<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.aja.member.model.dto.Customer" %>
<%
	Customer loginMember = (Customer)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css"/>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<title>AJA</title>
</head>
<body>

	<%if(loginMember==null) {%>
    <header>
        <div id="headerMain">
            <!-- 로고 -->
            <div id="headerLogo">
                <a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/images/logo(apricot).png" 
                    alt="logo" height="50" ></a>
            </div>


            <!-- 제품,About -->
            <div id="headerTitle">
                <div>
                    <a href=""><p>HandCream</p></a>
                </div>
                <div>
                    <a href=""><p>Perfume</p></a>
                </div>
                <div>
                    <a href=""><p>Body</p></a>
                </div>
                <div>
                    <a href="<%=request.getContextPath() %>/notice/noticelist.do"><p>Help</p></a>
                </div>
            </div>


            <!-- 장바구니,마이페이지,검색,메뉴? -->
            <!-- 수정본 학원캄퓨터에 있음 -->
            <div id="headerMypage">
            	<div>
            		<a href="<%=request.getContextPath() %>/product/productlist.do">관</a>
            	</div>
                <div>
                    <a href=""><img src="https://i.pinimg.com/236x/f4/bd/5d/f4bd5d6403cc1f1b4179dc11687bf74a.jpg" 
                        alt="마이페이지" height="25"></a>
                </div>
                <div>
                    <a href=""><img src="https://cdn-icons-png.flaticon.com/512/25/25424.png" 
                        alt="위시리스트" height="25"></a>
                </div>
                <div>
                    <a href=""><img src="https://cdn.icon-icons.com/icons2/1673/PNG/512/shoppingcartoutline_110834.png" 
                        alt="쇼핑백" height="25"></a>
                </div>
                <div>
                    <a href="<%=request.getContextPath() %>/member/login.do"><img src="https://cdn-icons-png.flaticon.com/512/152/152532.png" 
                        alt="로그인" height="25"></a>
                </div>         
            </div>
        </div>  <!-- <div id="headerMain">닫힘 -->
    </header>
    <%} else { %>
    	<header>
	        <div id="headerMain">
	            <!-- 로고 -->
	            <div id="headerLogo">
	                <a href=""><img src="<%=request.getContextPath()%>/images/logo(apricot).png" 
	                    alt="logo" height="50" ></a>
	            </div>
	
	
	            <!-- 제품,About -->
	            <div id="headerTitle">
	                <div>
	                    <a href=""><p>HandCream</p></a>
	                </div>
	                <div>
	                    <a href=""><p>Perfume</p></a>
	                </div>
	                <div>
	                    <a href=""><p>Body</p></a>
	                </div>
	                <div>
	                    <a href=""><p>About</p></a>
	                </div>
	            </div>
	
	
	            <!-- 장바구니,마이페이지,검색,메뉴? -->
	            <!-- 수정본 학원캄퓨터에 있음 -->
	            <div id="headerMypage">
	                <div>
	                    <a href=""><img src="https://i.pinimg.com/236x/f4/bd/5d/f4bd5d6403cc1f1b4179dc11687bf74a.jpg" 
	                        alt="마이페이지" height="25"></a>
	                </div>
	                <div>
	                    <a href=""><img src="https://cdn-icons-png.flaticon.com/512/25/25424.png" 
	                        alt="위시리스트" height="25"></a>
	                </div>
	                <div>
	                    <a href=""><img src="https://cdn.icon-icons.com/icons2/1673/PNG/512/shoppingcartoutline_110834.png" 
	                        alt="쇼핑백" height="25"></a>
	                </div>
	                <div>
	                    <a href="<%=request.getContextPath() %>/member/logout.do"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSAnFtBNVVAKlZhy80BsQqGLbCQRtlJxlbxNzLi26bXg&s" 
	                        alt="로그아웃" height="25"></a>
	                </div>
	            </div>
	        </div>  <!-- <div id="headerMain">닫힘 -->
    	</header>
    <%} %>

