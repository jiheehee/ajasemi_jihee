<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section id="memberList-container">
	<div id=search-conatiner>
		<form action="<%=request.getContextPath()%>/faq/faqlist.do">
		<input type="text" name="searchKeyword" size="25" placeholder="검색">
		<button type="submit">검색</button>								
		</form>		
	</div>
</section>







<%@ include file="/WEB-INF/views/common/footer.jsp" %>