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
    body {
        font-family: 'Noto Sans', sans-serif;
        background-color: white;
        margin-top: 30px;
        padding: 0;
    }
    section {
        display: flex;
        align-items: center;
    }
    #order-content {
        width: 90%;
        margin: 20px auto;
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
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    .product-img img {
        width: 100px;
        height: 100px;
        object-fit: cover;
        border-radius: 10px;
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
        border: 0.1px solid black;
    }
    #pageBar {
        margin-top: 30px;
    }
</style>

<section>
    <div id="order-content">
        <div><h5>주문배송조회</h5></div>
        <% if (!orders.isEmpty()) { %>
        <table>
            <thead>
                <tr>
                    <th>주문 날짜</th>
                    <th>주문 번호</th>
                    <th>상품 정보</th>
                    <th>가격</th>
                    <th>상태</th>
                    <th>배송비</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <% for (Order o : orders) { %>
                <tr>
                    <td><%= o.getOrderDate() %></td>
                    <td><%= o.getOrderKey() %></td>
                    <td>
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
                            </div>
                        </div>
                        <% } } %>
                    </td>
                    <td>KRW <%= o.getOrderDetail().get(0).getProduct().getProdPrice() %></td>
                    <td><%= o.getOrderStatus() %></td>
                    <td>
                        <% if(o.getOrderDetail().get(0).getOdPrice() >= 50000) { %>
                        무료
                        <% } else { %>
                        3000원
                        <% } %>
                    </td>
                    <td class="product-button">
                        <button>구매취소</button>
                        <button>환불</button>
                        <button>구매확정</button>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
        <div id="pageBar">
            <%= pageBar %>
        </div>
    </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
