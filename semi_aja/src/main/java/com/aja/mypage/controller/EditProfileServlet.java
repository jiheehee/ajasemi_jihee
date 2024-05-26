package com.aja.mypage.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.member.model.dto.Customer;
import com.aja.member.service.MemberService;
import com.google.gson.Gson;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/member/editmember.do")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// JSON 데이터 읽기
        StringBuffer sb = new StringBuffer();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }
        String data = sb.toString();
        System.out.println(data);
//		String data = request.getParameter("sendData");
//		System.out.println(data);

        Gson gson = new Gson();
        Customer editCt = gson.fromJson(data, Customer.class);
        System.out.println(editCt+"이게?");
        int result = new MemberService().editCustomer(editCt);
        
        if(result>0) {
        	Customer editedCt = new MemberService().searchMemberById(editCt.getCustEmail());
        	request.getSession().setAttribute("loginMember", editedCt);
        	
        	String updateCt = gson.toJson(editedCt);
        	response.setContentType("application/json");
        	response.setCharacterEncoding("UTF-8");
        	response.getWriter().write(updateCt);
        	
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
