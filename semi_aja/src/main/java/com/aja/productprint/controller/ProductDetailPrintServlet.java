package com.aja.productprint.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.productprint.model.dto.Product;
import com.aja.productprint.service.ProductDetailService;

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
