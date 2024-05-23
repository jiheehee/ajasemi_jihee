<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.faq.model.dto.Faq,java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<%
	List<Faq> faq=(List<Faq>)request.getAttribute("faq");
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
</style>

<h3><strong>FAQ</strong></h3>
<h6><strong>자주 묻는 질문</strong></h6>
<body>
    <div class="search-container">
        <form action="search_results.html" method="get">
            <input type="text" name="query" class="search-box">
            <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
        </form>
    </div>
</body>
<span class="info"><strong>찾으시는 답변이 없으면 1:1 문의하기 또는 고객센터 전화(1544-0421)로 문의해주세요.</strong></span><br>
<tr>
	<th>자주찾는 FAQ</th>
	<th>배송</th>
	<th>주문/결제</th>
	<th>취소/환불</th>
	<th>반품/교환</th>
	<th>리뷰</th>
</tr>
<%
	if(faq !=null){
		for(int i=0; i<faq.size(); i++){
			Faq faqlist=faq.get(i);
%>
<%-- <tr onclick="pop_up(event);" class="titleId">
	<td><%=faq.faqTitle()%></td>
	<td><%=faq.faqCategory()%></td>
	<td><%=faq.faqContent() %></td>
</tr> --%>
<%
		}
	}
%>



