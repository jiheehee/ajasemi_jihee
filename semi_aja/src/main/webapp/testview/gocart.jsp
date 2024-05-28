<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="<%= request.getContextPath() %>/member/cartview.do" action="post">	
		<input type="number" name="custKey">
		<input type="submit" value="장바구니로">
	</form>
</body>
</html>