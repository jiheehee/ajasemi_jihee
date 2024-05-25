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
	<input type="number" name="cust_key" placeholder="회원번호를 입력하세요">
	<input type="number" name="custKey" placeholder="회원번호를 입력하세요">장바구니페이지로
	<button onclick="getList()">리스트불러오기</button>
	<script>
		const getList = () => {
			const cust_key = document.querySelector("input[name='cust_key']").value;
			fetch("<%= request.getContextPath() %>/testfetch.do",{
				method : "POST",
				headers : {
					"Content-type" : "application/x-www-form-urlencoded;charset=utf-8"
				},
				body : "cust_key=" + cust_key
			})
			.then(response => response.json())
			.then(data => {
				console.log(data);
				console.log(data.addressInfo);
			});
		}
	</script>
</body>
</html>