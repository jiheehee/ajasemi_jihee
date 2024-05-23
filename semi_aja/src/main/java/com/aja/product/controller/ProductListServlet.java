package com.aja.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.product.model.dto.Product2;
import com.aja.product.service.ProductService;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/product/productlist.do")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		List<Product2> list = new ProductService().searchAllProduct();
		int cPage =1;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {}
	
		int numPerpage = 5;
		try {
			numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {}
		
		List<Product2> lists = new ProductService().searchAllProduct(cPage,numPerpage);
		
		request.setAttribute("lists", lists);
		
		int totalData = new ProductService().selectProductCount();
		int totalPage = (int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		String pageBar="<ul class='pagination justify-content-center'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='"+request.getRequestURI()+"?cPage="+(pageNo-1)+"&numPerpage="+numPerpage+"'>이전</a>";
			pageBar+="</li>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='"+request.getRequestURI()+"?cPage="+pageNo+"&numPerpage="+numPerpage+"'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='"+request.getRequestURI()+"?cPage="+(pageNo)+"&numPerpage="+numPerpage+"'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		request.setAttribute("pageBar", pageBar);
		
//		request.setAttribute("productList",list);
		request.getRequestDispatcher("/WEB-INF/views/admin/product/productList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
