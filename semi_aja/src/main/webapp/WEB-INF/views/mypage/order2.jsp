<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ page import="java.util.List,com.aja.mypage.model.dto.Order,com.aja.mypage.model.dto.OrderDetail" %>
<% 
	List<Order> orders = (List<Order>)request.getAttribute("orders"); 
	String pageBar = (String)request.getAttribute("pageBar");
%>
<style>
    .pagination {
        display: flex;
        justify-content: center;
        padding-left: 0;
        list-style: none;
        border-radius: 0.25rem;
    }
    .pagination li {
        display: inline;
    }
    .pagination li a {
        color: black;
        background-color: white;
        border: 1px solid white;
        padding: 0.5rem 0.75rem;
        margin: 0 0.25rem;
        text-decoration: none;
        border-radius: 0.25rem;
    }
    .pagination li.disabled a,
    .pagination li.active a {
        background-color: white;
        border-color: white;
        cursor: default;
    }
    .pagination li a:hover {
        background-color: black;
        color:white;
    }
    .pagination li.active a {
        color: black;
        background-color: white;
        border-color: white;
    }
</style>


<style>
	#pageBar{
		margin-top : 30px;
	}
	#full{
		width:100%;
		margin-top:50px;
		margin-bottom:50px;
	}
    body {
        font-family: 'Noto Sans', sans-serif;
        background-color: white;
        margin-top:30px;
        /* margin: 0; */
        padding: 0;
    }
    section{
    	display:flex;
    	align-items:center;
    }
    #order-content {
    	margin-top: 20px;
        width: 90%;
        margin:auto;
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    h5 {
    	padding-left: 5px;
        padding-bottom: 10px;
        font-size: 20px;
        color: #333;
    }
    .order-container {
    	margin-top:10px;
        border: 1px solid black;
        border-right:none;
        border-left:none;
       /*  border-radius: 10px; */
        margin-bottom: 20px;
        padding: 20px;
        background-color: white;
    }
    .order-info {
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
        margin-bottom: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .order-info p {
        margin: 0;
        color: #666;
    }
    .product {
        display: flex;
        flex-direction: row;
        margin-bottom: 20px;
    }
    .product-img img {
        width: 200px;
        height: 200px;
        object-fit: cover;
    }
    .product-detail {
        flex-grow: 1;
        padding-left: 20px;
    }
    .product-detail div {
        margin-bottom: 10px;
        color: #333;
    }
    .product-button {
        display: flex;
        gap: 10px;
    }
    .product-button button {
        background-color: black;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    
    .product-button button:hover {
        background-color: white;
        color: black;
        border: none;
        
    }
    
    @media (max-width: 1000px) {
        .product {
            flex-direction: column;
            align-items: center;
        }
        .product-img, .product-detail, .product-button {
            width: 100%;
            text-align: center;
        }
        .product-button {
            flex-direction: row;
            justify-content: space-around;
        }
        .product-button button {
            width: 30%;
        }
    }
    
    
    /* 
    @media (max-width: 1000px) {
        .product {
            flex-direction: column;
            align-items: center;
        }
        .product-img, .product-detail, .product-button {
            width: 100%;
            text-align: center;
        }
        .product-button {
            flex-direction: row;
            justify-content: space-around;
        }
        .product-button button {
            width: 30%;
        }
    } */
</style>

<section>
	<div id="full">
    <div id="order-content">
        <div><h5>주문배송조회</h5></div>
        <% if (!orders.isEmpty()) { 
            for (Order o : orders) { %>
        <div class="order-container">    
            <div class="order-info">
            	<div>
	                <p>[<%= o.getOrderDate() %>]</p>
	                <p>주문번호[<%= o.getOrderKey() %>]</p>
                </div>
                <div class="product-button">
                    <button onclick="cancle('<%=o.getOrderKey()%>');">구매취소</button>
					<button onclick="refund('<%= o.getOrderKey() %>');">환불</button>
                    <button onclick="check();">구매확정</button>
                </div>
            </div>
            <% if (!o.getOrderDetail().isEmpty()) {
                for (OrderDetail od: o.getOrderDetail()) { %>
            <div class="product">
                <div class="product-img">
                    <img src="<%=request.getContextPath() %>/upload/product/<%=od.getProduct().getProdImage() %>" alt="상품사진">
                </div>
                <div class="product-detail">
                    <div><strong>상품명:</strong> <%= od.getProduct().getProdName() %></div>
                    <div>
                        <strong>향:</strong> <%= od.getProduct().getOptionFlavor() %><br>
                        <strong>사이즈:</strong> <%= od.getProduct().getOptionSize() %>
                    </div>
                    <div><strong>가격:</strong> KRW <%= od.getProduct().getProdPrice() %></div>
                    <div><strong><%= o.getOrderStatus() %></strong></div>
                    <div><%= o.getOrderDelivery() %></div>
                </div>
            </div>
            <% }
            } %>
        </div>
        <% }
        } %>
    </div>
    <div id="pageBar">
    	<%=pageBar %>
    </div>
    </div>
</section>

<script>
	const cancle = (orderKey) => {
		console.log("취소 주문 번호:", orderKey);
		location.assign("<%=request.getContextPath()%>/mypage/orderrefund.do?orderKey="+orderKey+"&type=취소");
	}
	const refund = (orderKey) => {
        console.log("환불 주문 번호:", orderKey);
       	location.assign("<%=request.getContextPath()%>/mypage/orderrefund.do?orderKey="+orderKey+"&type=환불");
    }

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
