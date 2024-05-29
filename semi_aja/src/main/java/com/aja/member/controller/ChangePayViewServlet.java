package com.aja.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aja.member.model.dto.Address;
import com.aja.member.model.dto.CouponInfo;
import com.aja.member.model.dto.Customer;
import com.aja.member.model.dto.ProductInfo;
import com.aja.member.service.MemberService;

/**
 * Servlet implementation class ChangePayViewServlet
 */
@WebServlet("/member/gopayview.do")
public class ChangePayViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePayViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
//		Customer loginMember = (Customer)session.getAttribute("loginMember");
//		int memberNo = loginMember.getCustKey();
//		session.setAttribute("cust_key", memberNo);
		
		int memberNo = 46;
		
		String cartKies = request.getParameter("cartKies");
		
		Address defaultAddress = new MemberService().getDefaultAddress(memberNo);
		System.out.println(defaultAddress);
		
		List<ProductInfo> products = new MemberService().getCartInfo(memberNo, cartKies);
		session.setAttribute("productInfo", products);
		products.forEach(System.out::println);
		
		List<CouponInfo> coupons = new MemberService().getCouponInfo(memberNo);
		coupons.forEach(System.out::println);

		request.setAttribute("defaultAddress", defaultAddress);
		request.setAttribute("cartInfo", products);
		request.setAttribute("coupons", coupons);	
		request.getRequestDispatcher("/WEB-INF/views/member/payment.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
