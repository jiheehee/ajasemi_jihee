<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ page import="java.util.List,com.aja.mypage.model.dto.Order,com.aja.mypage.model.dto.OrderDetail" %>
<% 
	List<Order> orders = (List<Order>)request.getAttribute("orders"); 
	String pageBar = (String)request.getAttribute("pageBar");
%>
<section>
    <table>
        <thead>
            <tr>
                <th>상품정보</th>
                <th>배송비</th>
                <th>진행상태</th>
                <th>구매확정 및 리뷰</th>
            </tr>
        </thead>
        <tbody>
        	<% if (!orders.isEmpty()) { 
            for (Order o : orders) { %>
        	<tr>
        		<td colspan=5;>
        			<%=o.getOrderDate() %>
        			<%=o.getOrderKey() %>
        		</td>       	
        	</tr>
            <tr>
            	<% if (!o.getOrderDetail().isEmpty()) {
                for (OrderDetail od: o.getOrderDetail()) { %>
                <td>
                    <img src="<%=request.getContextPath() %>/upload/product/<%=od.getProduct().getProdImage() %>" alt="상품">
                    <div><%=od.getProduct().getProdName() %></div>
                    <div>
                    	[flavor]<%=od.getProduct().getOptionFlavor() %>
                    	[size]<%=od.getProduct().getOptionSize() %>ml
                    </div>
                    <div>
                    	KRW <%=od.getOdPrice()%>
                    	<%=od.getOdQuantity() %>개
                    </div>
                </td>
                <td>
                    배송비
                </td>
                <td>
                    진행상태
                </td>
                <td>
                    <button>
                        결제완료/배송준비중->결제취소
                        배송중/배송완료-> 환불/구매확정
                        구매확정->리뷰작성
                    </button>

                </td>
                <%}
                }%>
            </tr>
            <%}
            }%>
        </tbody>

    </table>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>