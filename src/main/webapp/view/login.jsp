<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login - RAMIJO Restaurant</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family: 'Poppins', sans-serif;
        }

        body{
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            background:#f8f8f8;
        }

        .container{
            width:100%;
            height:100%;
            background:white;
            border-radius:25px;
            overflow:hidden;
            display: grid;
            grid-template-columns:1fr 1fr;
            box-shadow:0px 15px 35px rgba(0,0,0,0.08);
        }

        /* LEFT SIDE */

        .left-side{
            background:linear-gradient(135deg,#fff6ef,#ffe9d6);
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
            position:relative;
            padding:40px;
        }

        /* LOGO */

        .logo{
            position:absolute;
            top:35px;
            left:45px;
            display:flex;
            flex-direction:column;
        }

        .logo h1{
            font-size:34px;
            color:#ff6b00;
            font-weight:800;
            letter-spacing:2px;
        }

        .logo span{
            font-size:14px;
            color:#222;
            letter-spacing:4px;
            margin-top:-5px;
        }

        /* ILLUSTRATION */

        .illustration img{
            width:300px;
            margin-bottom:30px;
        }

        /* WELCOME TEXT */

        .welcome-text{
            text-align:center;
        }

        .welcome-text h2{
            font-size:42px;
            color:#111;
            margin-bottom:15px;
        }

        .welcome-text p{
            font-size:18px;
            color:#666;
            line-height:30px;
        }

        /* RIGHT SIDE */

        .right-side{
            display:flex;
            justify-content:center;
            align-items:center;
            background:white;
            padding:40px;
        }

        .login-box{
            width:100%;
            max-width:360px;
        }

        .login-box h2{
            font-size:38px;
            color:#111;
            margin-bottom:10px;
        }

        .login-box p{
            color:#777;
            margin-bottom:35px;
        }

        /* INPUT */

        .input-group{
            margin-bottom:22px;
        }

        .input-group label{
            display:block;
            margin-bottom:8px;
            font-weight:600;
            color:#222;
        }

        .input-group input{
            width:100%;
            padding:15px;
            border:1px solid #ddd;
            border-radius:12px;
            font-size:15px;
            transition:0.3s;
        }

        .input-group input:focus{
            outline:none;
            border-color:#ff6b00;
            box-shadow:0px 0px 5px rgba(255,107,0,0.3);
        }

        /* FORGOT PASSWORD */

        .forgot-password{
            text-align:right;
            margin-bottom:25px;
        }

        .forgot-password a{
            text-decoration:none;
            color:#ff6b00;
            font-weight:600;
            font-size:14px;
        }

        /* BUTTON */

        .login-btn{
            width:100%;
            padding:15px;
            border:none;
            border-radius:12px;
            background:#ff6b00;
            color:white;
            font-size:17px;
            font-weight:700;
            cursor:pointer;
            transition:0.3s;
        }

        .login-btn:hover{
            background:#e55f00;
        }

        /* SIGN UP */

        .signup-link{
            margin-top:25px;
            text-align:center;
            color:#666;
        }

        .signup-link a{
            text-decoration:none;
            color:#ff6b00;
            font-weight:700;
        }

    </style>
</head>

<body>

<div class="container">

    <!-- LEFT SIDE -->

    <div class="left-side">

        <!-- LOGO -->

        <div class="logo">
            <h1>RAMIJO</h1>
            <span>RESTAURANT</span>
        </div>

        <!-- IMAGE -->

        <div class="illustration">

            <!-- CHANGE IMAGE PATH -->
            <img src="/images/orange.png" alt="Restaurant Login">

        </div>

        <!-- TEXT -->

        <div class="welcome-text">

            <h2>Welcome Back!</h2>

            <p>
                Log into your account
                <br>
                and continue your food experience
            </p >

        </div>

    </div>

    <!-- RIGHT SIDE -->

    <div class="right-side">

        <div class="login-box">

            <h2>Login</h2>

            <p>Please enter your credentials</p >

            <form action="/login" method="post">

                <!-- EMAIL -->

                <div class="input-group">

                    <label>Email</label>

                    <input type="email"
                           name="email"
                           placeholder="Enter your email"
                           required>

                </div>

                <!-- PASSWORD -->

                <div class="input-group">

                    <label>Password</label>

                    <input type="password"
                           name="password"
                           placeholder="Enter your password"
                           required>

                </div>

                <!-- FORGOT PASSWORD -->

                <div class="forgot-password">

                    <a href=" ">
                        Forgot Password?
                    </a >

                </div>

                <!-- BUTTON -->

                <button type="submit" class="login-btn">
                    Login
                </button>

            </form>

            <!-- SIGN UP -->

            <div class="signup-link">

                Don’t have an account?
                <a href="signup.jsp">
                    Sign Up
                </a >

            </div>

        </div>

    </div>

</div>

</body>
</html>