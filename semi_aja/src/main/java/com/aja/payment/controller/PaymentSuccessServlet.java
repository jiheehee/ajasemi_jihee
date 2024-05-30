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
//		HttpSession session = request.getSession();
//		Customer loginMember = (Customer)session.getAttribute("loginMember");
//		int custKey = loginMember.getCustKey();
		System.out.println("paySuccessServlet 실행");
		
		int custKey = 48;
		System.out.println("session에서 받아온 custKey : " + custKey);
		
		//int dcKey = Integer.parseInt(request.getParameter("dcKey"));
		
		//String cartKies = request.getParameter("cartKies");
		
		Order orderInfo = (Order)session.getAttribute("orderInfo");
		request.setAttribute("orderInfo", orderInfo);
		List<ProductInfo> purchaseList = (List<ProductInfo>)session.getAttribute("productInfo");
		System.out.println("session에서 받아온 orderInfo : " + orderInfo);
		
		//주문 테이블과 주문상세 테이블 업데이트
		new PaymentService().updatePaymentInfo(orderInfo, purchaseList, custKey);
		
		//포인트테이블 업데이트와 CUSTOEMR 포인트 UPDATE
		int usingPoint = Integer.parseInt(request.getParameter("usingPoint"));
		if(usingPoint > 0) {
			new PaymentService().updatePointState(custKey, usingPoint);
		}
		
		//쿠폰 사용시 쿠폰 사용여부 Y로 UPDATE
		int dcKey = Integer.parseInt(request.getParameter("dcKey"));
		if(dcKey > 0) {
			new PaymentService().couponStateUpdate(dcKey, custKey);			
		}
		
		//결제 완료시 주문된 상품 DELETE CART TABLE
		String cartKeyString = request.getParameter("cartKey");
		System.out.println("cartKeyString : " + cartKeyString);
		new PaymentService().deleteCartAfterPay(cartKeyString, custKey);
		
		
		
		session.removeAttribute("productInfo");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
