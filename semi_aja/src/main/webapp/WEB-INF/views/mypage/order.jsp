<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ page import="java.util.List,com.aja.mypage.model.dto.Order,com.aja.mypage.model.dto.OrderDetail" %>
<% List<Order> orders = (List<Order>)request.getAttribute("orders"); %>

<style>
    div#order-content{
        width: 100%;
        height: 1500px;
        border: 1px solid red;
    }
    div#order-info{
        border: 1px solid blue;
    }
    div#product{
        width: 100%;
        height: 250px;
        border: 1px dotted purple;
        display: flex;
        flex-direction: row;
        /* justify-content:space-between; */
    }
    div#product *{
        border: 2px solid yellow;
    }
    div#product-button{
        width: 20%;
        display: flex;
        align-items: center;
        flex-direction: column;
        justify-content: space-evenly;
    }
    div#product-button *{
        width: 70%;
    }
    div#product-img{
        width: 20%;
        border: 1px solid orange;
    }
    div#product-detail{
        width: 60%;
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;

    }
    div#product-detail *{
        margin-top: 10px;
        margin-bottom: 20px;
    }
    div#order-container{
    	border: 5px dotted black;
    }
</style>

<section>
<div id="searchOrder">

</div>
<div id="order-content">
	<div><h5>주문배송조회</h5></div>
	<%if(!orders.isEmpty())	{ 
		for(Order o : orders) {%>
	<div id="order-container">    
		<div id="order-box">
			<div id="order-info">
				<p><%=o.getOrderDate() %></p>
				<p><%=o.getOrderKey() %></p>
			</div>
			<%if(!o.getOrderDetail().isEmpty()) {
				for(OrderDetail od: o.getOrderDetail()) { %>
			<div id="product">
				<div id="product-img">
					<img src="" alt="상품사진">
				</div>
				<div id="product-detail">
					<div><%=od.getProduct().getProdName()%></div>
					<div>
						향 : <%=od.getProduct().getOptionFlavor() %>
						사이즈 : <%=od.getProduct().getOptionSize() %>
					</div>
					<div>KRW <%=od.getProduct().getProdPrice() %></div>
					<div>배송정보 || 주문정보</div>
				</div>
				<div id="product-button">
					<button>구매취소</button>
					<button>환불</button>
					<button>구매확정</button>
				</div>
			</div>
			<%}
			}%>
		</div>
	</div>
		<%} 
		}%>
</div>
</section>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>