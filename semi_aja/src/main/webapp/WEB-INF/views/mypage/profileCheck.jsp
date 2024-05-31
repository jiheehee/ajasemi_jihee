<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 개인정보 수정 전, 비밀번호 check  -->

<!-- <style>
    section{
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        width: 100%;
    }
    #profilePwCheck>form{
        display: flex;
        flex-direction: column;
    }
    
    #profilePw-container{
    	margin-top: 50px;
    	margin-bottom:50px;
    }
</style> -->

<!-- 
<style>
    section{
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        width: 100%;
    }
    #profilePwCheck>form{
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    
    #profilePw-container{
    	margin-top: 50px;
    	margin-bottom:50px;
    }
    
    h6 {
        font-size: 24px;
        color: black;
        margin-bottom: 20px;
    }
    
    input[type="password"] {
        border: none;
        border-bottom: 2px solid black;
        padding: 10px 0;
        margin-bottom: 20px;
        font-size: 16px;
        width: 200px;
        text-align: center;
        outline: none;
    }
    
    button {
        background-color: black;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s;
        margin-top: 10px;
    }
    
    button:hover {
        background-color: white;
        color: black;
        border: 2px solid black;
    }
</style> -->

<style>
    section {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        width: 100%;
    }
    #profilePwCheck > form {
        display: flex;
        flex-direction: row;
        align-items: center;
    }
    
    #profilePw-container {
        margin-top: 100px;
        margin-bottom: 200px;
    }
    
    h6 {
    	text-align:center;
        font-size: 18px;
        color: black;
        margin-bottom: 80px;
        padding-right:60px;
    }
    
    input[type="password"] {
        border: none;
        border-bottom: 1px solid black;
        padding: 10px 0;
        margin-right: 10px;
        font-size: 16px;
        width: 180px;
        text-align: center;
        outline: none;
    }
    
    button {
        background-color: black;
        color: white;
        border: none;
        padding: 15px 20px;
        font-size: 12px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    
    button:hover {
        background-color: white;
        color: black;
    }
</style>

<section>
    <div id="profilePw-container">
        <div><h6>비밀번호 확인</h6></div>
        <div id="profilePwCheck">
            <form action="<%=request.getContextPath()%>/mypage/profileend.do" method="POST">
                <input type="password" name="custPw"><button type="submit">check</button>
            </form>
        </div>
    </div>
</section>




<%@ include file="/WEB-INF/views/common/footer.jsp"%>