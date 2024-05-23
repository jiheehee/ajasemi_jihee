package com.aja.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aja.member.model.dto.Customer;
import com.aja.member.model.dto.KakaoDTO;
import com.aja.member.service.KakaoLoginService;

/**
 * Servlet implementation class KakaoLoginServlet
 */
@WebServlet("/member/kakaologin.do")
public class KakaoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		System.out.println(code);
		
		String accessToken = new KakaoLoginService().getAccessToken(code);
		
		KakaoDTO ct = new KakaoLoginService().getUserInfo(accessToken);
		// 사용자 정보가 담긴 객체 
		
		HttpSession session = request.getSession();
		
		if(ct!=null) {
			// 해당 사용자 정보가 존재 ( 사용자 정보 == ct ) -> login 해주면 됨 !!  
			Customer customer = new KakaoLoginService().searchById(ct.getCustEmail());
			if(customer==null) {
				// null 일 수 가 없음 외냐면 없으면 sevice 에서 db 에 저장해주니까 !
				// 카카오 사용자 이메일이 디비에 없음 -> 최초 로그인 ! 
				// 해당 사용자 정보를 db 에 저장하고 , session 에 담아쥼 ! 
				session.setAttribute("loginMember", customer);
				
				response.sendRedirect(request.getContextPath()+"/");
				// 개인정보 입력창으로 넘겨주기
				
				
			} else {
				// 사용자 이메일이 디비에 저장되어 있음 . ->걍 로그인 
				// 해당 사용자 정보를 session 에만 담아주면 됨 ! 
				session.setAttribute("loginMember", customer);
				response.sendRedirect(request.getContextPath()+"/");
			}
		} 
//		else {
//			// ct == null -> 해당 이메일 아이디가 이미 존재함. 따라서, 이메일이 중복된다는 메시지 창 띄워주고
//			// login 창 띄워주기 !
//			Customer customer = new KakaoLoginService().searchById(ct.getCustEmail());
//
//			if(customer!=null) {
//				session.setAttribute("loginMember", customer);
//				response.sendRedirect(request.getContextPath()+"/");
//			}
//		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
