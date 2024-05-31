<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    .full-height {
        height: 600px;
    }
    .centered-button {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <img src="<%= request.getContextPath() %>/upload/errorimage/errorpageimage.png" class="img-fluid full-height" alt="Error Image">
            </div>
        </div>
        <div class="row">
            <div class="col-12 centered-button">
                <button class="btn btn-primary" onclick="location.assign('<%= request.getContextPath() %>/main/mainview.do')">메인으로</button>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
