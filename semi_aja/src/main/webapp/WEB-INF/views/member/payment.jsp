<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@ page import = "com.aja.member.model.dto.Address, java.util.List, com.aja.member.model.dto.ProductInfo
, com.aja.member.model.dto.CouponInfo" %>
<%
	Address defaultAddressInfo = (Address)request.getAttribute("defaultAddress");
	List<ProductInfo> cartInfo = (List<ProductInfo>)request.getAttribute("cartInfo");
	List<CouponInfo> coupons = (List<CouponInfo>)request.getAttribute("coupons");
	System.out.println("jsp에서 받아온 session값 : " + session.getAttribute("cust_key"));
%>
    <section>
        <div id="totalPaymentContainer">
            <div id="deliAddContainer">
                <p class="p">배송지 정보</p>
                <table class="infoTable">
                    <tr>
                        <th>배송지 선택</th>
                        <td>
                            <input type="radio" value="기존 배송지" name="address">기존 배송지
                            <input type="radio" value="신규 배송지" name="address">신규 배송지
                        </td>
                    </tr>
                    <tr>
                        <th>배송지명</th>
                        <td class="needStarTd">
                            <span class="star">*</span><input type="text" name="receptionAddName" required>
                        </td>
                    </tr>
                    <tr>
                        <th>받는분 이름</th>
                        <td>
                            <span class="star">*</span><input type="text" name="receptionName" required>
                        </td>
                    </tr>
                    <tr>
                        <th>연락처 1</th>
                        <td>
                            <span class="star">*</span><input type="tel" name="receptionPhoneNum1" requried>
                        </td>
                    </tr>
                    <tr>
                        <th>연락처 2</th>
                        <td>
                            <input type="tel" name="receptionPhoneNum2">
                        </td>
                    </tr>
                    <tr id="addressInputTr">
                        <th>주소</th>
                        <td id="addressContainer">
                            <input type="text" id="sample4_postcode" placeholder="우편번호">
                            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                            <input type="text" id="sample4_roadAddress" class="addressInput" placeholder="도로명주소"><br>
                            <input type="text" id="sample4_jibunAddress" class="addressInput" placeholder="지번주소"><br>
                            <span id="guide" style="color:#999;display:none"></span>
                            <input type="text" id="sample4_detailAddress" class="addressInput" placeholder="상세주소"><br>
                            <input type="text" id="sample4_extraAddress" class="addressInput" placeholder="참고항목">
                        </td>
                    </tr>
                </table>
            </div>
            <div id="customerRequestContainer">
                <p class="p">배송 요청사항</p>
                <table class="infoTable">
                    <tr>
                        <th>배송 메세지</th>
                        <td>
                            <select name="deliveryMessage" id="deliveryRequestSelect">
                                <option value="">문앞에 두고 문자남겨주세요</option>
                                <option value="">직접 받을게요</option>
                                <option value="">벨을 누르지 말아주세요</option>
                                <option value="">도착 후 전화주시면 직접 받으러 갈게요</option>
                                <option value="">직접 입력하기</option>
                            </select>
                            <input type="text" name="deliveryRequestMessage" style="width:500px" hidden="true" required placeholder="요청사항을 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <th>공동현관 출입방법</th>
                        <td>
                            <input type="text" name="deliAddName" placeholder="없으면 건너뛰세요" required>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="prodInfoContainer">
                <p class="p">선택상품</p>
                <table class="infoTable">
                    <thead>
                        <tr>
                            <th>상품정보</th>
                            <th>옵션</th>
                            <th>가격</th>
                            <th>수량</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="prodImgContainer">
                                    <img src="https://cdn.imweb.me/thumbnail/20220923/d4e7acfcd9fc0.png" alt="" wdith="100px" height="100px">
                                </div>
                                <div class="prodContentContainer">
                                    <p>상품명</p>
                                    <p>
                                    	[1등 컨실러/NEW컬러출시] 더샘 
                                        커버 퍼펙션 트리플 팟 컨실러 5colors
                                    </p>
                                </div>
                            </td>
                            <td class="numtd">
                                <p>1</p>
                            </td>
                            <td class="numtd">
                                <p>1</p>
                            </td>
                            <td class="numtd">
                                <p>1</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="prodImgContainer">
                                    <img src="https://cdn.imweb.me/thumbnail/20220923/d4e7acfcd9fc0.png" alt="" wdith="100px" height="100px">
                                </div>
                                <div class="prodContentContainer">
                                    <p>상품명</p>
                                    <p>[1등 컨실러/NEW컬러출시] 더샘 
                                        커버 퍼펙션 트리플 팟 컨실러 5colors
                                        </p>
                                </div>
                            </td>
                            <td class="numtd">
                                <p>1</p>
                            </td>
                            <td class="numtd">
                                <p>1</p>
                            </td>
                            <td class="numtd">
                                <p>1</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="prodImgContainer">
                                    <img src="https://cdn.imweb.me/thumbnail/20220923/d4e7acfcd9fc0.png" alt="" wdith="100px" height="100px">
                                </div>
                                <div class="prodContentContainer">
                                    <p>상품명</p>
                                    <p>[1등 컨실러/NEW컬러출시] 더샘 
                                        커버 퍼펙션 트리플 팟 컨실러 5colors
                                        </p>
                                </div>
                            </td>
                            <td class="numtd">
                                <p>1</p>
                            </td>
                            <td class="numtd">
                                <p>1</p>
                            </td>
                            <td class="numtd">
                                <p>1</p>
                            </td>
                        </tr>
                        <%for(ProductInfo p : cartInfo) {%>
	                        <tr>
	                            <td>
	                                <div class="prodImgContainer">
	                                    <img src="<%= p.getProdImage() %>" alt="" width="100px" height="100px">
	                                </div>
	                                <div class="prodContentContainer">
	                                    <p><%= p.getProdName() %></p>
	                                    <p>
	                                    	<%= p.getProdContent() %>
	                                    </p>
	                                </div>
	                            </td>
	                            <td class="numtd">
	                                <p><%= p.getOptionFlavor()%></p>
	                                <p><%= p.getOptionSize() %></p>
	                            </td>
	                            <td class="numtd">
	                                <p><%= p.getProdPrice() %></p>
	                            </td>
	                            <td class="numtd">
	                                <p><%= p.getCartQuantity() %></p>
	                            </td>
	                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
            
            <div id="paymentContainer">
                <div id="discountContainer">
                    <p class="p">쿠폰적용</p>
                    <table id="couponTable">
                        <thead>
                            <tr>
                                <th colspan="2" class="couponTableTh">쿠폰 선택</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="applyableTd">
                                	<p id="couponPtag">적용 가능한 쿠폰</p>
                                </td>
                                <td>
                                    <select name="choiceCoupon" id="choiceCoupon">
                                        <% if(coupons.get(0).getCouponName() == null || coupons.isEmpty() || coupons == null) { %>
											    <option value="0">선택 가능한 쿠폰이 없습니다.</option>
										<% } else { %>
										   		<option disabled>쿠폰을 선택해주세요</option>
										   		<option value="0">선택안함</option>
											<% for(CouponInfo c : coupons) { %>
											    	<option value="<%= c.getCouponSale() %>">쿠폰명 : <%= c.getCouponName() %> <%= c.getCouponSale() %>%</option>
											<% } %>
										<% } %>
                                    </select>
                                    <% if(coupons.get(0).getCouponName() != null || !coupons.isEmpty() || coupons != null) { %>
                                    	<% for(CouponInfo c : coupons) { %>
                                    		<input type="number" name="getDcKey" value="<%= c.getDcKey() %>" readOnly hidden="true">
                                    	<% } %>
                                    <% } %>
                                    <input type="checkbox" id="checkUsingCoupon" disabled>
                                    <input type="checkbox" id="checkUsingPoint" disabled>
                                </td>
                            </tr>
                            <tr>
                            	<td class="applyableTd">
                            		<p id="mileagePtag">적용 가능한 마일리지</p>
                            	</td>
                            		<td>
                            			<div id="mileageContainer">
                            				<span>보유 포인트 : </span><span id="havingPointSpan"><%= coupons.get(0).getCustPoint() %></span><span>포인트</span><br>
                            				<span>적용후 포인트 : </span><span id="afterApplySpan"><%= coupons.get(0).getCustPoint() %></span><span>포인트</span>
	                                    	<input type="text" name="pointInput" placeholder="숫자만 입력해주세요">
	                                    	<button id="applyPoint">포인트사용</button>
	                                    	<button id="allPointApply">모든포인트사용</button>
	                                    	<button id="cancelApplyPoint">포인트사용취소</button>
	                                    </div>
                                	</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="executePayContainer">
                    <ul>
                        <li>
                            <span>총 상품금액</span>
                            <span id="totalPaySpan"></span><span>원</span>
                        </li>
                        <li>
                            <span>쿠폰 할인금액</span>
                            <span id="discountPriceSpan">0</span><span>원</span>
                        </li>
                        <li>
                            <span>적용 포인트</span>
                            <span id="pointApplySpan">0</span><span>포인트</span>
                        </li>
                        <li>
                            <span>총 결제금액</span>
                            <span id="finalPriceSpan"></span><span>원</span>
                        </li>
                        <li>
                            <button id="payButton">결제하기</button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <footer>
        <div id="footerMain">
            <!-- 주소 전화번호 등 -->
            <div id="footerMainLeft">
                <div>
                    <p>ajaaja</p>
                </div>
                <div>
                    <p>
                        2024-서울가산-e호 <br>
                        (08505)서울특별시 금천구 가산디지털2로95(가산동,km타워)3층 305호
                    </p>
                </div>
                <div>
                    <p>SH 110-457</p>
                </div>
                <div>
                    <p>COPYRIGHT AJAAJA,ALL RIGHTS RESERVED.</p>
                </div>
            </div>
            <!-- Q&A 등 하이퍼링크 -->
            <div id="footerMainRight">
                <div>
                    <a href=""><p>Q&A</p></a>
                </div>
                <div>
                    <a href=""><p>CONTACT</p></a>
                </div>
                <div>
                    <a href=""><p>FAQ</p></a>
                </div>
                <div>
                    <a href=""><p>INSTARGRAM</p></a>
                </div>
                <div>
                    <a href=""><p>NOTICE</p></a>
                </div>
            </div>
        </div>  <!-- <div id="footerMain">닫힘 --> 
    </footer>
    <style>
        section{
            display: flex;
            justify-content: center;
            width:100%;
        }
        #totalPaymentContainer{
            width:80%;
            justify-content: center;
            display:grid;
            flex-wrap: wrap;
        }
        tr{
            border-bottom:1px solid black;
            height:50px;
            align-content:center;
        }
        th{
            font-size:16px;
            background-color:rgb(190, 185, 185);
            width:250px;
            text-align:left;
            padding-left:10px;
        }
        td{
            padding-right:200px;
            padding-left:10px;
            
        }
        .infoTable{
            border-collapse:collapse;
            width:80%;
            border-top:2px solid black;
            margin-left:50px;
        }
        #prodImgContainer>img{
            width:100px;
            height:100px;
        }
        #deliAddContainer{
            justify-content:center;
        }
        #addressContainer{
            padding:0px;
            padding-left:30px;
        }
        #addressInputTr{
            height:100px;
        }
        #sample4_extraAddress{
            width:352px;
        }
        .p{
            margin-left:50px;
            font-size:20px;
        }
        #customerRequestContainer{
            margin-top:70px;
        }
        #headerMain{
            /* border: 1px solid red; */
            /* background-color: red; */
            height: 70px;
            display: flex;
        }
        .prodInfoContainer{
            margin-top:70px;
            overflow:hidden;
        }
        .prodInfoRow{
            height:150px;
        }
        .prodInfoRow>td>p{
            width:100px;
        }
        .prodInfoContainer table *{
            text-align:center;
        }
        .prodInfoScope{
            padding-right:100px;
        }
        tbody td:first-child{
            display:flex;
        }
        #prodImgContainer{
            align-content:center;
        }
        #prodImgContainer>img{
            height:150px;
            width:150px;
        }
        .prodContentContainer>p{
            width:100px;
            text-align:left;
        }
        .prodContentContainer>p:first-child{
            margin-top:10px;
            margin-bottom:10px;
        }
        .prodContentContainer>p:last-child{
            margin-top:10px;
            width:200px;
        }
        .prodContentContainer{
            width:200px;
        }
        #paymentContainer{
            display:flex;
        }
        #discountContainer{
            width:60%;
            overflow:hidden;
        }
        #executePayContainer{
            width:40%;
            border:2px solid black; 
        }
        .couponTableTh{
            text-align:center;
        }
        .applyableTd{
            align-items:center;
            padding-right:100px;
        }
        .numtd{
            padding-left:100px;
            padding-right:100px;
        }
        .numtd>p{
        	text-align:center;
        	text-overflow:ellipsis;
            white-space:nowrap;
        }
        #couponTable{
            margin-left:50px;
        }
        .applyableTd>p{
            min-width:150px;
        }
        #executePayContainer{
            width:30%;
        }
        .star{
            color:red;
            margin-right:5px;
        }
        .needStarTd{
            /* display:flex; */
            align-items:center;
        }
        .addressInput{
            width:300px;
        }
        .infoTable>thead>tr>th{
        	text-align:center;
        }
        #mileagePtag{
        	text-overflow:ellipsis;
            white-space:nowrap;	
        }







    #footerMain{
		/* border: 1px solid red; */
		height: 250px;
		display: flex;
	}
	
	/* 주소 전화번호 등 */
	#footerMainLeft{
		/* border: 1px solid orange; */
		display: flex;
		flex-direction: column;
		width: 69%;
		margin-left: 1%;
	}
	
	/* Q&A 등 하이퍼링크 */
	#footerMainRight{
		/* border: 1px solid orange; */
		width: 30%;
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		padding-top: 5px; 
	}
	
	/* 영역크기 */
	#footerMainRight>div{
		/* border: 1px solid green; */
		width: 45%;
		height: 20%;
	}
	
	/* 폰트 적용 */
	#footerMainRight a{
		text-decoration-line: none;
		font-size: 20px;     
	}
	 
	#headerMain{
		/* background-color: red; */
		height: 70px;
		display: flex;
		width: 100%;
	}

	/* 로고 */
	#headerLogo{
		/* border: 1px solid orange; */
		margin-left: 1%;
		display: flex;
		align-items: center;
		width: 10%;
	}

      /* 제품,About */
      #headerTitle{
          /* border: 1px solid orange; */
          display: flex;
          margin-left: 10%;
          justify-content: space-between;
          align-items: center;
          width: 40%;
      }

      /* 폰트적용 */
      #headerTitle a{
          text-decoration-line: none;
          font-size: 20px;
      }

      /* 장바구니,마이페이지,검색,메뉴? */
      #headerMypage{
          /* border: 1px solid orange; */
          display: flex;
          align-items: center;
          justify-content: space-between;
          width: 14%;
          margin-left: 24%;
      }
    </style>

    <!-- 카카오 우편번호 API script -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
	    //kakao 주소지 등록받는 api script로직입니다.
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("sample4_extraAddress").value = '';
	                }
	
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	 	 //사용자가 기본으로 설정한 배송지가 없을 경우 기존배송지를 선택할 수 없게하고 신규배송지를 입력하도록 하는로직입니다.
	 	 //else문에 빠지면 가져온 배송지 정보를 input태그 안에 value값으로 넣어줍니다.
	    <%if(defaultAddressInfo == null) {%>
	    	alert("기본으로 설정된 배송지가 없습니다. 신규 배송지를 입력해주세요!!");
	    	const inputNewRadio = document.querySelector("input[value='신규 배송지']");
	    	inputNewRadio.checked = true;
	    	document.querySelector("input[value='기존 배송지']").addEventListener("click", e => {
	    		e.target.disabled = true;
	    		alert("기본 배송지를 선택할 수 없습니다. 기본 배송지를 설정하고 이용해주세요. 기본 배송지는 마이페이지에서 설정 가능합니다.");
	    		inputNewRadio.checked = true;
	    	})
	    <%} else {%>
	    	document.querySelector("input[value='기존 배송지']").checked = true;
	    	//document.querySelector("input[name='receptionAddName']").value = "<%= defaultAddressInfo.getAddrName() %>"; 배송지명 ex) 집, 회사, 누구의집 
	    	document.querySelector("input[name='receptionName']").value = "<%= defaultAddressInfo.getAddrName() %>";
	    	document.querySelector("input[name='receptionPhoneNum1']").value = "<%=defaultAddressInfo.getAddrPhone() %>";
	    	document.querySelector("input[id='sample4_postcode']").value = "<%=defaultAddressInfo.getAddrPostcode()%>";
	    	document.querySelector("input[id='sample4_detailAddress']").value = "<%=defaultAddressInfo.getAddrDetail()%>";
	    	document.querySelector("input[id='sample4_roadAddress']").value = "<%=defaultAddressInfo.getAddrAddress()%>";//roadAddress 도로명주소 db는 수령인 주소
	    	
	    	//기본 배송지가 있는 사람이 신규 배송지를 눌렀다 다시 기본 배송지를 체크했을때 데이터를 받아옵니다.
	    	document.querySelector("input[value='기존 배송지']").addEventListener("click",e => {
	    		fetch("<%=request.getContextPath()%>/join/defaultaddress.do?cust_key=" + <%= session.getAttribute("cust_key") %>, {
	    			method : "GET",
	    			headers : {
	    				"Content-type" : "application/json;charset=utf-8"
	    			},
	    		})
	    		.then(response => response.json())
	    		.then(data => {
	    			console.log(data);
	    			document.querySelector("input[name='receptionName']").value = data.addrName;
	    			document.querySelector("input[name='receptionPhoneNum1']").value = data.addrPhone;
	    			document.getElementById("sample4_postcode").value = data.addrPostcode;
	    			document.getElementById("sample4_detailAddress").value = data.addrDetail;
	    			document.getElementById("sample4_roadAddress").value = data.addrAddress;
	    		});
	    	})
	    <%}%>
	    
	    //배송 메세지 select태그 안에서 직접 입력하기를 선택했을때 입력받는 input태그를 나오게 하는 로직입니다.
	    document.querySelector("select").addEventListener("change", e => {
	    	if(e.target.options[e.target.selectedIndex].innerHTML == '직접 입력하기') {
	    		document.querySelector("input[name='deliveryRequestMessage']").hidden = false;
	    	} else {
	    		document.querySelector("input[name='deliveryRequestMessage']").hidden = true;
	    	}
	    })
	    
	    //기존 배송지가 있던 사람이 신규 배송지를 선택하면 input태그 안의 기본 배송지 value를 다 비워줍니다.
	    document.querySelector("input[value='신규 배송지']").addEventListener("click", e => {
	    	document.querySelectorAll("#addressContainer>input[type='text']").forEach(input => {
	    		input.value = "";
	    	})
	    	document.querySelector("input[name='receptionName']").value = "";
    		document.querySelector("input[name='receptionPhoneNum1']").value = "";
    		document.querySelector("input[name='receptionPhoneNum2']").value = "";
	    })
	    
	    //변수문제로 보수 필요 ******************************
		let totalPay = 0;
	    let totalQuantity = 0;
	    let totalProdName = "";
	    
	    //결제할 총 금액 정보를 담아줄 총 수량, 금액 등등...을 구하고 list태그의 자식태그인 span태그에 값을 넣어주는 로직입니다.
	    //다른 정보들은 카카오api결제 request에 필요한 body data를 전달하기위한 로직입니다.
	    <%
		    int totalPay = 0; //총 금액
	    	int totalQuantity = 0; //총 수량
	    	String totalProdName = "";//총 상품명 이름
	    	int count = 1;
	    	for(ProductInfo p : cartInfo) {
	    		//
	    		totalPay += (p.getOptionPrice() + p.getProdPrice()) * p.getCartQuantity();
	    		totalQuantity += p.getCartQuantity();
	    		//상품명이 너무 길어지면 카카오페이 결제에서 보기 안좋으므로 장바구니의 상품이 3개이상이면 4번째 상품명 부터는 ... 으로 대체합니다.
	    		if(cartInfo.size() <= 3) {
		    		if(cartInfo.size() == count) {
		    			totalProdName += p.getProdName();
		    			count++;
		    		} else {
		    			totalProdName += p.getProdName() + ", ";
		    			count++;
		    		}
	    		} else {
	    			if(3 > count) {
		    			totalProdName += p.getProdName() + ", ";
		    			count++;
		    		} else if(count == 3){
		    			totalProdName += p.getProdName() + "...";
		    			count++;
		    		}
	    		}
	    	}
	    	System.out.println("전체비용 : " + totalPay);
    	%>
    	
    	totalPay = <%= totalPay %>;
    	totalQuantity = <%= totalQuantity %>;
    	sumProdName = "<%= totalProdName %>";
    	document.querySelector("span[id='totalPaySpan']").innerText = totalPay;
    	
    	document.getElementById("choiceCoupon").addEventListener("change", e => {
    		const applyPoint = document.getElementById("pointApplySpan").innerText;
    		let selectCouponDisRate = e.target.value;
    		let discountPrice = <%= totalPay %> * (selectCouponDisRate / 100);
    		document.querySelector("#discountPriceSpan").innerText = discountPrice;
    		document.querySelector("#finalPriceSpan").innerText = <%= totalPay %> - discountPrice - applyPoint;
    		document.querySelector("#checkUsingCoupon").checked = true;
    	})
    	 
    	
    	//쿠폰이 존재하면 할인율이 가장 높은 쿠폰을 option태그에서 select되어 있게하는 로직입니다.
    	<% if(coupons.get(0).getCouponName() != null) { %>
   			const couponSelect = document.querySelector("#choiceCoupon");
   			console.log(couponSelect);
   			let num = 0;
   			//쿠폰중 가장높은 할인율을 변수 num에 저장합니다.
   			for(let i = 1; i < couponSelect.length; i++) {
   				if(num < couponSelect[i].value) {
   					num = couponSelect[i].value;
   				}
   			}
   			
   			//가장높은 할인율을 가지고있는 쿠폰을 select 합니다.
   			for(let i = 1; i < couponSelect.length; i++) {
   				if(couponSelect[i].value == num) {
   					couponSelect[i].selected = true;
   					document.querySelector("#checkUsingCoupon").checked = true;
   				}
   			}
   			
   			//적용된 쿠폰의 pk값을 받아오기위한 로직입니다.
   			(function() {
	  			let dcKey;
	   			if(document.getElementById("checkUsingCoupon").checked) {
	   				const selectCoupon = document.getElementById("choiceCoupon");
	   				dcKey = document.querySelectorAll("input[name='getDcKey']")[selectCoupon.selectedIndex - 2].value;
	   				console.log(selectCoupon.selectedIndex);
	   				console.log(dcKey);
	   			}
	   			
	   			document.getElementById("choiceCoupon").addEventListener("change", e => {
	   				const selectCoupon = document.getElementById("choiceCoupon");
	   				if(selectCoupon.selectedIndex > 1) {
	   					dcKey = document.querySelectorAll("input[name='getDcKey']")[e.target.selectedIndex - 2];
	   					console.log(selectCoupon.selectedIndex);
	   					console.log(dcKey);
	   				}
	   			})
   			})()
   			
   			
   			
   			//할인 가격과 쿠폰이 적용된 후의 결제 가격을 입력해줍니다.(처음 페이지에 접속했을때)
   			
   			document.querySelector("#discountPriceSpan").innerText = totalPay * (num / 100);
   			console.log("쿠폰할인가격 : " + totalPay * (num / 100));
   			document.querySelector("#finalPriceSpan").innerText = totalPay * ((100 - num) / 100);
   			
   			
   			document.getElementById("choiceCoupon").addEventListener("change", e => {
   				
   			})
    	<% } else {%>
	    	document.querySelector("#finalPriceSpan").innerText = totalPay;
    	<% } %>
    	
    	//마일리지 입력란에 숫자형인지 확인해주는 로직입니다.
    	document.querySelector("input[name='pointInput']").addEventListener("keyup", e => {
    		const numberingPoint = Number(document.querySelector("input[name='pointInput']").value);
    		const pointInput = document.querySelector("input[name='pointInput']");
    		let oriText = document.querySelector("input[name='pointInput']").value;
    		const oriTextArr = Array.from(oriText);
    		if(isNaN(numberingPoint)) {
    			alert("숫자만 입력해주세요");
    			for(let i = 0; i < oriTextArr.length; i++) {
    				if(isNaN(oriTextArr[i])) {
    					pointInput.value = oriText.substring(0, i);
    					return;
    				}
    			}
    		}
    	})
    	
    	//마일리지를 적용하는 로직입니다.
    	document.getElementById("applyPoint").addEventListener("click", e => {
    		const afterApplySpan = document.getElementById("afterApplySpan");
    		const wantUsingPointInput = document.querySelector("input[name='pointInput']");
    		const wantUsingPoint = wantUsingPointInput.value;
    		const pointApplySpan = document.getElementById("pointApplySpan");
    		const afterApplyPoint = afterApplySpan.innerText;
    		const finalPriceSpan = document.getElementById("finalPriceSpan");
    		console.log(wantUsingPoint);
    		console.log(afterApplyPoint);
    		//보유포인트보다 더 많은값을 입력하면 막는 로직입니다.
    		if(wantUsingPoint > afterApplyPoint) {
    			alert("보유 마일리지보다 더 큰 값을 입력할 수 없습니다.");
    			wantUsingPointInput.value = afterApplyPoint;
    			if(afterApplyPoint == 0) {
    				wantUsingPointInput.value = "";
    			}
    		} else if(wantUsingPoint > 0) {
    			pointApplySpan.innerText = wantUsingPoint;
    			finalPriceSpan.innerText -= wantUsingPoint;
    			afterApplySpan.innerText -= wantUsingPoint;
    			wantUsingPointInput.value = "";
    		}
    	})
    	
    	//포인트 전체적용 로직입니다.
    	document.getElementById("allPointApply").addEventListener("click", e => {
    		const marginPoint = Number(document.getElementById("afterApplySpan").innerText);
    		document.getElementById("afterApplySpan").innerText -= marginPoint;
    		document.getElementById("finalPriceSpan").innerText = Number(document.getElementById("finalPriceSpan").innerText) - marginPoint;
    		document.getElementById("pointApplySpan").innerText = Number(document.getElementById("pointApplySpan").innerText) + marginPoint;
    	})
    	
    	//포인트 적용 취소 로직입니다.
    	document.getElementById("cancelApplyPoint").addEventListener("click", e => {
    		const applyPoint = Number(document.getElementById("pointApplySpan").innerText);
    		const afterApplyPoint = Number(document.getElementById("afterApplySpan").innerText);
    		document.getElementById("pointApplySpan").innerText = 0;
    		document.getElementById("afterApplySpan").innerText = applyPoint + afterApplyPoint;
    		document.getElementById("finalPriceSpan").innerText = Number(document.getElementById("finalPriceSpan").innerText) + applyPoint; 
    	})
    	
    	
    	
    	
    	
    </script>

    <!-- 카카오페이 결제 API script -->
    <script>
		
        document.querySelector("#payButton").addEventListener("click",e => {
       		const finalPrice = document.querySelector("#finalPriceSpan").innerText;
       		let cartKey;
       		let dcKey;
       		const usingPoint = document.getElementById("pointApplySpan").innerText;
       		const selectCoupon = document.getElementById("choiceCoupon");
			if(selectCoupon.selectedIndex > 1) {
				dcKey = document.querySelectorAll("input[name='getDcKey']")[selectCoupon.selectedIndex - 2].value;
			}
			
			console.log(dcKey);
			<% String cartKey = "";
    		int counts = 1;
			for(ProductInfo p : cartInfo) { 
				if(counts == cartInfo.size()) {
					cartKey += p.getCartKey();
					counts++;
				} else {
					cartKey +=  p.getCartKey() + ",";
					counts++;
				}
			}
			System.out.println("cartKey : " + cartKey);%>
			
			let delRequest = "";
			const delReqSelect = document.getElementById("deliveryRequestSelect");
			if(delReqSelect.selectedIndex == 4) {
				delRequest = document.querySelector("input[name='deliveryRequestMessage']").innerText;
			} else {
				delRequest = delReqSelect[delReqSelect.selectedIndex].innerText;
			}
			
        	fetch("<%= request.getContextPath() %>/member/kakaopay.do", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                },
                //상품정보와 상품결제/실패/성공/취소로 이동할 주소등등 을 body에 담아서 넘겨줍니다
                body: JSON.stringify({
                    "cid": "TC0ONETIME",
                    "partner_order_id": "partner_order_id",
                    "partner_user_id": "partner_user_id",
                    "item_name": sumProdName,
                    "quantity": totalQuantity,
                    "total_amount": finalPrice,
                    "vat_amount": "200",
                    "tax_free_amount": "0",
                    "approval_url": "http://localhost:8080/semi_aja/pay/paysuccess.do?usingPoint=" + usingPoint,
                    <%-- ?custKey=<%= session.getAttribute("cust_key") %>"
                    + "&orderPrice=" + Number(document.getElementById("finalPriceSpan").innerText)
                    + "&orderSale=" + (Number(document.getElementById("discountPriceSpan").innerText) + Number(document.getElementById("pointApplySpan").innerText))
                    + "&orderPayoption=카카오페이&orderName=<%= defaultAddressInfo.getAddrName() %>"
                    + "&orderPostcode=<%= defaultAddressInfo.getAddrPostcode() %>&orderAddress=<%= defaultAddressInfo.getAddrAddress() %>"
                    + "&orderDetailaddr=<%= defaultAddressInfo.getAddrDetail() %>&orderPhone=<%= defaultAddressInfo.getAddrPhone() %>"
                    + "&cartKies=<%= cartKey %>"
                    + "&dcKey=" + dcKey, --%>
                    "fail_url": "http://localhost:8080/testproject/fail",
                    "cancel_url": "http://localhost:8080/semi_aja/WEB-INF/views/payment/paycancel.jsp",
                    "custKey" : "<%= session.getAttribute("cust_key") %>",
                    "orderPrice" : Number(document.getElementById("finalPriceSpan").innerText),
                    "orderSale" : (Number(document.getElementById("discountPriceSpan").innerText) + Number(document.getElementById("pointApplySpan").innerText)),
                    "orderPayoption" : "카카오페이",
                    "orderName" : "<%= defaultAddressInfo.getAddrName() %>",
                    "orderPostcode" : document.getElementById("sample4_postcode").value,
                    "orderAddress" : document.getElementById("sample4_roadAddress").value,
                    "orderDetailaddr" : document.getElementById("sample4_detailAddress").value,
                    "orderPhone" : document.querySelector("input[name='receptionPhoneNum1']").value,
                    "orderRequest" : delRequest,
                    "cartKies" : "<%= cartKey %>",
                    "dcKey" : dcKey,
                    "orderState" : "주문"
                })
            })
            .then(response => response.json())
            .then(data => {
            	console.log(data);
            	//data.next_redirect_pc_url의 문자열이 존재하면 if문에 빠지며 존재하지 않을경우 else문으로 빠집니다.
            	if (data.next_redirect_pc_url) {
                    window.open(data.next_redirect_pc_url);
                } else {
                    console.error('next_redirect_pc_url not found in the response.');
                }
            	
            })
            .catch(error => console.error('Error:', error)); 
        	//error메세지는 요청을 보냈을때 response로 온 에러메세지를 console창에 출력합니다
        	//response객체는 servlet에서 받아주고 있습니다.
        })
    </script>
</body>
</html>