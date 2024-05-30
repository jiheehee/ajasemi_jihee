package com.aja.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.aja.member.model.dto.Customer;
import com.aja.member.service.MemberService;

/**
 * Servlet implementation class CheckEmailServlet
 */
@WebServlet("/member/checkIdDuplicate.do")
public class CheckEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // JSON 파싱
        BufferedReader reader = request.getReader();
        StringBuilder jsonString = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonString.append(line);
        }

        // 파싱된 JSON을 Java 객체로 변환
        JSONObject json = new JSONObject(jsonString.toString());
        String custEmail = json.getString("custEmail");

        // 아이디 중복 체크
        Customer customer = new MemberService().searchMemberById(custEmail);
        boolean isDuplicate = true;
        if(customer==null) {
        	isDuplicate = false;
        }

        // JSON 응답 작성
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("isDuplicate", isDuplicate);
        out.print(jsonResponse);
        out.flush();
    }

		
		
		
		


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
