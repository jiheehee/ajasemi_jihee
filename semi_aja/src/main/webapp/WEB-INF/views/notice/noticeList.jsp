<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.notice.dto.Notice,java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Notice> notices=(List<Notice>)request.getAttribute("notices");
%> 

<style>

	h6{
		padding-bottom:20px;
	}
	
	section{
		/* border : 1px solid red;  */
		width:1000px;
		margin-left:250px;
	}
	
	#popup1{
		display:none;
	}
    /* 초기 모든 팝업 숨김 */
    .popup {
       display: none;
    }

    /* 팝업 보여질때 */
   .popup_show {
        display: block;
        border:1px solid red;
        width:1000px;
        height:1000px;
    }

    /* 팝업 토글 버튼 스타일 */
    tr.titleId {
        cursor: pointer;
/*         background-color: #e1dcd6; /* 팝업 토글 영역 강조*/ */
        background-color: ##ffffff; /* 팝업 토글 영역 강조*/
        border:1px solid red;
    }
</style>

<div>
    <a href="<%=request.getContextPath()%>/faq/faqlist.do"><p> FAQ </p></a>
</div>

<section id="notice-container">
	<h3><strong>NOTICE</strong></h3>
	<h6><strong>공지사항</strong></h6>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
		<%
			if(notices !=null){
				for(int i=0; i<notices.size(); i++){
					Notice notice=notices.get(i);
		%>
		<tr onclick="pop_up(event);" class="titleId">
			<td><%=(i+1)%></td>
			<td><%= notice.getNoticeTitle()%></td>
			<td><%= notice.getNoticeEnrolldate() %></td>
		</tr>
		<tr class="popup">
			<td><%=notice.getNoticeContent() %></td>
		</tr>
		<%
				}
			}
		%>				
		</tbody>
	</table>
</section>
<script>
/* 	const pop_up = function(e){
		const $tr = e.target.parentElement;
		const $popup = $tr.nextElementSibling;
		console.log($popup);
		
		$popup.classList.toggle("popup");
		$popup.classList.toggle("popup_show");
	}
	 */
	const pop_up = function(e){
        const $tr = e.target.parentElement;
        const $popup = $tr.nextElementSibling;
        console.log($popup);
        
    // 다른 열들의 팝업을 모두 닫음 
    const $popups = document.querySelectorAll('.popup_show');
    $popups.forEach(popup => {
        popup.classList.remove('popup_show');
        popup.classList.add('popup');
    });

    $popup.classList.toggle("popup_show");
    }
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>