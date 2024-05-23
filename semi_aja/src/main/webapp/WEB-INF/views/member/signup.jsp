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

<style>
	/* 모달 스타일 */
    .modal {
        display: none; /* 기본적으로 안 보이게 설정 */
        position: fixed; /* 화면에 고정 */
        z-index: 1; /* 다른 요소들보다 위에 위치 */
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto; /* 스크롤 가능하게 설정 */
        background-color: rgba(0, 0, 0, 0.4); /* 반투명 배경 */
    }

    /* 모달 내용 */
    .modal-content {
        background-color: #fefefe;
        margin: 30% auto; /* 중앙 정렬 */
        padding: 20px;
        border: 1px solid #888;
        width: 60%; /* 모달 너비 */
    }

    /* 모달 닫기 버튼 스타일 */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
       	cursor: pointer;
       	margin-left:auto;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    
   	input[name='custEmailId']{
   		width:33.995% !important;
   	}
   	select[name='emailDomain']{
   		margin-right: 15.1px;
   		width:33.995% !important;
   	}
   	button#idcheck{
   		width:18% !important;
   		font-size: 12px !important;
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
		                <button id="idcheck">중복확인</button>
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
		                <input type="text" name="custName" placeholder="Name">
		            </div>
		            <div class="name-message hide">이름을 입력해주세요</div>
		            
		        </div>
		        <div class="info">
		            <label for="custNickname">닉네임</label><br>
		            <div>
		                <input type="text" name="custNickname" placeholder = "Nickname">
		            </div>
		            <div class="nickname-message hide">닉네임을 입력해주세요</div>
		          
		        </div>
		        <div class="info">
		            <label for="custPhone">전화번호</label><br>
		            <div>
		                <input type="text" name="custPhone" placeholder="Phone">
		            </div>       
		            <div class="phone-message hide">유효한 전화번호를 입력해주세요</div>
		             
		        </div>
		        <div class="info">
		            <label for="custBirth">생년월일</label><br>
		            <div>
		                <input type="text" name="custBirth" placeholder="Birth Day">
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
	<!-- 모달 HTML -->
	<div id="myModal" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <p id="modalMessage">아이디 또는 패스워드를 입력하세요.</p>
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
	<script type="text/javascript">
		/* $("#idcheck").click(function) */
	
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
		const elStrongPasswordMessage = document.querySelector(".strongPassword-message");
		
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
	    const elInputDetailAddress = document.getElementById("sample6_detailAddress");
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
		
		function isValidPhoneNumber(value) {
	        return /^(010|011|012|013|014|018|019)\d{7,8}$/.test(value);
	    }

	    function isValidBirthDate(value) {
	        return /^\d{8}$/.test(value);
	    }

	    function isValidName(value) {
	        return /^[가-힣]+$/.test(value);
	    }

	    function isGenderSelected() {
	        return document.querySelector('input[name="custGender"]:checked') !== null;
	    }

	    function isValidAddress() {
	        return elInputPostcode.value.trim() !== '' && elInputAddress.value.trim() !== '' && elInputDetailAddress.value.trim() !== '';
	    }
	    
	    
		
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
	    
	    // 이름 유효성 검사
	    elInputName.addEventListener("input", () => {
	        const name = elInputName.value;

	        if (isValidName(name)) {
	            elNameMessage.classList.add('hide');
	        } else {
	            elNameMessage.classList.remove('hide');
	        }
	    });

	   	// 닉네임 유효성 검사
	    elInputNickname.addEventListener("input", () => {
	        const nickname = elInputNickname.value;

	        if (nickname.trim() === '') {
	            elNicknameMessage.classList.remove('hide');
	        } else {
	            elNicknameMessage.classList.add('hide');
	        }
	    });

	   	// 전화번호 유효성 검사
	    elInputPhone.addEventListener("input", () => {
	        const phone = elInputPhone.value;

	        if (isValidPhoneNumber(phone)) {
	            elPhoneMessage.classList.add('hide');
	        } else {
	            elPhoneMessage.classList.remove('hide');
	        }
	    });

	   	// 생년월일 유효성 검사
	    elInputBirth.addEventListener("input", () => {
	        const birth = elInputBirth.value;

	        if (isValidBirthDate(birth)) {
	            elBirthMessage.classList.add('hide');
	        } else {
	            elBirthMessage.classList.remove('hide');
	        }
	    });

	   	// 성별 유효성 검사
	    elInputGender.forEach(gender => {
	        gender.addEventListener("change", () => {
	            if (isGenderSelected()) {
	                elGenderMessage.classList.add('hide');
	            } else {
	                elGenderMessage.classList.remove('hide');
	            }
	        });
	    });

	   	// 우편번호 유효성 검사
	    elInputPostcode.addEventListener("input", () => {
	        if (isValidAddress()) {
	            elAddressMessage.classList.add('hide');
	        } else {
	            elAddressMessage.classList.remove('hide');
	        }
	    });

	   	// 주소 유효성 검사
	    elInputAddress.addEventListener("input", () => {
	        if (isValidAddress()) {
	            elAddressMessage.classList.add('hide');
	        } else {
	            elAddressMessage.classList.remove('hide');
	        }
	    });

	   	// 상세주소 유효성 검사
	    elInputDetailAddress.addEventListener("input", () => {
	        if (isValidAddress()) {
	            elAddressMessage.classList.add('hide');
	        } else {
	            elAddressMessage.classList.remove('hide');
	        }
	    });
	    
	    
	    const elForm = document.querySelector("button[type='submit']");

		 // 폼 제출 시 유효성 검사
		 elForm.addEventListener('click', (event) => {
		     event.preventDefault(); // 폼 제출 이벤트 기본 동작 방지
	
		     // 유효성 검사 함수 호출
		     if (validateForm()) {
		         elForm.submit(); // 유효성 검사 통과 시 폼 제출
		     } else {
		         openModal('모든 필수 항목을 입력하세요.'); // 유효성 검사 통과 실패 시 알림
		     }
		 });

		 function validateForm() {
		     // 모든 필수 입력값에 대한 유효성 검사
		     return idLength(elInputId.value) &&
		         onlyNumberAndEnglish(elInputId.value) &&
		         elInputEmail.value !== "none" &&
		         strongPassword(elInputPassword.value) &&
		         isMatch(elInputPassword.value, elInputPasswordCheck.value) &&
		         isValidName(elInputName.value) &&
		         elInputNickname.value.trim() !== '' &&
		         isValidPhoneNumber(elInputPhone.value) &&
		         isValidBirthDate(elInputBirth.value) &&
		         isGenderSelected() &&
		         isValidAddress();
		 }
		 
     	// 모달 창 열기
        function openModal(message) {
            const modal = document.getElementById("myModal");
            const modalMessage = document.getElementById("modalMessage");
            modalMessage.textContent = message; // 모달 내용 설정
            modal.style.display = "block"; // 모달 보이기
        }

        // 모달 닫기 버튼 설정
        const closeBtn = document.getElementsByClassName("close")[0];
        closeBtn.onclick = function() {
            const modal = document.getElementById("myModal");
            modal.style.display = "none"; // 모달 숨기기
            
         	// 유효성 검사에 실패한 첫 번째 입력란 찾기
            const firstErrorInput = document.querySelector('.failure-message:not(.hide), .mismatch-message:not(.hide), .name-message:not(.hide), .nickname-message:not(.hide), .phone-message:not(.hide), .birth-message:not(.hide), .gender-message:not(.hide), .address-message:not(.hide)');
            
            // 유효성 검사에 실패한 첫 번째 입력란에 포커스 설정하고 스크롤 이동
            if (firstErrorInput) {
                const container = firstErrorInput.closest('.info');
                const inputField = container.querySelector('input, select');
                inputField.focus();
                
			// 입력란이 위치한 곳으로 스크롤 이동
			container.scrollIntoView({ behavior: 'smooth', block: 'center' });
            
        	}
        }

	</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>