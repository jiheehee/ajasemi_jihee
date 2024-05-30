package com.aja.productprint.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aja.member.model.dto.Customer;
import com.aja.product.service.ProductService;
import com.aja.productprint.model.dto.Product;
import com.aja.productprint.model.dto.WishDTO;
import com.aja.productprint.service.ProductDetailService;
import com.aja.productprint.service.ProductListService;
import com.aja.productprint.service.ProductWishAddService;

/**
 * Servlet implementation class ProductDetailPrintServlet
 */
@WebServlet("/product/productdetailprint.do")
public class ProductDetailPrintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailPrintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int prodKey = Integer.parseInt(request.getParameter("prodKey"));
		System.out.println(prodKey);
		
		Product result = new ProductDetailService().selectDetailProduct(prodKey);
		
		
		
		request.setAttribute("product", result);
		
		int cateKey = Integer.parseInt(request.getParameter("cateKey"));
		System.out.println(cateKey);
		List<Product> list = new ProductDetailService().selectDetailProductList(cateKey);
//		for(int i=0;i<list.size();i++) {
//			Product p = new ProductDetailService().selectProductImage(list.get(i).getProdKey());
//			list.get(i).setProdImage1(p.getProdImage1());
//			list.get(i).setProdImage2(p.getProdImage2());
//			list.get(i).setProdImage3(p.getProdImage3());
//			list.get(i).setProdImage4(p.getProdImage4());
//			list.get(i).setProdImage5(p.getProdImage5());
//		};
		
		request.setAttribute("productlist", list);
		
		
		HttpSession session = request.getSession();
		Customer loginMember = (Customer)session.getAttribute("loginMember"); //아이디가 session에 있어서 접근 가능
		
		int custKey = 0;
		
		if(loginMember != null) {
			custKey = loginMember.getCustKey();			
		}
		
		WishDTO wish = WishDTO.builder()
				.custKey(custKey)
				.prodKey(prodKey)
				.build();
		
		int  wishNumber = new ProductDetailService().selectWishProduct(wish);
		
		request.setAttribute("wishNumber", wishNumber);
		
		//상품 이름 
		String prodName = (String)request.getParameter("prodName");
		System.out.println(prodName);
		List<Integer> reviewQnaCount = new ProductDetailService().selectDetailProductCount(prodName);
		
		request.setAttribute("reviewQnaCount", reviewQnaCount);
		
		
		request.getRequestDispatcher("/WEB-INF/views/product/productDetail.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
