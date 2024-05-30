<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.qna.model.dto.Qna,java.text.SimpleDateFormat" %>
<%
	Qna q=(Qna)request.getAttribute("qnaKey");
%>

<h3>글쓴거 상세페이지</h3>

<style>
 section#notice-container{width:600px; margin:0 auto; text-align:center;}
 section#notice-container h2{margin:10px 0;}
 table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
 table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
 table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style>

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