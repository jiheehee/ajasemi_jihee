<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp" %>
<%@ page import = "java.util.List,com.aja.product.model.dto.ProdOption" %>
<%
	List<ProdOption> optionList = (List<ProdOption>)request.getAttribute("optionList");
%>
 <style>
        /* 테이블 스타일 */
        #tbl-category {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        #tbl-category th, #tbl-category td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        #tbl-category th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        #tbl-category tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        #tbl-category tr:hover {
            background-color: #ddd;
        }

        #tbl-category td form {
            display: inline;
        }

        /* 폼 스타일 */
        #admin_middle_content {
            background-color: #f9f9f9;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 300px;
            margin: 0 auto;
        }

        #admin_middle_content input[type="text"],
        #admin_middle_content input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        #admin_middle_content input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #admin_middle_content input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* 버튼 스타일 */
        button {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #d32f2f;
        }
    </style>
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