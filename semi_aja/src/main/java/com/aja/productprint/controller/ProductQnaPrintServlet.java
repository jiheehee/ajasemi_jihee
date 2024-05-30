package com.aja.productprint.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.productprint.model.dto.ProductQnaDTO;
import com.aja.productprint.service.ProductQnaPrintService;

/**
 * Servlet implementation class ProductQnaPrintServlet
 */
@WebServlet("/product/productqnaprint.do")
public class ProductQnaPrintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductQnaPrintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String prodName = request.getParameter("prodName");
		System.out.println(prodName);
		List<ProductQnaDTO> qnaList = new ProductQnaPrintService().selectProductAllQna(prodName);
		
		request.setAttribute("qnaList", qnaList);
		
		request.getRequestDispatcher("/WEB-INF/views/product/productqna.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
