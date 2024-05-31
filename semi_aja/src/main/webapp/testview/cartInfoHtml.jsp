<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.aja.cart.model.dto.CartInfo" %>
<%
	List<CartInfo> cartInfos = (List<CartInfo>)request.getAttribute("cartInfo");
	int count = 0;
%>
<%for(CartInfo c : cartInfos) {%>
<tr>
     <td>
	     <input type="checkbox" name="selectProducts"
	     value="<%= c.getCartKey() %>" id="<%= count %>">
     </td>                	                      
     <td><%= c.getProdName() %></td>
     <td>
     	 <p>향 : <%= c.getOptionFlavor() %></p>
         <p>용량 : <%= c.getOptionSize() %></p>
     </td>             
     <td>
         <div class="stock-container">
             <button class="amountUp" id="<%= count %>" type='button' value="incre">+</button>
             <input type="number" min='1' max='<%= c.getProdStock() %>' value='<%= c.getCartQuantity() %>' size="2" class="amountInput">
             <button class="amountDown" type='button' value="decre" id="<%= count %>">-</button>
         </div>
     </td>
     <td class='cart-total'>
        <span>상품가격 : </span><span id="prodPrice<%= count %>"><%= c.getProdPrice() %></span> + <span>옵션가격 : </span><span id="optionPrice<%= count %>"><%= c.getOptionPrice() %></span><br>
        <span>총 가격 : </span><span id="totalProdPrice<%= count %>" class="totalPriceSpan"><%= (c.getProdPrice() + c.getOptionPrice()) * c.getCartQuantity() %></span>
     </td>								
     <td>                             
         <button class="btn btn-primary" id="<%= count %>" name="deleteButton">삭제</button>
     </td>
  </tr>
<%count++;
} %>
