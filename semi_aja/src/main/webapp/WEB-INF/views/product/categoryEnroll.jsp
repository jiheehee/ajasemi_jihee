<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/admin/header.jsp" %>
<%@ page import = "java.util.List,com.aja.product.model.dto.Category,com.aja.product.model.dto.Keyword" %>
<%
	List<Category> categoryList= (List<Category>)request.getAttribute("categoryList");
	List<Keyword> keywordList = (List<Keyword>)request.getAttribute("keywordList");
%>

       <table id="tbl-category">
	             <tr>
		            <th>카테고리명</th>
                </tr>
            <tbody>
       	    <%if(categoryList.size()>0){ 
       	    	for(Category c : categoryList){%>
       	    <tr>
       	    	<td><%=c.getCateKey() %></td>
       	    	<td><%=c.getCateName() %></td>
       	    	<td>
       	    	<br>
	       	    	<form action = "<%=request.getContextPath() %>/product/deletecategory.do">
								<input type="hidden" name = "categoryKey" value ="<%=c.getCateKey() %>">
								<button type="submit">삭제</button>
					</form>
				</td>
       	    <% }%>
       	    </tr>
       	 	<% }else{%>
       	    
       	   		<tr>
       	   			<td colspan="2">조회된 데이터가 없습니다</td>
       	   		</tr>
       	    
       	 	<%} %>   
            </tbody>
        </table>
            <form action="<%=request.getContextPath()%>/product/categoryenroll.do">
            	<div id="admin_middle_content">
      				카테고리명 : <input type="text" name="cateName">
	            	<input type="submit" value="등록">
	            </div>
            </form>
         <table id="tbl-keyword">
	             <tr>
		            <th>키워드명</th>
                </tr>
            <tbody>
       	    <%if(keywordList.size()>0){ 
       	    	for(Keyword k : keywordList){%>
       	    <tr>
       	    	<td><%=k.getKeywordKey() %></td>
       	    	<td><%=k.getKeywordName() %></td>
       	    	<td>
       	    	<br>
	       	    	<form action = "<%=request.getContextPath() %>/product/deletekeyword.do">
								<input type="hidden" name = "keywordKey" value ="<%=k.getKeywordKey() %>">
								<button type="submit">삭제</button>
					</form>
				</td>
       	    <% }%>
       	    </tr>
       	 	<% }else{%>
       	    
       	   		<tr>
       	   			<td colspan="2">조회된 데이터가 없습니다</td>
       	   		</tr>
       	    
       	 	<%} %>   
            </tbody>
        </table>
         <form action="<%=request.getContextPath()%>/product/keywordenroll.do">
            	<div id="admin_middle_content">
      				키워드명 : <input type="text" name="keywordName">
	            	<input type="submit" value="등록">
	            </div>
            </form>
<%@ include file ="/WEB-INF/views/admin/footer.jsp" %>