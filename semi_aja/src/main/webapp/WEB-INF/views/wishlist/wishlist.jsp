<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.wish.model.dto.Wish,java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Wish> wish=(List<Wish>)request.getAttribute("wish");
	/* out.print(wishList.get(0).getProdKey()); */
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
    <h3><strong>WISH LIST</strong></h3>
 <h6><strong>위시리스트</strong></h6>
</header>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<body>
	<form action="wishInto" method="post">
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

	<%for(Wish w : wish){ %>
    <div class="wishlist-container">
        <h1>위시리스트</h1>
        <ul class="wishlist">
            <li class="wishlist-item">
                <h2><%=w.getProduct().getProdName() %></h2>
                <a href="<%=request.getContextPath()%>/product/productdetailprint.do?prodKey=<%=w.getProdKey()%>"></a>
                <span class="price"><%=w.getProduct().getProdPrice() %></span>
                <button class="remove-button" onclick="delProduct(event, '<%=w.getProdKey()%>');">삭제</button>
            </li>
        </ul>
    </div>
    <%
	}
    %>
</body>

<script>
	function delProduct(event,prodKey){
		//이벤트 발생한 버튼의 부모 요소인 li 찾기		
		const listProduct=event.currentTarget.parentElement.parentElement.parentElement;
		

		
		//서버로 삭제 요청 보냄
		$.ajax({
			type:"POST",
			url:"<%=request.getContextPath()%>/product/productwishdelete.do",
			data:{prodKey: prodKey},
			success: function(response){
				console.log("삭제 성공",response);
				if(response>0){
					//선택한 항목 삭제
					listProduct.remove();
				}else{
					alert("삭제실패 다시시도하세요! :(");
				}
			},
			error:function(error){
				console.error("삭제 실패",error);
			}
		});		
	}		
</script>



<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>