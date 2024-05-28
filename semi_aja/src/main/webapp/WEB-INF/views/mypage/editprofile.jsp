<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/header.jsp"%>

 <style>
 	.errormessage{
 		font-size: 10px;
 		text-align: center;
 		padding-top:0;
 		margin-top:0;
 		margin-bottom : 50px;
 		color: red;
 		
 	}
 	.inputsize{
 		width: 300px;
    }
	.profileInput{
	    display: flex;
	    flex-direction: row;
	    width: 400px;
	    margin-bottom: 42px;
	}
	.profilefont{
	    font-size: 12px;
	    width: 100px;
	    height: 22px;
	    text-align: center;
	    display: flex;
	    align-items: center;
	}
	.profileInput>input{
	    width: 61%;
	}
	.profileInput>input,
	.profileInput>select {
	    border: none;
	    border-bottom: 1px solid black;
	    outline: none;
	    font-size : 12.5px;
	    padding-left: 8px;
	}
	select {
	    width: 17%;
	    border: none;
	    border-bottom: 1px solid black;
	    outline: none;
	    appearance: none; /* 기본 화살표 제거 */
	}
	#editprofile-container{
	    width: 400px;
	    display: flex;
	    flex-direction: column;
	    align-items: start;
	}
	#editprofile-text{
	    display: flex;
	    flex-direction: column;
	    align-items: start;
	}
	#editorprofile-text div{
	    text-align: left;
	}
	div#editprofile {
	   display: flex;
	   flex-direction: column;
	   align-items: center; 
	   margin-top: 70px;
	   margin-bottom: 150px;
	}
	/* 라디오 버튼을 숨기고 커스텀 체크박스 스타일 적용 */
	.custom-radio {
	    display: none;
	}
	.custom-label {
	    display: inline-block;
	    width: 9px;
	    height: 9px;
	    border: 2px solid black;
	    border-radius: 3px;
	    position: relative;
	    cursor: pointer;
	    margin-right: 10px;
	}
	.custom-label::after {
	    content: '';
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 12px;
	    height: 12px;
	    background-color: black;
	    transform: translate(-50%, -50%) scale(0);
	    transition: transform 0.2s ease-in-out;
	    border-radius: 2px;
	}
	.custom-radio:checked + .custom-label::after {
	    transform: translate(-50%, -50%) scale(0.5);
	}
	/* 성별 옵션 간격 조절 */
	.gender-option {
	    display: flex;
	    align-items: center;
	    margin-right: 20px; /* 각 성별 옵션 사이의 간격 설정 */
	}
	.gender-option input[type="radio"] {
    margin-right: 5px; /* 라디오 버튼과 라벨 사이의 간격 설정 */
	}
	
	.button-container {
        display: flex;
        justify-content: center;
        width: 100%;
        margin-top: 20px;
    }
    .button-container button {
        margin: 0 10px;
        font-size : 10.5px;
        background-color: black;
        color: rgb(235, 235, 235);
       	
    }
   	p{
   		font-size: 12.5px;
   		position : relative;
   		top: 7.0px;
   	}
   	input[type='button']{
   		font-size: 8px;
   		background-color: black;
   		color: rgb(235, 235, 235);
   		
   	}
</style>

<section>
    <div id="editprofile">
        <div id="editprofile-container">
            <div id="editprofile-text">
                <div style="height: 100px;"><h5>회원정보 수정</h5></div>
                <div style="height: 80px;"><h6>INFORMATION</h6></div>
            </div>
       
            <div id="profileId" class="profileInput">
                <div class="profilefont">아이디</div>
                <input type="text" name="custEmail" value="<%=loginMember.getCustEmail()%>" readonly>
            </div>
            <div class="errormessage"></div>
            <div id="new-profilePw" class="profileInput">
                <div class="profilefont">새 비밀번호</div>
                <input type="password" name="custPw" id="newPassword">
            </div>
            <div id="passwordMessage" class="errormessage"></div>
            <div id="newPwCheck"></div>
            <div id="new-profilePw-check" class="profileInput">
                <div class="profilefont">새 비밀번호 확인</div>
                <input type="password" name="custPwCheck" id="newPasswordCheck">
            </div>
            <div id="passwordCheckMessage" class="errormessage"></div>
            <div id="profileName" class="profileInput">
                <div class="profilefont">이름</div>
                <input type="text" name="custName" value="<%=loginMember.getCustName()%>" id="custName">
            </div>
            <div id="nameMessage" class="errormessage"></div>
            <div id="profileNickname" class="profileInput">
                <div class="profilefont">닉네임</div>
                <input type="text" name="custNickname" value="<%=loginMember.getCustNickname()%>">
            </div>
            <div id="nicknameMessage" class="errormessage"></div>
            <div id="profilePhone" class="profileInput">
                <div class="profilefont">전화번호</div>
                <select name="phone-first" id="phone-first">
                    <option value="010" <%=loginMember.getCustPhone().substring(0,3).equals("010") ? "selected":""%>>010</option>
                    <option value="011" <%=loginMember.getCustPhone().substring(0,3).equals("011") ? "selected":""%>>011</option>
                    <option value="016" <%=loginMember.getCustPhone().substring(0,3).equals("016") ? "selected":""%>>016</option>
                    <option value="017" <%=loginMember.getCustPhone().substring(0,3).equals("017") ? "selected":""%>>017</option>
                    <option value="018" <%=loginMember.getCustPhone().substring(0,3).equals("018") ? "selected":""%>>018</option>
                    <option value="019" <%=loginMember.getCustPhone().substring(0,3).equals("019") ? "selected":""%>>019</option>
                </select>
                <input type="text" name="phone-second" value="<%=loginMember.getCustPhone().substring(3,7) %>" style="width: 20%; margin-left: 5px; margin-right: 5px;">
                <input type="text" name="phone-last" value="<%=loginMember.getCustPhone().substring(7) %>" style="width: 20%;">
            </div>
            <div id="phoneMessage" class="errormessage"></div>
            <div id="profileBirth" class="profileInput">
               <div class="profilefont">생년월일</div>
               <input type="date" name="custBirth" value=<%=loginMember.getCustBirth() %>>
            </div>
            <div class="errormessage"></div>
            <div id="profileGender" class="profileInput">
                <div class="profilefont">성별</div>
                <div class="gender-option">
                    <input type="radio" id="female" name="custGender" value="F" class="custom-radio" <%=loginMember.getCustGender().equals("F")?"checked":"" %> onclick="return false">
                    <label for="female" class="custom-label"></label><p>Female</p>
                </div>
                <div class="gender-option">
                    <input type="radio" id="male" name="custGender" value="M" class="custom-radio" <%=loginMember.getCustGender().equals("M")?"checked":"" %> onclick="return false">
                    <label for="male" class="custom-label"></label><p>Male</p>
                </div>
            </div>
            <div class="errormessage"></div>
         
            <div id="profileAddress" class="profileInput">
                <div class="profilefont">주소</div>
                <div class="address-content inputsize">
                    <div class="profileInput">
                        <input type="text" id="sample6_postcode" name="custPostcode" placeholder="우편번호" style="width: 45%;" value=<%=loginMember.getCustPostcode() %>>
                        <input type="button" onclick="sample6_execDaumPostcode()" value="주소찾기" style="width: 15%;">
                    </div>
                    <div class="profileInput">
                        <input type="text" id="sample6_address" name="custAddress" placeholder="주소" value="<%=loginMember.getCustAddress()%>">
                    </div>
                    <div class="profileInput">
                        <input type="text" id="sample6_detailAddress" name="custDetailAddress" placeholder="상세주소" value=<%=loginMember.getCustDetailAddress()  %>>
                    </div>
                </div>
				
            </div>
            
            <!-- 제출 !  -->
           	<div class="button-container">
           		<button onclick="edit();">회원정보수정</button>
           		<button>회원탈퇴</button>
           	</div>
        </div>
    </div>
</section>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 주소 api
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
	// 유효성 검사 
	
    // 이름 유효성 검사 (한글만 허용)
    const nameInput = document.querySelector("input[name='custName']");
    const nameMessage = document.getElementById('nameMessage');

    const nameInputChangeHandler = () => {
        const custName = nameInput.value.trim();
        const nameRegExp = /^[가-힣]+$/;
        if (!nameRegExp.test(custName)) {
            nameMessage.innerText = "이름은 한글만 입력 가능합니다.";
        } else {
            nameMessage.innerText = "";
        }
    }

    nameInput.addEventListener('input', nameInputChangeHandler);

    // 비밀번호 유효성 검사 (8글자 이상, 영문, 숫자, 특수문자 포함)
    const passwordInput = document.querySelector("input[name='custPw']");
    const passwordMessage = document.getElementById('passwordMessage');

    const passwordInputChangeHandler = () => {
        const newPassword = passwordInput.value.trim();
        const passwordRegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
        if (!passwordRegExp.test(newPassword)) {
            passwordMessage.innerText = "비밀번호는 8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 모두 포함해야 합니다.";
        } else {
            passwordMessage.innerText = "";
        }
    }

    passwordInput.addEventListener('input', passwordInputChangeHandler);

    // 비밀번호 확인 유효성 검사
    const newPasswordCheckInput = document.querySelector("input[name='custPwCheck']");
    const passwordCheckMessage = document.getElementById('passwordCheckMessage');

    const newPasswordCheckInputChangeHandler = () => {
        const newPassword = passwordInput.value.trim();
        const newPasswordCheck = newPasswordCheckInput.value.trim();
        if (newPassword !== newPasswordCheck) {
            passwordCheckMessage.innerText = "비밀번호와 비밀번호 확인이 일치하지 않습니다.";
        } else {
            passwordCheckMessage.innerText = "";
        }
    }

    newPasswordCheckInput.addEventListener('input', newPasswordCheckInputChangeHandler);

    // 전화번호 유효성 검사 (숫자만 허용, 4자리씩만 입력)
    const phoneSecondInput = document.querySelector("input[name='phone-second']");
    const phoneLastInput = document.querySelector("input[name='phone-last']");
    const phoneMessage = document.getElementById('phoneMessage');

    const phoneInputChangeHandler = () => {
       const phoneSecond = phoneSecondInput.value.trim();
       const phoneLast = phoneLastInput.value.trim();
       const phoneRegExp = /^\d{4}$/;
       if (!phoneRegExp.test(phoneSecond) || !phoneRegExp.test(phoneLast)) {
           phoneMessage.innerText = "전화번호는 숫자만 입력 가능하며, 각각 4자리씩 입력되어야 합니다.";
       } else {
           phoneMessage.innerText = "";
       }
    }
	
    phoneSecondInput.addEventListener('input', phoneInputChangeHandler);
    phoneLastInput.addEventListener('input', phoneInputChangeHandler);
    
    // 새비밀번호가 헌비밀번호랑 같은지 검사
    const newCustPwInput = document.querySelector("input[name='custPw']");
    const newCustPwCheckInput = document.querySelector("input[name='custPwCheck']");
    
    const newCustPwChangeHandler = () => {
    	const newCustPw = newCustPwInput.value.trim();
    	const newCustPwCheck = newCustPwCheckInput.value.trim();
    	if(newCustPw=='<%=loginMember.getCustPw()%>'){
    		passwordCheckMessage.innerText="현재 비밀번호와 동일한 비밀번호는 사용할 수 없습니다.";
    	} else {
    		passwordCheckMessage.innerText="";
    	}
    }
    
  	newCustPwCheckInput.addEventListener('blur', newCustPwChangeHandler);
	
</script>
<script>
	
	const edit = ()=>{
		// 인풋에 담긴 밸류를 비교해서 loginMember 랑 모두 같으면, 변경할 내용이 없는 거임 
		// 하나라도 다르면, 변경할 내용이 있음 !
		const custEmail = document.querySelector("input[name='custEmail']");
		const custName = document.querySelector("input[name='custName']");
		const custNickname = document.querySelector("input[name='custNickname']");
		const custBirth = document.querySelector("input[name='custBirth']");
		const custPhoneFirst = document.querySelector("select[name='phone-first']").value.trim();
		const custPhoneSecond = document.querySelector("input[name='phone-second']").value.trim();
		const custPhoneLast = document.querySelector("input[name='phone-last']").value.trim();
		const custPhone = custPhoneFirst + custPhoneSecond + custPhoneLast;
		const custPostcode = document.querySelector("input[name='custPostcode']").value;
		const custAddress = document.querySelector("input[name='custAddress']").value;
		const custDetailAddress = document.querySelector("input[name='custDetailAddress']").value;
		let custPw = document.querySelector("input[name='custPw']").value;
		const custPwCheck = document.querySelector("input[name='custPwCheck']").value;
	
		console.log(custPhoneFirst);
		
		const nameRegExp = /^[가-힣]+$/;
        const passwordRegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
        const phoneRegExp = /^\d{4}$/;

		// 이름 유효성, 패스워드 형식 유효성, 패스워드 확인 일치
		// 새패스워드 확인, 전화번호 유효성 검사 
		if(nameRegExp.test(custName.value.trim()) && (passwordRegExp.test(custPw.trim())||custPw.trim()=="" )
				&& custPw.trim()===custPwCheck.trim() && phoneRegExp.test(custPhoneSecond) 
				&& phoneRegExp.test(custPhoneLast) && custPw.trim()!=='<%=loginMember.getCustPw()%>'){
				
			if(custPw==''){
				custPw=null;
			}
			
			if('<%=loginMember.getCustName()%>'==custName.value && '<%=loginMember.getCustNickname()%>'== custNickname.value
					&& '<%=loginMember.getCustBirth()%>'== custBirth.value && '<%=loginMember.getCustPhone()%>'==custPhone 
					&& '<%=loginMember.getCustPostcode()%>'== custPostcode && '<%=loginMember.getCustAddress()%>'== custAddress 
					&& '<%=loginMember.getCustDetailAddress()%>' == custDetailAddress && custPw==null){
				alert('변경된 내용이 없습니다.');		
			} else {
				const sendData = {  "custEmail":custEmail.value, 
									"custName":custName.value,
									"custNickname":custNickname.value,
									"custBirth":custBirth.value,
									"custPw":custPw, 
									"custPostcode":custPostcode,
									"custAddress":custAddress,
									"custDetailAddress":custDetailAddress,
									"custPhone":custPhone};
				console.log(sendData);
				$.ajax({
					url:"<%=request.getContextPath()%>/member/editmember.do",
					type:"POST",
					data: {sendData:JSON.stringify(sendData)},
				    /* contentType: "application/x-www-form-urlencoded; charset=UTF-8",  */
				    success: function(editedCt) {
				        console.log(editedCt);
				        sessionStorage.setItem("loginMember",JSON.stringify(editedCt));
				        location.reload();
				    }
					
				});
			}
		} else {
			
			alert("제출된 정보가 유효하지 않습니다.");
		}
		
		
	}
	


</script>



<%@ include file = "/WEB-INF/views/common/footer.jsp"%>