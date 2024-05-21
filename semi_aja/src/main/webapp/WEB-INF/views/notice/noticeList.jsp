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
				<td id=num></td>
				<td id=title></td>
				<td id=content></td>				
			</tr>
		</tbody>
	</table>
</section>
<script>
document.addEventListener("DOMContentLoaded",function(){
	var tdElements=document.querySelectorAll("td#num"); //td의 num요소 가져오기
	tdElements.forEach((td,index)=>{
		td.textContent=index+1;
	});	
});
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>