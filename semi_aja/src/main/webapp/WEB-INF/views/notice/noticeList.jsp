<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.notice.dto.Notice,java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Notice> notices=(List<Notice>)request.getAttribute("notices");
%>
<section id="notice-container">
	<h2>공지사항</h2>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>제목이 어쩌구 저쩌구</td>
				<td>2024.05.21</td>
			</tr>
		</tbody>
	</table>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>