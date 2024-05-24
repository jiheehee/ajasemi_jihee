package com.aja.payment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aja.member.model.dto.ProductInfo;
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
		
		
		HttpSession session = request.getSession();
		int custKey = (int)session.getAttribute("cust_key");
		System.out.println("session에서 받아온 custKey : " + custKey);
		
		//int dcKey = Integer.parseInt(request.getParameter("dcKey"));
		
		//String cartKies = request.getParameter("cartKies");
		
		Order orderInfo = (Order)session.getAttribute("orderInfo"); 
		request.setAttribute("orderInfo", orderInfo);
		List<ProductInfo> purchaseList = (List<ProductInfo>)session.getAttribute("productInfo");
		System.out.println("session에서 받아온 orderInfo : " + orderInfo);
		new PaymentService().updatePaymentInfo(orderInfo, purchaseList, custKey);
		
		new PaymentService().updatePointState(custKey);
		
//		new PaymentService().couponStateUpdate(dcKey, custKey);
//		new PaymentService().deleteCartAfterPay(cartKies, custKey);
//		request.getRequestDispatcher("/WEB-INF/views/payment/paysuccess.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
