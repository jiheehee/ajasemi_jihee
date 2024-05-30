<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.faq.model.dto.Faq,java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<%
	List<Faq> faqlist=(List<Faq>)request.getAttribute("faq");
%>
<style>
	table{
		/* border : 1px solid red; */
		width: 1000px;
		margin-left: 250px;
	}
	
	h3{
		padding-top:50px;
	}
	/* FAQ 자주찾는 질문 태그 스타일 */
	h3,h6 {
		padding-left:250px;
	}
	
	/* FAQ 자주찾는 질문 태그 스타일 */
	a{
		text-decoration:none;
		color:black;
	}
	
	.info{
		font-size:12px;
		padding-left:250px;
	}

   .search-container {
		padding-left:250px;
        position: relative;
        width: 300px;
    }
    .search-box {
        width: 250px;
        height: 60px;
        padding: 10px 40px 10px 10px;
        font-size: 16px;
        border: 1px solid #000000;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        outline: none;
       
    }
    .search-button {
        position: absolute;
        right: 0;
        top: 0;
        bottom: 0;
        width: 40px;
        height: 40px;
        border: none;
        background: none;
        cursor: pointer;
        outline: none;
        /* display: flex; */
    }
    .search-button i {
    	/* border: 1px solid red; */
        margin-top: 15px;
        margin-left:180px;
        color: #000;
        font-size: 30px;
    }
    
    /* 카테고리 스타일 적용 */
	body {
	    font-family: Arial, sans-serif;
	    line-height: 1.6;
	    margin: 0;
	    padding: 20px;
	}
	
	.faq-categories {
		/* border:1px solid red; */
	    display: flex;
	    gap: 20px;
	    margin-left: 250px;
	    margin-bottom: 20px;
	}
	
	.faq-button {
	    padding: 10px 20px;
	    background-color: #605D58;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s;
	}
	
	.faq-button:hover {
	    background-color: #282825;
	}	
	/* 본문 테이블 스타일 */	
</style>

<h3><strong><a href="<%=request.getContextPath() %>/faq/faqlist.do">FAQ</a></strong></h3>
<h6><strong><a href="<%=request.getContextPath() %>/faq/faqlist.do">자주 묻는 질문</a></strong></h6>
<body>

<section id="memberList-container">
    <div class="search-container">
        <form action="<%=request.getContextPath()%>/faq/faqsearch.do">
            <input type="text" name="search" class="search-box"> <!-- 여기서 search가 키값으로 들어감 -->
            <button type="submit" class="search-button"><i class="fas fa-search"><!-- 돋보기 --></i></button>
        </form>
    </div>
</section>
<span class="info"><strong>찾으시는 답변이 없으면 1:1 문의하기 또는 고객센터 전화(1544-0421)로 문의해주세요.</strong></span><br>

<form id="category-form" action="<%=request.getContextPath()%>/faq/categorysearch.do" method="GET">
	<input type="hidden" name="category" id="category-input">
</form>

<div class="faq-categories">
	<button class="faq-button" data-category="배송" onclick="submitCategory(this)">배송</button>
	<button class="faq-button" data-category="주문결제" onclick="submitCategory(this)">주문/결제</button>
	<button class="faq-button" data-category="취소/환불" onclick="submitCategory(this)">취소/환불</button>
	<button class="faq-button" data-category="반품/교환" onclick="submitCategory(this)">반품/교환</button>
	<button class="faq-button" data-category="리뷰" onclick="submitCategory(this)">리뷰</button>
</div>

<table>
<tr>
	<th>구분</th>
	<th>제목</th>
</tr>
<%
	if(faqlist != null) {
		for(int i = 0; i < faqlist.size(); i++) {
			Faq faq = faqlist.get(i);
%>
<tr onclick="pop_up(event)" class="titleId">
	<td><%=faq.getFaqCategory() %></td>
	<td><%=faq.getFaqTitle() %></td>
</tr>	
<tr class="popup">
	<td colspan="3"><%=faq.getFaqContent() %></td>
</tr>
<%
		}
	}
%>	
</table>

<script>
  	const pop_up = function(e) {
		const $tr = e.target.parentElement;
		const $popup = $tr.nextElementSibling;
		console.log($popup);		
		$popup.classList.toggle("popup");
		$popup.classList.toggle("popup_show");		
	} 	
	function submitCategory(button) {
		const category = button.getAttribute('data-category');
		document.getElementById('category-input').value = category;
		document.getElementById('category-form').submit();
	} 
</script>


<br>
<br>
<br>
<br>
<br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>