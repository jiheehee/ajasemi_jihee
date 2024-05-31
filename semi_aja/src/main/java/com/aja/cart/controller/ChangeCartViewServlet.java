package com.aja.cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aja.cart.model.dto.CartInfo;
import com.aja.cart.service.CartService2;
import com.aja.member.model.dto.Customer;

/**
 * Servlet implementation class ChangeCartViewServlet
 */
@WebServlet("/member/cartview.do")
public class ChangeCartViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeCartViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginMember = (Customer)session.getAttribute("loginMember");
		int custKey = loginMember.getCustKey();
		System.out.println("session에서 가져온 custKey : " + custKey);
		

		
		session.setAttribute("custKey", custKey);
		List<CartInfo> cartInfoList =  new CartService2().getCartInfo(custKey);
		request.setAttribute("cartInfoList", cartInfoList);
		cartInfoList.forEach(System.out::println);
		
		request.getRequestDispatcher("/WEB-INF/views/cart/realcart.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
