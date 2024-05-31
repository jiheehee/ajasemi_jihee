package com.aja.coupon.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.coupon.service.CouponService;

/**
 * Servlet implementation class CouponDistributeServlet
 */
@WebServlet("/coupon/distributecoupon.do")
public class CouponDistributeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponDistributeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int couponKey = Integer.parseInt(request.getParameter("couponKey"));
		String couponName = request.getParameter("couponName");
		int result = 0;
		List custKeyList = new ArrayList();
		
		
		if(couponName!=null) {
			if(couponName.contains("생일")) {
				System.out.println(couponName);
				custKeyList = new CouponService().selectBirthdayCustomer();
				if(custKeyList.size()>0) {
					for(int i=0;i<custKeyList.size();i++) {
						result = new CouponService().birthdayCouponDistribute((int)custKeyList.get(i),couponKey);
						System.out.println(result);
					}
				}
			}
			else if(couponName.contains("멤버십")) {
//				result = new CouponService().membershipCouponDistribute(couponKey);
			}
		} 
		String msg,loc="";
		if(result>0) {
			msg="쿠폰발급 성공했습니다. :)";
			loc="/coupon/couponlist.do";
		}else {
			msg ="쿠폰발급 실패했습니다. :(";
			loc="/coupon/couponlist.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
