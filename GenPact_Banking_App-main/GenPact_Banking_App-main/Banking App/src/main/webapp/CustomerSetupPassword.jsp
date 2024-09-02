<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setup Password</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style><%@include file="CSS/SetupPassword.css"%></style>
</head>
<body>
    <form class="registration-form" action="SetupPasswordServlet" method="post">
        <h2>Setup New Password</h2>
        <div class="field">
            <label for="customer-name">Account No:</label>
            <input type="text" id="customer-name" placeholder="Accout No."
                class="cname" name="accountNo" required>
        </div>
        <div class="field">
            <label for="tempPassword">Temporary Password</label>
            <input type="password" id="tempPassword" placeholder="Temporary Password" name="tempPassword" required>
        </div>
        <div class="field">
            <label for="Password">New Password</label>
            <input type="password" id="Password" placeholder="Password" name="newPassword" required>
        </div>

        <button class="create btn-primary" type="submit">Submit</button>
    </form>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>