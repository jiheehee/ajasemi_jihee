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
 * Servlet implementation class CouponUpdateServlet
 */
@WebServlet("/coupon/couponupdate.do")
public class CouponUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int couponKey = Integer.parseInt(request.getParameter("couponKey"));
		Coupon c = new CouponService().searchCoupon(couponKey);
		request.setAttribute("coupon", c);
		request.getRequestDispatcher("/WEB-INF/views/admin/coupon/couponUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
