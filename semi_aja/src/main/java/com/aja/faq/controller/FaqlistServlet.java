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
 * Servlet implementation class FaqlistServlet
 */
@WebServlet("/faq/faqlist.do")
public class FaqlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqlistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			
		
		//서비스에 있는 화면 가져와서 여기에 뿌려줌
		List<Faq> faq=new FaqService().faqlist();
		
		// 데이터 저장소 객체에 저장시켜줌
		request.setAttribute("faq", faq);
		
		// 어디로 이동시켜줄건지
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
