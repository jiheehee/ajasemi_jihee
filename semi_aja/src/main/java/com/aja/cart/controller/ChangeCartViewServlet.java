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
		int custKey = Integer.parseInt(request.getParameter("custKey"));
		HttpSession session = request.getSession();
		session.setAttribute("custKey", custKey);
		
		List<CartInfo> cartInfoList =  new CartService2().getCartInfo(custKey);
		request.setAttribute("cartInfoList", cartInfoList);
		cartInfoList.forEach(System.out::println);
		
		request.getRequestDispatcher("/testview/testcart.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
