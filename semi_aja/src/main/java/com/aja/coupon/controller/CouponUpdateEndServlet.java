package com.aja.coupon.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.coupon.model.dto.Coupon;
import com.aja.coupon.service.CouponService;

/**
 * Servlet implementation class CouponUpdateEndServlet
 */
@WebServlet("/coupon/couponupdateend.do")
public class CouponUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String couponName = request.getParameter("couponName");
		int couponSale = Integer.parseInt(request.getParameter("couponSale"));
		int couponKey = Integer.parseInt(request.getParameter("couponKey"));
		Coupon c = Coupon.builder().couponKey(couponKey).couponName(couponName).couponSale(couponSale).build();
		
		int result = new CouponService().updateCoupon(c);
		String msg="";
		if(result>0) {
			msg="쿠폰수정 성공했습니다. :)";
		}else {
			msg ="쿠폰수정 실패했습니다. :(";
		}
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/WEB-INF/views/common/closeMsg.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
