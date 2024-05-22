<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp" %>
<%@ page import = "java.util.List,com.aja.product.model.dto.ProdOption" %>
<%
	List<ProdOption> optionList = (List<ProdOption>)request.getAttribute("optionList");
%>
            <table id="tbl-category">
	             <tr>
		            <th>옵션</th>
                </tr>
            <tbody>
       	    <%if(optionList.size()>0){ 
       	    	for(ProdOption o : optionList){%>
       	    <tr>
       	    	<td><%=o.getOptionKey() %></td>
       	    	<td><%=o.getOptionFlavor() %></td>
       	    	<td><%=o.getOptionSize() %></td>
       	    	<td><%=o.getOptionPrice() %></td>
       	    	<td>
       	    	<br>
	       	    	<form action = "<%=request.getContextPath() %>/product/deleteoption.do">
								<input type="hidden" name = "optionKey" value ="<%=o.getOptionKey() %>">
								<button type="submit">삭제</button>
					</form>
				</td>
       	    <% }%>
       	    </tr>
       	 	<% }else{%>
       	    
       	   		<tr>
       	   			<td colspan="4">조회된 데이터가 없습니다</td>
       	   		</tr>
       	    
       	 	<%} %>   
            </tbody>
        </table>
            <form action="<%=request.getContextPath()%>/product/optionenroll.do">
            	<div id="admin_middle_content">
      				향 : <input type="text" name="optionFlavor" required><br>
      				용량 : <input type="text" name="optionSize" required><br>
      				조정가격 : <input type="number" name="optionPrice" required><br>
	            	<input type="submit" value="등록">
	            </div>
            </form>
<%@ include file ="/WEB-INF/views/admin/footer.jsp" %>