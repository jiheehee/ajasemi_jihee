<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ page import="com.aja.payment.model.dto.Order" %>
<%
    Order orderInfo = (Order)request.getAttribute("orderInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결제성공</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div id="paySuccessInfoContainer" class="card">
            <div class="card-header">
                <h1 class="card-title">결제성공</h1>
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>목록</th>
                            <th>내용</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>성함</td>
                            <td><%= orderInfo.getOrderName() %></td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>우편번호 : <%= orderInfo.getOrderPostcode()%> 주소 : <%= orderInfo.getOrderAddress() %> <%= orderInfo.getOrderDetailaddr() %></td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td><%= orderInfo.getOrderPhone() %></td>
                        </tr>
                        <tr>
                            <td>배송 요청사항</td>
                            <td><%= orderInfo.getOrderRequest() %></td>
                        </tr>
                        <tr>
                            <td>총 상품명</td>
                            <td><%= orderInfo.getOrderName() %></td>
                        </tr>
                        <tr>
                            <td>총 가격</td>
                            <td><%= orderInfo.getOrderPrice() %></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="buttonContainer" class="mt-3 text-center">
            <button onclick="location.assign('<%= request.getContextPath() %>/main/mainview.do')" class="btn btn-primary">메인으로</button>
            <button onclick="window.location.href='#'" class="btn btn-secondary">어디론가</button>
        </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
