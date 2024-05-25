<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,com.aja.product.model.dto.Category,com.aja.product.model.dto.Keyword,com.aja.product.model.dto.Product2" %>
<%
	List<Category> categoryList= (List<Category>)request.getAttribute("categoryList");
	List<Keyword> keywordList = (List<Keyword>)request.getAttribute("keywordList");
	Product2 p =(Product2)request.getAttribute("Product");
%>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        #admin_middle_content {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        form {
            display: flex;
            flex-direction: column;
        }
        form div {
            margin-bottom: 15px;
        }
        form div label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        form input[type="text"],
        form input[type="number"],
        form textarea,
        form select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        form input[type="file"] {
            margin-top: 10px;
        }
        form input[type="submit"] {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        form input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
        <form action="<%=request.getContextPath()%>/product/updateproductend.do" method="get">
            <div id="admin_middle_content">  <!-- 내용물 -->
                <div>
                      <label for="prodCategory">상품 카테고리</label>
                	<% if (categoryList.size() > 0) { %>
                    <select name="prodCategory" id="prodCategory">
                        <% for (Category c : categoryList) { %>
                            <option value="<%= c.getCateKey() %>"
                                <%= c.getCateName().equals(p.getCateName()) ? "selected" : "" %>>
                                <%= c.getCateName() %>
                            </option>
                        <% } %>
                    </select>
                	<% } %>
                   <br>
                  	<label for="prodKeyword">상품 키워드</label>
              		<% if (keywordList.size() > 0) { %>
                    <select name="prodKeyword" id="prodKeyword">
                        <% for (Keyword k : keywordList) { %>
                            <option value="<%= k.getKeywordKey() %>"
                                <%= k.getKeywordName().equals(p.getKeywordName()) ? "selected" : "" %>>
                                <%= k.getKeywordName() %>
                            </option>
                        <% } %>	
                    </select>
                	<% } %>
                	<input type="hidden" name="prodKey" value="<%=p.getProdKey() %>">
                    상품이름<input type="text" name="prodName" placeholder="상품이름" value ="<%=p.getProdName() %>" required><br>
                    상품가격<input type="number" name="prodPrice" placeholder="상품가격" value ="<%=p.getProdPrice() %>" required min="0"><br>
                    상품설명<input type="text" name="prodContent" placeholder="상품설명" value ="<%=p.getProdContent() %>" required><br>
                    재고<input type="number" name="prodStock" placeholder="재고" value ="<%=p.getProdStock() %>" required min="0"><br>
                    상세설명<textarea name="prodDetailCon" placeholder="상품상세설명" required><%=p.getProdDetailCon() %></textarea><br>
                    전성분<textarea name="prodComponent" placeholder="전성분"  required><%=p.getProdComponent() %></textarea><br>
                    상품이미지<input type="file" name="upfiles" id="prodImages" multiple><br>
                </div>
            </div>
            <input type="submit" value="수정">
        </form>
        