<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/member/gopayview.do" method="post">
		<input type="number" name="memberNo" placeholder="회원번호를 입력하세요">
		<input type="submit" value="결제하러가기">
	</form>
</body>
</html>