package com.aja.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aja.product.model.dto.ProdOption;
import com.aja.product.service.OptionService;

/**
 * Servlet implementation class OptionEnrollServlet
 */
@WebServlet("/product/optionenroll.do")
public class OptionEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OptionEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	ProdOption o = 	ProdOption.builder()
			.optionFlavor(request.getParameter("optionFlavor"))
			.optionSize(request.getParameter("optionSize"))
			.optionPrice(Integer.parseInt(request.getParameter("optionPrice")))
			.build();
	
	int result = new OptionService().enrollOption(o);
	String msg="", loc="";
	if(result>0) {
		msg="등록 성공했습니다. :)";
		loc = "/";
	}else {
		msg = "등록 실패했습니다. :(";
		loc = "/";
	}
	request.setAttribute("msg", msg);
	request.setAttribute("loc",loc);
	request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
