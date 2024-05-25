package com.aja.coupon.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.coupon.service.CouponService;

/**
 * Servlet implementation class CouponDeleteServlet
 */
@WebServlet("/coupon/deletecoupon.do")
public class CouponDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int couponKey = Integer.parseInt(request.getParameter("couponKey"));
		int result = new CouponService().deleteCoupon(couponKey);
		
		String msg="", loc="";
		if(result>0) {
			msg="삭제 성공했습니다. :)";
			loc = "/coupon/couponlist.do";
		}else {
			msg = "삭제 실패했습니다. :(";
			loc = "/coupon/couponlist.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
