<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.cart.model.dto.Cart,java.text.SimpleDateFormat" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Cart> cartList=(List<Cart>)request.getAttribute("cart");
/* 	out.print(cartList.get(0).getProduct());
	out.print(cartList.get(0).getOption()); 
	out.print(cartList.get(0).getProduct().getProdPrice()); 
	out.print(cartList.get(0).getOption().getOptionPrice()); */
%>
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
                	<%for(Cart cart : cartList) {%>
	               	<tr>
	               		<td>
	               			<input type="checkbox" name="selectProducts" 
	               			value="<%=cart.getProduct().getProdKey() %>">
	               		</td>                	                      
                        <td><%=cart.getProduct().getProdName() %></td>
                        <td>향 : <%=cart.getOption().getOptionFlavor()%><br>
                        	용량 : <%=cart.getOption().getOptionSize()%> ml
                        </td>             
                        <td>
                        	<div id="stock-container">
                        		<button class="btn-outline-success" type='button' value="incre">+</button>
                        		<input type="number" min='1' max='50' value='1' size="2" >
                        		<button class="btn-outline-danger" type='button' value="decre">-</button>
                        	</div>
                        </td>
						<td id='cart-total'>
							<span><%=cart.getProduct().getProdPrice() %> + <%=cart.getOption().getOptionPrice() %></span></span><br>
							<h5>=<strong><%=(cart.getProduct().getProdPrice())+(cart.getOption().getOptionPrice()) %></h5></strong>
						</td>								
                        <td>                             
                            <a href="" class="btn">삭제</a>
                        </td>
                     </tr>
                     <%} %>
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
                            <td><%=+3000 %></td>
                            <td><strong>=</strong></td>
                            <td><h5><strong>91,000원</strong></h5></td>
                        </tr>
                </tbody>           	           
            </table>            
        <a href="" class="btn">장바구니 비우기</a>
        </form>
    </div>
</body>
<script>
	$("#stock-container>input").keyup(e=>{
		if($(e.target).val()<=0) $(e.target).val(1);
		else if($(e.target).val()>50) $(e.target).val(50);
		totalPriceCalc($(e.target));
	})
	$("#stock-container>button").click(e=>{
		//버튼클릭시 수량 증가하기
		const flag=e.target.value;
		let $target;
		switch(flag){
			case 'incre' : 
					$target=$(e.target).next();
					$target.val()>0&&$target.val()<50&&$target.val(Number($target.val())+1);
					break;
			case 'decre' : 
					$target=$(e.target).prev();
					$target.val()>1&&$target.val(Number($target.val())-1);
					break;
		}
		totalPriceCalc($target);
	});
	function totalPriceCalc($target){
		const oriPriceData=$("#cart-total>span").text().split("+");
		$("#cart-total strong").text((Number(oriPriceData[0].trim())+Number(oriPriceData[1].trim()))*$target.val());
	}
</script>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>