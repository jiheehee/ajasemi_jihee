package com.aja.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.aja.member.model.dto.Customer;

/**
 * Servlet Filter implementation class LoingCheckFilter
 */
@WebFilter(urlPatterns = {"/cart/*","/mypage/*"})
public class LoingCheckFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoingCheckFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req=(HttpServletRequest)request;
		HttpSession session=req.getSession();
		Customer loginMember=(Customer)session.getAttribute("loginMember");
		if(loginMember==null) {
			request.setAttribute("msg","로그인 후 이용할 수 있습니다");
			request.setAttribute("loc","/member/login.do");
			request.getRequestDispatcher(request.getServletContext().getInitParameter("viewpath")+"common/msg.jsp")
			.forward(request, response);
		}else {
			// pass the request along the filter chain
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
