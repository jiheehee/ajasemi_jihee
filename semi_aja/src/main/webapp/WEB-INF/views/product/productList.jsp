<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/WEB-INF/views/common/header.jsp"  %>
<%@ page import="java.util.List,com.aja.productprint.model.dto.Product" %>
<%
	List<Product> productlist = (List<Product>)request.getAttribute("productlist");
	int totalPage =	(int)request.getAttribute("totalPage");
%>



<style>
    body{
        margin: 0px;
        padding: 0px;
    }

    /* 카테고리 css */
    /* #category{
        height: 60px;
        width: 100%;
        background-color: white;
        position: fixed;
        top: 70px;
        display: flex;
        align-items: center;
    } */
    /* 상단 왼쪽 상품종류 */
    /* #category-header{
        margin-left: 10px;
        margin-right: 10px;
        align-content: center;
    } */

    /* 상단 상품상세?종류 */
    /* .category-content{
        align-content: center;
        background-color: lightgray;
        margin: 10px;
        border-radius: 18px;
        height: 60%;
        padding-left: 10px;
        padding-right: 10px;
    } */
    /* 상품 이름에 버튼 */
    /* .category-content-btn{
        border: 0;
        background-color: transparent;
        height: 100%;
        width: 100%;
        min-width: max-content;
    } */
    
    /* 상품리스트 전체 css */
    #product-wrap{
        display: grid;
        grid-template-columns: repeat(auto-fill,minmax(min(500px),1fr)); 
        grid-auto-rows: minmax(150px, auto);
        grid-gap: 5px;
        padding: 2px;
        /* margin:0 auto; */
        margin-top: 80px;
        margin-bottom: 100px;
    }

    /* 상품영역 css */
    .products{
        border: 1px solid black;
    }
    /* 전체영역 */
    #div-top{
        top: 0px;
    }
    /* header */
    #header{
        position: fixed;
        top: 0px; 
        background-color: white; 
        width: 100%;
    }
    /* 상품 이미지 (상단) */
    .product-img{
        width: 100%;
    }

    /* 상품 이름 등 (하단) */
    .product-msg{
        width: 100%;
        margin-top: 0px;
        display: flex;
    }

    /* 상품 하단 */
    .product-msg-name{
        margin-top: 0px;
        flex-grow: 10;
    }

    /* 상품 하단 a태그 폰트관리 */
    .product-msg-name>a{
        text-decoration-line: none;
    }

    /* 상품 하단 찜버튼영역 */
    .product-msg-wish{
        flex-grow: 1;
    }

    /* 상품 하단 찜버튼 */
    .product-msg-wish>button{
        border: 0;
        background-color: transparent;
        float: right;
        
    }
    /* 찜버튼 오른쪽으로 보내기 */
    .product-msg-option{
        float: right;
    }
    
    #loading{
    	 text-align: center;
    	 margin-bottom : 150px;
    	 font-size : 30px;
    	 display : none;
    }
    
    
</style>



<body>
    
    <main> <!-- 가장 큰 범위로 감싸기 -->
        <div id="div-top"> <!-- 가장 큰 범위로 감싸기 /아래 margin-bottom으로 footer랑 여유공간 -->
            <!-- <div id="category"> 상단바 느낌 화면을 내려도 고정되어 있어야함. position:fixed
                <div id="category-header">
                    <h2>handCream</h2>
                </div>
                <div class="category-content">
                    <button class="category-content-btn" onclick="categorybtn(event);" value="체인">체인 핸드</button>
                </div> 
                <div class="category-content">
                    <button class="category-content-btn" onclick="categorybtn(event);" value="튜브">튜브 핸드</button>
                </div> 
                <div class="category-content">
                    <button class="category-content-btn" onclick="categorybtn(event);" value="소독">손 소독제</button>
                </div> 
            </div> -->
            <div id="product-wrap"> <!-- wrap 일정범위 넘어가면 아래줄로 넘김 -->
            
            
            	<%for(Product p : productlist){ %>
            
                <div class="products"> <!-- aspect-ratio : 3/1 너비100 높이33.3 이거 안쓰고 grid씀 -->
                    <a href="<%=request.getContextPath()%>/product/productdetailprint.do?prodKey=<%=p.getProdKey()%>&cateKey=<%=p.getCateKey()%>">
                        <div class="product-img">
                            <img src="https://web-resource.tamburins.com/catalog/product/1504792781/62afe28f-a6b2-47c6-bda7-315030b79f24/Thumbnail_ChainHand_65ml_000.jpg"
                             alt="상품이미지" width="100%" height="100%">
                        </div>
                    </a>
                    <div class="product-msg">
                        <div class="product-msg-name">
                            <a href="<%=request.getContextPath()%>/product/productdetailprint.do?prodKey=<%=p.getProdKey()%>&cateKey=<%=p.getCateKey()%>">	
                                <div>								<!-- 눌렀을때 구분할수 있는 값도 같이 보내기 PROD_KEY -->
                                    <p><%=p.getProdName()%></p>
                                    <p><%=p.getKeywordName()%></p>
                                </div>
                                <div>
                                    <span><%=p.getProdPrice()%></span>
                                    <span class="product-msg-option"><%=p.getOptionFlavor() %></span>
                                </div>
                            </a>
                        </div>
                        <div class="product-msg-wish">
                            <button type="button"  onclick="dee(event);">
                                <img src="https://i.pinimg.com/236x/ce/28/d0/ce28d041490341165bd143bb07944e75.jpg"
                                    alt="찜버튼" width="30px" height="30px" >
                            </button>
                        </div>
                    </div>
                </div> <!-- priducts 닫힘 div -->
                
                <%} %> <!-- for문 끝남 --> 
            </div>	<!-- product 담고있는 div 끝 -->
            
            <div id="loading">Loading...</div>
            
        </div>
        	
        
    </main>
</body>


<script>

	/* console.log(document.getElementById("product-wrap").innerHTML); */
	/* console.log(document.getElementsByClassName("products")[0]); */
	/* console.log($("#product-wrap>.products").clone()); */
	var copydiv = "<div class='products'>"+document.getElementById("product-wrap").innerHTML+"</div>";


	$(document).ready(function() {
		var cPage = 1; //현재페이지
		var loading = false;
		
			
		function getList(cPage) {
			if(<%=totalPage%>>cPage){
				$("#loading").show();
			}
			$.ajax({
				type: "get",
				url : "<%=request.getContextPath()%>/product/productlistprint.do?cateKey=<%=productlist.get(0).getCateKey()%>",
				data : { cPage : cPage}, //여기 data 서블릿으로 넘겨줘서 그 값을 처리해서 아래 success의 data에 담겨져있음
						 //},	"order" : "view_cnt"
				dataType : "html",
				beforeSend: function() {
					
                	loading = true;
            	},
				success:function(data){
					/* consloe.log(data) */
					if(cPage>1){
						var e = $(data).find(".products");
						/* console.log(e); */
						$("#product-wrap").append(e);
						/* console.log(cPage); */
						$("#loading").hide();
					}
					loading = false;						
				},
				error: function() {
					$("#loading").hide();
	                loading = false;
	            }
			});
		}
		
		
		$(window).scroll(function(){
			var scrollTop = $(window).scrollTop(); // 위로 스크롤된 길이
			var windowsHeight = $(window).height(); //웹브라우저의 창의 높이
			var documentHeight = $(document).height(); // 문서 전체의 높이
			var isBottom = scrollTop + windowsHeight +10 >= documentHeight;  // 조건 
			
			if(isBottom){
				//만일 마지막 페이지라면
				if(!loading){
					cPage++; //현재페이지 1증가
					getList(cPage); //추가로 받을 리스트 ajax처리				
				}
			}
		});
		getList(cPage);
	});

		
	
	
   /*  const dee=(e)=>{
        console.log(e.target);
    }

    const categorybtn=(e)=>{
        console.log(e.target.value);
    } */
    
    
	
	
</script>




<%@ include file = "/WEB-INF/views/common/footer.jsp" %>







