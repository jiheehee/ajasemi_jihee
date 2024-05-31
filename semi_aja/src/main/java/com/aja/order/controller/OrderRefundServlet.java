package com.aja.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.order.model.dto.OrderRefund;
import com.aja.order.model.dto.OrderStock;
import com.aja.order.service.OrderService;

/**
 * Servlet implementation class OrderCancelServlet
 */
@WebServlet("/order/orderrefund.do")
public class OrderRefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderRefundServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String order = request.getParameter("orders");
		String[] orders = order.split(",");
		List<OrderRefund> list = new ArrayList<>();
		
		int[] realOrders = new int[orders.length];
		for(int i=0;i<orders.length;i++) {
			realOrders[i] = Integer.parseInt(orders[i]);
			OrderRefund or = new OrderService().orderRefundInfo(realOrders[i]);
			List<Integer> detailOrderList = new OrderService().orderDetailList(realOrders[i]);
			//1. 회원 포인트 변화.
			if(or.getOrderPoint() !=0) {
				new OrderService().refundPoint(or.getOrderPoint(),or.getCustKey());
				System.out.println(or.getOrderPoint());
			}
			//2.회원 쿠폰 반환
			if(or.getDcKey()!=0) {
				new OrderService().refundCoupon(or.getDcKey());
				System.out.println(or.getDcKey());
			}
			//3. 상태변경
			int result = new OrderService().orderStatusUpdate(or.getOsKey());
			System.out.println(or.getOsKey());
			//4. 재고변경
			for(int j=0;j<detailOrderList.size();j++) {
				OrderStock os = new OrderService().orderStockRollback(detailOrderList.get(j));
				System.out.println(detailOrderList.get(j));
				new OrderService().orderStockUpdate(os.getProdKey(),os.getQuantity());
			}
			
			if(result>0) {
				String msg="", loc="";
				if(result>0) {
					msg = "환불 성공했습니다. :)";
					loc = "/order/orderstatuslist.do";
				}else {
					msg = "환불 실패했습니다. :(";
					loc = "/order/orderstatuslist.do";
				}
				request.setAttribute("msg", msg);
				request.setAttribute("loc",loc);
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			}
		}
		
		
		//쿠폰 key, 포인트, 회원 key, 주문상세 key
		//주문상세는 1대 다 ==> 따로 가져옴.
		
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
