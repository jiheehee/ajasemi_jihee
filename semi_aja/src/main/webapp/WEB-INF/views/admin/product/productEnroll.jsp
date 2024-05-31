<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.List,com.aja.product.model.dto.Category,com.aja.product.model.dto.Keyword,com.aja.product.model.dto.ProdOption" %>
<%
	List<Category> categoryList= (List<Category>)request.getAttribute("categoryList");
	List<Keyword> keywordList = (List<Keyword>)request.getAttribute("keywordList");
	List<ProdOption> optionList = (List<ProdOption>)request.getAttribute("optionList");
%>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
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
        <form action="<%=request.getContextPath()%>/product/productenrollend.do" method="post" enctype="multipart/form-data">
            <div id="admin_middle_content">  <!-- 내용물 -->
                <div>
                    상품 카테고리
                     <%if(categoryList.size()>0){%>
                    <select id="prodCategory">
                    	<%for(Category c : categoryList){%>
                    <option value="<%=c.getCateKey() %>"><%=c.getCateName() %></option>
                   <% }%>
                  	 </select>
                   <% }%>
                   <br>
                   상품 키워드
                   <%if(keywordList.size()>0){ %>
                   <select id="prodKeyword">
                   		<%for(Keyword k : keywordList){ %>
					<option value="<%=k.getKeywordKey() %>"><%=k.getKeywordName() %></option>
					<% } %>                   
                   </select>
                   <% } %>
                   상품옵션
                   <%if(optionList.size()>0){ %>
                   <select id="prodOptionFlavor" >
                   		<%for(ProdOption o : optionList){ %>
					<option value="<%=o.getOptionFlavor() %>"class ="optionFlavor"><%=o.getOptionFlavor() %></option>
					<% } %>                   
                   </select>
                   <% } %>
                   
                     <%if(optionList.size()>0){ %>
                   <select id="prodOptionSize">
                   		<%for(ProdOption o : optionList){ %>
					<option value="<%=o.getOptionSize() %>" class="optionSize"><%=o.getOptionSize() %></option>
					<% } %>                   
                   </select>
                   <% } %>
                   <br>
                    상품이름<input type="text" id="prodName" placeholder="상품이름" required><br>
                    상품가격<input type="number" id="prodPrice" placeholder="상품가격" required min="0"><br>
                    상품설명<input type="text" id="prodContent" placeholder="상품설명" required><br>
                    재고<input type="number" id="prodStock" placeholder="재고" required min="0"><br>
                    상세설명<textarea id="prodDetailCon" placeholder="상품상세설명" required></textarea><br>
                    전성분<textarea id="prodComponent" placeholder="전성분" required></textarea><br>
                    상품이미지<input type="file" name="upfiles" id="prodImages" multiple><br>
                    <div id="preview"></div>
                </div>
            </div>
            <input type="button" value="등록" id ="productUpload">
        </form>
        
        
        
        <script>
        $(document).ready(function(){
        		const flavors = document.querySelectorAll("#prodOptionFlavor>option ");
        		const sizes = document.querySelectorAll("#prodOptionSize>option");
        		const usedSizes = new Set();
        		flavors.forEach(option =>{
        			const flavor = option.value;
        			console.log(flavor);
        			if(usedSizes.has(option.value)){
        				option.style.display = "none";
        			}else{
        				option.style.display = "block";
        			}
        			usedSizes.add(flavor);
        		});
        		sizes.forEach(option =>{
        			const size = option.value;
        			if(usedSizes.has(option.value)){
        				option.style.display = "none";
        			}else{
        				option.style.display = "block";
        			}
        			usedSizes.add(size);
        		});
        });
        
        	$("#prodImages").change(e=>{
        		$("#preview").empty();
        		$.each(e.target.files,(i,file)=>{
        			const fileReader = new FileReader();
        			fileReader.readAsDataURL(file);
        			fileReader.onload=(e)=>{
        				const path = e.target.result;
        				const img=$("<img>").attr({
        					src:path,
        					width:"200",
        					height:"200"
        				});
        				$("#preview").append(img);
        			}
        		})
        	});
        	$("#productUpload").click(e=> {
        	
        		
        		const formData = new FormData();
        		const files = $("#prodImages")[0].files;
   	    		for(let i=0;i<files.length;i++){
        			formData.append("upFile"+i,files[i]);
        		}
        	    formData.append("prodCategory", $("#prodCategory").val());
        	    formData.append("prodKeyword", $("#prodKeyword").val());
        	    formData.append("prodName", $("#prodName").val());
        	    formData.append("prodPrice", $("#prodPrice").val());
        	    formData.append("prodContent", $("#prodContent").val());
        	    formData.append("prodStock", $("#prodStock").val());
        	    formData.append("prodDetailCon", $("#prodDetailCon").val());
        	    formData.append("prodComponent", $("#prodComponent").val());
        	    formData.append("prodOptionFlavor",$("#prodOptionFlavor").val());
        	    formData.append("prodOptionSize",$("#prodOptionSize").val());
        		$.ajax({
        			url: '<%=request.getContextPath()%>/product/productenrollend.do',
        			type: 'post',
        			data: formData,
        			processData: false,
        			contentType: false,
        			success:data=>{
        				const responseData = JSON.parse(data);
        				if(responseData.result){
        					alert("업로드 성공");
        					
        				}else{
        					alert("업로드 실패");
        				}
        			},
        			complete:()=>{
        				$("#prodDetailCon").val("");
        				$("#prodComponent").val("");
        				$("#prodName").val("");
        				$("#prodPrice").val("");
        				$("#prodContent").val("");
        				$("#prodStock").val("");
        				$("#preview").empty();
        				$("#prodImages").val("");
        				
        			}
        		})
        		
        	});
        	
        	
        	
        	
        	
        </script>
        