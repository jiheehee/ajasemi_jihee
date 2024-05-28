<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.aja.cart.model.dto.CartInfo" %>
<%
	List<CartInfo> cartInfos = (List<CartInfo>)request.getAttribute("cartInfoList");
	int count = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table th, table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        table th {
            background-color: #f8f8f8;
            color: #555;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px 5px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            color: #fff;
            background-color: #333;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #555;
        }
        .total {
            text-align: right;
            font-size: 18px;
            margin-top: 20px;
        }
        .empty-message {
            text-align: center;
            color: #777;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<% if(cartInfos == null) {%>
	<h1>장바구니에 등록된 상품이 없습니다.</h1>
<% } else {%>
	<div class="container">
        <h1>장바구니</h1>
			<form action="cartInto" method="post">
            <table>
                <thead>
                    <tr>
                    	<th>선택</th>
                        <th>상품 정보</th>                        
                        <th>옵션</th>
                        <th>수량</th>
                        <th>금액</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <%for(CartInfo c : cartInfos) {%>
                	<tr>
                        <td>
                            <input type="checkbox" name="selectProducts" 
                            value="">
                        </td>                	                      
                     <td><%= c.getProdName() %></td>
                     <td>
                     	 <p>향 : <%= c.getOptionFlavor() %></p>
                         <p>용량 : <%= c.getOptionSize() %></p>
                     </td>             
                     <td>
                         <div class="stock-container">
                             <button class="btn-outline-success" id="<%= count %>" type='button' value="incre">+</button>
                             <input type="number" min='1' max='<%= c.getProdStock() %>' value='1' size="2" >
                             <button class="btn-outline-danger" type='button' value="decre">-</button>
                         </div>
                     </td>
                     <td class='cart-total'>
                        <span>상품가격 : </span><span id="prodPrice<%= count %>"><%= c.getProdPrice() %></span> + <span>옵션가격 : </span><span id="optionPrice<%= count %>"><%= c.getOptionPrice() %></span><br>
                        <span>총 가격 : </span><span id="totalProdPrice<%= count %>"><%= c.getProdPrice() + c.getOptionPrice() %></span>
                     </td>								
                     <td>                             
                         <a href="" class="btn">삭제</a>
                     </td>
                  </tr>
                <%count++;} %>
                </tbody>
            </table>
            <table>
            	<thead>
            		<tr>
            			<th>총 주문금액</th>
            			<th></th>
            			<th>배송비</th>
            			<th></th>
            			<th>총 결제금액</th>
            		</tr>
            	</thead> 
            	<tbody>
                    <tr>
                        <td>체크박스로 선택된거 다 가져오기</td>
                        <td><strong>+</strong></td>
                        <td></td>
                        <td><strong>=</strong></td>
                        <td><h5><strong>91,000원</strong></h5></td>
                    </tr>
                </tbody>           	           
            </table>
        <a href="" class="btn">장바구니 비우기</a>
        </form>
    </div>
<% } %>
<script>
	document.querySelectorAll(".btn-outline-success").forEach(e => {
		e.addEventListener("click", e => {
			const buttonId = e.target.id;
			const amount = e.target.
			const prodPrice = Number(document.getElementById("prodPrice" + buttonId).innerText);
			const optionPrice = Number(document.getElementById("optionPrice" + buttonId).innerText);
			console.log("prodPrice : " + prodPrice + " optionPrice : " + optionPrice);
			document.getElementbyId("totalProdPrice" + buttonId).innerText = 
		})
	});
</script>
</body>
</html>