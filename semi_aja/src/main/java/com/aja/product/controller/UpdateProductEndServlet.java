package com.aja.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.product.model.dto.Product;
import com.aja.product.service.ProductService;
import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		String path = getServletContext().getRealPath("upload/product");
		int maxSize = 1024*1024*10;
		String encode = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request,path,maxSize,encode,new DefaultFileRenamePolicy());
		
		
		int cateKey = Integer.parseInt(mr.getParameter("prodCategory"));
		int keywordKey = Integer.parseInt(mr.getParameter("prodKeyword"));
		String name = mr.getParameter("prodName");
		int price = Integer.parseInt(mr.getParameter("prodPrice"));
		String component = mr.getParameter("prodComponent");
		String content = mr.getParameter("prodContent");
		String detailCon = mr.getParameter("prodDetailCon");
		int stock = Integer.parseInt(mr.getParameter("prodStock"));
		int prodKey = Integer.parseInt(mr.getParameter("prodKey"));
		
		
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
		
		int fileInsertResult = 0;
		Enumeration<String>names = mr.getFileNames();
		List<Map<String,String>> files = new ArrayList<>();
		while(names.hasMoreElements()) {
			String fileName = (String) names.nextElement();
			String originalFileName = mr.getOriginalFileName(fileName);
			String fileSystemName = mr.getFilesystemName(fileName);
			files.add(Map.of("fileName",fileName,"originalFileName",originalFileName));
		}
		if(result>0) {
			fileInsertResult = new ProductService().updateImages(mr, p.getProdKey());
		}
		
		new Gson().toJson(Map.of("result",true),response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
