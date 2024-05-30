package com.aja.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aja.member.model.dto.Customer;
import com.aja.member.service.MemberService;

/**
 * Servlet implementation class LoginEndServlet
 */
@WebServlet(name="login" ,urlPatterns = "/member/loginend.do")
public class LoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String custEmail=request.getParameter("custEmail");
		
		System.out.println(custEmail);
		
		String custPw =request.getParameter("custPw");
		
		String saveId = request.getParameter("saveId");
		
		if(saveId != null) {
			
			Cookie saveIdCookie = new Cookie("saveId", custEmail);
			// 전체이메일을 넘겨줌
			saveIdCookie.setMaxAge(60*60*24*7);
			response.addCookie(saveIdCookie);
		} else {
			
			Cookie saveIdCookie = new Cookie("saveId",custEmail);
			saveIdCookie.setMaxAge(0);
			saveId = null;
			response.addCookie(saveIdCookie);
		}	
		
		if(custEmail.equals("")||custPw.equals("")) {
			
			request.setAttribute("msg", "아이디나 패스워드를 입력하세요.");
			request.setAttribute("loc", "/");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			rd.forward(request, response);
			
		} else {
			
			Customer ct = new MemberService().searchMemberById(custEmail, custPw);
			
			if(ct!=null) {
				// 로그인한 정보를 HttpSession 에 저장
				HttpSession session = request.getSession(); // 여기서는 폴스든 트루든 상관없음 외냐 jsp 에는 이미 내장객체로 session 을 가지고 잇기 때문
				session.setAttribute("loginMember", ct);
				// 화면전환
				response.sendRedirect(request.getContextPath());
			} else {
				// custom이 널임 
				request.setAttribute("msg", "아이디나 패스워드가 일치하지 않습니다.");
				request.setAttribute("loc", "/member/login.do");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			}
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
