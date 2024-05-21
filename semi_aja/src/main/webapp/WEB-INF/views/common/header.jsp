<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css"/>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>

<title>AJA</title>
</head>
<body>

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
                    <a href="<%=request.getContextPath() %>/notice/noticelist.do"><p>Help</p></a>
                </div>
            </div>


            <!-- 장바구니,마이페이지,검색,메뉴? -->
            <!-- 수정본 학원캄퓨터에 있음 -->
            <div id="headerMypage">
                <div>
                    <a href=""><img src="https://i.pinimg.com/236x/db/a3/12/dba312c2f4808382c9086f42cfdfcd88.jpg" 
                        alt="장바구니" height="25"></a>
                </div>
                <div>
                    <a href=""><img src="https://i.pinimg.com/236x/f4/bd/5d/f4bd5d6403cc1f1b4179dc11687bf74a.jpg" 
                        alt="마이페이지" height="25"></a>
                </div>
                <div>
                    <a href=""><img src="https://i.pinimg.com/236x/55/da/93/55da9379cadae5a06c4f4efd06ffffde.jpg" 
                        alt="검색" height="25"></a>
                </div>
                <div>
                    <a href=""><img src="https://i.pinimg.com/236x/24/d8/9b/24d89b2ebde80c8098f7525f55267686.jpg" 
                        alt="메뉴" height="25"></a>
                </div>
                <div>
                    <a href="<%=request.getContextPath() %>/member/login.do"><img src="https://i.pinimg.com/236x/24/d8/9b/24d89b2ebde80c8098f7525f55267686.jpg" 
                        alt="로그인" height="25"></a>
                </div>
                <div>
                    <a href=""><img src="https://i.pinimg.com/236x/24/d8/9b/24d89b2ebde80c8098f7525f55267686.jpg" 
                        alt="회원가입" height="25"></a>
                </div>
            </div>
        </div>  <!-- <div id="headerMain">닫힘 -->
    </header>

