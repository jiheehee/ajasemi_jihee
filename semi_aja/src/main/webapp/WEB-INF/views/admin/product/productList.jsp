<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.aja.product.model.dto.Product2" %>
<%@ include file="/WEB-INF/views/admin/header.jsp" %>
<%
	List<Product2> productList = (List<Product2>)request.getAttribute("lists");
	String pageBar=(String)request.getAttribute("pageBar");
%>
<style>
    #tbl-product {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-size: 18px;
        text-align: left;
    }
    #tbl-product th, #tbl-product td {
        padding: 12px 15px;
        border: 1px solid #ddd;
    }
    #tbl-product tr {
        background-color: #f9f9f9;
    }
    #tbl-product tr:nth-of-type(even) {
        background-color: #f2f2f2;
    }
    #tbl-product th {
        background-color: #4CAF50;
        color: white;
    }
    #tbl-product td button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 5px 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
    }
    #tbl-product td button:hover {
        background-color: #45a049;
    }
    .content{
    	display:flex;
    	flex-direction:column;
    }
    #pageBar>ul{
    	display:flex;
    	list-style-type:none;
    	justify-content:center;
    	border : 1px solid red;
    }
    #pageBar>ul>li>a{
    	text-decoration-line : none;
    	color : black;
    	cursor: pointer;
    }
    
    
    
</style>
	<div class="content">
     <table id="tbl-product">
	         <tr>
		        <td>상품번호</td>
		        <td>상품명</td>
		        <td>카테고리명</td>
		        <td>키워드명</td>
		  <!--       <td>향(옵션)</td>
		        <td>사이즈(옵션)</td> -->
		        <td>가격(옵션추가가격)</td>
		        <td>재고</td>
		        <td>설명</td>
		        <td>상세설명</td>
		        <td>전성분</td>
		        <td>등록일</td>
		        <td>삭제여부</td>
             </tr>
       	    <%if(productList.size()>0){ 
       	    	for(Product2 p2 : productList){%>
       	    <tr>
       	    	<td><%=p2.getProdKey() %></td>
       	    	<td><%=p2.getProdName() %></td>
       	    	<td><%=p2.getCateName() %></td>
       	    	<td><%=p2.getKeywordName() %></td>
       	    	<%-- <td><%=p2.getOptionFlavor() %></td>
       	    	<td><%=p2.getOptionSize() %></td> --%>
       	    	<td><%=p2.getOptionPrice()+p2.getProdPrice() %></td>
       	    	<td><%=p2.getProdStock()%></td>
       	    	<td><%=p2.getProdContent() %></td>
       	    	<td><%=p2.getProdDetailCon() %></td>
       	    	<td><%=p2.getProdComponent() %></td>
       	    	<td><%=p2.getProdEnrollDate() %></td>
       	    	<td><%=p2.isProdDeleted()%></td>
       	    	<td>
       	    	<br>
       	    		<form action="<%=request.getContextPath() %>/product/updateproduct.do"  onsubmit="openInNewWindow(event);">
       	    			<input type="hidden" name="prodKey" value="<%=p2.getProdKey() %>">
       	    			<button type="submit">수정</button> 
       	    		</form>
       	    	</td>
       	    	<td>
       	    	<br>
	       	    	<form action = "<%=request.getContextPath() %>/product/deleteproduct.do">
								<input type="hidden" name = "prodKey" value ="<%=p2.getProdKey() %>">
								<button type="submit">삭제</button>
					</form>
				</td>
       	    <% }%>
       	    </tr>
       	 	<% }else{%> 
       	   		<tr>
       	   			<td colspan="11">조회된 데이터가 없습니다</td>
       	   		</tr>
       	 	<%} %>   
           	<td> <button onclick="enrollProduct()">상품등록</button></td>
            </tbody>
            
        </table>
        
        <div id="pageBar">
        	<%=pageBar %>
        </div>
        </div>
        
            <script>
           		enrollProduct =()=>{
           		var url = "<%=request.getContextPath() %>/product/productenroll.do";
           		var windowName = "상품등록";
           		var windowFeatures = "width=500,height=500,resizable=yes,scrollbars=yes";
           		window.open(url,windowName,windowFeatures);
           		
           		}
           		
                function openInNewWindow(event) {
                    event.preventDefault(); // 기본 폼 제출 방지

                    var form = event.target;
                    var formData = new FormData(form);

                    var url = form.action;
                    var queryString = new URLSearchParams(formData).toString();
                    var fullUrl = url + "?" + queryString;

                    var windowFeatures = "width=500,height=500,resizable=yes,scrollbars=yes";
                    var newWindow = window.open(fullUrl, "_blank", windowFeatures);

                }
            </script>
            
<%@ include file="/WEB-INF/views/admin/footer.jsp"%>