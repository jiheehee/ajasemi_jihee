<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	
	<style>
  	
    .signup-form {
        display: flex;
        align-items: center;
        flex-direction: column;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        width: 100%;
        padding: 20px;
        /* overflow: auto;
        max-height: 90vh; */
    }
    .signup-form h4 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }
    .signup-content {
        width: 400px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .info {
        width: 100%;
        margin-bottom: 20px;
    }
    .info label {
        margin: 15px;
        font-size: 14px;
        color: #333;
        margin-bottom: 5px;
        display: inline-block;
    }
    .info input[type="text"], .info input[type="password"], .info select, .info input[type="button"] {
        width: calc(100% - 20px);
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }
    .info input[type="radio"] {
        margin-right: 5px;
    }
    .info input[type="button"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
    }
    .info input[type="button"]:hover {
        background-color: #0056b3;
    }
    .info input[type="text"]:focus, .info input[type="password"]:focus, .info select:focus {
        border-color: #007bff;
        outline: none;
    }
    div#infoEmail>div{
        display: flex;
        flex-direction: row;
        margin: 10px;
    }
    div#infoEmail>div>input{
        margin-right: 15px;
    }
    .info>div{
        margin: 10px;
    }

</style>
<section>
	<div class="signup-form">
	    <h4>회원가입</h4>
	    <div class="signup-content">
	        <div class="info" id="infoEmail">
	            <label for="custEmailId">이메일</label>
	            <div>
	                <input type="text" name="custEmailId" placeholder="Email Id">
	                <select name="emailDomain">
	                    <option value="none">이메일선택</option>
	                    <option value="@naver.com">@ naver.com</option>
	                    <option value="@daum.net">@ daum.net</option>
	                    <option value="@gmail.com">@ gmail.com</option>
	                </select>
	            </div>
	        </div>
	        <div class="info">
	            <label for="custPw">비밀번호</label><br>
	            <div>
	                <input type="password" name="custPw" placeholder="Password">
	            </div>
	        </div>
	        <div class="info">
	            <label for="custPwCheck">비밀번호 확인</label><br>
	            <div>
	                <input type="password" name="custPwCheck" placeholder="Password">
	            </div>
	        </div>
	        <div class="info">
	            <label for="">이름</label><br>
	            <div>
	                <input type="text" name="custName">
	            </div>
	        </div>
	        <div class="info">
	            <label for="custNickname">닉네임</label><br>
	            <div>
	                <input type="text" name="custNickname">
	            </div>
	        </div>
	        <div class="info">
	            <label for="custPhone">전화번호</label><br>
	            <div>
	                <input type="text" name="custPhone">
	            </div>        
	        </div>
	        <div class="info">
	            <label for="custBirth">생년월일</label><br>
	            <div>
	                <input type="text" name="custBirth">
	            </div>
	        </div>
	        <div class="info">
	            <label for="custGender">성별</label><br>
	            <div>
	                <input type="radio" name="custGender" id="F" value="F">
	                <label for="F">여</label>
	                <input type="radio" name="custGender" id="M" value="M">
	                <label for="M">남</label>
	            </div>
	        </div>
	        <div class="info">
	            <label for="sample6_postcode">주소</label><br>
	            <div>
	                <input type="text" id="sample6_postcode" placeholder="우편번호">
	                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	                <input type="text" id="sample6_address" placeholder="주소"><br>
	                <input type="text" id="sample6_detailAddress" placeholder="상세주소">
	                <input type="text" id="sample6_extraAddress" placeholder="참고항목">
	            </div>
	        </div>
	    </div>
	</div>
	</section>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                if (data.userSelectedType === 'R') {
	                    addr = data.roadAddress;
	                } else {
	                    addr = data.jibunAddress;
	                }
	
	                if(data.userSelectedType === 'R'){
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>