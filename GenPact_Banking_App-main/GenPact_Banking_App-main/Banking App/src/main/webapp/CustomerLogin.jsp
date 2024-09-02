<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Helvetica+Neue&display=swap" rel="stylesheet" />
    <style><%@include file="CSS/CustomerLogin.css"%></style>
    <title>Customer Account Login</title>
</head>

<body class="page">


    <form class="form-control" action="LoginServlet" method="post">
        <p class="title">Customer Login</p>
        <div class="input-field">
            <input required="" class="input" type="text" name="accountNo"/>
            <label class="label" for="input">Enter Account Number</label>
        </div>
        <div class="input-field">
            <input required="" class="input" type="password" name="password"/>
            <label class="label" for="input">Enter Password</label>
        </div>
        <a class="forgorp" href="" >Forgot your password?</a>
        <button class="submit-btn" type="submit">Sign In</button>
        <div class="admin">
            <a href="AdminLogin.jsp" class="shift">Login as Admin</a>
            </div>
    </form>
    
</body>



</html>