package com.aja.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aja.cart.service.CartService2;
import com.aja.member.model.dto.Customer;

/**
 * Servlet implementation class AsyncDeleteCartServlet
 */
@WebServlet("/cart/deletecart.do")
public class AsyncDeleteCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AsyncDeleteCartServlet() {
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
		int cartKey = Integer.parseInt(request.getParameter("cartKey"));
		
		//삭제하기 버튼을 누르면 db에서 데이터 삭제
		new CartService2().asynDeleteCart(custKey, cartKey);
		response.sendRedirect(request.getContextPath() + "/member/cartview.do");
//		List<CartInfo> cartInfo = new CartService2().getCartInfo(custKey);
//		
//		request.setAttribute("cartInfo", cartInfo);
//		request.getRequestDispatcher("/testview/cartInfoHtml.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
