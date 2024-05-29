<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
h3{
	padding-top: 30px;
}

h3,h6 {
		padding-left:250px;
	}

body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    color: #333;
    margin: 0;
    padding: 0;
}

h1 {
    margin: 0;
    font-size: 2em;
}

main {
    padding: 20px;
}

.table-container {
    max-width: 1000px;
    margin: 20px auto;
    background-color: #fff;
    box-shadow: 0 0 15px rgba(139, 139, 139, 0.1);
    border-radius: 8px;
    overflow: hidden;
}

.qna-table {
    width: 100%;
    border-collapse: collapse;
    text-align: left;
}

.qna-table th, .qna-table td {
    padding: 15px;
    border-bottom: 1px solid #e0e0e0;
}

.qna-table th {
    background-color: #9c9898;
    color: #fff;
    text-transform: uppercase;
    font-weight: normal;
    font-size: 1em;
}

.qna-table tr:nth-child(even) {
    background-color: #f9f9f9;
}

.qna-table tr:hover {
    background-color: #f1f1f1;
}

.qna-table td {
    color: #555;
}

.qna-table td:last-child {
    text-align: center;
    font-weight: bold;
    color: #7c7c7c;
}

.qna-table th, .qna-table td {
    text-align: left;
}

.qna-table th:last-child, .qna-table td:last-child {
    text-align: center;
}

.qna-table td.answer-complete {
    color: green;
}

.qna-table td.answer-pending {
    color: red;
}


</style>

<body>
    <header>
        <h3><strong>NOTICE</strong></h3>
		<h6><strong>공지사항</strong></h6>
    </header>
    <main>
        <div class="table-container">
            <table class="qna-table">
                <thead>
                    <tr>
                        <th>상담구분</th>
                        <th>상담제목</th>
                        <th>작성일</th>
                        <th>답변유무</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>배송 문의</td>
                        <td>주문한 상품의 배송이 지연되고 있습니다. 확인 부탁드립니다.</td>
                        <td>2024-05-20</td>
                        <td>답변 완료</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </main>
</body>





<br>
<br>
<br>
<br>
<br>
<br>
<br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>