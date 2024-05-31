<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.qna.model.dto.Qna,java.text.SimpleDateFormat" %>
<%
	Qna q=(Qna)request.getAttribute("qnaKey");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
/*  section#notice-container{width:600px; margin:0 auto; text-align:center;}
 section#notice-container h2{margin:10px 0;}
 table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
 table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
 table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;} */
 
 h3{
	padding-top: 30px;
}

h3,h6 {
		padding-left:250px;
	}
	
h6 {
	margin-bottom:40px;
}
 
/* 전반적인 섹션 스타일 */
#qna-container {
    width: 70%;
    margin: 0 auto;
    padding: 20px;
    background-color: #f5f5f5;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* 테이블 스타일 */
#tbl-notice {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

/* 테이블 헤더 스타일 */
#tbl-notice th {
    background-color: #e0e0e0;
    color: #333;
    padding: 10px;
    text-align: left;
    border-bottom: 2px solid #ccc;
    width: 20%; /* 헤더의 너비를 고정 */
}

/* 테이블 셀 스타일 */
#tbl-notice td {
    background-color: #fff;
    color: #555;
    padding: 10px;
    border-bottom: 1px solid #e0e0e0;
}

/* 파일 다운로드 div 스타일 */
#tbl-notice div {
    display: flex;
    align-items: center;
    cursor: pointer;
}

#tbl-notice div img {
    margin-right: 10px;
}

#tbl-notice div span {
    color: #007BFF;
    text-decoration: none;
}

/* 버튼 스타일 */
#tbl-notice input[type="button"] {
    background-color: #333333;
    color: white;
    padding: 10px 20px;
    margin: 10px 5px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

#tbl-notice input[type="button"]:hover {
    background-color: #757575;
}
 
 
</style>

<header>
        <h3><strong>QNA</strong></h3>
		<h6><strong>1:1 문의</strong></h6>
    </header>
<section id="qna-container">
        <table id="tbl-notice">
        <tr>
            <th>제 목</th>
            <td><%=q.getCustTitle() %></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td>
           		<%if(q.getFilePath()!=null){ %>
           		<!-- <a href=""> -->
           		<div onclick="fn_filedownload('<%=q.getFilePath()%>');">
           			<img src="<%=request.getContextPath()%>/images/file.png"
           			width="25"><span><%=q.getFilePath() %></span>
           		</div>
           		<!-- </a> -->
           		<%}else{ %>
           			첨부파일없음!
           		<%} %>
            </td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><%=q.getQnaContent() %></td>
        </tr>
        <tr>
            <th colspan="2">
                <input type="button" value="수정하기" 
                onclick="location.assign('<%=request.getContextPath()%>/qna/qnaupdate.do?no=<%=q.getQnaKey()%>')">
                <input type="button" value="삭제하기" onclick="">
            </th>
        </tr>
    </table>
</section>

<script>
	const fn_filedownload=(fileName)=>{	
		location.assign(`<%=request.getContextPath()%>/notice/filedown.do?filename=\${fileName}`);
	}
</script>








<%@ include file="/WEB-INF/views/common/footer.jsp" %>