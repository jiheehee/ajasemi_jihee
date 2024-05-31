<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.util.List,com.aja.productprint.model.dto.ProductQnaDTO" %>

<%
	List<ProductQnaDTO> qnaList = (List<ProductQnaDTO>)request.getAttribute("qnaList");
%>



<%if(qnaList.size()!=0) {%>
<!-- 제목 내용 상품이미지... 등록일 비밀글(y,n) 카테고리 / 답변은 내용 작성일 -->
<div id="product-footer-main-three-header">   <!-- 상단바 문의 카테고리 -->
    <div>   <!-- 왼쪽 -->
        <h3>상품 문의 (<%=qnaList.size()%>)</h3>
    </div>
    <div>   <!-- 오른쪽 -->
        <ul id="product-footer-main-three-header-category"> 
            <li>
                <button onclick="qnabutton(event);" value="All">ALL</button>
                <span>|</span>
            </li>
            <%
            	int count1 = 0;
            	int count2 = 0;
            	int count3 = 0;
            	int count4 = 0;
            	int count5 = 0;
            
            for(ProductQnaDTO q : qnaList){ 
            	if(q.getPqnaCategory().contains("배송문의")){
            		count1++;
            	}
            	if(q.getPqnaCategory().contains("주문문의")){
            		count2++;
            	}
            	if(q.getPqnaCategory().contains("재입고문의")){
            		count3++;
            	}
            	if(q.getPqnaCategory().contains("사이즈문의")){
            		count4++;
            	}
            	if(q.getPqnaCategory().contains("기타문의")){
            		count5++;
            	}
            } %>
            <li>		<!-- onclick으로 화면에 출력되는거 변경하기 -->
                <button onclick="qnabutton(event);" value="배송문의">배송문의 (<%=count1%>)</button>
                <span>|</span>
            </li>
            <li>
                <button onclick="qnabutton(event);" value="주문문의">주문문의 (<%=count2%>)</button>
                <span>|</span>
            </li>
            <li>
                <button onclick="qnabutton(event);" value="재입고문의">재입고문의 (<%=count3%>)</button>
                <span>|</span>
            </li>
            <li>
                <button onclick="qnabutton(event);" value="사이즈문의">사이즈문의 (<%=count4%>)</button>
                <span>|</span>
            </li>
            <li>
                <button onclick="qnabutton(event);" value="기타문의">기타문의 (<%=count5%>)</button>
            </li>
        </ul>
        <button id="qnawrite">상품문의</button>	<!-- 버튼으로 Q&A작성 창으로 이동 -->
    </div>
</div>  <!-- 상단바 닫힘 -->

<hr style="border: 3px solid black; width: 100%;">

<div>   <!-- 답변 -->
    <ul id="product-footer-main-three-content-list">
    
    
    <%for(ProductQnaDTO q : qnaList){  %>
    
    
        <li>
            <div>   <!-- Q -->
            	<%if(q.getProdcsContent()!=null){ %>
                <span style=" background-color:  #9bce26; ">답변완료</span>	<!-- q.getProdcsContent() 가있으면 답변완료 / 없으면 답변대기 -->
                <%}else{ %>
                <span style=" background-color:  lightgray;">답변대기</span>
                <%} %>
                <span>[<%=q.getPqnaCategory()%>]</span>
                <%if(q.getPqnaSecret().contains("Y")){ %>
                <img src="https://i.pinimg.com/236x/7f/5c/7c/7f5c7cd30efc2190db8c19614d073516.jpg" 
                    alt="비밀글여부" width="30px" height="30px">
                <%} %>
               <span><%=q.getPqnaTitle()%></span> 
                <span><%=q.getCustNickname()%></span> 
                <span><%=q.getPqnaEnrolldate()%></span> 
            </div>
            <hr width="100%">

            <div class="product-footer-main-three-qnacontainer">   <!-- Q&A -->
                <%if(q.getPqnaSecret().contains("N")){ %>
                <div>   <!-- Q -->
                    <p>Q</p>
                    <p><%=q.getPqnaTitle()%></p>
                </div>
                
                <%if(q.getProdcsContent()!=null){ %>
                <hr width="70%">
                <div>   <!-- A -->
                    <p>A</p>
                    <p>
                         <%=q.getProdcsContent()%>
                        <br><br>
                        Apricot<br>
                        Guide to Better Choice
                    </p>
                </div>
                <%} %>
                
                <hr width="100%">
                <%} %>
            </div>
        </li>
	
	
	<%} %>


        

    </ul>
</div>
<%}else{ %>
	<div>
   		<h3 style="text-align: center;	margin: 70px 0 100px 0; ">작성된 Q&A가 없습니다.</h3>
   		<hr>
   	</div>
<%} %>




