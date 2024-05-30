<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.aja.member.model.dto.Address, java.util.List, com.aja.member.model.dto.ProductInfo
, com.aja.member.model.dto.CouponInfo" %>
<%
	Address defaultAddressInfo = (Address)request.getAttribute("defaultAddress");
	List<ProductInfo> cartInfo = (List<ProductInfo>)request.getAttribute("cartInfo");
	List<CouponInfo> coupons = (List<CouponInfo>)request.getAttribute("coupons");
	System.out.println("coupons : " + coupons);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제창</title>
</head>
<body>
    <header>
        <div id="headerMain">
            <div id="headerLogo">
                <a href=""><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAY8AAAB+CAMAAADr/W3dAAAAh1BMVEX///8AAAAkJCS2trZ2dnatra2Pj4/8/Pzs7Ozw8PD4+Pjz8/Pb29vX19fm5uZCQkLGxsZHR0e/v7+dnZ3S0tLMzMxMTEzf39+RkZGpqak2NjZxcXF8fHwlJSWJiYmCgoJeXl4vLy8zMzNra2ugoKBbW1scHBwPDw8LCwtlZWVUVFQ9PT0XFxeASHsAAAAPXUlEQVR4nO1daXeqSBCVEOOO+xb3aIxG///vG1HAur1WExw8T+6HOW8iNEVXde3dlEpMVJqVy39bFe71BR6LqXdFL286CtzweePHd950FLii5UWo5k1JgRCzmB/9vCkpcEEjZoe3yZuUAhfsEn54g7xpKVAqLe78mOVNS4HS0CNo5E1NgSPlxzRval4eVcoO7zNvcl4eE+CH10o5TM23o4j/GUB2eO8ph2l6dhSLzw5fnLSUFp3Dj262pP+TaIuTltKic/hxypb0fxEtadK+0g0UbN+t+MiW9n8RM1mKixg9P9QUWmWbN1EvjL5Kzdfypup1cb4yYL8DfhRZ97zQuzFgiUHIW95kvSy6NwYEpSUwpJM3XS+KKGZYi0ms37wJe1FEzu7w8s8tMGScN2UvicjZvRZpB8CPVd6kvSSizG75+j+YN6nnTNpLAuYe84rlnEl7Rfiom86UH3/MjFeqwbjZHI+DtKFlLWj1fN/vtFKP0AjGw8sQvcsQ1cz6YGvjXnnX30391gM61T5jZ/cGDNWHaUdtDPvrzSEZ53x6nzbdRhjvjm+Ekv3vZOhWA6gP+scNfZnD13Y3YKrg/vt0OA6q1aDp90cB+aHemX9RsrblbHkSWfDEt23QN/DWqcZslEeeAoctO6Jp7DaqEb57XBmv+9+qAS4YTTkTCOXSOz+ac9WIfoYd6FEbw32m8ImB4VYNmlsFzTH6HPmsTPQDrDgUjd8NJFzYapcLUBOxsgzWmgEP/aw4EkWAC/Iu8KSl64BjnVzG2FmH6ByMA8xsHGnaSLg497YaPk3lHSIZMkiJ5/ms2bEiypDQauAvPMeR8SvrVHhfljDzg158OI3aG6dXr0tr43wadT/FP57MHRtTcuktkVeTSqiIURb58Eo0GNUiHXiMk8s7fgMK+8MrjRfb3uVP6L00dv4YRNJQ7dGCmVHlIfXe1o+5Xx9OvuAnY7RbJhdeS6WMQnQG+b5IDObwxw19iIvLC8HLEsxmAEZloh/jbr6Qa/Uk12lsZoWM6FtZWN1NaPr7NEg0fZWw3n8vaJ8+euNw2JrIX44qtiGSZ9QgU3gIv25Lde5IcmIgFaNlSCKXXWkVNH9UfEKA5VBNT2tBr9C74JQf3Ys4xf9egvFqCZbKIGcsRIUPIZFbgWccuYNRdqjcgAZVZppJTRLMbcWPtdsABqmmKn6hcWthoWqFjfLjt1TZ3/41l4RkiL7HH2t4kVoXFR+WQZgur28lq05HVRv1RJ8oJ7Oq41QEyo6R9ip4O51Vp2/zHZOlio7rDqbRhshG7cW/YxmE5/JSN3nOuEa55ycxmpqWIN8weKlEowMD1zDC0qyiHrlke/ufs+ZS1Fl/qVFES1fWs2D2eC4vUUZ6F4B68Ko1lOgS3Zo8GRw+OvjBSDMVac1eMMqP0fXdztpsDTjCknDzEXf5yP4jtsdxXF4qcwYFR4eVH5soNG3p3terfPAXzMEF5ITU643yw/ZWoIf/UDSKAi9V6zSwnOHytpgE0TSErJOSSdAq/4benJ+ZJISg0YWawUIYY96Ujxen1VgVw/1YBrFneakGMGVhQTIlnZJE1mvtANu2Jhr8MI4sgnq9C9UFsFvMs/X7g35P23YQhRlqWYQyyNo2FKVeb29D0GSM5Iskq1LvHOkAHZZ2rxPUkUofi/wwcziAa1PunYkssHohYhnE5vKO2NRQTSHuO7jHPe6tX+AzMXLINGz4UfyOjQTWbn/of2ZHbICOnpiSWAax6GPqxypXv/pS0RQQu+ia5gdyObuDIVerCBqEhn+bAsTLU1WoIpWvW9tYBjFLHE3q2qIVwzxU+aOIgOXMKWqChlEEK5g+tPtMkMpKE6XHD9RZXyyDmDNldPHbJoOqNsHU0DDUUcQgK8W6Y0PvkJcjvr49hwcCkabtIAq99GsbyiBGhQ661ray6boTYifqx5viaxkgzTz1DVkTWaBh/ZztETHyz72qGsuiPsOJTrXJ/aaupnUvGihuXJyQx3TyGmFQXsUGHCiZakgZrRnjnd1JoIjEw7S1ElSiyQOltTerLYXIRpAGSM19OgjZyTCoBhhUS1ob/GdOXQNCEOfzRjClzoH+LcG3sZoyWHbCqhOKvRNurRi3dzFv2tN7JKtXN/6qAOydcT4gCXfecKBnOfh61r3+oCf6ht+uHOGZdTBgXGMKdRBJjIAfHCqQdtd2kx9nfujLQJAMsioLmDsxhfXmiejuGOkgKGhy9z0ujTcBPzh9eH8K0aXd/wxoa5FgTFeTDyMmEMmKuRWsFEfYz3yLgIKe4+ZXQYwkBVM3/agCBtCOR4JI3S8M/OjW4NF+rw6Sa7rQXPi5NIUA4JpzmwrQfxR/pfzgnV8Aa9vtNAUhOcOErhR5st+qg+TUyucSJDistCzZcMg0T4Kokig/eK43uKNuRx5EFcYfv2wBFOt1hlIn0wzIXnTZdPmnxq8H0eSqCnMER/nBs0jgrJuT3AJi02PvTkEHVOP2gePoBkX4o9wKn+BNJf0V8E64XWnYJCB6DTQg4E0ulNGdApA4ZWFvcESnQXNOMszG4s0Be9WIxhVyUR6ys4OhHZcfGLSY+MHzEMCMuhxuEXsCHB4y9ndWQKk50KFDU2z7EyD5kujaZM8PXrIZpsqFH7F/yskrYNpZvXBhfTjQoYdZZ0kMwfXBtR+49kX7QfnBM86pEybRLbxTwbDZXanhIJOWzT6IxsS05eAgqCy0H+nsufhm7usD7IeDPY9jLh7d6KUrs1Pg3WR1CE1Fu7/Jk8MWoIDr76JrLT2fCATPfsCWMId62l5DgQYb+hhlIQDUfYZHCNTKWpYIGgto5BbnQNLO4q90zfGUD8TY/Hgw7qzgtmKju6MSPlBp2Z5i1vDVO8QEcwmiyc2XQM5IDvmIFl6zxksVBN17argFUTSWqphwlY4QJho+mrAbsJ4PtX6uawNpN1m/kKiKZWlxntj5xFhr8r+5gs3uipgQcvd/35Iio9qX8r7o1II/xj29FBKb8ron/GAdJYnuGvtgi3j98/dWWWNCyPw/6CT+npABRbabU4MabOg9stkj/DhwZhfSYZampzuSyeXeUMI2fhXlkHh42FmuaMeQ7SgyPE2MFVL59zfHEVPVYBJN65J/xMqXwrOGhOLDPs4WbMhTBPsLKTSeCQN5Vqxqyg+OMoFdvVz3KsksOLmldCJUEQaY08cdKtcgLo+QGIZcBc/BAnOuYCEVMo4LDULJbcWIiXDTKpi+kB1lUN9OmWY3kOcI/ADflddMAAZJsajp/DLau0Flss1HfINbfxBmpuWtRzZVnBnucyjoK8wocqQT3km1mWBDL7AX0MG8ca3BlD8+ACuyMjPBdXzg1yTuOkY0mOBzcNQLrHmV9gZ+2HMwI9t4KsQ5ANcPPqJFl/UB2MYHnpZ/37UhTjmoTM5uBXq9sh4L/LB2r9ras0ulcaspWt7kdZw35WIJUDbZUEJnLhDfPbUy0D9jYSZQeji9XBlMYxXa1hEHQbM8AcFNg3zhxCfq1/lYRIzRZfMG4mne2xpjqLI0ZTMz79UYycmDCbaH6FTA1P3XyA/Logf7JVvzi55ddQbD6ck7EUsxNBNgAtYKFJUs2P/JidEDZZpua57K5A0UGgGyzLYFAsGbukQgpGjMNgk8fkmkVsmM9Oha+NXeYAf29MgTjnVEu/sWFksVGeZPs2ZInBjF7ICNs1iQBoNYsUvDpF2hlCLJin+JiNbddvt3GVwEO/n5LuMpQmihcVBOILA6URJcvU05iA3nyZS8S8I+lUiDjJpjQrqa15prpK4ZfdKkAmtJcq7CpHjXu1q/KtHIycuk+Zw2hiCq8teGLU2xXZaZ1tGMHSFJaatjTtD4Jh1g2BJ0B0kG3Fiz1wYJUBCQlm4v1J6/obGchP+Kre+9nSLVobrCAZWyRyBwzOTCRWGE7NZ8mOlL9v2oNT63oxkyJbr6coXw4/fGwDfNCoHYR/Z15t71mlK4SGqhIrn9eWklwQihK0pR5hCaULV5k+YmukKOmk5GgUm0tC5bhxTolij4itpQntZrR7G9UbkJNTCtP7KgtsN47egtV5tj+Mbl23vfcxrp4jXhi0ZSvbkkHzGhXCLNuzRJcpEsMaX2T+zfWkskxq1KtlZAuegzK5Qf3cR8biWarYa19BVO+NHrRW6tf/NO70W8lEdmCVVT1WSL22neyoK01MpEmGSn+Z7DWMi2JVmgG4M7gm7erzw7mHg0pI1of0mXGN8ZXXbVvtCWpOLvOtJXu5vK6N/k0DQPLAgKS9lcHZw9Ad2PTqtaKVUa42F5vqH3K+aCuikj1A2dhJGmSbxwHOuI76ATK2Uw+cYwieZIw5iIiONx4g+Hw95uLjaS75UGph8umm8vrJDsSpFlp7NposIAwV5rXFrTUcgUqgyoeMTRrDwIRanR8olDNLI56x84yGLZG4ertDrcCa0q5ihM5EdJdxTyHWs1aUHoMbbDION00SrV26vfRS91gVs4flazKaIjLREF2uoEaEferiaCkckeK88qF7Gy8FXih/k0ZM9QE9xeLPi2e1nWte6oNrrm1ompTX3An9hUq9N7yj1nFCd9NsM3c6TN07XDrnGUC2bWirjMj9LAtNHlqPdaK8SVnN3mf+Pt16vl6rhPedZJiNC/ObePq+VyOV9/mtwc33SS88wcKg71eqHLLwUrj72P8dNnePy0nSrJqU11XcVHo6BUf7yP67T7+1ugUBnERrCRvn+wMgjoGq8ODCs+2CmVxs+c8X2Chq/akLiZOHaidlZKzbn44M2Akh+XGVU05+2tu7IroXicLstrk99HaCut6XKUqJ99e97v8A9cGJeXoySBtFhPeqlWddDpv38lIn3YzPpD9jgaflyMgE/9xLfZlCUntfLqezt5gk8C12vVWi3lZ6ga1SCopvwO+x3hR3rGQdWRBi0/rkMGzUGnM2gGD2tuKiDAyI8C/zsaBT+eCtWCH0+FoODHU4F2DLidVVfgESj48VxoFfx4KgwKfjwVOgU/ngq0GPPAjuQCTBT8eC6I37srkC8KfjwXygU/ngr0kIM0x+MXyBaTgh9PBdpVyjovo8BDQRsinE9jL5A56JZh9nbyAg8D7XFx/7pYgaxB28AYn8cp8GDQPivFpo4C/zOgxfLPPUcF/ooN5UdWh6YWSAs80jd1z3OBjIBHFhX8yBt4Wqj75wQLZAvkR4aHPBdIBdzL/gR96S8OPNz9gUesFWCh43nt2Xy1XK3ef1OeaFEgQ9SoCa9l7F/9B3ndtHA+NnZ+AAAAAElFTkSuQmCC" 
                    alt="logo" height="50" ></a>
            </div>
            <div id="headerTitle">
                <div>
                    <a href=""><p>handCream</p></a>
                </div>
                <div>
                    <a href=""><p>Perfume</p></a>
                </div>
                <div>
                    <a href=""><p>Body</p></a>
                </div>
                <div>
                    <a href=""><p>About</p></a>
                </div>
            </div>
            <div id="headerMypage">
                <div>
                    <a href=""><img src="https://i.pinimg.com/236x/db/a3/12/dba312c2f4808382c9086f42cfdfcd88.jpg" 
                        alt="장바구니" height="35"></a>
                </div>
                <div>
                    <a href=""><img src="https://i.pinimg.com/236x/f4/bd/5d/f4bd5d6403cc1f1b4179dc11687bf74a.jpg" 
                        alt="마이페이지" height="35"></a>
                </div>
                <div>
                    <a href=""><img src="https://i.pinimg.com/236x/55/da/93/55da9379cadae5a06c4f4efd06ffffde.jpg" 
                        alt="검색" height="35"></a>
                </div>
                <div>
                    <a href=""><img src="https://i.pinimg.com/236x/24/d8/9b/24d89b2ebde80c8098f7525f55267686.jpg" 
                        alt="메뉴?" height="35"></a>
                </div>
            </div>
        </div>
    </header>
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
                            <select name="deliveryMessage" id="">
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
                                    <img src="https://cdn.imweb.me/thumbnail/20220923/d4e7acfcd9fc0.png" alt="" width="100px" height="100px">
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
	                                    <img src="<%= request.getContextPath() %>/upload/product/<%= p.getProdImage1() %>" alt="" width="100px" height="100px">
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
                                <td id="applyableTd"><p id="couponPtag">적용 가능한 쿠폰</p></td>
                                <td>
                                    <select name="choiceCoupon" id="choiceCoupon">
                                        <% if(coupons == null || coupons.isEmpty()) { %>
											    <option>선택 가능한 쿠폰이 없습니다.</option>
										<% } else { %>
										   		<option>쿠폰을 선택해주세요</option>
											<% for(CouponInfo c : coupons) { %>
											    	<option value="<%= c.getCouponSale() %>">쿠폰명 : <%= c.getCouponName() %> <%= c.getCouponSale() %>%</option>
											<% } %>
										<% } %>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="executePayContainer">
                    <ul>
                        <li>
                            <span>총 상품금액</span>
                            <span id="totalPaySpan">60000원</span>
                        </li>
                        <li>
                            <span>쿠폰 할인금액</span>
                            <span>5000원</span>
                        </li>
                        <li>
                            <span>총 배송비</span>
                            <span>3500원</span>
                        </li>
                        <li>
                            <span>총 결제금액</span>
                            <span>51500</span>
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
        #applyableTd{
            align-items:center;
            padding-right:100px;
        }
        .numtd{
            padding-left:100px;
            padding-right:100px;
        }
        #couponTable{
            margin-left:50px;
        }
        #couponPtag{
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
	    		alert("기존 배송지를 선택할 수 없습니다. 기본 배송지를 설정하고 이용해주세요. 기본 배송지는 마이페이지에서 설정 가능합니다.");
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
	    <%}%>
	    
	    //배송 메세지 select태그 안에서 직접 입력하기를 선택했을때 입력받는 input태그를 나오게 하는 로직입니다.
	    document.querySelector("select").addEventListener("change", e => {
	    	if(e.target.options[e.target.selectedIndex].innerHTML == '직접 입력하기') {
	    		document.querySelector("input[name='deliveryRequestMessage']").hidden = false;
	    	} else {
	    		document.querySelector("input[name='deliveryRequestMessage']").hidden = true;
	    	}
	    })
	    
	    
	    
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
	    	System.out.println(totalProdName);
    	%>
    	
    	totalPay = <%= totalPay %>;
    	totalQuantity = <%= totalQuantity %>;
    	totalProdName = "<%= totalProdName %>";
    	document.querySelector("span[id='totalPaySpan']").innerHTML = totalPay;
    	
    	<% if(coupons != null) { %>
   			const couponSelect = document.querySelector("#choiceCoupon");
   			console.log(couponSelect);
   			let num = 0;
   			for(let i = 1; i < couponSelect.length; i++) {
   				if(num < couponSelect[i].value) {
   					num = couponSelect[i].value;
   				}
   			}
   			
   			for(let i = 1; i < couponSelect.length; i++) {
   				if(couponSelect[i].value == num) {
   					couponSelect[i].selected = true;
   				}
   			}
    	<% } %>
    	
    </script>

    <!-- 카카오페이 결제 API script -->
    <script>
        document.querySelector("#payButton").addEventListener("click",e => {
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
                    "item_name": totalProdName,
                    "quantity": totalQuantity,
                    "total_amount": totalPay,
                    "vat_amount": "200",
                    "tax_free_amount": "0",
                    "approval_url": "http://localhost:8080/testproject/success",
                    "fail_url": "http://localhost:8080/testproject/fail",
                    "cancel_url": "http://localhost:8080/testproject/cancel"
                })
            })
            .then(response => response.json())
            .then(data => {
            	console.log(data);
            	//data.next_redirect_pc_url의 문자열이 존재하면 if문에 빠지며 존재하지 않을경우 else문으로 빠집니다.
            	if (data.next_redirect_pc_url) {
                    window.location.href = data.next_redirect_pc_url;
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