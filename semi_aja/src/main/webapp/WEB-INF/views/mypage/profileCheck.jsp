<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 개인정보 수정 전, 비밀번호 check  -->

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
    }
    div{
        border: 1px solid hotpink;
    }
</style>

<section>
    <div id="profilePw-container">
        <div><h6>비밀번호 확인</h6></div>
        <div id="profilePwCheck">
            <form action="<%=request.getContextPath()%>/member/profileend.do">
                <input type="password" name="custPw">
                <!-- <button onclick="submit();" type="button">확인</button> -->
                <button type="submit">확인</button>
            </form>
        </div>
    </div>
</section>
<script>
	const submit = ()=>{
		const custPw = document.querySelector("input[name='custPw']").value;
		location.replace("<%=request.getContextPath()%>/member/profileend.do?custPw="+custPw);
	}
</script>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>