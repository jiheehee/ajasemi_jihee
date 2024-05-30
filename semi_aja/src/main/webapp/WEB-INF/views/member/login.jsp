<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	// Cookie 가저오기
	Cookie[] cookies = request.getCookies();
	String saveId =null;
	String custEmail;
	String custEmailId=null;
	String domainEmail=null;
	
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId = c.getValue();
			/* 	custEmailId=saveId.substring(0,saveId.indexOf("@"));
				domainEmail=saveId.substring(saveId.indexOf("@")); */
				break;
			}
		}
	}
%>
    <style>
        .my-element{
            min-width: 800px;

        }
        .login-container {
       		margin-top:70px !important;
       		margin-bottom:70px !important;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 600px;
            height: 500px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }
        .login-container h3 {
        	margin-top:35px;
            margin-bottom: 40px;
            text-align: center;
        }
        .input {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        .login-box {
            display: flex;
            flex-direction: column;
            width: 400px;
            /* border: 1px solid red; */
        }
        .login-box input,
        .login-box select#emailDomain {
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[name='custEmail'] {
            flex: 2;
        }

        select#emailDomain {
            flex: 1;
        }

        input[name='custPw'] {
            flex: 2;
        }

        .input-group i {
            cursor: pointer;
            /* 스타일 추가 */
        }
        .login-window{
            width: 100%;
            background-color: black;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        /* .login-window>.apricot-login{
            border: 1px solid blue;
            padding-top: 30px;
            text-align: center;
            width: 640px;
            box-sizing: border-box;
            margin: 0px auto;
        } */
        #loginEtc {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 5px;
            margin-bottom: 30px;
            font-size: 11px;
        }
        #loginEtc > div {
            display: flex;
            align-items: center;
        }
        #loginEtc p {
            margin: 0 10px;
           	cursor: pointer;
        }
        button{
            width: 100%;
            height: 40px;
        }
        /* .saveId{
            border: 1px solid salmon;
        } */
        input[id="saveId"]{
            position: relative;
            top: 2.5px;
        }
        label[for="saveId"]{
            position: relative;
            top: -2.5px;
        }
        #kakao-login{
            margin-top: 30px;
        }
        
        /* button#kakao {
		  padding: 15px 30px;
		  font-size: 18px;
		  font-weight: bold;
		  color: #3C1E1E;
		  background-color: #F7E600;
		  border: none;
		  border-radius: 5px;
		  cursor: pointer;
		  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		  transition: background-color 0.3s, transform 0.3s;
		}
		
		button#kakao:hover {
		  background-color: #E5C700;
		  transform: translateY(-2px);
		}
		
		button#kakao:active {
		  background-color: #CBA400;
		  transform: translateY(0);
		} */
		div#pwBox input, div#idBox input {
	    	border: none;
		    border-bottom: 1px solid black;
		    outline: none;
		    font-size : 12.5px;
		    padding-left: 8px;
	    }
	    button[type='button'], button[type='submit']{
   		font-size: 10px;
   		background-color: black;
   		color: rgb(235, 235, 235);
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
	        width: 35%; /* 모달 너비 */
	    }

	    /* 모달 닫기 버튼 스타일 */
	    .close {
	        color: #aaa;
	        float: right;
	        font-size: 28px;
	        font-weight: bold;
	    }
	
	    .close:hover,
	    .close:focus {
	        color: black;
	        text-decoration: none;
	        cursor: pointer;
	    }
	</style>
    <section>
    <div class="login-window">
        <!-- <div class="apricot-login">
            <h2>Apricot 로그인</h2>
        </div> -->
        <div class="login-container">
            <h3>Apricot Login</h3>
            <div class="login-box">
            <form action="<%=request.getContextPath() %>/member/loginend.do" method="POST" onSubmit ="return isValid()" >
                <div class="input" id="idBox">
                	<input type="text" name="custEmail" placeholder="이메일을 입력하세요." value="<%=saveId!=null?saveId:"" %>">
                   <%--  <input type="text" name="custEmailId" placeholder="Email_Id" value="<%=saveId!=null?custEmailId:"" %>">
                    <select id="emailDomain" name="emailDomain">
                        <option value="none">이메일선택</option>
                        <option value="@naver.com" <%=saveId!=null&&domainEmail.equals("@naver.com")?"selected":"" %>> @ naver.com</option>
                        <option value="@daum.net" <%=saveId!=null&&domainEmail.equals("@daum.net")?"selected":"" %>> @ daum.net</option>
                        <option value="@gmail.com" <%=saveId!=null&&domainEmail.equals("@gmail.com")?"selected":"" %>> @ gmail.com</option>
                    </select> --%>
                </div>
                <div id="idValidContainer"></div>
                <div class="input" id="pwBox">
                    <input type="password" name="custPw" placeholder="Password">
                </div>
                <div id="loginEtc">
                    <div class="saveId" style="margin-left:5px;">
                        <label for="saveId">
                        <input type="checkbox" name="saveId" id="saveId" <%=saveId!=null?"checked":""%>>
                        아이디 저장
                        </label>
                    </div>
                    <div style="margin-left:auto;">
                        <p>아이디 찾기</p>
                        <p>비밀번호 찾기</p>
                        <p onclick="signUp();">회원가입</p>
                    </div>
                </div>
                <div>
                    <button type="submit" onclick="login();">LOGIN</button>
                </div>
                <div id="kakao-login">
                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=cb27b0d18235587769af0f402ac2e929&redirect_uri=http://14.36.141.71:10079/GDJ79_semi_aja_semi/member/kakaologin.do&response_type=code">
                    	<button type="button">KAKAO LOGIN</button>
                    </a>
                </div>
            </form>
            </div>
        </div>
    </div>
    <!-- 모달 HTML -->
	<div id="myModal" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <p id="modalMessage">아이디 또는 패스워드를 입력하세요.</p>
	    </div>
	</div>
    </section>
    <script>
    
    	const signUp =()=>{
    		location.assign("<%=request.getContextPath()%>/member/signup.do");
    	};
    	// 로그인 버튼 클릭시 프론트에서 js 로 처리해야 할 것 : 유효성 검사, 사용자에게 간단한 오류알림 등
        const isValid = () => {
            const custEmail = $("input[name='custEmail']").val();
            const custPw = $("input[name='custPw']").val();
            
           	if(custEmailId.trim()===''|| custPw.trim()=== '') {
           		// 아이디나 패스워드를 입력하지 않고 로그인 버튼 클릭 시, 자바스크립트로 프론트에서 걸러줌.
           	 	openModal("아이디 또는 패스워드를 입력하세요.");
           		return false;
           	} 
           	
           	if(!custEmail.contains("@") || !custEmail.contains(".")){
           		openModal("아이디 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.");
           		return false;
           	}
           	
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
        }

    </script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

