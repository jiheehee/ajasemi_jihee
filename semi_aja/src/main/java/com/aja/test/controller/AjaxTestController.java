package com.aja.test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.aja.member.model.dto.Address;
import com.aja.member.service.MemberService;

/**
 * Servlet implementation class AjaxTestController
 */
@WebServlet("/testfetch.do")
public class AjaxTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("일단왔습니다.");
		int cust_key = Integer.parseInt(request.getParameter("cust_key"));
		System.out.println(cust_key);
		Address addressInfo = new MemberService().getDefaultAddress(cust_key);
		
		JSONObject addObject = new JSONObject();
		addObject.put("addrDetail", addressInfo.getAddrDetail());
		
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(addObject);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
