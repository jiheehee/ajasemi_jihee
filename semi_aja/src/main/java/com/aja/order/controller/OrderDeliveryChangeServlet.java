package com.aja.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.order.service.OrderService;

/**
 * Servlet implementation class OrderDeliveryChangeServlet
 */
@WebServlet("/order/orderdeliverychange.do")
public class OrderDeliveryChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDeliveryChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("deliveryType");
		String order = request.getParameter("orders");
		String[] orders = order.split(",");
		
		int[] realOrders = new int[orders.length];
		for(int i=0;i<orders.length;i++) {
			realOrders[i] = Integer.parseInt(orders[i]);
		}
		
		int result = new OrderService().updateDelivery(type,realOrders);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
