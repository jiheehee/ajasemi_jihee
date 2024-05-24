<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.faq.model.dto.Faq,java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<%
	List<Faq> faqlist=(List<Faq>)request.getAttribute("faq");
%>
<style>
	h3{
		padding-top:50px;
	}
	
	h3,h6 {
		padding-left:200px;
	}
	
	.info{
		font-size:12px;
		padding-left:200px;
	}

   .search-container {
		padding-left:200px;
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
        margin-left:130px;
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
	    margin-left: 200px;
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

<h3><strong>FAQ</strong></h3>
<h6><strong>자주 묻는 질문</strong></h6>
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

<form id="category-form" method="GET">
	<input type="hidden" name="category" id="category-input">
</form>
<body>
    <div class="faq-categories">
        <button class="faq-button" data-category="frequent" onclick="submitCategory(this)">자주찾는 FAQ</button>
        <button class="faq-button" data-category="shopping">배송</button>
        <button class="faq-button" data-category="order">주문/결제</button>
        <button class="faq-button" data-category="cancellation">취소/환불</button>
        <button class="faq-button" data-category="return">반품/교환</button>
        <button class="faq-button" data-category="review">리뷰</button>
    </div>
</body>
<table>
<tr>
	<th>구분</th>
	<th>제목</th>
</tr>
	<%
		if(faqlist !=null){
			for(int i=0; i<faqlist.size(); i++){
				Faq faq=faqlist.get(i);
	%>
	<tr onclick="pop_up" class="titleId">
	<td><%=faq.getFaqCategory() %></td>
	<td><%=faq.getFaqTitle() %></td>
	</tr>	
	<tr class="popup">
		<td><%=faq.getFaqContent() %></td>		
	</tr>
	<%
		}
	}
	%>	
</table>
</body>

<script>
	const pop_up = function(e){
		const $tr = e.target.parentElement;
		const $popup = $tr.nextElementSibling;
		console.log($popup);		
		$popup.classList.toggle("popup");
		$popup.classList.toggle("popup_show");		
	}	
	
	/* 카테고리 로직 */
	function submitCategory(button){
		const category=button.getAttribute('data-category');
		document.getElementById('category-input').value=category;
		document.getElementById('category-form').submit();
	}
	
</script>


<br>
<br>
<br>
<br>
<br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>