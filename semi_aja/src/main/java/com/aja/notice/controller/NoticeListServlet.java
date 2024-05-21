package com.aja.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.notice.dto.Notice;
import com.aja.notice.service.NoticeService;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/notice/noticelist.do")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage=1;
		try {
			cPage=Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {}
		int numPerpage=5;
		try{
			numPerpage=Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {}
		
		List<Notice> noticelist=new NoticeService().selectNotice(cPage,numPerpage);	
		
		//저장해온거를 다시 화면에 데이터를 보내는구문
		request.setAttribute("noticelist",noticelist);
		request.getRequestDispatcher("/WEB-INF/views/notice/noticeList.jsp").forward(request, response);
		
		int totalData=new NoticeService().selectNoticeCount();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
