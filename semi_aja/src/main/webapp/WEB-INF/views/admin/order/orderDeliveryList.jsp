<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.aja.order.model.dto.CustomerOrder" %>

<% List<CustomerOrder> orderList = (List<CustomerOrder>)request.getAttribute("orderList"); 
	
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>배송관리</title>
</head>
<body>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
		.hidden{
			display:none;
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
        <select id="deliveryType">
        		<option value="배송준비중"  >배송준비중</option>
        		<option value="배송중" >배송중</option>
        		<option value="배송완료"  >배송완료</option>
        </select>
            <tr>
            	<th>전체선택<input type="checkbox" id="allOrder"></th>
                <th>주문번호</th>
                <th>고객명</th>
                <th>주문가격</th>
                <th>주문날짜</th>
                <th>배송상태</th>
                <th>주문상태</th>
            </tr>
        </thead>
        <tbody id="result">
        <% if(orderList.size()>0) {
        for(CustomerOrder co : orderList){%>
                <tr>
       				<td><input type="checkbox" class="orders" name="orders" value="<%=co.getOrderKey() %>"></td>
                    <td><%= co.getOrderKey()%></td>
                    <td><%= co.getCustName() %></td>
                    <td><%= co.getOrderPrice() %></td>
                    <td><%= co.getOrderDate() %></td>
                    <td><%= co.getOrderDelivery() %></td>
                    <td><%= co.getOrderStatus() %></td>
                    <td>
                </tr>
                    <%}
                    }%>
        </tbody>
        </table>
        <form action = "<%=request.getContextPath()%>/order/orderdeliverychange.do" onsubmit ="getOrder(event);">
        	<select name = "deliveryT" id="deliveryT">
        		<option value="배송준비중" class='hidden' >배송준비중</option>
        		<option value="배송중" selected>배송중</option>
        		<option value="배송완료"  >배송완료</option>
        	</select>
        	<input type="submit" value="변경">
        </form>
    </section>
    
    <script>
    document.querySelector("#allOrder").addEventListener("click", function(){
    	
    	const isChecked = document.querySelector("#allOrder").checked;
    	if(isChecked){
    		const checkboxes = document.querySelectorAll(".orders");
    		for(const checkbox of checkboxes){
    			checkbox.checked = true;
    		}
    	}
    	else{
    		const checkboxes = document.querySelectorAll(".orders");
    		for(const checkbox of checkboxes){
    			checkbox.checked = false;
    		}
    	}
    });

    let checkboxes = document.querySelectorAll(".orders");
    	for(const checkbox of checkboxes){
    		checkbox.addEventListener("click",function(){
    			
    			const totalCnt = checkboxes.length;
    			
    			const checkedCnt = document.querySelectorAll(".orders:checked").length;
    			
    			if(totalCnt == checkedCnt){
    				document.querySelector("#allOrder").checked=true;
    			}
    			else{
    				document.querySelector("#allOrder").checked=false;
    			}
    		});
    	};
 
    $(document).ready(function(){
    	$("#deliveryType").change(function(){
    		var selectedValue = $("#deliveryType").val();
    		$.ajax({
    			url : "<%=request.getContextPath()%>/order/orderdeliveryajax.do",
    			type: "post",
    			data: {
    				deliveryType: selectedValue
    			},
    			success : function(data){
    				$("#result").empty();
    			    if(data.length > 0) {
                        data.forEach(function(co) {
                            var row = '<tr>' +
                                '<td><input type="checkbox" class="orders" value="' + co.orderKey + '"></td>' +
                                '<td>' + co.orderKey + '</td>' +
                                '<td>' + co.custName + '</td>' +
                                '<td>' + co.orderPrice + '</td>' +
                                '<td>' + co.orderDate + '</td>' +
                                '<td>' + co.orderDelivery + '</td>' +
                                '<td>' + co.orderStatus + '</td>' +
                                '</tr>';
                            $("#result").append(row);
                        });
    				}else{
    					$("#result").append('<tr><td colspan="7">주문이 없습니다</td></tr>')
    				}
    		$("#allOrder").prop('checked',false);
    		  let checkboxes = document.querySelectorAll(".orders");
    	    	for(const checkbox of checkboxes){
    	    		checkbox.addEventListener("click",function(){
    	    			
    	    			const totalCnt = checkboxes.length;
    	    			
    	    			const checkedCnt = document.querySelectorAll(".orders:checked").length;
    	    			
    	    			if(totalCnt == checkedCnt){
    	    				document.querySelector("#allOrder").checked=true;
    	    			}
    	    			else{
    	    				document.querySelector("#allOrder").checked=false;
    	    			}
    	    		});
    	    	};
    			}
    		})
    	});
    });
     const getOrder=(event)=>{
    	 event.preventDefault();
    	 var url = event.target.action;
    	 var orders = document.querySelectorAll(".orders");
    	 var values = new Array();
    	 console.log(url);
    	 
    	 for(let i=0;i<orders.length;i++){
    		 if(orders[i].checked==true)
    		 values.push(orders[i].value);
    	 }
    	 var deliveryType = document.getElementById("deliveryT").value;
    	 
    	  location.assign(url+"?"+"orders="+values+"&deliveryType="+deliveryType);
    	 
    	 
     }
     
     $(document).ready(function(){
    	 $("#deliveryType").change(function(){
    		 var nowType = $("#deliveryType").val();
    	 	$("#deliveryT option").removeClass('hidden');
    	 	$('#deliveryT option[value="'+ nowType+'"]').addClass('hidden');
    	 	var firstVisibleOption=$("#deliveryT option:not(.hidden)").first().val();
    	 	$("#deliveryT").val(firstVisibleOption);
	     })
     });
     
     
  
    </script>
</body>
</html>