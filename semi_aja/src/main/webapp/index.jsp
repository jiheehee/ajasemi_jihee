<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>

	#sectionDiv{
		width:100%;
		height:1000px;
	}
	#videoSection{
		/* border:1px solid black; */
	}
	#productContainer{
		display: flex;
		flex-direction:row;
		align-items:center;
		overflow-x:scroll;
		/* overflow-y:hidden; */
	
	}
	#productContainer::-webkit-scrollbar{
		display:none;
	}
	.product{
		padding:20px;
		border:1px solid skyblue;
		padding-bottom:0;
		padding-top:0;
		align-items:center;
	}
	.product>p{
		margin:0;
		font-size:10.5px;
	}
	
	#bestSeller{
		text-align:center;
		border: 1px solid blue;
	}
	#productSection{
		border: 1px solid green;
		margin-top:100px;
	}
	
</style>
<section>
	<div id="sectionDiv">
		<div id="videoSection">
			<video src="<%=request.getContextPath()%>/images/main.mp4" width="100%" autoplay muted loop></video>
		</div>
	</div>
	<%-- 	<div id="productSection">
			<div><h3 id="bestSeller">Best Seller</h3></div>
			<div id="productContainer">
				<div class="product">
					<img src="<%=request.getContextPath()%>/images/pumkini.jpeg" width="190px" height="230px">
					<p>쉘 퍼퓸 핸드 펌키니</p>
					<p>₩ 32,000</p>
				</div>
				<div class="product">
					<img src="<%=request.getContextPath()%>/images/pumkini.jpeg" width="190px" height="230px">
					<p>쉘 퍼퓸 핸드 펌키니</p>
					<p>₩ 32,000</p>
				</div>
				<div class="product">
					<img src="<%=request.getContextPath()%>/images/pumkini.jpeg" width="190px" height="230px">
					<p>쉘 퍼퓸 핸드 펌키니</p>
					<p>₩ 32,000</p>
				</div>
				<div class="product">
					<img src="<%=request.getContextPath()%>/images/pumkini.jpeg" width="190px" height="230px">
					<p>쉘 퍼퓸 핸드 펌키니</p>
					<p>₩ 32,000</p>
				</div>
				<div class="product">
					<img src="<%=request.getContextPath()%>/images/pumkini.jpeg" width="190px" height="230px">
					<p>쉘 퍼퓸 핸드 펌키니</p>
					<p>₩ 32,000</p>
				</div>
				<div class="product">
					<img src="<%=request.getContextPath()%>/images/pumkini.jpeg" width="190px" height="230px">
					<p>쉘 퍼퓸 핸드 펌키니</p>
					<p>₩ 32,000</p>
				</div>
			</div>
			</div>
	</div> --%>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>