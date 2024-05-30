<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    
<style>
    section#qna-container{width:600px; margin:0 auto; text-align:center;}
    section#qna-container h2{margin:10px 0;}
    table#tbl-qna{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-qna th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-qna td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style>
    
<section id="qna-container">
	<form action="<%=request.getContextPath()%>/qna/qnawriteend.do"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="custKey" value="<%=loginMember.getCustKey()%>"> 
		<table id="tbl-qna">
			<tr>
				<th>제목</th>
				<td><input class="form-control" type="text" name="title" required></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input class="form-control" type="text" name="content" required></td>
				
			</tr>
			<tr>
				<td>
					<input class="form-control" type="file" name="uptile">
					<input class="form-control" type="file" name="uptile2">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="submit" value="등록하기">등록하기</button>
				</th>
			</tr>		
		</table>
	</form>
</section>
    
    
    
    
    
    
    
    
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>