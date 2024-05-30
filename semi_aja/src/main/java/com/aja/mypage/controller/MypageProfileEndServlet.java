package com.aja.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aja.member.model.dto.Customer;
import com.aja.member.service.MemberService;

/**
 * Servlet implementation class MypageProfileEndServlet
 */
@WebServlet(name = "check2",urlPatterns="/mypage/profileend.do")
public class MypageProfileEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageProfileEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 받아온 비밀번호가 db 에 저장된 비밀번호와 일치하는지 확인 
		// 일치 -> 개인정보 수정화면
		// 일치 x -> 비밀번호 입력화면으로 돌아가기 ! 
		HttpSession session = request.getSession();
		Customer ct = (Customer)session.getAttribute("loginMember");
		System.out.println(ct+"지금화깅");
		String inputPw = request.getParameter("custPw");
		
		Customer checkCt = new MemberService().searchMemberById(ct.getCustEmail(), inputPw);
		// 이게 null 이면, 비밀번호가 일치하지 않는 거임 ! 
		
		if(checkCt == null) {
			response.sendRedirect(request.getContextPath()+"/mypage/profile.do");
		} else {
//			response.sendRedirect(request.getContextPath()+"/WEB-INF/views/mypage/editprofile.jsp");
			request.getRequestDispatcher("/WEB-INF/views/mypage/editprofile.jsp").forward(request, response);
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
