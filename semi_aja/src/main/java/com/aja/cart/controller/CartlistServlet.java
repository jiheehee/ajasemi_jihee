package com.aja.cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.cart.model.dto.Cart;
import com.aja.cart.service.CartService;
import com.aja.member.model.dto.Customer;

/**
 * Servlet implementation class CartlistServlet
 */
@WebServlet("/cart/cartlist.do")
public class CartlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartlistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer c=(Customer)request.getSession().getAttribute("loginMember");
		int custKey=c.getCustKey();
		
		List<Cart> cart=new CartService().getCartList(custKey);
		
		request.setAttribute("cart", cart);				
		
		request.getRequestDispatcher("/WEB-INF/views/cart/cart.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
