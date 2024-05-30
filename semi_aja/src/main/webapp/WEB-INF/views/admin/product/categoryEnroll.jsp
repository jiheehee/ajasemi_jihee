<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/admin/header.jsp" %>
<%@ page import = "java.util.List,com.aja.product.model.dto.Category,com.aja.product.model.dto.Keyword" %>
<%
	List<Category> categoryList= (List<Category>)request.getAttribute("categoryList");
	List<Keyword> keywordList = (List<Keyword>)request.getAttribute("keywordList");
%>

   <style>
        /* 공통 테이블 스타일 */
	       table {
	    width: 100%;
	    border-collapse: collapse;
	    margin-bottom: 20px;
	}
	
	th, td {
	    border: 1px solid #ddd;
	    padding: 8px;
	    text-align: left;
	}
	
	th {
	    background-color: #f2f2f2;
	    font-weight: bold;
	}
	
	tr:nth-child(even) {
	    background-color: #f9f9f9;
	}
	
	tr:hover {
	    background-color: #ddd;
	}
	
	td form {
	    display: inline;
	}
	
	/* 공통 폼 스타일 */
	.admin_middle_content {
	    background-color: #f9f9f9;
	    padding: 20px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    width: 300px;
	    margin: 20px auto 20px auto;
	}
	
	.admin_middle_content input[type="text"] {
	    width: 100%;
	    padding: 10px;
	    margin: 5px 0 10px 0;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	}
	
	.admin_middle_content input[type="submit"] {
	    width: 100%;
	    background-color: #4CAF50;
	    color: white;
	    padding: 10px 20px;
	    margin: 8px 0;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	}
	
	.admin_middle_content input[type="submit"]:hover {
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
	
	/* clearfix 클래스 수정 */
	.clearfix {
	    display: flex;
	    justify-content: flex-end;
	    padding-right: 20px; /* 오른쪽으로 밀기 위한 패딩 추가 */
	}
    </style>
          <div class="clearfix">
        <table id="tbl-category">
            <tr>
                <th>카테고리명</th>
                <th>삭제</th>
            </tr>
            <tbody>
                <% if(categoryList.size() > 0) { 
                    for(Category c : categoryList) { %>
                <tr>
                    <td><%= c.getCateKey() %></td>
                    <td><%= c.getCateName() %></td>
                    <td>
                        <form action="<%= request.getContextPath() %>/product/deletecategory.do">
                            <input type="hidden" name="categoryKey" value="<%= c.getCateKey() %>">
                            <button type="submit">삭제</button>
                        </form>
                    </td>
                </tr>
                <% } %>
                <% } else { %>
                <tr>
                    <td colspan="3">조회된 데이터가 없습니다</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <form action="<%= request.getContextPath() %>/product/categoryenroll.do" class="admin_middle_content">
            카테고리명 : <input type="text" name="cateName">
            <input type="submit" value="등록">
        </form>
    </div>

    <div class="clearfix">
        <table id="tbl-keyword">
            <tr>
                <th>키워드명</th>
                <th>삭제</th>
            </tr>
            <tbody>
                <% if(keywordList.size() > 0) { 
                    for(Keyword k : keywordList) { %>
                <tr>
                    <td><%= k.getKeywordKey() %></td>
                    <td><%= k.getKeywordName() %></td>
                    <td>
                        <form action="<%= request.getContextPath() %>/product/deletekeyword.do">
                            <input type="hidden" name="keywordKey" value="<%= k.getKeywordKey() %>">
                            <button type="submit">삭제</button>
                        </form>
                    </td>
                </tr>
                <% } %>
                <% } else { %>
                <tr>
                    <td colspan="3">조회된 데이터가 없습니다</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <form action="<%= request.getContextPath() %>/product/keywordenroll.do" class="admin_middle_content">
            키워드명 : <input type="text" name="keywordName">
            <input type="submit" value="등록">
        </form>
    </div>
<%@ include file ="/WEB-INF/views/admin/footer.jsp" %>