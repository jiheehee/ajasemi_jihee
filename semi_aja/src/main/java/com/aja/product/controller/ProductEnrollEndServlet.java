package com.aja.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.product.model.dto.Product;
import com.aja.product.service.ProductService;
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
		System.out.println(path);
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();	
		int maxSize = 1024*1024*10;
		String encode = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request, path,maxSize,encode,new DefaultFileRenamePolicy());

		int cateKey = Integer.parseInt(mr.getParameter("prodCategory"));
		int keywordKey = Integer.parseInt(mr.getParameter("prodKeyword"));
		String name = mr.getParameter("prodName");
		int price = Integer.parseInt(mr.getParameter("prodPrice"));
		String content = mr.getParameter("prodContent");
		int stock = Integer.parseInt(mr.getParameter("prodStock"));
		String detailCon = mr.getParameter("prodDetailCon");
		String component = mr.getParameter("prodComponent");
		
		Product p= Product.builder()
				.cateKey(cateKey)
				.keywordKey(keywordKey)
				.prodName(name)
				.prodPrice(price)
				.prodComponent(component)
				.prodContent(content)
				.prodDetailCon(detailCon)
				.prodStock(stock)
				.build();
		
		int[] result = new ProductService().enrollProduct(p); 
		int fileInsertResult = 0;
		Enumeration files = mr.getFileNames();
		while(files.hasMoreElements()) {
			String fileName = (String) files.nextElement();
			String originalFileName = mr.getOriginalFileName(fileName);
			String fileSystemName = mr.getFilesystemName(fileName);
			File uploadedFile = mr.getFile(fileName);
		}
		if(result[0]>0) {
			fileInsertResult = new ProductService().enrollImages(mr,result[1]);
			
			String msg="", loc="";
			if(fileInsertResult>0) {
				msg="상품등록 성공했습니다. :)";
				loc = "/";
			}else {
				msg = "상품이미지등록 실패했습니다. :(";
				loc = "/";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("loc",loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
		else {
			String msg="", loc="";
				msg = "삭제 실패했습니다. :(";
				loc = "/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc",loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
			
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
