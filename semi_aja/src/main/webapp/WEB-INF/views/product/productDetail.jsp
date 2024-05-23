<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/WEB-INF/views/common/header.jsp"  %>
    

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
        width: 100%;
        display: flex;
        flex-wrap: wrap;
    }

    .product-main-content-productlist{
        width: 20%;
        display: flex;
        flex-direction: column;
        text-align: center;
    }

    .product-main-content-productlist>p{
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

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
        border: 0.5px solid black;
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

    #product-footer-main-three-header-category>li>button, #product-footer-main-three-header>div>button{
        height: 100%;
        cursor: pointer;
        border: 0;
        background-color: transparent;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    /* Q&A 작성버튼  */
    #product-footer-main-three-header>div:last-child>button{
        margin-left: 20px;
    }

    /* Q&A 띄워주는 공간 ul */
    #product-footer-main-three-content-list{
        list-style-type: none;
        padding: 0;
    }

    #product-footer-main-three-content-list>li>div{
        display: flex;
        align-items: center;
        padding: 10px 0 10px 0;
    }

   

    /* Q&A span 선택자 */
    #product-footer-main-three-content-list>li>div>span:nth-of-type(1){
        background-color:  #9bce26;
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
</style>    
   
   
<body>
    <main>
        <div id="product-main">    <!-- 상품사진, 상품 정보 -->
            <div id="product-main-img-div"> <!-- 상품사진 -->
                <div class="product-main-img">
                    <img src="https://web-resource.tamburins.com/catalog/product/1504792781/bb74101c-120c-4cbc-88bd-7acdf9bbe528/Thumbnail_ChainHand_65ml_000.jpg"
                     alt="상품1" width="100%">
                </div>
                <div class="product-main-img">
                    <img src="https://web-resource.tamburins.com/catalog/product/1504792781/bb74101c-120c-4cbc-88bd-7acdf9bbe528/Thumbnail_ChainHand_65ml_000.jpg"
                     alt="상품2" width="100%">
                </div>
            </div> <!-- 상품사진 닫 -->

            <div id="product-main-content"> <!-- 상품 정보 -->
                <div id="product-main-content-div">
                    <div>  <!-- 상품 정보 -->
                        <div>
                            <h2>상품 이름</h2>
                            <p>가격</p>
                            <p>키워드</p>
                        </div>
                        <p>
                            제품 설명제품 설명제품 설명제품 설명제품 설명제품 설명제품 설명제품 설명제품 설명
                            제품 설명제품 설명제품 설명제품 설명제품 설명제품 설명제품 설명제품 설명
                        </p>
                    </div>

                    <div id="product-main-content-list">  <!-- 관련상품 출력 -->
                        <div class="product-main-content-productlist">
                            <button class="product-main-content-listbtn">
                                <img src="https://web-resource.tamburins.com/catalog/product/1504792781/bb74101c-120c-4cbc-88bd-7acdf9bbe528/Thumbnail_ChainHand_65ml_000.jpg"
                                alt="상품" width="100%">
                            </button>
                            <p>상품이름</p>
                        </div>
                       <div class="product-main-content-productlist">
                            <button class="product-main-content-listbtn">
                                <img src="https://web-resource.tamburins.com/catalog/product/1504792781/bb74101c-120c-4cbc-88bd-7acdf9bbe528/Thumbnail_ChainHand_65ml_000.jpg"
                                alt="상품" width="100%">
                            </button>
                            <p>상품이름</p>
                        </div>
                        <div class="product-main-content-productlist">
                            <button class="product-main-content-listbtn">
                                <img src="https://web-resource.tamburins.com/catalog/product/1504792781/bb74101c-120c-4cbc-88bd-7acdf9bbe528/Thumbnail_ChainHand_65ml_000.jpg"
                                alt="상품" width="100%">
                            </button>
                            <p>상품이름</p>
                        </div>
                    </div>  <!-- 관련상품 닫 -->
                    <hr style="width: 95%;">    

                    <div>  <!-- 옵션 -->
                        <div id="product-main-content-menu">
                            <div>
                                <p>사이즈</p>
                                <div id="product-main-content-option">
                                    <button>30mL</button>
                                    <button>65mL</button>
                                </div>  
                            </div>
                            <div id="product-main-content-menu-quantity">
                                <p>수량</p>
                                <div>
                                    <button onclick="plusnum();">-</button>
                                    <input type="number" min="1" max="100" value="1">
                                    <button onclick="minusnum();">+</button>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div id="product-main-content-buy"> <!-- 로그인 안헀을때 alert창 띄워주기 -->
                                <button>장바구니</button>
                                <button>구매하기</button>
                                <button type="button"  onclick="dee(event);">
                                    <img src="https://i.pinimg.com/236x/ce/28/d0/ce28d041490341165bd143bb07944e75.jpg"
                                        alt="찜버튼" width="30px" height="30px" >
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="product-footer-move"> <!-- 상품footer / 누르면 바로가기 -->
            <a href="">Home</a>
            <p>/</p>
            <a href="">Hand</a>
            <p>/</p>
            <a href="">체인 핸드000</a>
        </div>

        <ul id="product-footer-category">
            <li>제품 상세정보</li>
            <li>리뷰 (3)</li>
            <li>Q&A (4)</li>
        </ul>
        <hr width="100%">
        <div id="product-footer-main">   <!-- 아래 공간 -->
            <div id="product-footer-main-one">   <!-- 제품설명 -->
                <h3>제품 상세정보</h3>  
                <br>
                <p>
                    식물성 오일 성분으로 피부 장벽을 강화시키며 빠르게 스며듭니다.
                     끈적이지 않는 깔끔한 텍스처는 언제든지 손을 사용하기에 
                     자유로운 상태를 유지해 주며, 벨벳같이 부드러운 피부로 가꾸어 줍니다.
                </p>
                <br>
                <h3>전성분</h3>
                <p>
                    정제수, 글리세린, 부틸렌글라이콜, 시어버터, 세테아릴알코올, 하이드로제네이티드폴리데센,
                     1,2-헥산다이올, 카프릴릭/카프릭트라이글리세라이드, 퀸즈랜드넛오일, 베르가모트오일, 광곽향오일,
                      올리브오일, 단향오일, 라벤더추출물, 오레가노꽃/잎/줄기추출물, 로즈마리추출물, 타임추출물, 다이메티콘,
                       폴리글리세릴-3메틸글루코오스다이스테아레이트, 합성비즈왁스, 암모늄아크릴로일다이메틸타우레이트/브이피코폴리머,
                        하이드로제네이티드레시틴, 폴리메틸메타크릴레이트, 하이드록시에틸아크릴레이트/
                        소듐아크릴로일다이메틸타우레이트코폴리머, 글리세릴스테아레이트, 하이드록시에틸우레아, 카프릴릴글라이콜, 
                        아크릴레이트/C10-30알킬아크릴레이트크로스폴리머, 에틸헥실글리세린, 트로메타민, 토코페롤, 세틸알코올, 잔탄검,
                         소듐파이테이트, 리모넨, 리날룰
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
                    있는 경우 전문의와 상담할 것 2.상처가 있는 부위 등에는 사용을 자제할 것.
                    보관 및 취급시의 주의사항 1)어린이의 손에 닿지 않는 곳에 보관할 것 2)직사광선을 피해서 보관할 것 *본 제품은 
                    공정거래위원회 고시 소비자 분쟁 해결 기준에 의거교환 또는 보상 받을 수 있습니다.
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
                <div id="product-footer-main-two-header">   <!-- 별 만들기 -->
                    <h3>리뷰 (3)</h3>
                    <div class="star-ratings">
                        <div class="star-ratings-fill">
                            <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                        </div>
                        <div>
                            <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                        </div>
                    </div>
                </div>
                <hr style="width: 100%; border: 3px solid black">
                <div>   <!-- 리뷰 목록 -->
                    <ul id="product-footer-main-two-reviewlist">    <!-- 리뷰하나당 li -->
                        <li>
                            <div class="product-footer-main-two-reviewlist-div">   <!-- 별점, 게시자, 날짜 -->
                                <div class="star-ratings-list">
                                    <div class="star-ratings-fill-list">
                                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                    </div>
                                    <div>
                                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                    </div>
                                </div>
                                <div>게시자sol</div>
                                <div>2024.05.21</div>
                            </div>
                            <div>   <!-- 리뷰내용 -->
                                <p>
                                    리뷰내용 리뷰내용 리뷰내용 리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용 리뷰내용리뷰내용리뷰내용 리뷰내용리뷰내용
                                    리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용 리뷰내용리뷰내용
                                </p>
                            </div>
                            <hr style="width: 100%;">
                        </li>
                        <li>    <!-- 리뷰2 열림  -->
                            <div class="product-footer-main-two-reviewlist-div">   <!-- 별점, 게시자, 날짜 -->
                                <div class="star-ratings-list">
                                    <div class="star-ratings-fill-list">
                                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                    </div>
                                    <div>
                                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                    </div>
                                </div>
                                <div>게시자sol</div>
                                <div>2024.05.21</div>
                            </div>
                            <div>   <!-- 리뷰내용 -->
                                <p>
                                    리뷰내용 리뷰내용 리뷰내용 리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용 리뷰내용리뷰내용리뷰내용 리뷰내용리뷰내용
                                    리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용 리뷰내용리뷰내용
                                </p>
                            </div>
                            <hr style="width: 100%;">
                        </li>
                        <li>
                            <div class="product-footer-main-two-reviewlist-div">   <!-- 별점, 게시자, 날짜 -->
                                <div class="star-ratings-list">
                                    <div class="star-ratings-fill-list">
                                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                    </div>
                                    <div>
                                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                    </div>
                                </div>
                                <div>게시자sol</div>
                                <div>2024.05.21</div>
                            </div>
                            <div>   <!-- 리뷰내용 -->
                                <p>
                                    리뷰내용 리뷰내용 리뷰내용 리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용 리뷰내용리뷰내용리뷰내용 리뷰내용리뷰내용
                                    리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용 리뷰내용리뷰내용
                                </p>
                            </div>
                            <hr style="width: 100%;">
                        </li>   <!-- 리뷰3 닫 -->
                    </ul>
                </div>
            </div>  <!-- 리뷰 닫힘 -->

            <div id="product-footer-main-three">   <!-- Q&A -->
                <!-- 제목 내용 상품이미지... 등록일 비밀글(y,n) 카테고리 / 답변은 내용 작성일 -->
                <div id="product-footer-main-three-header">   <!-- 상단바 문의 카테고리 -->
                    <div>   <!-- 왼쪽 -->
                        <h3>상품 Q&A (4)</h3>
                    </div>
                    <div>   <!-- 오른쪽 -->
                        <ul id="product-footer-main-three-header-category"> 
                            <li>
                                <button>ALL</button>
                                <span>|</span>
                            </li>
                            <li>
                                <button>배송문의 (1)</button>
                                <span>|</span>
                            </li>
                            <li>
                                <button>주문문의 (1)</button>
                                <span>|</span>
                            </li>
                            <li>
                                <button>재입고문의 (1)</button>
                                <span>|</span>
                            </li>
                            <li>
                                <button>사이즈문의 (0)</button>
                                <span>|</span>
                            </li>
                            <li>
                                <button>기타문의 (1)</button>
                            </li>
                        </ul>
                        <button>Q&A 작성</button>
                    </div>
                </div>  <!-- 상단바 닫힘 -->
                <hr style="border: 3px solid black; width: 100%;">
                <div>   <!-- 답변 -->
                    <ul id="product-footer-main-three-content-list">
                        <li>
                            <div>   <!-- Q -->
                                <span>답변완료</span>
                                <span>[배송문의]</span>
                                <img src="https://i.pinimg.com/236x/7f/5c/7c/7f5c7cd30efc2190db8c19614d073516.jpg" 
                                    alt="비밀글여부" width="30px" height="30px">
                                <span>이거왜이래이거왜이래이거왜이래</span>
                                <span>작성자</span>
                                <span>2024.05.21</span>
                            </div>
                            <hr width="100%">
            
                            <div class="product-footer-main-three-qnacontainer">   <!-- Q&A -->
                                <div>   <!-- Q -->
                                    <p>Q</p>
                                    <p>이거왜이래이거왜이래이거왜이래</p>
                                </div>
                                <hr width="70%">
                                <div>   <!-- A -->
                                    <p>A</p>
                                    <p>
                                        안녕하세요. 라운드랩 담당자입니다.<br>먼저 저희 제품에 관심가져주셔서 감사합니다.자작나무 수분 
                                        선크림의 차단 지수는 판매 페이지에 기재된 SPF 55±8.5 PFA 19.80(PA++++)입니다.<br>해당 지수는 
                                        임의로 기재한 숫자가 아닌 제 3의 임상 기관인 한국 피부 과학 연구원에서 자외선 차단 인체 적용 실험을 실시한
                                        결과이니 믿고 사용해 주시면 감사하겠습니다:)<br>감사합니다.
                                        <br><br>
                                        Apricot<br>
                                        Guide to Better Choice
                                    </p>
                                </div>
                                <hr width="100%">
                            </div>
                        </li>

                        <li>
                            <div>   <!-- Q -->
                                <span>답변완료</span>
                                <span>[주문문의]</span>
                                <img src="https://i.pinimg.com/236x/7f/5c/7c/7f5c7cd30efc2190db8c19614d073516.jpg" 
                                    alt="비밀글여부" width="30px" height="30px">
                                <span>이거왜이래이거왜이래이거왜이래</span>
                                <span>작성자</span>
                                <span>2024.05.21</span>
                            </div>
                            <hr width="100%">
            
                            <div class="product-footer-main-three-qnacontainer">   <!-- Q&A -->
                                <div>   <!-- Q -->
                                    <p>Q</p>
                                    <p>이거왜이래이거왜이래이거왜이래</p>
                                </div>
                                <hr width="70%">
                                <div>   <!-- A -->
                                    <p>A</p>
                                    <p>
                                        안녕하세요. 라운드랩 담당자입니다.<br>먼저 저희 제품에 관심가져주셔서 감사합니다.자작나무 수분 
                                        선크림의 차단 지수는 판매 페이지에 기재된 SPF 55±8.5 PFA 19.80(PA++++)입니다.<br>해당 지수는 
                                        임의로 기재한 숫자가 아닌 제 3의 임상 기관인 한국 피부 과학 연구원에서 자외선 차단 인체 적용 실험을 실시한
                                        결과이니 믿고 사용해 주시면 감사하겠습니다:)<br>감사합니다.
                                        <br><br>
                                        Apricot<br>
                                        Guide to Better Choice
                                    </p>
                                </div>
                                <hr width="100%">
                            </div>
                        </li>

                        <li>
                            <div>   <!-- Q -->
                                <span>답변완료</span>
                                <span>[재입고문의]</span>
                                <img src="https://i.pinimg.com/236x/7f/5c/7c/7f5c7cd30efc2190db8c19614d073516.jpg" 
                                    alt="비밀글여부" width="30px" height="30px">
                                <span>이거왜이래이거왜이래이거왜이래</span>
                                <span>작성자</span>
                                <span>2024.05.21</span>
                            </div>
                            <hr width="100%">
            
                            <div class="product-footer-main-three-qnacontainer">   <!-- Q&A -->
                                <div>   <!-- Q -->
                                    <p>Q</p>
                                    <p>이거왜이래이거왜이래이거왜이래</p>
                                </div>
                                <hr width="70%">
                                <div>   <!-- A -->
                                    <p>A</p>
                                    <p>
                                        안녕하세요. 라운드랩 담당자입니다.<br>먼저 저희 제품에 관심가져주셔서 감사합니다.자작나무 수분 
                                        선크림의 차단 지수는 판매 페이지에 기재된 SPF 55±8.5 PFA 19.80(PA++++)입니다.<br>해당 지수는 
                                        임의로 기재한 숫자가 아닌 제 3의 임상 기관인 한국 피부 과학 연구원에서 자외선 차단 인체 적용 실험을 실시한
                                        결과이니 믿고 사용해 주시면 감사하겠습니다:)<br>감사합니다.
                                        <br><br>
                                        Apricot<br>
                                        Guide to Better Choice
                                    </p>
                                </div>
                                <hr width="100%">
                            </div>
                        </li>

                        <li>
                            <div>   <!-- Q -->
                                <span>답변완료</span>
                                <span>[기타문의]</span>
                                <img src="https://i.pinimg.com/236x/7f/5c/7c/7f5c7cd30efc2190db8c19614d073516.jpg" 
                                    alt="비밀글여부" width="30px" height="30px">
                                <span>이거왜이래이거왜이래이거왜이래</span>
                                <span>작성자</span>
                                <span>2024.05.21</span>
                            </div>
                            <hr width="100%">
            
                            <div class="product-footer-main-three-qnacontainer">   <!-- Q&A -->
                                <div>   <!-- Q -->
                                    <p>Q</p>
                                    <p>이거왜이래이거왜이래이거왜이래</p>
                                </div>
                                <hr width="70%">
                                <div>   <!-- A -->
                                    <p>A</p>
                                    <p>
                                        안녕하세요. 라운드랩 담당자입니다.<br>먼저 저희 제품에 관심가져주셔서 감사합니다.자작나무 수분 
                                        선크림의 차단 지수는 판매 페이지에 기재된 SPF 55±8.5 PFA 19.80(PA++++)입니다.<br>해당 지수는 
                                        임의로 기재한 숫자가 아닌 제 3의 임상 기관인 한국 피부 과학 연구원에서 자외선 차단 인체 적용 실험을 실시한
                                        결과이니 믿고 사용해 주시면 감사하겠습니다:)<br>감사합니다.
                                        <br><br>
                                        Apricot<br>
                                        Guide to Better Choice
                                    </p>
                                </div>
                                <hr width="100%">
                            </div>
                        </li>

                    </ul>
                </div>
            </div>  <!-- Q&A 닫힘 -->

        </div>  <!-- 아래공간 닫 -->
    </main>
</body>    
    
  
  
<script>
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
    });
    // Q&A 띄우기
    document.querySelector("#product-footer-category>li:nth-of-type(3)").addEventListener("click",e=>{
        one.style.display = "none";
        two.style.display = "none";
        three.style.display = "block";
    });

    //Q&A ^0^
    let $qna = document.querySelectorAll("#product-footer-main-three-content-list>li>div:nth-of-type(1)");
    let $qnacontainer = document.querySelectorAll("#product-footer-main-three-content-list>li>div:nth-of-type(2)");
    $qna.forEach((e)=>{
        e.addEventListener("click",(e)=>{
            $qnacontainer.forEach((q)=>{
                q.style.display="none";
                e.currentTarget.parentElement.lastElementChild.style.display = "flex";
            })
        })
    });


    //리뷰에 별점 표시
    for(let i=0;i<document.getElementById("product-footer-main-two-reviewlist").children.length;i++){
        const score = (i * 20)+1;   //i자리에 해당리뷰 별점가져와 대입
        document.getElementsByClassName("star-ratings-fill-list")[i].style.width = score+"%";
    }

    //전체 별점의 평균값 출력
    const score = (4 * 20)+1;   //4자리에 별점 가져와서 대입하기
    document.getElementsByClassName("star-ratings-fill")[0].style.width = score+"%";
    


    const test=()=>{
        console.log("2");
    };

    //수량 + -
    const plusnum=()=>{
        if(document.querySelector("#product-main-content-menu-quantity>div>input").value > 1){
            const num = document.querySelector("#product-main-content-menu-quantity>div>input").value;
            document.querySelector("#product-main-content-menu-quantity>div>input").value = Number(num)-1;
        }else{
            alert("1개 이상부터 구매할 수 있는 상품입니다.")
        }
    };
    // 50자리에  상품 재고만큼 걸기
    const minusnum=()=>{
        if(document.querySelector("#product-main-content-menu-quantity>div>input").value < 50){
            const num = document.querySelector("#product-main-content-menu-quantity>div>input").value;
            document.querySelector("#product-main-content-menu-quantity>div>input").value = Number(num)+1;
        }else{
            alert("최대 50개까지만 구매가능합니다.")
        }
    };

    const dee=(e)=>{
        console.log(e.target);
    };
</script>    
    
    
    
    
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>





    
    