<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.product.model.dto.Product2" %>
<%@ include file="/WEB-INF/views/admin/header.jsp" %>
<%
	List<Product2> productList = (List<Product2>)request.getAttribute("productList");
%>
     <table id="tbl-product">
	         <tr>
		        <td>상품번호</td>
		        <td>상품명</td>
		        <td>향(옵션)</td>
		        <td>사이즈(옵션)</td>
		        <td>가격(옵션추가가격)</td>
		        <td>재고</td>
		        <td>설명</td>
		        <td>상세설명</td>
		        <td>전성분</td>
		        <td>등록일</td>
		        <td>삭제여부</td>
             </tr>
       	    <%if(productList.size()>0){ 
       	    	for(Product2 p2 : productList){%>
       	    <tr>
       	    	<td><%=p2.getProdKey() %></td>
       	    	<td><%=p2.getProdName() %></td>
       	    	<td><%=p2.getOptionFlavor() %></td>
       	    	<td><%=p2.getOptionSize() %></td>
       	    	<td><%=p2.getOptionPrice()+p2.getProdPrice() %></td>
       	    	<td><%=p2.getProdStock()%></td>
       	    	<td><%=p2.getProdContent() %></td>
       	    	<td><%=p2.getProdDetailCon() %></td>
       	    	<td><%=p2.getProdEnrollDate() %></td>
       	    	<td><%=p2.isProdDeleted()%></td>
       	    	<td>
       	    	<br>
	       	    	<form action = "<%=request.getContextPath() %>/product/deleteproduct.do">
								<input type="hidden" name = "prodKey" value ="<%=p2.getProdKey() %>">
								<button type="submit">삭제</button>
					</form>
				</td>
       	    <% }%>
       	    </tr>
       	 	<% }else{%> 
       	   		<tr>
       	   			<td colspan="11">조회된 데이터가 없습니다</td>
       	   		</tr>
       	 	<%} %>   
           	<td> <button onclick="enrollProduct()">상품등록</button><td>
            </tbody>
            <script>
           		enrollProduct =()=>{
           		var url = "<%=request.getContextPath() %>/product/productenroll.do";
           		var windowName = "상품등록";
           		var windowFeatures = "width=500,height=500,resizable=yes,scrollbars=yes";
           		window.open(url,windowName,windowFeatures);
           		
           		}
            </script>
            
        </table>
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>