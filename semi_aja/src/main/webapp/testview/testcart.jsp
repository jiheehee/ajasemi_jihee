<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ page import="java.util.List, com.aja.cart.model.dto.CartInfo" %>
<%
	List<CartInfo> cartInfos = (List<CartInfo>)request.getAttribute("cartInfoList");
	int count = 0;
%>
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
            <table id="cartInfoContainer">
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
	                    value="<%= c.getCartKey() %>" id="<%= count %>">
	                </td>
	                <td>
	                	<%= c.getProdName() %>
	                	<img src="<%= request.getContextPath() %>/upload/product/<%= c.getCartImage1() %>" width="100" height="100">
	                </td>
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
                        <td id="totalCheckedPriceTd">0</td>
                        <td><strong>+</strong></td>
                        <td id="deliveryPriceTd">3000</td>
                        <td><strong>=</strong></td>
                        <td><h5><span id="finalPriceSpan">0</span></h5></td>
                    </tr>
                </tbody>           	           
            </table>
        <button id="paymentDoButton">결제하러가기</button>
    </div>
<% } %>

<script>
	//장바구니에 있는 수량을 update해주는 함수입니다.
	function callUpdateCartFetch(modifyAmount, cartKey) {
		fetch("<%= request.getContextPath() %>/cart/updateQuantity.do", {
			method : "POST",
			headers : {
				"Content-type" : "application/x-www-form-urlencoded"
			},
			body : "amount=" + modifyAmount + "&cartKey=" + cartKey
		})
	}
	
	//check된 모든 상품의 가격을 배송비까지 더해줍니다.
	function finalCheckedPrice() {
		let totalPrice = 0;
		document.querySelectorAll("input[name='selectProducts']").forEach(e => {
			if(e.checked == true) {
				totalPrice += Number(document.getElementsByClassName("totalPriceSpan")[e.id].innerText);
			}
		})
		if(totalPrice < 50000) {
			totalPrice += 3000;
		}
		return totalPrice;
	}
	
	//check된 모든 상품의 배송비를 비포함한 가격을 리턴해줍니다.
	function totalCheckedPrice() {
		let totalPrice = 0;
		document.querySelectorAll("input[name='selectProducts']").forEach(e => {
			if(e.checked == true) {
				totalPrice += Number(document.getElementsByClassName("totalPriceSpan")[e.id].innerText);
			}
		})
		return totalPrice;
	}
	
	//전체비용에 대한 데이터를 넣어주는 함수입니다. check박스가 check되어있을때 수량변경을 시도할때 실행시킬 함수입니다.
	function innerDataForPrice(buttonId) {
		if(document.querySelectorAll("input[name='selectProducts']")[buttonId].checked == true) {
			document.getElementById("finalPriceSpan").innerText = totalCheckedPrice();
			
			const totalPriceTd = document.getElementById("totalCheckedPriceTd");
			const deliveryElement = document.getElementById("deliveryPriceTd");
			
			
			//호출한 함수가 배송비를 보함한 전체비용을 리턴합니다. 리턴된 가격이 53000원 이하면 배송비가 붙은 가격이고 아니면 붙지않은 가격입니다.
			totalCheckedPrice() < 53000 ? 
					totalPriceTd.innerText = totalCheckedPrice() - 3000  : totalPriceTd.innerText = totalCheckedPrice();
			
			//위 조건으로 배송비여부를 선택합니다.
			totalCheckedPrice() < 53000 ? 
					deliveryElement.innerText = 3000 :  deliveryElement.innerText = 0;
		}
	}
	
	//수량 +버튼을 눌렀을때입니다.
	document.querySelectorAll(".amountUp").forEach(e => {
		e.addEventListener("click", e => {
			const buttonId = e.target.id;
			const oriAmount = Number(e.target.nextElementSibling.value); //버튼 누르기 전 수량
			const modifyAmount = oriAmount + 1; //누르고 나서 수량
			const maxAmount = document.querySelectorAll(".amountInput")[buttonId].max;
			console.log("maxAmount : " + maxAmount);
			console.log("modifyAmount : " + modifyAmount);
			if(modifyAmount > maxAmount) {
				alert("재고량 이상입니다.");
			} else {
				const cartKey = document.querySelectorAll("input[type='checkbox']")[buttonId].value;
				e.target.nextElementSibling.value = modifyAmount;
				const prodPrice = Number(document.getElementById("prodPrice" + buttonId).innerText);
				const optionPrice = Number(document.getElementById("optionPrice" + buttonId).innerText);
				document.getElementById("totalProdPrice" + buttonId).innerText = (prodPrice + optionPrice) * modifyAmount;
				
				innerDataForPrice(buttonId);
				
				callUpdateCartFetch(modifyAmount, cartKey);
			}
		})
	});
	
	//수량 -버튼을 눌렀을때입니다.
	document.querySelectorAll(".amountDown").forEach(e => {
		e.addEventListener("click", e => {
			const buttonId = e.target.id;
			const oriAmount = Number(e.target.previousElementSibling.value); 
			const modifyAmount = oriAmount - 1;
			const cartKey = document.querySelectorAll("input[type='checkbox']")[buttonId].value;
			if(modifyAmount < 1) {
				alert("그만하세요 ^^");
			} else {
				e.target.previousElementSibling.value = modifyAmount;
				const prodPrice = Number(document.getElementById("prodPrice" + buttonId).innerText);
				const optionPrice = Number(document.getElementById("optionPrice" + buttonId).innerText);
				document.getElementById("totalProdPrice" + buttonId).innerText = (prodPrice + optionPrice) * modifyAmount;
				
				innerDataForPrice(buttonId);
				
				if(totalCheckedPrice() > 50000) document.getElementById("finalPriceSpan").innerText = totalCheckedPrice();
				else document.getElementById("finalPriceSpan").innerText = totalCheckedPrice() + 3000;
				callUpdateCartFetch(modifyAmount, cartKey);
				
			}
		})
	});
	
	//수량을 input태그안에 입력했을때
	document.querySelectorAll(".amountInput").forEach(e => {
		e.addEventListener("blur", e => {
			const inputAmount = e.target.value;
			const pk = e.target.previousElementSibling.id;
			const cartKey = document.querySelectorAll("input[name='selectProducts']")[pk].value;
			console.log("max수량 : " + e.target.max);
			console.log("inputAmount : " + inputAmount);
			//입력한 수량이 1보다 작을때입니다.
			if(inputAmount < 1) {
				e.target.value = 1;
			} else {
				//입력한 수량이 재고수량보다 클때입니다.
				if(Number(inputAmount) > Number(e.target.max)) {
					alert("재고 없어요. 돌아가세요");
					e.target.value = 1;
				} else {
					const prodPrice = Number(document.getElementById("prodPrice" + pk).innerText);
					const optionPrice = Number(document.getElementById("optionPrice" + pk).innerText);
					document.getElementById("totalProdPrice" + pk).innerText = (prodPrice + optionPrice) * e.target.value;
					
					innerDataForPrice(pk);
				}
			}
		})
	})
	
	//checkbox를 check했을때 입니다. 결제할 상품의 가격과 배송비를 합친 총 가격을 보여줍니다.
	document.querySelectorAll("input[name='selectProducts']").forEach(e => {
		e.addEventListener("click", e => {
				const pk = e.target.id;
				const checkedTotalPrice = totalCheckedPrice(); //체크된 상품의 가격
				console.log("checkedTotalPrice : " + checkedTotalPrice);
				const totalPriceTd = document.getElementById("totalCheckedPriceTd");
				const oriTotalPrice = Number(totalPriceTd.innerText); //체크된 전체상품의 가격
				const deliveryPriceTd = document.getElementById("deliveryPriceTd");
				const oriFinalPrice = (document.getElementById("finalPriceSpan").innerText);
				//checkbox를 check했을때입니다.
			if(e.target.checked == true) {
					totalPriceTd.innerText = totalCheckedPrice();					
					//상품 가격이 50000원이 넘었을때입니다.
				if(totalPriceTd.innerText > 50000) {
					deliveryPriceTd.innerText = 0;
					document.getElementById("finalPriceSpan").innerText = totalCheckedPrice();
				} else {
					deliveryPriceTd.innerText = 3000;
					document.getElementById("finalPriceSpan").innerText = totalCheckedPrice() + 3000;
				}
			} else {
				totalPriceTd.innerText = totalCheckedPrice();
				if(totalPriceTd.innerText > 50000) {
					deliveryPriceTd.innerText = 0;
					document.getElementById("finalPriceSpan").innerText = totalCheckedPrice();
				} else {
					deliveryPriceTd.innerText = 3000;
					document.getElementById("finalPriceSpan").innerText = totalCheckedPrice() + 3000;
				}
			}
			
			//체크된 상품이 없다면 배송비를 0으로 만들어줍니다.
			if(totalCheckedPrice() == 0) {
				deliveryPriceTd.innerText = 0;
				document.getElementById("finalPriceSpan").innerText = 0;
			}
		})
	});
	
	//삭제하기 버튼입니다.
	document.getElementsByName("deleteButton").forEach(e => {
		e.addEventListener("click", e => {
			console.log("아니 된거맞아?");
			console.log(e.target.id);
			const pk = e.target.id;
			const cartKey = document.querySelectorAll("input[name='selectProducts']")[pk].value;
			location.assign("<%= request.getContextPath() %>/cart/deletecart.do?cartKey=" + cartKey);
			<%-- fetch("<%= request.getContextPath() %>/cart/deletecart.do?cartKey=" + cartKey, {
				mothod : "GET",
				headers : {
					"Content-type" : "application/x-www-form-urlencoded"
				}
			})
			.then(response => response.text())
			.then(data => {
				console.log(data);
				document.querySelector("#cartInfoContainer>tbody").innerHTML = data;
			}) --%>
		})
	});
	
	//결제하기 버튼을 눌렀을때입니다.
	document.getElementById("paymentDoButton").addEventListener("click", e => {
		const prodPrice = Number(document.getElementById("totalCheckedPriceTd").innerText);
		if(prodPrice == 0) {
			alert("결제할 상품을 선택하지 않았습니다.");
			return;
		}
		let cartKies = "";
		let count = 1;
		const checkedNumber = document.querySelectorAll("input[name='selectProducts']").length;
		document.querySelectorAll("input[name='selectProducts']").forEach(e => {
			if(e.checked == true) {
				if(checkedNumber == count) {
					cartKies += e.value;
				} else {
					cartKies += e.value + ",";			
				}
			}
			console.log(cartKies);
			count++;
		});
		console.log(cartKies);
		location.assign("<%= request.getContextPath() %>/member/gopayview.do?cartKies=" + cartKies);
	});
</script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>