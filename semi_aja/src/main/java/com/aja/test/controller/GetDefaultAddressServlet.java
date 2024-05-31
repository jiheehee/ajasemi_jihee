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
 * Servlet implementation class GetDefaultAddressServlet
 */
@WebServlet("/join/defaultaddress.do")
public class GetDefaultAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDefaultAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cust_key = Integer.parseInt(request.getParameter("cust_key"));
		Address defaultAddress = new MemberService().getDefaultAddress(cust_key);
		System.out.println(defaultAddress);
		JSONObject addressObject = new JSONObject();
		addressObject.put("addrName", defaultAddress.getAddrName());
		addressObject.put("addrPostcode", defaultAddress.getAddrPostcode());
		addressObject.put("addrAddress", defaultAddress.getAddrAddress());
		addressObject.put("addrDetail", defaultAddress.getAddrDetail());
		addressObject.put("addrPhone", defaultAddress.getAddrPhone());
		
		response.getWriter().print(addressObject);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
