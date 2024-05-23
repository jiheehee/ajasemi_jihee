package com.aja.productprint.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.productprint.model.dto.Product;
import com.aja.productprint.service.ProductListService;

/**
 * Servlet implementation class ProductListPrintServelt
 */
@WebServlet("/product/productlistprint.do")
public class ProductListPrintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListPrintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage = 1;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {}
		
		int numPerpage = 6;
		try {
			numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {}
		
		
		int cateKey = Integer.parseInt(request.getParameter("cateKey"));
		
//		System.out.println(cateKey);
		List<Product> result = new ProductListService().selectAllProduct(cateKey,cPage,numPerpage);
		
//		System.out.println(result);
		request.setAttribute("productlist", result);
		
		int totalData = new ProductListService().selectAllProductCount(cateKey);
//		System.out.println(totalData);
		int totalPage = (int)Math.ceil((double)totalData/numPerpage);
		
		request.setAttribute("totalPage", totalPage);
		
//		int pageBarSize = 5;
//		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
//		int pageEnd = pageNo+pageBarSize-1;
	
		
//		PrintWriter out = response.getWriter();
//		out.println("됐니?");
		
		
		
		System.out.println("됐니?");
		
		
		
		request.getRequestDispatcher("/WEB-INF/views/product/productList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
