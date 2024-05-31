<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.List,com.aja.order.model.dto.OrderDetail" %>    
<%
	List<OrderDetail> orderDetailList = (List<OrderDetail>)request.getAttribute("orderDetailList");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 상세</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .order-detail-container {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .order-detail-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .order-detail-table th, .order-detail-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .order-detail-table th {
            background-color: #f2f2f2;
            color: #333;
        }

        .order-detail-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .order-detail-table tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <div class="order-detail-container">
        <h1>주문 상세</h1>
        <table class="order-detail-table">
            <thead>
                <tr>
                    <th>주문 번호</th>
                    <th>옵션 이름</th>
                    <th>상품 이름</th>
                    <th>가격</th>
                    <th>수량</th>
                </tr>
            </thead>
            <tbody>
            	<%if(orderDetailList.size()>0){ 
            	for(OrderDetail od : orderDetailList){%>
                <tr>
                    <td><%= od.getOdKey() %></td>
                    <td><%= od.getOptionFlavor() %></td>
                    <td><%= od.getProdName() %></td>
                    <td><%= od.getOdPrice() %></td>
                    <td><%= od.getOdQuantity() %></td>
                </tr>
                <%}
            	}%>
            </tbody>
        </table>
    </div>
</body>
</html>