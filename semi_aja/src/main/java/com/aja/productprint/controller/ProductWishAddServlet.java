package com.aja.productprint.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aja.member.model.dto.Customer;
import com.aja.productprint.model.dto.WishDTO;
import com.aja.productprint.service.ProductWishAddService;

/**
 * Servlet implementation class ProductWishAddServlet
 */
@WebServlet("/product/productwishadd.do")
public class ProductWishAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductWishAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int prodKey = Integer.parseInt(request.getParameter("prodKey"));
		
		HttpSession session = request.getSession();
		Customer loginMember = (Customer)session.getAttribute("loginMember"); //아이디가 session에 있어서 접근 가능
		
		
		
		int custKey = loginMember.getCustKey();
		
		WishDTO wish  = WishDTO.builder()
				.custKey(custKey)
				.prodKey(prodKey)
				.build();	
		
		
		int result = new ProductWishAddService().insertProductWishAdd(wish);
		
		
		
		
		System.out.println("찜 연결");
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
