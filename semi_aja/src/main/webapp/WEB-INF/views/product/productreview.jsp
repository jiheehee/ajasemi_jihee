<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.List,com.aja.productprint.model.dto.ReviewDTO" %>   
    
<%
	List<ReviewDTO> reviewList = (List<ReviewDTO>)request.getAttribute("reviewList");
	//int reviewCount = (int)request.getAttribute("reviewCount");
%>    
    
    
<%if(reviewList.size()!=0){ %>
<div id="product-footer-main-two-header">   <!-- 별 만들기 -->
    <h3>리뷰 (<%=reviewList.size()%>)</h3>
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
    <!-- for -->
    <%if(!reviewList.isEmpty()) { 
	    for(ReviewDTO r : reviewList){ %>
	    
	        <li>
	        	<p hidden><%=r.getReviewRate()%></p>	<!-- 별점 -->
	            <div class="product-footer-main-two-reviewlist-div">   <!-- 별점, 게시자, 날짜 -->
	                <div class="star-ratings-list">
	                    <div class="star-ratings-fill-list">
	                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                    </div>
	                    <div>
	                        <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	                    </div>
	                </div>
	                <div><%=r.getCustNickname()%></div>
	                <div><%=r.getReviewEnrolldate()%></div>
	            </div>
	            <div>   <!-- 리뷰내용 -->
	                <p>
	                    <%=r.getReviewContent() %>
	                </p>
	            </div>
	            <hr style="width: 100%;">
	        </li>
        
        	<%}
        }%>
        
      </ul>
     </div>
     <%}else{ %>
     	<div>
     		<h3 style="text-align: center;	margin: 70px 0 100px 0; ">작성된 리뷰가 없습니다.</h3>
     		<hr>
     	</div>
     <%} %>
     
     
     
     
     
     
     
     
     