<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp" %>
<%@ page import="java.util.List,com.aja.coupon.model.dto.Coupon"%>

<%
	List<Coupon> couponList = (List<Coupon>)request.getAttribute("list");


%>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
	</head>
	<body>

	
	<table>
	    <thead>
	        <tr>
	            <th>쿠폰 키번호</th>
	            <th>이름</th>
	            <th>할인율</th>
	        </tr>
	    </thead>
	    <tbody>
	        <%
	            if (couponList != null && !couponList.isEmpty()) {
	                for (Coupon coupon : couponList) {
	        %>
	        <tr>
	            <td><%= coupon.getCouponKey()%></td>
	            <td><%= coupon.getCouponName() %></td>
	            <td><%= coupon.getCouponSale() %> %</td>
	            <td>
	            	<form action="<%=request.getContextPath()%>/coupon/distributecoupon.do">
	            	<input type="hidden" name="couponKey" value="<%=coupon.getCouponKey() %>">
	            	<input type="hidden" name="couponName" value="<%=coupon.getCouponName() %>">
	            	<input type="submit" value="발급">
	            	</form>
	            
	            
	            <td>
	            	<button class="updateCoupon" data-couponKey="<%=coupon.getCouponKey()%>">수정</button>
	            
		        </td>
	            <td>
	            	<form action="<%=request.getContextPath()%>/coupon/deletecoupon.do">
	            	<input type="submit" value="삭제">
	            	<input type="hidden" name="couponKey" value="<%=coupon.getCouponKey() %>">
	            	</form>
	            </td>
	        </tr>
	        <%
	                }
	            } else {
	        %>
	        <tr>
	            <td colspan="3">No coupons available.</td>
	        </tr>
	        <%
	            }
	        %>
		<tr>
			<td><button onclick="enrollCoupon();">쿠폰등록</button>
		</tr>
	    </tbody>
	</table>
	
	<script>
		enrollCoupon=()=>{
			var url ="<%=request.getContextPath()%>/coupon/couponenroll.do";
			var windowFeature = "width=500,height=500,resizable=yes,scrollbars=yes";
			window.open(url,"_blank",windowFeature)
           		
		}
		document.querySelectorAll(".updateCoupon").forEach(button =>{
			button.addEventListener("click",e=>{
				const couponKey = e.target.getAttribute("data-couponKey");
				console.log(couponKey);
				var url ="<%=request.getContextPath()%>/coupon/couponupdate.do?couponKey="+couponKey;
				var windowFeature = "width=500,height=500,resizable=yes,scrollbars=yes";
				window.open(url,"_blank",windowFeature);
			});
		});
		
		
	</script>
	
<%@ include file="/WEB-INF/views/admin/footer.jsp" %>