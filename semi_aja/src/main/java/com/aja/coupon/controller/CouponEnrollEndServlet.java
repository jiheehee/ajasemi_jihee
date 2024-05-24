package com.aja.coupon.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.coupon.service.CouponService;

/**
 * Servlet implementation class CouponEnrollEndServlet
 */
@WebServlet("/coupon/couponenrollend.do")
public class CouponEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponEnrollEndServlet() {
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
		int result = new CouponService().enrollCoupon(couponName,couponSale);
		
		String msg="";
		if(result>0) {
			msg="쿠폰등록 성공했습니다. :)";
		}else {
			msg ="쿠폰등록 실패했습니다. :(";
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
