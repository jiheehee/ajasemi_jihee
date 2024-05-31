package com.aja.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.member.model.dto.Customer;
import com.aja.member.service.MemberService;

/**
 * Servlet implementation class SignUpEndServlet
 */
@WebServlet(name = "signup", urlPatterns="/member/signupend.do")
public class SignUpEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
//    public class Member {
//    	private int custKey;
//    	private String custEmail;
//    	private String custPw;
//    	private String custNickname;
//    	private String custPhone;
//    	private String custGender;
//    	private String custBirth;
//    	private String custAddress;
//    	private String custDetailAddress;
//    	private String custDelete;
//    	private Date custEnrollDate;
//    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 다,, input태그로 받아올 거니까.. 파라미터로 가저오기 .. 
		
		String custEmail = request.getParameter("custEmail");
//		String emailDomain = request.getParameter("emailDomain");
//		String custEmail = custEmailId + emailDomain;
		String custPw = request.getParameter("custPw");
		String custNickname = request.getParameter("custNickname");
		String custPhone = request.getParameter("custPhone");
		String custGender = request.getParameter("custGender");
		String custBirth = request.getParameter("custBirth");
		System.out.println(custBirth);
		String custPostcode = request.getParameter("custPostcode");
		
		String custAddress = request.getParameter("custAddress");
		String custDetailAdress = request.getParameter("custDetailAddress");
		String custName = request.getParameter("custName");
		// custDelete -> 탈퇴한회원 X로 표시
		// custEnrollDate -> sysdate 로 insert
		
		Customer ct = new Customer().builder()
					.custEmail(custEmail)
					.custPw(custPw)
					.custNickname(custNickname)
					.custPhone(custPhone)
					.custGender(custGender)
					.custBirth(custBirth)
					.custAddress(custAddress)
					.custDetailAddress(custDetailAdress)
					.custName(custName)
					.custPostcode(custPostcode)
					.build();
		
		System.out.println(ct);
		
		int result = new MemberService().signUp(ct);
		if(result>0) {
			// 회원가입 성공 시 모달창 띄워주고 로그인 페이지로 이동하고. .  
			response.sendRedirect(request.getContextPath()+"/member/login.do");
		} else {
			// 회원가입 실패 시 회원가입 페이지 입력한 데이터 그대로 유지하면서 회원가입창 띄우고싶다.. 
			// session 에 설정하고 쓰고 나면 . . 지우기 . . . 
			
			response.sendRedirect(request.getContextPath()+"/member/signup.do");
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
