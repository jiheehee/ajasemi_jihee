<%@page import="javax.swing.plaf.synth.SynthOptionPaneUI"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp" %>
<%@ page import="java.util.List,com.aja.order.model.dto.CustomerOrder" %>

<% List<CustomerOrder> orderList = (List<CustomerOrder>)request.getAttribute("orderList"); 
	
%>

 <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .order-table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .order-table th, .order-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .order-table th {
            background-color: #f2f2f2;
            color: #333;
        }

        .order-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .order-table tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
	<section>
    <table class="order-table">
        <thead>
        <tr><h2>Order List</h2></tr>
            <tr>
                <th>주문번호</th>
                <th>고객명</th>
                <th>주문가격</th>
                <th>주문날짜</th>
                <th>배송상태</th>
                <th>주문상태</th>
            </tr>
        </thead>
        <tbody>
        <% if(orderList.size()>0) {
        for(CustomerOrder co : orderList){%>
                <tr>
                    <td><%= co.getOrderKey()%></td>
                    <td><%= co.getCustName() %></td>
                    <td><%= co.getOrderPrice() %></td>
                    <td><%= co.getOrderDate() %></td>
                    <td><%= co.getOrderDelivery() %></td>
                    <td><%= co.getOrderStatus() %></td>
                    <td>
                    <form action = "<%=request.getContextPath() %>/order/detailorderlist.do" onsubmit ="detailOrder(event);">
                    	<input type="hidden" name="orderKey" value = "<%=co.getOrderKey()%>">
                    	<button type="submit" >상세보기</button>
                    </form>
                    <%if(co.getOrderDelivery()!=null) { %>
                    <%if(co.getOrderDelivery().equals("배송준비중")) {%>
                    <form action ="<%=request.getContextPath() %>/order/deliverystatusend.do">
                    	<input type="hidden" name="orderKey" value="<%=co.getOrderKey()%>">
                    	<button type="submit">발송</button>
                    </form>
                    <%}
                    }%>
                    
                    <%if(co.getOrderDelivery()!=null){ %>
                    <%if(co.getOrderDelivery().equals("배송중")){ %>
                    <form action ="<%=request.getContextPath()%>/order/deliverystatuscomplete.do">
                    	<input type="hidden" name="orderKey" value="<%=co.getOrderKey() %>">
                    	<button type="submit">배송완료</button>
                    </form>
                    
                    <%}
                    }%>
                </tr>
               	
         <%}
        }%>
        
        
        
        </tbody>
    </table>
      	<div><button onclick="deliveryStatus();">배송관리</button></div>
      	<br>
      	<div><button onclick="orderStatus();">주문관리</button></div>
     <div id="pageBar">
        	<%=request.getAttribute("pageBar") %>
     </div>
    </section>
    <script>
    		orderStatus=()=>{
    			var url = "<%=request.getContextPath()%>/order/orderstatuslist.do"
    			var windowFeatures = "width=1000,height=1200,resizable=yes,scrollbars=yes";
    			window.open(url,"_blank",windowFeatures);
    		}
    		deliveryStatus=()=>{
	    		var url = "<%=request.getContextPath()%>/order/orderdeliverylist.do"
	    		var windowFeatures = "width=1000,height=1200,resizable=yes,scrollbars=yes";
	    		window.open(url,"_blank",windowFeatures);
    		}
    		
    	
    	
    	 detailOrder =(event)=>{
    		event.preventDefault();
    		var form = event.target;
    		var formData = new FormData(form);
    		console.log(formData);
    		var url = form.action;
    		var queryString = new URLSearchParams(formData).toString();
    		var realUrl = url+"?"+queryString;
    		
    		var windowFeatures = "width=1500,height=1000,resizable=yes,scrollbars=yes";
    		window.open(realUrl,"_blank", windowFeatures); 
    	} 
    	 
    	 
    	 
    </script>

<%@ include file="/WEB-INF/views/admin/footer.jsp" %>