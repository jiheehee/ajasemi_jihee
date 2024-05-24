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
		
		int result = new ProductCartAddService().insertProductCartAdd(cart);
		
		String msg="", loc="";
		if(result>0) {
			msg="등록 성공했습니다. :)";
			loc = "/";
		}else {
			msg = "등록 실패했습니다. :(";
			loc = "/";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc",loc);
		
		System.out.println("장바구니 연결");
		
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
