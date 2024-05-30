package com.aja.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.order.model.dto.CustomerOrder;
import com.aja.order.service.OrderService;

/**
 * Servlet implementation class OrderDeliveryListServlet
 */
@WebServlet("/order/orderdeliverylist.do")
public class OrderDeliveryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDeliveryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status="배송준비중";
		if(request.getParameter("orderDelivery")!= null) {
			status = request.getParameter("orderDelivery");
		}
		List<CustomerOrder> orderList = new OrderService().selectOrderAll1(status);
		
		request.setAttribute("orderList", orderList);
		request.getRequestDispatcher("/WEB-INF/views/admin/order/orderDeliveryList.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
