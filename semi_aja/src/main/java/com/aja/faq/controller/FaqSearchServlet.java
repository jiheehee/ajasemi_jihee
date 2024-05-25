package com.aja.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.faq.model.dto.Faq;
import com.aja.faq.service.FaqService;

/**
 * Servlet implementation class FaqSearchServlet
 */
@WebServlet("/faq/faqsearch.do")
public class FaqSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String faqsearch=request.getParameter("search"); //jsp에서 검색창의 name값을 search로 설정해둠
		
		List<Faq> faq= new FaqService().searchFaqByTitle(faqsearch);
//		System.out.println(faq);
		
		request.setAttribute("faq",faq);
		request.getRequestDispatcher("/WEB-INF/views/faq/faq.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
