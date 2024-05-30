<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ page import="java.util.List,com.aja.mypage.model.dto.Order,com.aja.mypage.model.dto.OrderDetail" %>
<% List<Order> orders = (List<Order>)request.getAttribute("orders"); %>

<style>
    body {
        font-family: 'Noto Sans', sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }
    #order-content {
        width: 90%;
        margin: 0 auto;
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    h5 {
        border-bottom: 2px solid #ff6347;
        padding-bottom: 10px;
        color: #333;
    }
    .order-container {
        border: 2px solid #ff6347;
        border-radius: 10px;
        margin-bottom: 20px;
        padding: 20px;
        background-color: #fff5f5;
    }
    .order-info {
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
        margin-bottom: 10px;
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
        width: 100px;
        height: 100px;
        object-fit: cover;
        border-radius: 10px;
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
        flex-direction: column;
        justify-content: center;
    }
    .product-button button {
        background-color: #ff6347;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .product-button button:hover {
        background-color: #e5533d;
    }
    @media (max-width: 768px) {
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
</style>

<section>
    <div id="order-content">
        <div><h5>주문배송조회</h5></div>
        <% if (!orders.isEmpty()) { 
            for (Order o : orders) { %>
        <div class="order-container">    
            <div class="order-info">
                <p>주문 날짜: <%= o.getOrderDate() %></p>
                <p>주문 번호: <%= o.getOrderKey() %></p>
            </div>
            <% if (!o.getOrderDetail().isEmpty()) {
                for (OrderDetail od: o.getOrderDetail()) { %>
            <div class="product">
                <div class="product-img">
                    <img src="" alt="상품사진">
                </div>
                <div class="product-detail">
                    <div><strong>상품명:</strong> <%= od.getProduct().getProdName() %></div>
                    <div>
                        <strong>향:</strong> <%= od.getProduct().getOptionFlavor() %><br>
                        <strong>사이즈:</strong> <%= od.getProduct().getOptionSize() %>
                    </div>
                    <div><strong>가격:</strong> KRW <%= od.getProduct().getProdPrice() %></div>
                    <div><strong><%= o.getOrderStatus() %></strong></div>
                </div>
                <div class="product-button">
                    <button>구매취소</button>
                    <button>환불</button>
                    <button>구매확정</button>
                </div>
            </div>
            <% }
            } %>
        </div>
        <% }
        } %>
    </div>
</section>

<script>
	

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
