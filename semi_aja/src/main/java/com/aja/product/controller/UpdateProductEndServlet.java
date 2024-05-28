package com.aja.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.product.model.dto.Product;
import com.aja.product.service.ProductService;

/**
 * Servlet implementation class UpdateProductEndServlet
 */
@WebServlet("/product/updateproductend.do")
public class UpdateProductEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cateKey = Integer.parseInt(request.getParameter("prodCategory"));
		int keywordKey = Integer.parseInt(request.getParameter("prodKeyword"));
		String name = request.getParameter("prodName");
		int price = Integer.parseInt(request.getParameter("prodPrice"));
		String component = request.getParameter("prodComponent");
		String content = request.getParameter("prodContent");
		String detailCon = request.getParameter("prodDetailCon");
		int stock = Integer.parseInt(request.getParameter("prodStock"));
		int prodKey = Integer.parseInt(request.getParameter("prodKey"));
		
		
		Product p= Product.builder()
				.prodKey(prodKey)
				.cateKey(cateKey)
				.keywordKey(keywordKey)
				.prodName(name)
				.prodPrice(price)
				.prodComponent(component)
				.prodContent(content)
				.prodDetailCon(detailCon)
				.prodStock(stock)
				.build();
		
		int result = new ProductService().updateProduct(p);
		
		String msg="";
		if(result>0) {
			msg="수정 성공했습니다. :)";
		}else {
			msg = "수정 실패했습니다. :(";

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
