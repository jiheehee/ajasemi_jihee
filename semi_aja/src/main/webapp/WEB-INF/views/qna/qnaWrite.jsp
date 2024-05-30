<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    
<style>
/*     section#qna-container{width:600px; margin:0 auto; text-align:center;}
    section#qna-container h2{margin:10px 0;}
    table#tbl-qna{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-qna th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-qna td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;} */
    
h3{
	padding-top: 30px;
}

h3,h6 {
		padding-left:250px;
	}
	
h6 {
	margin-bottom:40px;
}    

    /* 전반적인 폼 스타일 */
#qna-container {
    width: 60%;
    margin: 0 auto;
    padding: 20px;
    background-color: #f5f5f5;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* 테이블 스타일 */
#tbl-qna {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

/* 테이블 헤더 스타일 */
#tbl-qna th {
    background-color: #e0e0e0;
    color: #333;
    padding: 10px;
    text-align: left;
    border-bottom: 2px solid #ccc;
}

/* 테이블 셀 스타일 */
#tbl-qna td {
    background-color: #fff;
    color: #555;
    padding: 10px;
    border-bottom: 1px solid #e0e0e0;
}

/* 인풋 필드 스타일 */
#tbl-qna .form-control {
    width: calc(100% - 22px);
    padding: 8px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

/* 버튼 스타일 */
#tbl-qna button {
    background-color: #333333;
    color: white;
    padding: 10px 20px;
    margin: 10px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    text-align: center;
    display: inline-block;
    font-size: 16px;
    width: 100%;
}

/* 버튼 호버 효과 */
#tbl-qna button:hover {
    background-color: #757575;
}
    
    
    
</style>
 
 <header>
    <h3><strong>NOTICE</strong></h3>
 <h6><strong>공지사항</strong></h6>
</header>
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