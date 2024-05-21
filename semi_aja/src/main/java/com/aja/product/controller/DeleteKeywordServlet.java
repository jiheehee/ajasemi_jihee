package com.aja.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.product.service.CategoryService;

/**
 * Servlet implementation class DeleteKeywordServlet
 */
@WebServlet("/product/deletekeyword.do")
public class DeleteKeywordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteKeywordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("keywordKey"));
		int result = new CategoryService().deleteKeyword(num);
//		response.sendRedirect(request.getContextPath()+"/views/product/categoryEnroll.jsp");
		//성공 실패로 msg
		String msg="", loc="";
		if(result>0) {
			msg="삭제 성공했습니다. :)";
			loc = "/";
		}else {
			msg = "삭제 실패했습니다. :(";
			loc = "/";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
