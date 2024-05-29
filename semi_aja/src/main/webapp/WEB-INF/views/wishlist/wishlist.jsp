<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.wish.model.dto.Wish,java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Wish> wishList=(List<Wish>)request.getAttribute("wish");
%>

<style>
 body {
     font-family: Arial, sans-serif;
     background-color: #f4f4f4;
     margin: 0;
     padding: 0;
 }
 
 .wishlist-container {
     max-width: 800px;
     margin: 50px auto;
     background-color: #fff;
     padding: 20px;
     box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
     border-radius: 8px;
 }
 
 h1 {
     text-align: center;
     color: #333;
 }
 
 .wishlist {
     list-style: none;
     padding: 0;
     margin: 0;
 }
 
 .wishlist-item {
     display: flex;
     justify-content: space-between;
     align-items: center;
     padding: 15px;
     border-bottom: 1px solid #ddd;
 }
 
 .wishlist-item h2 {
     margin: 0;
     font-size: 1.2em;
 }
 
 .wishlist-item p {
     margin: 5px 0 0 0;
     color: #a29b9b;
 }
 
 .wishlist-item .price {
     font-weight: bold;
     color: #000;
 }
 
 .remove-button {
     background-color: #434140;
     color: #fff;
     border: none;
     padding: 10px 15px;
     cursor: pointer;
     border-radius: 5px;s
     transition: background-color 0.3s;
 }
 
 .remove-button:hover {
     background-color: #8f8c8b;
 }
 </style>

<header>
    <h3><strong>NOTICE</strong></h3>
 <h6><strong>공지사항</strong></h6>
</header>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<body>
	<form action="wishInto" metho="post">
		<table>
			<thead>
				<tr>
					<th>상품명</th>
					<th>상세페이지</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
		</table>
	</form>

    <div class="wishlist-container">
        <h1>위시리스트</h1>
        <ul class="wishlist">
            <li class="wishlist-item">
                <h2>상품 이름 1</h2>
                <p>상품 상세 페이지 이동</p>
                <span class="price">₩30,000</span>
                <button class="remove-button">삭제</button>
            </li>
        </ul>
    </div>
    
    <%for(Product p : productlist){ %>
            
                <div class="products"> <!-- aspect-ratio : 3/1 너비100 높이33.3 이거 안쓰고 grid씀 -->
                    <a href="<%=request.getContextPath()%>/product/productdetailprint.do?prodKey=<%=p.getProdKey()%>&cateKey=<%=p.getCateKey()%>">
                        <div class="product-img">
                            <img src="https://web-resource.tamburins.com/catalog/product/1504792781/62afe28f-a6b2-47c6-bda7-315030b79f24/Thumbnail_ChainHand_65ml_000.jpg"
                             alt="상품이미지" width="100%" height="100%">
                        </div>
                    </a>
                    <div class="product-msg">
                        <div class="product-msg-name">
                            <a href="<%=request.getContextPath()%>/product/productdetailprint.do?prodKey=<%=p.getProdKey()%>&cateKey=<%=p.getCateKey()%>">	
                                <div>								<!-- 눌렀을때 구분할수 있는 값도 같이 보내기 PROD_KEY -->
                                    <p><%=p.getProdName()%></p>
                                    <p><%=p.getKeywordName()%></p>
                                </div>
                                <div>
                                    <span><%=p.getProdPrice() + p.getOptionPrice()%></span>
                                    <span class="product-msg-option"><%=p.getOptionFlavor() %></span>
                                </div>
                            </a>
                        </div>
                        <div class="product-msg-wish">
                            <button type="button" onclick="wishadd(event);">
    
</body>



<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>