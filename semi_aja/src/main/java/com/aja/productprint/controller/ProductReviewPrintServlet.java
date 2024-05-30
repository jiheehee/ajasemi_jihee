package com.aja.productprint.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.productprint.model.dto.ReviewDTO;
import com.aja.productprint.service.ProductReviewPrintService;

/**
 * Servlet implementation class ProductReviewPrintServlet
 */
@WebServlet("/product/productreviewprint.do")
public class ProductReviewPrintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductReviewPrintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String prodName = request.getParameter("prodName");
		//System.out.println(prodName);
		
		List<ReviewDTO> reviewList = new ProductReviewPrintService().selectProductAllReview(prodName);
		//System.out.println("reviewList : "+reviewList);
		
//		int reviewCount = new ProductReviewPrintService().selectProductAllReviewCount(prodName);
//		System.out.println("reviewCount : "+reviewCount);
		
		
		request.setAttribute("reviewList", reviewList);
//		request.setAttribute("reviewCount", reviewCount);
		
		request.getRequestDispatcher("/WEB-INF/views/product/productreview.jsp").forward(request, response);
		//request.getRequestDispatcher("/referenceview/productreview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
