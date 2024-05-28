package com.aja.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.order.service.OrderService;

/**
 * Servlet implementation class OrderDeliveryCompleteServlet
 */
@WebServlet("/order/deliverystatuscomplete.do")
public class OrderDeliveryCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDeliveryCompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderKey =Integer.parseInt(request.getParameter("orderKey"));
		
		int result = new OrderService().deliveryComplete(orderKey);
		
		if(result>0) {
			String msg="", loc="";
			if(result>0) {
				msg = "변경 성공했습니다. :)";
				loc = "/order/orderlist.do";
			}else {
				msg = "변경 실패했습니다. :(";
				loc = "/order/orderlist.do";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("loc",loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
