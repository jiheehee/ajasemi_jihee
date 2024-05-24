package com.aja.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aja.payment.model.dto.Order;
import com.aja.payment.service.PaymentService;

/**
 * Servlet implementation class PaymentSuccessServlet
 */
@WebServlet("/pay/paysuccess.do")
public class PaymentSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentSuccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("결제성공");
//		System.out.println(request.getParameter("orderInfo"));
//		String custKey = request.getParameter("custKey");
//		int orderPrice = Integer.parseInt(request.getParameter("orderPrice"));
//		int orderSale = Integer.parseInt(request.getParameter("orderSale"));
//		String orderPayoption = request.getParameter("orderPayoption");
//		String orderName = request.getParameter("orderName");
//		String orderPostcode = request.getParameter("orderPostcode");
//		String orderAddress = request.getParameter("orderAddress");
//		String orderDetailaddr = request.getParameter("orderDetailaddr");
//		String orderPhone = request.getParameter("orderPhone");
//		String orderRequest = request.getParameter("orderRequest");
//		int dcKey = Integer.parseInt(request.getParameter("dcKey"));
		Order orderInfo = Order.builder()
							.custKey(Integer.parseInt(request.getParameter("custKey")))
							.orderPrice(Integer.parseInt(request.getParameter("orderPrice")))
							.orderSale(Integer.parseInt(request.getParameter("orderSale")))
							.orderPayoption(request.getParameter("orderPayoption"))
							.orderName(request.getParameter("orderName"))
							.orderPostcode(request.getParameter("orderPostcode"))
							.orderAddress(request.getParameter("orderAddress"))
							.orderDetailaddr(request.getParameter("orderDetailaddr"))
							.orderPhone(request.getParameter("orderPhone"))
							.orderRequest(request.getParameter("orderRequest"))
							.build();
		HttpSession session = request.getSession();
		int custKey = (int)session.getAttribute("cust_key");
		
		int dcKey = Integer.parseInt(request.getParameter("dcKey"));
		
		String cartKies = request.getParameter("cartKies");
		
		request.setAttribute("orderInfo", orderInfo);
		
		new PaymentService().updatePaymentInfo(orderInfo);
		new PaymentService().couponStateUpdate(dcKey, custKey);
		new PaymentService().deleteCartAfterPay(cartKies, custKey);
		request.getRequestDispatcher("/WEB-INF/views/payment/paysuccess.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
