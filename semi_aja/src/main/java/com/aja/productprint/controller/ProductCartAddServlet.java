package com.aja.productprint.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aja.member.model.dto.Customer;
import com.aja.productprint.model.dto.CartDTO;
import com.aja.productprint.service.ProductCartAddService;

/**
 * Servlet implementation class ProductCartAdd
 */
@WebServlet("/product/productcartadd.do")
public class ProductCartAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductCartAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원고유번호, 상품고유번호, 옵션고유번호, 수량 넘겨받아서 DB에 저장하고 장바구니 사이트로 웹전환
		
		HttpSession session = request.getSession();
		Customer loginMember = (Customer)session.getAttribute("loginMember"); //아이디가 session에 있어서 접근 가능
		
		System.out.println(loginMember);
		
		int custKey = loginMember.getCustKey();
		int prodKey = Integer.parseInt(request.getParameter("prodKey"));
		int optionKey = Integer.parseInt(request.getParameter("optionKey"));
		int productCount = Integer.parseInt(request.getParameter("productCount"));
		
		CartDTO cart = CartDTO.builder()
				.custKey(custKey)
				.prodKey(prodKey)
				.optionKey(optionKey)
				.productCount(productCount)
				.build();
		
		int cartResult = new ProductCartAddService().insertProductCartAdd(cart);
		
		
		//ajax 로 result 값 넘겨주기 setAttribute로 넘겨주고 get으로 받아서 그걸 이용해 모달창 띄우기
		
		//request.setAttribute("cartResult", cartResult);
		
		
		if(cartResult>0) {
//			회원번호로 상품번호를 조회했을떄 이미 등록되어 있으면 등록안되게 막고, 이미 장바구니에 있는 상품입니다. 띄우기
			cartResult = 0;
		}else {
			cartResult = 1;
		}
		
		System.out.println("장바구니 연결");
		
		
		//request.setAttribute("cartResult", cartResult);
//		System.out.println(cartResult);
//		response.setContentType("html/text");
//		response.setCharacterEncoding("utf-8");
		
		//ajax 값 넘겨주기 
		response.getWriter().print(cartResult);
		
		
		
		//response.getWriter().		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
