<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.notice.dto.Notice,java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Notice> notices=(List<Notice>)request.getAttribute("notices");
%>
<section id="notice-container">
	<h2>공지사항</h2>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>