package com.aja.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.product.model.dto.Category;
import com.aja.product.model.dto.Keyword;
import com.aja.product.model.dto.Product2;
import com.aja.product.service.CategoryService;
import com.aja.product.service.ProductService;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/product/updateproduct.do")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int prodKey = Integer.parseInt(request.getParameter("prodKey"));
		Product2 p = new ProductService().selectProduct(prodKey);
		List<Category> categoryList = new CategoryService().searchAllCategory();
		List<Keyword> keywordList = new CategoryService().searchAllKeyword();
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("keywordList", keywordList);
		request.setAttribute("Product", p);
		request.getRequestDispatcher("/WEB-INF/views/admin/product/updateProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
