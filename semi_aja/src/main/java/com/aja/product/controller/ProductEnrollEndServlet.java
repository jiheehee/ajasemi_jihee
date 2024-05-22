package com.aja.product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ProductEnrollEndServlet
 */
@WebServlet("/product/productenrollend.do")
public class ProductEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = getServletContext().getRealPath("/upload/product");
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();
		int maxSize = 1024*1024*10;
		String encode = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request, path,maxSize,encode,new DefaultFileRenamePolicy());
		String oriname = mr.getOriginalFileName("upfiles");
		String rename = mr.getFilesystemName("upfiles");

		int cateKey = Integer.parseInt(mr.getParameter("prodCategory"));
		int keywordKey = Integer.parseInt(mr.getParameter("prodKeyword"));
		String name = mr.getParameter("prodName");
		int price = Integer.parseInt(mr.getParameter("prodPrice"));
		String content = mr.getParameter("prodContent");
		int stock = Integer.parseInt(mr.getParameter("prodStock"));
		String detailCon = mr.getParameter("prodDetailCon");
		String component = mr.getParameter("prodComponent");
		System.out.println(oriname);
		System.out.println(rename);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
