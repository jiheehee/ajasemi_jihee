<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
    #mypageGrade{
        display: flex;
        flex-direction: row;
        justify-content: center; 
        align-items: center; 
    }
    div#mypage-container{
    	margin-top:60px;
    	margin-bottom: 80px;
        width: 400px;
        height: 500px;
        /* border: 1px solid black; */
    }
    div#mypageUser{
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    div#mypageUser div{
        width: 100%;
        /* border: 1px solid salmon; */
        margin-top: 0;
        margin-bottom: 0;
    }
    div#mypageUser div *{
        /* border: 2px solid blue; */
        margin-top: 0;
        margin-bottom: 0;
        text-align:center;
    }
    section{
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    div#mypageList{
        margin-top: 30px;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
    }
    div#mypageList div{
        width: 100%;
        border: 1px solid magenta;
        height: 50px;
        display: flex;  /* Add this line */
        justify-content: center;  /* Add this line */
        align-items: center;  /* Add this line */
    }
    #mypageLoginMember{
    	margin-bottom : 5px;
    }
</style>

<section>
    <div id="mypage-container">
        <div id="mypageUser">
        	<% if(loginMember.getCustName()!=null) {%>
            	<div id="mypageLoginMember"><h3><%=loginMember.getCustName() %></h3></div>
            <%} %>
            <div id="mypageGrade"><h5>GRADE</h5><h2>custGrade</h2></div>
            <div><h4>TOTAL KRW 구매실적</h4></div>
        </div>
        <div id="mypageList">
            <div onclick="location.assign('<%=request.getContextPath()%>/mypage/orderlist.do')"><h3>ORDER</h3></div>
            <div onclick="location.assign('<%=request.getContextPath()%>')"><h3>WISHLIST</h3></div>
            <div onclick="location.assign('<%=request.getContextPath()%>/mypage/profile.do')"><h3>PROFILE</h3></div>
            <div onclick="location.assign('<%=request.getContextPath()%>/mypage/address.do')"><h3>ADDRESS</h3></div>
            <div onclick="location.assign('<%=request.getContextPath()%>')"><h3>COUPON</h3></div>
            <div onclick="location.assign('<%=request.getContextPath()%>')"><h3>POINT</h3></div>
            <div onclick="location.assign('<%=request.getContextPath()%>/member/logout.do')"><h3>LOGOUT</h3></div>
        </div>
    </div>
</section>
<script type="text/javascript">
	
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
