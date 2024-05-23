<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	
	<style>
  	
  	div.hide{
  		display:none !important;
  	}	
  		
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
	<form action="<%=request.getContextPath() %>/member/signup.do" method="post">
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
		            <div class="success-message hide">사용할 수 있는 아이디입니다</div>
		            <div class="failure-message hide">아이디는 4~12글자이어야 합니다</div>
					<div class="failure-message2 hide">영어소문자 또는 숫자만 가능합니다</div>
					<div class="failure-message3 hide">이메일을 선택해야 합니다.</div>
		             
		        </div>
		        <div class="info">
		            <label for="custPw">비밀번호</label><br>
		            <div>
		                <input type="password" name="custPw" placeholder="Password">
		            </div>
    				<div class="strongPassword-message hide">8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요</div>
		        </div>
		        <div class="info">
		            <label for="custPwCheck">비밀번호 확인</label><br>
		            <div>
		                <input type="password" name="custPwCheck" placeholder="Password">
		            </div>
		            <div class="mismatch-message hide">비밀번호가 일치하지 않습니다</div>
		            
		        </div>
		        <div class="info">
		            <label for="">이름</label><br>
		            <div>
		                <input type="text" name="custName">
		            </div>
		            <div class="name-message hide">이름을 입력해주세요</div>
		            
		        </div>
		        <div class="info">
		            <label for="custNickname">닉네임</label><br>
		            <div>
		                <input type="text" name="custNickname">
		            </div>
		            <div class="nickname-message hide">닉네임을 입력해주세요</div>
		          
		        </div>
		        <div class="info">
		            <label for="custPhone">전화번호</label><br>
		            <div>
		                <input type="text" name="custPhone">
		            </div>       
		            <div class="phone-message hide">유효한 전화번호를 입력해주세요</div>
		             
		        </div>
		        <div class="info">
		            <label for="custBirth">생년월일</label><br>
		            <div>
		                <input type="text" name="custBirth">
		            </div>
		            <div class="birth-message hide">생년월일은 8자리로 입력해주세요</div>
		            
		        </div>
		        <div class="info">
		            <label for="custGender">성별</label><br>
		            <div>
		                <input type="radio" name="custGender" id="F" value="F">
		                <label for="F">여</label>
		                <input type="radio" name="custGender" id="M" value="M">
		                <label for="M">남</label>
		            </div>
		            <div class="gender-message hide">성별을 선택해주세요</div>
		            
		        </div>
		        <div class="info">
		            <label for="sample6_postcode">주소</label><br>
		            <div>
		                <input type="text" id="sample6_postcode" placeholder="우편번호">
		                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		                <input type="text" id="sample6_address" name="custAddress" placeholder="주소"><br>
		                <input type="text" id="sample6_detailAddress" name="custDetailAddress" placeholder="상세주소">
		                <input type="text" id="sample6_extraAddress" placeholder="참고항목">
		            </div>
		            <div class="address-message hide">주소를 입력해주세요</div>
		        </div>
		        <div>
		        	<button type="submit">회원가입</button>
		        </div>
		    </div>
		</div>
	</form>
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
	<script>
		// 유효성 검사 javascript
		
		// 아이디 정보 가져오기
		const elInputId = document.querySelector("input[name='custEmailId']");
		const elInputEmail = document.querySelector("select[name='emailDomain']");
		const elSuccessMessage = document.querySelector(".success-message");
		const elFailureMessage = document.querySelector(".failure-message");
		const elFailureMessageTwo = document.querySelector(".failure-message2");
		const elFailureMessageThree = document.querySelector(".failure-message3");
		
		// 비밀번호 정보 가져오기
		const elInputPassword = document.querySelector("input[name='custPw']");
		const elInputPasswordCheck = document.querySelector("input[name='custPwCheck']");
		const elMismatchMessage = document.querySelector(".mismatch-message");
		const elStrongPasswordMessage = document.querySelector(".strongPassword-message")
		
		// 이름 닉네임 전화번호 생년월일 성별 주소 가져오기
		const elInputName = document.querySelector("input[name='custName']");
	    const elNameMessage = document.querySelector(".name-message");
	    const elInputNickname = document.querySelector("input[name='custNickname']");
	    const elNicknameMessage = document.querySelector(".nickname-message");
	    const elInputPhone = document.querySelector("input[name='custPhone']");
	    const elPhoneMessage = document.querySelector(".phone-message");
	    const elInputBirth = document.querySelector("input[name='custBirth']");
	    const elBirthMessage = document.querySelector(".birth-message");
	    const elInputGender = document.querySelectorAll("input[name='custGender']");
	    const elGenderMessage = document.querySelector(".gender-message");
	    const elInputPostcode = document.getElementById("sample6_postcode");
	    const elInputAddress = document.getElementById("sample6_address");
	    const elAddressMessage = document.querySelector(".address-message");

	
		function idLength(value) {
				return value.length >= 4 && value.length <= 12
		}
		
		function onlyNumberAndEnglish(str) {
			return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
		}
		
		function strongPassword (str) {
			return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
		}
		
		function isMatch (password1, password2) {
			return password1 === password2;
		}
		
	
		document.querySelector("input[name='custEmailId']").addEventListener("keyup",e=>{
			document.querySelector("select[name='emailDomain']").addEventListener("change",e=>{
				const emailId = e.target.value;
				const emailDomain = e.target.value;
				console.log(emailId);
				
				
			})
		})
		
		// 이메일 아이디와 도메인 유효성 검사
	    elInputId.addEventListener("input", () => {
	        const emailId = elInputId.value;
	        const emailDomain = elInputEmail.value;

	        // 이메일 아이디 길이 검사
			if (idLength(emailId)) {
	            elFailureMessage.classList.add('hide');
	            if (onlyNumberAndEnglish(emailId)) {
	                elFailureMessageTwo.classList.add('hide');
	                if (emailDomain !== "none") {
	                    elFailureMessageThree.classList.add('hide');
	                    elSuccessMessage.classList.remove('hide');
	                } else {
	                    elFailureMessageThree.classList.remove('hide');
	                    elSuccessMessage.classList.add('hide');
	                }
	            } else {
	                elFailureMessageTwo.classList.remove('hide');
	                elSuccessMessage.classList.add('hide');
	            }
	        } else {
	            elFailureMessage.classList.remove('hide');
	            elSuccessMessage.classList.add('hide');
	        }
      	});

	    elInputEmail.addEventListener("change", () => {
	        const emailId = elInputId.value;
	        const emailDomain = elInputEmail.value;
	
	        if (emailDomain !== "none") {
	            elFailureMessageThree.classList.add('hide');
	            if (idLength(emailId) && onlyNumberAndEnglish(emailId)) {
	                elSuccessMessage.classList.remove('hide');
	            }
	        } else {
	            elFailureMessageThree.classList.remove('hide');
	            elSuccessMessage.classList.add('hide');
	        }
	    });

	    // 비밀번호 유효성 검사
	    elInputPassword.addEventListener("input", () => {
        	const password = elInputPassword.value;

	        if (strongPassword(password)) {
	            elStrongPasswordMessage.classList.add('hide');
	        } else {
	            elStrongPasswordMessage.classList.remove('hide');
	        }
	    });

	    // 비밀번호 확인 일치 검사
	    elInputPasswordCheck.addEventListener("input", () => {
	        const password = elInputPassword.value;
	        const passwordCheck = elInputPasswordCheck.value;
	
	        if (isMatch(password, passwordCheck)) {
	            elMismatchMessage.classList.add('hide');
	        } else {
	            elMismatchMessage.classList.remove('hide');
	        }
	    });

	</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>