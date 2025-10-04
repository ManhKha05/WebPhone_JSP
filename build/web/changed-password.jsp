<%-- 
    Document   : changed-password
    Created on : Aug 7, 2025, 3:25:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
        body {
            font-size: 20px;
        }
        .changed {
            position: absolute;
            top: calc(50% - 150px);
            left: calc(50% - 175px);
            text-align: center;
            border: 2px solid rgb(165, 94, 106);
            border-radius: 10px;
            box-shadow: 0 0 10px rgb(173, 164, 166);
            width: 350px;
            height: 32vh;
        }  
        .inform {
            padding: 20px;
            margin: 15px auto;
            background-color: rgb(206, 206, 187);
            border-radius: 5px;
            width: 80%;
            height: 60px;
        }
        .btn-login {
            color: #fff;
            font-size: 16px;
            background-color: #5372F0;
            border: none;
            border-radius: 5px;
            margin-top: 5px;
            width: 250px;
            height: 40px;
        }
    </style>
    <form action="./login" method="get" class="changed">
        <div class="inform">
            Your password changed. Now you can login with new your password
        </div>
        <button class="btn-login">Login Now</button>
    </form>
    </body>
</html>
