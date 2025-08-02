# 화장품 쇼핑몰 웹사이트

<br>
<br>

![main](https://github.com/user-attachments/assets/f9b87fc4-dbc3-4703-b7c9-1634106807dd)

<br>
<br>

### 소비자와 판매자를 위한 통합 쇼핑 플랫폼

> Java & JSP 기반으로 구현한 화장품 쇼핑몰 웹사이트입니다.  
> 소비자는 다양한 상품을 검색하고 구매할 수 있고,  
> 관리자는 상품 및 주문, 회원, 게시판 등을 관리할 수 있습니다.

<br>


## 🗂️ 목차

1. [Overview](#-overview)
2. [주요 기능](#-주요-기능)
3. [서비스 화면](#-서비스-화면)
4. [개발 환경](#-개발-환경)
5. [기획 및 설계 산출물](#-기획-및-설계-산출물)

<br>

## ✨ Overview

- 개발 인원 : 5명  
- 개발 기간 : 24.04 ~ 24.06
- 주요 기술 : Java, JSP, Oracle, JavaScript, jQuery, Ajax  
- 목적 : 실제 운영 가능한 쇼핑몰 서비스 설계 및 구현  

<br>


## 🔧 주요 기능

| 분류 | 기능 요약 |
|------|-----------|
| 회원 기능 | 일반 회원가입/로그인, 카카오 소셜 로그인, 마이페이지, 비밀번호 확인 후 정보 수정 |
| 쇼핑 기능 | 상품 목록/상세 보기, 장바구니, 위시리스트, 주문 및 결제 기능, 쿠폰/포인트 적용 |
| 게시판 기능 | 공지사항, FAQ, Q&A(1:1문의), 자유게시판 |
| 관리자 기능 | 회원/상품/게시판/주문 통합 관리, 상품 등록 및 배송 현황 확인 |
| 기타 | 카테고리 필터링, AJAX 기반 스크롤 페이징, API를 통한 주소 자동 입력 등 |

<br>
<br>

## 🖥️ 개발 환경

| 구분 | 내용 |
|------|------|
| 언어 | Java, JSP, SQL, HTML, CSS, JavaScript |
| 개발 도구 | Eclipse, SQL Developer, Tomcat |
| DBMS | Oracle |
| 라이브러리/기술 | jQuery, Ajax, JSON |
| 협업 도구 | Git, Notion, Figma, Illustrator |

<br>
<br>
<br>

## 🗂️ 폴더 구조

```bash
📦cosme-shop
 ┣ 📂controller                 
 ┃ ┣ AdminController.java       # 관리자 기능
 ┃ ┣ MemberController.java      # 회원가입, 로그인
 ┃ ┣ ProductController.java     # 상품 목록 및 상세
 ┃ ┣ CartController.java        # 장바구니 및 위시리스트
 ┃ ┗ OrderController.java       # 주문 / 결제

 ┣ 📂service                    
 ┃ ┣ AdminService.java
 ┃ ┣ MemberService.java
 ┃ ┣ ProductService.java
 ┃ ┣ CartService.java
 ┃ ┗ OrderService.java

 ┣ 📂dao                        
 ┃ ┣ AdminDAO.java
 ┃ ┣ MemberDAO.java
 ┃ ┣ ProductDAO.java
 ┃ ┣ CartDAO.java
 ┃ ┗ OrderDAO.java

 ┣ 📂vo                        
 ┃ ┣ MemberVO.java
 ┃ ┣ ProductVO.java
 ┃ ┣ OrderVO.java
 ┃ ┣ CartVO.java
 ┃ ┗ BoardVO.java

 ┣ 📂webapp
 ┃ ┣ 📂css
 ┃ ┃ ┗ style.css
 ┃ ┣ 📂product
 ┃ ┃ ┣ productDetail.jsp
 ┃ ┃ ┣ productList.jsp
 ┃ ┃ ┣ productqna.jsp
 ┃ ┃ ┗ productreview.jsp
 ┃ ┣ 📂qna
 ┃ ┃ ┣ qna.jsp
 ┃ ┃ ┣ qnaUpdate.jsp
 ┃ ┃ ┣ qnaView.jsp
 ┃ ┃ ┗ qnaWrite.jsp
 ┃ ┣ 📂wishlist
 ┃ ┃ ┗ wishlist.jsp
 ┃ ┣ 📂testview
 ┃ ┃ ┣ cartInfoHtml.jsp
 ┃ ┃ ┣ cartview.jsp
 ┃ ┃ ┣ gocart.jsp
 ┃ ┃ ┗ payment.jsp
 ┃ ┣ index.jsp
 ┃ ┗ web.xml
```
<br>
<br>
<br>

## 📐 기획 및 설계 산출물

### 📌 [ERD 설계 바로가기](https://www.erdcloud.com/d/qrG6povgeePhaRyWJ)

![erd](https://github.com/user-attachments/assets/f59fc487-4a78-42e0-8ebd-b90c9bd5a0d0)

<br>
<br>
<br>

---

## 👀 서비스 화면

### 🔹 메인화면

- 메뉴 및 로고 클릭 시 해당 기능으로 이동  
- 로그인 필요 기능 클릭 시 로그인 화면으로 이동  
<img src="https://github.com/user-attachments/assets/7922d83e-067f-4a0b-a289-aaab02099600" width="80%"/>
<img src="https://github.com/user-attachments/assets/d9be6ffc-8c30-4944-a431-14c71224840e" width="80%"/>



### 🔹 회원가입 & 로그인

- 카카오 소셜 로그인 / 일반 로그인  
- 회원정보 수정 시 비밀번호 확인 필요  
<img src="https://github.com/user-attachments/assets/65509433-6005-4a97-8cf4-6fed21842d46" width="30%"/>
<img src="https://github.com/user-attachments/assets/553b835b-0623-4217-9e38-9df089df2fc5" width="80%"/>



### 🔹 관리자 페이지

- 상품/회원/게시판/주문 통합 관리 기능  
<img src="https://github.com/user-attachments/assets/11271ce6-c1c4-4e6b-889e-cc8e8ebc5f9c" width="40%"/>
<img src="https://github.com/user-attachments/assets/53c809fc-1a20-4290-898b-c802433780a1" width="50%"/>



### 🔹 상품 목록

- 카테고리 기반 상품 출력  
- AJAX 기반 스크롤 페이징 처리  
<img src="https://github.com/user-attachments/assets/1497562e-5e58-4f11-83fa-3e3ff7151872" width="70%"/>
<img src="https://github.com/user-attachments/assets/ecfa4061-558c-44a1-a5fa-2b97285a2f23" width="70%"/>



### 🔹 주문 및 결제

- 배송지 API, 포인트/쿠폰 실시간 적용  
<img src="https://github.com/user-attachments/assets/5efa436a-93d0-49fc-b469-7626609f9cbe" width="70%"/>
<img src="https://github.com/user-attachments/assets/9cb80e2f-22f5-4fcf-9284-672609054d07" width="70%"/>



### 🔹 장바구니 & 위시리스트

- 수량 변경 시 실시간 가격 변경  
- 상품 상세 페이지 연동  
<img src="https://github.com/user-attachments/assets/d872f55e-d5d1-4a5c-8a1e-6215ca572681" width="70%"/>
<!--<img src="https://github.com/user-attachments/assets/367afb97-a3e2-40b2-a8df-fab5160c398e" width="70%"/>-->



### 🔹 게시판 (FAQ / Q&A / 공지사항)

#### ▫ FAQ
- 카테고리 필터링, 제목 기반 검색  
<!--<img src="https://github.com/user-attachments/assets/65bdb91c-63d1-48f4-bb3c-f0b8e41978bf" width="70%"/>-->
<img src="https://github.com/user-attachments/assets/45dda465-6857-424d-bebc-c35e24b245be" width="70%"/>

#### ▫ Q&A
- 회원별 1:1 문의, 관리자 답변 시스템  
<img src="https://github.com/user-attachments/assets/157c1b93-fd78-4df2-9cee-fbde5e1e92c3" width="70%"/>
<img src="https://github.com/user-attachments/assets/f6b85db4-30ee-4984-822c-fe7f7f8b639b" width="70%"/>

<br>
<br>
<br>
<br>

---


## 📝 정리하며

- 프로젝트를 통해 웹 애플리케이션 전반 구조(회원, 상품, 주문, 게시판, 관리자 등)를 직접 설계하고 구현하며 전반적인 백엔드 로직에 대한 실무 감각을 키울 수 있었습니다.
- 실시간 처리와 사용자 편의성을 고려한 프론트 연동 로직도 중요하게 반영했습니다.
