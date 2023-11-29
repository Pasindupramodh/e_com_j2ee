<%-- 
    Document   : verify
    Created on : Nov 25, 2023, 10:39:11 AM
    Author     : pasin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Verification</title>
    <%@include file="css.jsp" %>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .verification-container {
            background-color: #fff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h1 {
            color: #4caf50;
            font-size: 24px;
        }

        p {
            color: #555;
            font-size: 16px;
            margin-top: 10px;
        }

        .verification-button {
            background-color: #4caf50;
            color: #fff;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        .verification-button:hover {
            background-color: #45a049;
        }

        .note {
            color: #888;
            font-size: 14px;
            margin-top: 15px;
        }
    </style>
    
</head>
<body>
    <div class="verification-container">
        <h1>Email Verification</h1>
        <p>Great news! Your account is almost ready. We've sent a verification email to your address.</p>
        <!--<button class="verification-button">Check Email</button>-->
        <br>
        <p class="note">Didn't receive the email? Please check your spam folder or <a class="gl-link" href="sendAgain"> request a new verification email.</a></p>
    </div>
</body>
</html>
