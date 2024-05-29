package com.aja.wish.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.member.model.dto.Customer;
import com.aja.wish.model.dto.Wish;
import com.aja.wish.service.WishService;

/**
 * Servlet implementation class WishServlet
 */
@WebServlet("/wish/wish.do")
public class WishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Customer c=(Customer)request.getSession().getAttribute("loginMember");
		int custKey=c.getCustKey();
		
		System.out.println("출력");
		List<Wish> wish=new WishService().wishList(custKey);
		request.setAttribute("wish", wish);
		request.getRequestDispatcher("/WEB-INF/views/wishlist/wishlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
