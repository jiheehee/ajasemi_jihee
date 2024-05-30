<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img src="<%= request.getContextPath() %>/upload/errorimage/errorpageimage.png" width="100%" height="600px">
	<button onclick="location.assign('<%= request.getContextPath() %>/main/mainview.do')">메인으로</button>
</body>
</html>