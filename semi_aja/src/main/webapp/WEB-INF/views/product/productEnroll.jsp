<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,com.aja.product.model.dto.Category,com.aja.product.model.dto.Keyword" %>
<%
	List<Category> categoryList= (List<Category>)request.getAttribute("categoryList");
	List<Keyword> keywordList = (List<Keyword>)request.getAttribute("keywordList");
%>
        <form action="<%=request.getContextPath()%>/product/productenrollend.do" method="post" enctype="multipart/form-data">
            <div id="admin_middle_content">  <!-- 내용물 -->
                <div>
                    상품 카테고리
                     <%if(categoryList.size()>0){%>
                    <select name="prodCategory">
                    	<%for(Category c : categoryList){%>
                    <option value="<%=c.getCateKey() %>"><%=c.getCateName() %></option>
                   <% }%>
                  	 </select>
                   <% }%>
                   <br>
                   상품 키워드
                   <%if(keywordList.size()>0){ %>
                   <select name="prodKeyword">
                   		<%for(Keyword k : keywordList){ %>
					<option value="<%=k.getKeywordKey() %>"><%=k.getKeywordName() %></option>
					<% } %>                   
                   </select>
                   <% } %>
                   <br>
                    상품이름<input type="text" name="prodName" placeholder="상품이름" required><br>
                    상품가격<input type="number" name="prodPrice" placeholder="상품가격" required min="0"><br>
                    상품설명<input type="text" name="prodContent" placeholder="상품설명" required><br>
                    재고<input type="number" name="prodStock" placeholder="재고" required min="0"><br>
                    상세설명<textarea name="prodDetailCon" placeholder="상품상세설명" required></textarea><br>
                    전성분<textarea name="prodComponent" placeholder="전성분" required></textarea><br>
                    상품이미지<input type="file" name="upfiles" id="prodImages" multiple><br>
                </div>
            </div>
            <input type="submit" value="등록">
        </form>
        