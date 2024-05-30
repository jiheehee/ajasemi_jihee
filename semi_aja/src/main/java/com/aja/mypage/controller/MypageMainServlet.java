package com.aja.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aja.member.model.dto.Customer;

/**
 * Servlet implementation class MypageMainServlet
 */
@WebServlet("/mypage/mypage.do")
public class MypageMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String custPw = ((Customer)session.getAttribute("loginMember")).getCustPw();
		if(custPw==null) {
			// 카카오 -> 비밀번호 확인하지 않고 개인정보 수정
			request.getRequestDispatcher("/WEB-INF/views/mypage/editkakao.jsp").forward(request, response);
		} else {
			// 일반 -> 비밀번호 확인 후 개인정보 수정
			request.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(request, response);			
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
