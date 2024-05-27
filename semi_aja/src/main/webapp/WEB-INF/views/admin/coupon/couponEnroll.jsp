<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 등록</title>
</head>
<style>
	body {
	    font-family: Arial, sans-serif;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    height: 100vh;
	    margin: 0;
	    background-color: #f4f4f4;
	}
	
	.container {
	    width: 500px;
	    height: 500px;
	    background-color: white;
	    padding: 20px;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    text-align: center;
	}
	
	h1 {
	    font-size: 24px;
	    margin-bottom: 20px;
	}
	
	label {
	    display: block;
	    margin: 10px 0 5px;
	    font-weight: bold;
	}
	
	input[type="text"],
	input[type="number"] {
	    width: calc(100% - 22px);
	    padding: 10px;
	    margin-bottom: 20px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	}
	
	button {
	    padding: 10px 20px;
	    background-color: #007BFF;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	}
	
	button:hover {
	    background-color: #0056b3;
	}
</style>
<body>
    <div class="container">
        <h1>쿠폰 등록</h1>
        <form action="<%=request.getContextPath() %>/coupon/couponenrollend.do" method="post">
            <label for="couponName">쿠폰명:</label>
            <input type="text" id="couponName" name="couponName" required>
            <label for="couponSale">할인율:</label>
            <input type="number" id="couponSale" name="couponSale" required min="0" max="100">
            <button type="submit">등록</button>
        </form>
    </div>
</body>
</html>