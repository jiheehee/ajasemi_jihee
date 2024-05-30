<%@page import="com.aja.productprint.model.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/WEB-INF/views/common/header.jsp"  %>

<%@	page import="java.text.DecimalFormat"%>
<%@ page import="java.util.List,com.aja.productprint.model.dto.Product" %>
<%@ page import="java.util.HashSet,java.util.Set" %>



<%
	List<Product> productlist = (List<Product>)request.getAttribute("productlist");
	Product product = (Product)request.getAttribute("product");	
	int wishNumber = (int)request.getAttribute("wishNumber");
	List<Integer> reviewQnaCount = (List<Integer>)request.getAttribute("reviewQnaCount");
	//reviewQnaCount [0]=review   [1]=qna
	Set<String> nameFilter = new HashSet<>();

	
	DecimalFormat df = new DecimalFormat("###,###"); //숫자 ,표시
	int price = product.getProdPrice()+product.getOptionPrice();		//사용하고 싶은거 골라서 넣으삼
%>



<style>
    body{
        margin: 0px;
        padding: 0px;
    }

    #product-main{
        display: flex;
        width: 100%;
    }
    
    #product-main-img-div{
        flex-grow: 1;
        max-width: 50%;
        min-width: 200px;
    }

    #product-main-content{
        flex-grow: 1;
        min-height: min-content;
        overflow: none;
        margin-bottom: 150px;
    }

    #product-footer-move{
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        height: 70px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #product-footer-move *{
        text-decoration-line: none;
        padding-left: 0.5%;
    }
    
    #product-footer-move>p{
    	margin-bottom: 0;
    }

    #product-main-content-div{
        margin: 0% 20% 0px 20%;
        padding-top: 12%;
        display: flex;
        flex-direction: column;
        position: sticky;
        overflow: auto;
        min-height: 200px;
        top: 0px;
    }

    #product-main-content-list{
    	/* border : 1px solid red; */
        /* display: flex;
        flex-direction : column; */
       	overflow-y : scroll;
       	overflow-x : hidden;
        transform: rotate(-90deg);
        width : 200px;
        height: 500px;
       
       /*  margin-left: 150px;
        margin-top:-180px;
        margin-bottom:-180px; */
        
        margin: -180px 200px -180px 150px;
    }
    
    #product-main-content-list::-webkit-scrollbar{
		display:none;
	}

    .product-main-content-productlist{
    	/* border : 1px solid red;  */
        height: 42%;
        width: 70%;
        text-align: center;
        transform : rotate(90deg);
        margin: -70px 10px -60px 25px ;
        padding: 40px 0px 0px 30px ;
    }
    
    /* 관련 상품에 마우스 올렸을떄 효과 */
    .product-main-content-productlist>button:hover{
    	transform : scale(1.1);
    	transition : transform 0.5s;
    }

    /* .product-main-content-productlist>p{
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    } */

    .product-main-content-listbtn{
        border: 0;
        background-color: transparent; 
        max-width: 100px;
        cursor: pointer;
    }

    .product-main-content-listbtn>img{
        border-radius: 5%;
    }

    #product-main-content-menu{
        display: flex;
        margin-top: 30px;
    }

    #product-main-content-menu>div:first-child{
        flex-grow: 8;
    }

    /* 옵션 사이즈div안 p태그 */
    #product-main-content-menu>div:first-child>p{
        margin: 0;
    }
    
    #product-main-content-menu-quantity{
        flex-grow: 1;
        display: flex;
        align-items: center;
        min-width: max-content;
        margin-top: 10px;
    }

    #product-main-content-menu-quantity *{
        padding: 0;
    }

    #product-main-content-menu-quantity>p{
        margin: 0; 
        margin-right: 10px;
    }

    /* 수량 div안에 button -  + */
    #product-main-content-menu-quantity>div>button{
        border: 0;
        background-color: transparent;
        font-size: 20px;
    }
   
    #product-main-content-menu-quantity>div>input{
        width: 30px;
    }

    input::-webkit-outer-spin-button, input::-webkit-inner-spin-button{
        -webkit-appearance: none;
        margin: 0;
    }


    #product-main-content-option{
        flex-grow: 7;
        display: flex;
        flex-wrap: nowrap;
    }

    #product-main-content-option>button{
        border: 0.5px solid lightgray;
        border-radius: 18px;
        height: 35px;
        width: 60px;
        padding-left: 20px;
        padding-right: 20px;
        margin-right: 10px;
        min-width: max-content;
        align-items: center;
        background-color: white;
        cursor: pointer;
    }
    
    #product-main-content-buy{
        display: flex;
        margin-top: 30px;
    }

    #product-main-content-buy>button{
        cursor: pointer;
        border-radius: 5%;
    }

    #product-main-content-buy>button:not(:last-child){
        width: 43%;
        height: 40px;
        background-color: black;
        color: white;
        min-width: max-content;
    }
    #product-main-content-buy>button:not(:last-child){
        margin-right: 2%;
    }

    #product-main-content-buy>button:last-child{
        border: 0;
        background-color: transparent;
    }
    
    #product-footer-category{
        list-style-type: none;
        display: flex;
        justify-content: space-between;
        margin: 20px 20% 20px 20%;
    }
    
    #product-footer-category>li{
        width: 28%;
        height: 50px;
        font-size: 30px;
        min-width: 200px;
        cursor: pointer;
        display: flex;
        justify-content: center;
    }
    
    #product-footer-category>li:hover{
        border-bottom: 1px solid black;
    }

    #product-footer-main{
        margin: 0 15% 400px 15%;
    }

    /* 제품 상세보기 */
    #product-footer-main-one{
        display: none;
    }

    /* 리뷰 */
    #product-footer-main-two{
        display: none;
    }

    /* Q&A */
    #product-footer-main-three{
        display: none;
    }

    /* 리뷰 별 만들기 */
    .star-ratings, .star-ratings-list{
        color: #aaa9a9; 
        position: relative;
        unicode-bidi: bidi-override;
        width: max-content;
        -webkit-text-fill-color: transparent;
        -webkit-text-stroke-width: 1.3px;
        -webkit-text-stroke-color: #2b2a29;
        
    }
    
    .star-ratings{
    	font-size: 26px;
    }
    
    .star-ratings-list{
    	font-size: 18px;    	
    }

    .star-ratings-fill, .star-ratings-fill-list{
        color: #fff58c;
        padding: 0;
        position: absolute;
        z-index: 1;
        display: flex;
        top: 0;
        left: 0;
        overflow: hidden;
        -webkit-text-fill-color: gold;
        margin-right: 20px;
    }
    /* 별 끝 */

    #product-footer-main-two-header{
        display: flex;
    }

    #product-footer-main-two-header>h3{
        margin:0;
        margin-right: 10px;
    }

    /* 리뷰 ul */
    #product-footer-main-two-reviewlist{
        list-style: none;
        margin: 0;
        padding: 0;
        /* background-color : red; */
    }

    /* 별점 게시자 날짜 정렬 */
    .product-footer-main-two-reviewlist-div{
        display: flex;
    }

    /* 게시자선택 날짜 오른쪽으로 보내기 */
    .product-footer-main-two-reviewlist-div>div:nth-child(2){
        flex-grow: 100;
    }
    /* 날짜 선택 */
    .product-footer-main-two-reviewlist-div>div:last-child{
        flex-grow: 1;
    }

    /* 리뷰리스트 별 */
    .star-ratings-list{
        margin-right: 10px;
    }

    /* Q&A 헤더부분 */
    #product-footer-main-three-header{
        display: flex;
        justify-content: flex-start;
    }

    /* Q&A 헤더 왼쪽 div */
    #product-footer-main-three-header>div{   
        display: flex;
        align-items: center;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    #product-footer-main-three-header>div>h3{
        margin: 0;
    }

    #product-footer-main-three-header>div:last-child{
        margin-left: auto;
        display: flex;
    }

    #product-footer-main-three-header-category{
        list-style-type: none;
        display: flex;
        height: 90%;
    }

    #product-footer-main-three-header-category>li>button  {
        height: 100%;
        cursor: pointer;
        border: 0;
        background-color: transparent;
        text-overflow: ellipsis;
        white-space: nowrap;
    }


	#product-footer-main-three-header>div>button {
		background-color : #9bce26;
		color : white;
		border : 0; 
		border-radius: 10px;
		padding : 5px 10px 5px 10px;
		font-size: 20px;
	}
    /* Q&A 작성버튼  */
    #product-footer-main-three-header>div:last-child>button{
        margin-left: 20px;
    }

    /* Q&A 띄워주는 공간 ul */
    #product-footer-main-three-content-list{
        list-style-type: none;
        padding: 0;
        height: 55px;
    }

    #product-footer-main-three-content-list>li>div{
        display: flex;
        align-items: center;
        padding: 0;
    }

   

    /* Q&A span 선택자 */
    #product-footer-main-three-content-list>li>div>span:nth-of-type(1){
        /* background-color:  #9bce26; */
        border-radius: 50px;
        color: white;
        padding: 5px 10px 5px 10px;
    }

    /* [문의종류] */
    #product-footer-main-three-content-list>li>div>span:nth-of-type(2){
        color: lightslategray;
    }
    
    #product-footer-main-three-content-list>li>div>span:nth-of-type(3){
        flex-grow: 1;
    }

    #product-footer-main-three-content-list>li>div:first-child *{
        margin: 0 10px 0 10px;
        overflow: hidden; 
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    /* Q&A 답변 박스 */
    .product-footer-main-three-qnacontainer{
        display: flex;
        flex-direction: column; 
        
    }

    .product-footer-main-three-qnacontainer>div{
        display: flex;
        width: 100%;
        
    }

    /* Q A */
    .product-footer-main-three-qnacontainer>div>p:nth-of-type(1){
        font-size: 30px;
        padding: 20px 5% 20px 5%;
        width: 0;
        justify-content: flex-start;
        margin: 0;
    }

    /* 문의내용 문의답변 */
    .product-footer-main-three-qnacontainer>div>p:nth-of-type(2){
        padding: 25px 10% 25px 7%;
        margin: 0;
    }

    #product-footer-main-three-content-list>li>div:nth-of-type(2){
        display: none;
        background-color: #fafafab0;
    }
    
    #product-main-content-div::-webkit-scrollbar{
    	display:none;
    }
    
   
   
   
   
   
    /* 모달 전체 창 */
      .modal-buy{
          display: none; /* 기본적으로 안 보이게 설정  */
          position: fixed; /* 화면에 고정 */
          z-index: 1; /* 다른 요소들보다 위에 위치 */
          left: 0;
          top: 0;
          width: 100%;
          height: 100%;
          overflow: hidden; /* 스크롤 가능하게 설정 */
          background-color: rgba(0, 0, 0, 0.2); /* 반투명 배경 */
      }
      /* 모달 메세지 창 */
      .modal-buy>div{
          background-color: #fefefe;
          margin: 15% auto; /* 중앙 정렬 */
          border: 1px solid #888;
          width: 300px; /* 모달 너비 */
          border-radius: 10px;
      }

      .modal-buy>div>div:nth-of-type(1){
          height: 30px;
      }
      /* X */
      .modal-buy>div>div:nth-of-type(1)>p:nth-of-type(1){
          float: right;
          margin: 0 ;
          padding: 0 20px 0 0;
          font-size: 40px;
          height: 100%;
          color: #aaa;;
      }
      /* X 효과 */
      .modal-buy>div>div:nth-of-type(1)>p:nth-of-type(1):hover, .modal-buy>div>div:nth-of-type(1)>p:nth-of-type(1):focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
      }
      /* 중간 div */
      .modal-buy>div>div:nth-of-type(2){
          display: flex;
          flex-direction: column;
          align-items: center;
      }
      /* 중간에 이미지 */
      .modal-buy>div>div:nth-of-type(2)>div>img{
          margin : 0 0 0 60px;
      }
      /* 중간에 p태그 */
      .modal-buy>div>div:nth-of-type(2)>div>p{
          margin: 10px 0 10px 0;
      }
      /* 버튼 태그있는 div영역 */
      .modal-buy>div>div:nth-of-type(3){
          display: flex;
          height: 40px;
          width: 100%;
          padding: 0 7% 0 7%;
          margin-bottom :10px;
          
      }
      /* 버튼 감싸고있는 a태그 */
      .modal-buy>div>div:nth-of-type(3)>a{
          height: 100%;
      }
      /* 버튼 속성 */
      .modal-buy>div>div:nth-of-type(3)>a>button{
          height: 100%;
          border: 1px solid black;
          border-radius: 5px;
          cursor: pointer;
          
      }
      
      /* 계속쇼핑하기 버튼 */
      .modal-buy>div>div:nth-of-type(3)>a:nth-of-type(1)>button{
          background-color: black;
          color: white;
          margin: 0 5px 0 0 ;
      }
      /* 장바구니 보기 버튼 */
      .modal-buy>div>div:nth-of-type(3)>a:nth-of-type(2)>button{
          background-color: white;
          color: black;
          margin: 0 0 0 5px ;
      }
   
   
   
   
    
</style>    
   
   
<body>
    <main>
        <div id="product-main">    <!-- 상품사진, 상품 정보 -->
            <div id="product-main-img-div"> <!-- 상품사진 -->
            	
            	
            	<%if(product.getProdImage1()!=null){%>
            			<div class="product-main-img">
                        <img src="<%=request.getContextPath()%>/upload/product/<%=product.getProdImage1()%>"
                         alt="상품" width="100%">
                    </div>
            		<%} %>
            		
            		
            		<% if(product.getProdImage2()!=null){%>
            			<div class="product-main-img">
                    <img src="<%=request.getContextPath()%>/upload/product/<%=product.getProdImage2()%>"
                     alt="상품" width="100%">
                </div>
            		<%} %>
            		
            		
            		<% if(product.getProdImage3()!=null){%>
            			<div class="product-main-img">
                    <img src="<%=request.getContextPath()%>/upload/product/<%=product.getProdImage3()%>"
                     alt="상품" width="100%">
                </div>
            		<% }%>
            		
            		
            		<% if(product.getProdImage4()!=null){%>
            			<div class="product-main-img">
                    <img src="<%=request.getContextPath()%>/upload/product/<%=product.getProdImage4()%>"
                     alt="상품" width="100%">
                </div>
            		<% }%>
            		
            		
            		<% if(product.getProdImage5()!=null){%>
            			<div class="product-main-img">
                    <img src="<%=request.getContextPath()%>/upload/product/<%=product.getProdImage5()%>"
                     alt="상품" width="100%">
                </div>
            		<%}%>
            		
                
                
                
                
            </div> <!-- 상품사진 닫 -->

            <div id="product-main-content"> <!-- 상품 정보 -->
                <div id="product-main-content-div">
                    <div>  <!-- 상품 정보 -->
                        <div>
                            <h3><%=product.getProdName()%></h3>
                            <p>₩ <%=df.format(price)%></p>
                            <p><%=product.getOptionFlavor()%> | <%=product.getKeywordName()%></p>
                            <%-- <p><%=product.getKeywordName()%></p> --%>
                        </div>
                        <p><%=product.getProdContent()%></p>
                    </div>
					<!-- <p>관련 상품</p> -->
                    <div id="product-main-content-list">  <!-- 관련상품 출력 / list받아오면 처리 카테고리같은애들 다 띄우기 -->
                        <%for(Product p : productlist){ 
                        	if(! product.getProdName().equals(p.getProdName())){ 
                        		 if(! nameFilter.contains(p.getProdName())){%>
			                        <div class="product-main-content-productlist">
			                            <input type="text" value="prodKey=<%=p.getProdKey()%>&cateKey=<%=p.getCateKey()%>&prodName=<%=p.getProdName()%>" hidden> 
			                            <button class="product-main-content-listbtn" onclick="relproduct(event);"> 
			                                <img src="<%=request.getContextPath()%>/upload/product/<%=p.getProdImage1()%>"
			                                alt="상품" width="100%">
			                            	<p><%=p.getProdName()%></p>
			                            </button>
			                        </div>
			                        <p hidden><%=nameFilter.add(p.getProdName()) %></p>	<!-- 등록된 상품을 Set에 저장시켜 다시 출력안되게 만듦 -->
	                        	<%}
                        	} 
                        }%>
                    </div>  <!-- 관련상품 닫 -->
                    
                    
                    <br>
                    <hr style="width: 95%;">    
	
                    <div>  <!-- 옵션 -->
                        <div id="product-main-content-menu">
                            <div>
                                <p>사이즈</p>
                                <div id="product-main-content-option">
                                	  <!-- list받아오면 처리/ 상품이름이 같은애 기준? -->
                                	  <%for(Product p : productlist){
                                	  		if(product.getProdName().equals(p.getProdName())){ %>
                                	  			<input type="text" value="prodKey=<%=p.getProdKey()%>&cateKey=<%=p.getCateKey()%>&prodName=<%=p.getProdName()%>" hidden> 
                                	  			<button onclick="relproduct(event);"
	                                	  			<%if(product.getProdKey()==p.getProdKey()){ %>
		                                	  				style="border: 2px solid black;"
		                                	  			<%} %>>
		                                	  		<%=p.getOptionSize()%>mL
                                	  			</button>
                                	  	<%}
                                	  }%>
                                </div>  
                            </div>
                            <div id="product-main-content-menu-quantity">
                                <p>수량</p>
                                <div>
                                    <button onclick="plusnum();">-</button>
                                    <input type="number" min="1" max=<%=product.getProdStock()%> value="1"> <!-- max 재고량 -->
                                    <button onclick="minusnum();">+</button>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div id="product-main-content-buy"> <!-- 로그인 안헀을때 alert창 띄워주기 -->
                                <button id="addCart">장바구니</button>	<!-- 장바구니로 정보넘김 -->
                                <button id="buyNow">바로 구매하기</button>	<!-- 결제페이지한테 정보넘김  // 상품고유번호, 수량만 보내기-->
                                <button type="button"  onclick="wishadd(event);">
                                <!-- 
                                	로그인한 회원만 찜가능
                                	비 로그인상태로 누르면 로그인화면으로 이동
                                	찜 전,후 다른 UI띄움
                                	찜한 상태에서 찜버튼을 누르면 찜 취소기능
                                -->
                                <% 
								    String imgSrc = "https://i.pinimg.com/236x/d1/b1/14/d1b11450ff68b1400487a63e8dc78702.jpg"; // 기본 이미지 URL
								    if (loginMember != null) {
							            if (wishNumber > 0) {
							            	imgSrc = "https://i.pinimg.com/236x/3b/d1/b3/3bd1b3a93f9bb1857ef51a67b9d6d90c.jpg";
							            } else {
							            	imgSrc = "https://i.pinimg.com/236x/d1/b1/14/d1b11450ff68b1400487a63e8dc78702.jpg";
							        	}
								    }
								%>
                                <img src= "<%=imgSrc%>" 
                                        alt="찜버튼" width="30px" height="30px" >
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="product-footer-move"> <!-- 상품footer / 누르면 바로가기 -->
            <a href="<%=request.getContextPath()%>">Home</a>
            <p>/</p>
            <a href="<%=request.getContextPath()%>/product/productlistprint.do?cateKey=<%=product.getCateKey()%>">
            	<%=product.getCateName()%>
            </a>
            <p>/</p>
            <a href="#"><%=product.getProdName()%></a>
        </div>

        <ul id="product-footer-category">
            <li>제품 상세정보</li>
            <li>리뷰 (<%=reviewQnaCount.get(0)%>)</li>
            <li>Q&A (<%=reviewQnaCount.get(1)%>)</li>
        </ul>
        <hr width="100%">
        <div id="product-footer-main">   <!-- 아래 공간 -->
            <div id="product-footer-main-one">   <!-- 제품설명 -->
                <h3>제품 상세정보</h3>  
                <br>
                <p>
                    <%=product.getProdDetailCon()%>
                </p>
                <br>
                <h3>전성분</h3>
                <p>
                    <%=product.getProdComponent()%>
                </p>
                <br>
                <h3>사용방법</h3>
                <p>
                    손을 씻고 물기가 완전히 마르기 전, 손에 적당량을 덜어 발라줍니다. 움직임이 많고 피부가 얇은 부위인 손목에도 
                    핸드크림을 발라 마사지해 주는 것이 좋습니다.
                </p>
                <br>
                <h3>사용할 때의 주의사항</h3>
                <p>
                    1.화장품 사용시 또는 사용후 직사광선에 의하여 사용부위가 붉은반점, 부어오름, 가려움증 등의 이상 증상이나 부작용이 
                    있는 경우 전문의와 상담할 것 <br>
                    2.상처가 있는 부위 등에는 사용을 자제할 것.	<br><br>
                    보관 및 취급시의 주의사항 <br>
                    1)어린이의 손에 닿지 않는 곳에 보관할 것 <br>
                    2)직사광선을 피해서 보관할 것 <br>
                    *본 제품은 공정거래위원회 고시 소비자 분쟁 해결 기준에 의거교환 또는 보상 받을 수 있습니다.
                </p>
                <br>
                <h3>사용기한</h3>
                <p>
                    사용기한 36개월(상품 발송일 기준으로 사용기한이 12개월 이상 남은 상품만을 판매합니다.)
                </p>
                <br>
                <h3>제조업자</h3>
                <p>
                    코스맥스(주)
                </p>
                <hr width="100%">
            </div>  <!-- 제품설명 닫 -->



            <div id="product-footer-main-two">   <!-- 리뷰 / 리뷰가 없으면 등록된 리뷰가 없습니다. 띄우기  -->
                
            </div>  <!-- 리뷰 닫힘 -->




            <div id="product-footer-main-three">   <!-- Q&A / Q&A가 없으면 등록된 Q&A가 없습니다. 띄우기 -->
                
            </div>  <!-- Q&A 닫힘 -->
				
				
				
				
				
        </div>  <!-- 아래공간 닫 -->
        
        
        <!-- 모달 HTML -->
		<div class="modal-buy"> <!-- 배경 -->
	        <div >  <!-- 가장 큰범위 div -->
	            <div>   <!-- 가장 위부분 x -->
	                <p class="modal-close">&times;</p>
	            </div>
	
	            <div>   <!-- 중간부분 -->
	                <div>
	                    <img src="https://i.pinimg.com/236x/7c/7e/0f/7c7e0f0c00f30b5462e86f7b43ef48d0.jpg" 
	                    	alt="장바구니" width="60px" height="60px">
	                    
	                    <p></p>
	                </div>
	            </div>
	
	            <div>   <!-- 하단부 버튼 -->
	                <a href="#">
	                    <button>
	                        계속 쇼핑하기
	                    </button>
	                </a>
	                <a href="<%=request.getContextPath()%>/member/cartview.do">	<!-- 장바구니 서블릿 주소 -->
	                    <button>
	                        장바구니 보기
	                    </button>
	                </a>
	            </div>
	        </div>
	    </div>
        
		
		
    </main>
</body>    
    
  
  
<script>

	//모달창	  
	//모달 닫기 버튼
     document.getElementsByClassName("modal-close")[0].addEventListener("click",e=>{
  	   document.getElementsByClassName("modal-buy")[0].style.display="none";
     });
       
	//모달 계속쇼핑하기 버튼
     document.querySelector(".modal-buy>div>div:nth-of-type(3)>a:nth-of-type(1)>button").addEventListener("click",e=>{
    	 document.getElementsByClassName("modal-buy")[0].style.display="none";
     });
    



	//구매기능	id buyNow  결제페이지로 이동 ->	상품고유번호, 수량 넘기기
	<% if(loginMember !=null){%>
			if(document.querySelector("#product-main-content-menu-quantity>div>input").value>0){
		  		document.querySelector("#buyNow").addEventListener("click",e=>{
					const productCount = document.querySelector("#product-main-content-menu-quantity>div>input").value;
					//결제 서블릿으로 상품고유번호, 수량 넘겨주기
					window.location.href = "<%=request.getContextPath()%>/pay//* 바로결제서블릿주소 */?prodKey=<%=product.getProdKey()%>"
						+"&productCount="+productCount;
			  	});
			}
		<%}else{%>
			document.querySelector("#buyNow").addEventListener("click",e=>{
				alert("로그인 후 이용 가능합니다.");
				window.location.href = "<%=request.getContextPath()%>/member/login.do";
		  	}); 
			
		<%}%>



	//찜 기능
	<% if(loginMember !=null){%>
	const wishadd=(e)=>{
		$.ajax({
			type: "get",
			url : "<%=request.getContextPath()%>/product/productwishadd.do",
			data : {prodKey : <%=product.getProdKey()%>}, //여기 data 서블릿으로 넘겨줘서 그 값을 처리해서 아래 success의 data에 담겨져있음
			dataType : "html",
			beforeSend: function() {
	    	},
			success:function(data){
				location.reload();
				
			},
		});
		
	}	//찜 닫
	<%}else{%>
		const wishadd=()=>{
			alert("로그인 후 이용 가능합니다.");
			window.location.href = "<%=request.getContextPath()%>/member/login.do";
		}
	<%}%>



	
	//장바구니 버튼	//key:value로 뭐뭐넘길지 생각하기	//회원고유번호, 상품고유번호, 옵션고유번호, 수량 넘겨받아서 DB에 저장하고 장바구니 페이지로 패이지전환
		<% if(loginMember !=null){%>
			if(document.querySelector("#product-main-content-menu-quantity>div>input").value>0){
		  		document.querySelector("#addCart").addEventListener("click",e=>{
					const productCount = document.querySelector("#product-main-content-menu-quantity>div>input").value;
					
					//장바구니 서블릿으로 필요한 값 넘겨주기
					 $.ajax({
						type: "get",
						url : "<%=request.getContextPath()%>/product/productcartadd.do?prodKey=<%=product.getProdKey()%>"
							+"&optionKey=<%=product.getOptionKey()%>&productCount="+productCount
							,
						data : { }, 
						beforeSend: function() {
				    	},
						success:function(data){
							////ajax 로 result 값 넘겨주기 setAttribute로 넘겨주고 get으로 받아서 그걸 이용해 모달창 띄우기
							//console.log(data);
							var	modalMsg = "";
							modalMsg = "장바구니에 추가되었습니다.";
							if(data > 0){
								//console.log("data : " + data);
								//console.log("if문 true")
								//	장바구니 이미 있을때
								modalMsg = "장바구니에 이미 있습니다."; 
							}
							//console.log("modalMsg");
							//모달창 열기
							document.querySelector(".modal-buy>div>div:nth-of-type(2)>div>p").innerText = modalMsg;
							document.getElementsByClassName("modal-buy")[0].style.display="block";

							//	모달창 .style.display="block";
							//	모달창안에 버튼 두개 장바구니로이동, 계속쇼핑하기 만들어서 a태그로 어디로 넘길지 정하기
						}
					}); //ajax닫힘
			  	}); 					
			}
		<%}else{%>
			document.querySelector("#addCart").addEventListener("click",e=>{
				alert("로그인 후 이용 가능합니다.");
				window.location.href = "<%=request.getContextPath()%>/member/login.do";
		  	}); 
			
		<%}%>


	//관련상품 페이지 변경 // 사이즈 눌렀을때 페이지 변경
	const relproduct=(e)=>{
		window.location.href = "<%=request.getContextPath()%>/product/productdetailprint.do?"+e.currentTarget.previousElementSibling.value
	}
	

    const one = document.getElementById("product-footer-main-one");
    const two = document.getElementById("product-footer-main-two");
    const three = document.getElementById("product-footer-main-three");

    // 제품 상세정보 띄우기
    document.querySelector("#product-footer-category>li:nth-of-type(1)").addEventListener("click",e=>{
        one.style.display = "block";
        two.style.display = "none";
        three.style.display = "none";
    });
    
    
    
    // 리뷰 띄우기
    document.querySelector("#product-footer-category>li:nth-of-type(2)").addEventListener("click",e=>{
        one.style.display = "none";
        two.style.display = "block";
        three.style.display = "none";
        //리뷰 버튼을 누르면 PROD_NAME를 이용해서 알 맞는 리뷰를 리스트형태로 가져오고 innerHTML해서 넣기..?   append?
		$.ajax({
			type: "get",
			url : "<%=request.getContextPath()%>/product/productreviewprint.do",
			data : {prodName : "<%=product.getProdName()%>"}, 
			dataType : "html",
			success:function(data){
				//console.log("get방식");
				//console.log(data);
				//리뷰 jsp 가져오기
				document.querySelector("#product-footer-main-two").innerHTML = data;
				let totalstar = 0;
				//리뷰 별점 표시
				for(let i=0;i<<%=reviewQnaCount.get(0)%>;i++ ){
					let starwidth = (document.querySelectorAll("#product-footer-main-two-reviewlist>li>p")[i].innerText * 20)+1;
					document.getElementsByClassName("star-ratings-fill-list")[i].style.width = starwidth+"%";
					totalstar += Number(document.querySelectorAll("#product-footer-main-two-reviewlist>li>p")[i].innerText) ;
					//console.log(totalstar);
				}
				//console.log(totalstar);
			    //전체 별점의 평균값 출력
			    const totalstaravg = totalstar/<%=reviewQnaCount.get(0)%>;
			    //console.log(totalstaravg);
			    const totalstarwidth = (totalstaravg * 20)+1;   //4자리에 별점 가져와서 대입하기
			    document.getElementsByClassName("star-ratings-fill")[0].style.width = totalstarwidth+"%";
			}
		});
    });
    
    
    
    
    // Q&A 띄우기
    document.querySelector("#product-footer-category>li:nth-of-type(3)").addEventListener("click",e=>{
        one.style.display = "none";
        two.style.display = "none";
        three.style.display = "block";
        
        $.ajax({
			type: "get",
			url : "<%=request.getContextPath()%>/product/productqnaprint.do",
			data : {prodName : "<%=product.getProdName()%>"}, 
			dataType : "html",
			success:function(data){
				
				//console.log(data);
				//QNA jsp 가져오기
				document.querySelector("#product-footer-main-three").innerHTML = data;
				
				//Q&A ^0^
			    let $qna = document.querySelectorAll("#product-footer-main-three-content-list>li>div:nth-of-type(1)");
			    let $qnacontainer = document.querySelectorAll("#product-footer-main-three-content-list>li>div:nth-of-type(2)");
			    $qna.forEach((e)=>{
			        e.addEventListener("click",(e)=>{
			            	let number = 0;
			            	if(e.currentTarget.parentElement.lastElementChild.style.display === "flex"){
			            		number = 1;
			            	}
			            $qnacontainer.forEach((q)=>{
			                q.style.display="none";
			            })
			                //flex를 한번 더 눌렀을때 none으로 숨겨 주기
			                if(number > 0){
				                e.currentTarget.parentElement.lastElementChild.style.display = "none";			                	
			                }else{
			                	e.currentTarget.parentElement.lastElementChild.style.display = "flex";		
			                }
			        })
			    });
			    //qna작성 버튼
				document.getElementById("qnawrite").addEventListener("click",e=>{
					//console.log(e.target);
					alert("개발 중 입니다.");
					<%-- window.location.href = "<%=request.getContextPath()%>"; --%>
				});
			}
		});	//ajax 닫
        
    });
    //	value 이용해서 화면에 출력되는 값 변경하기
    /* const qnabutton=(e)=>{
		console.log(e.target.value);
	} */


    
    

    //수량 + 버튼
    const plusnum=()=>{
        if(document.querySelector("#product-main-content-menu-quantity>div>input").value > 1){
            const num = document.querySelector("#product-main-content-menu-quantity>div>input").value;
            document.querySelector("#product-main-content-menu-quantity>div>input").value = Number(num)-1;
        }else{
            alert("1개 단위로 구매 가능한 상품입니다. 수량을 다시 선택해주세요.")
        }
    };
    
    // 수량 - 버튼
    const minusnum=()=>{
        if(document.querySelector("#product-main-content-menu-quantity>div>input").value < <%=product.getProdStock()%>){
            const num = document.querySelector("#product-main-content-menu-quantity>div>input").value;
            document.querySelector("#product-main-content-menu-quantity>div>input").value = Number(num)+1;
        }else{
            alert("현재 재고가 "+<%=product.getProdStock()%>+"개 있습니다.")
        }
    };
    
    //수량 input태그
    document.querySelector("#product-main-content-menu-quantity>div>input").addEventListener("blur",e=>{
    	if(document.querySelector("#product-main-content-menu-quantity>div>input").value > <%=product.getProdStock()%>){
    		alert("현재 재고가 "+<%=product.getProdStock()%>+"개 있습니다.");
    		document.querySelector("#product-main-content-menu-quantity>div>input").value = <%=product.getProdStock()%>;
    	}
    	
    	if(document.querySelector("#product-main-content-menu-quantity>div>input").value < 1){
    		alert("1개 단위로 구매 가능한 상품입니다. 수량을 다시 선택해주세요.");
    		document.querySelector("#product-main-content-menu-quantity>div>input").value = 1;
    	}
    });
    
    
    

    
    
</script>    
    
    
    
    
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>





    
    