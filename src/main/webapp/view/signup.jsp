<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Sign Up - RAMIJO Restaurant</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins', sans-serif;
        }

        body{
            min-height:100vh;
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
            overflow-y:hidden;
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

        /* IMAGE */

        .illustration img{
            width:300px;
            margin-bottom:30px;
        }

        /* TEXT */

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

        .signup-box{
            width:100%;
            max-width:360px;
            height: auto-fit;
        }

        .signup-box h2{
            font-size:38px;
            color:#111;
            margin-bottom:10px;
        }

        .signup-box p{
            color:#777;
            margin-bottom:35px;
        }

        /* ROW */

        .row{
            display:flex;
            gap:15px;
            width:100%;
        }

        .row .input-group{
            flex:1;
        }

        /* INPUT */

        .input-group{
            width:100%;
            margin-bottom:20px;
        }

        .input-group label{
            display:block;
            margin-bottom:8px;
            font-weight:600;
            color:#222;
        }

        .input-group input{
            width:100%;
            min-width:0;
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

        /* PASSWORD RULES */

        .password-rules{
            background:#fff6ef;
            padding:15px;
            border-radius:12px;
            margin-bottom:20px;
        }

        .password-rules p{
            margin-bottom:8px;
            color:#444;
            font-size:14px;
        }

        /* CHECKBOX */

        .checkbox{
            display:flex;
            align-items:flex-start;
            margin-bottom:25px;
        }

        .checkbox input{
            margin-right:10px;
            margin-top:5px;
        }

        .checkbox label{
            color:#666;
            font-size:14px;
            line-height:24px;
        }

        .checkbox a{
            color:#ff6b00;
            text-decoration:none;
            font-weight:600;
        }

        /* BUTTON */

        .signup-btn{
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
            margin-bottom:20px;
        }

        .signup-btn:hover{
            background:#e55f00;
        }

        /* LOGIN LINK */

        .login-link{
            text-align:center;
            color:#666;
        }

        .login-link a{
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

            <img src="/images/orange.png" alt="Restaurant signup">
        </div>

        <!-- TEXT -->

        <div class="welcome-text">

            <h2>Create Account</h2>

            <p>
                Join RAMIJO Restaurant
                <br>
                and enjoy your food experience
            </p >

        </div>

    </div>

    <!-- RIGHT SIDE -->

    <div class="right-side">

        <div class="signup-box">

            <h2>Sign Up</h2>

            <p>Please enter your information</p>

            <form action="SignupServlet" method="post">

                <!-- FIRST & LAST NAME -->

                <div class="row">

                    <div class="input-group">

                        <label>First Name</label>

                        <input type="text"
                               name="firstName"
                               placeholder="Enter first name"
                               required>

                    </div>

                    <div class="input-group">

                        <label>Last Name</label>

                        <input type="text"
                               name="lastName"
                               placeholder="Enter last name"
                               required>

                    </div>

                </div>

                <!-- EMAIL -->

                <div class="input-group">

                    <label>Email</label>

                    <input type="email"
                           name="email"
                           placeholder="Enter your email"
                           required>

                </div>

                <!-- PHONE -->

                <div class="input-group">

                    <label>Phone Number</label>

                    <input type="text"
                           name="phone"
                           placeholder="Enter phone number"
                           required>

                </div>

                <!-- PASSWORD -->

                <div class="input-group">

                    <label>Password</label>

                    <input type="password"
                           name="password"
                           placeholder="Enter password"
                           required>
                </div>

                <!-- CONFIRM PASSWORD -->

                <div class="input-group">

                    <label>Confirm Password</label>

                    <input type="password"
                           name="confirmPassword"
                           placeholder="Confirm password"
                           required>

                </div>
                <!-- BUTTON -->

                <button type="submit" class="signup-btn">
                    Create Account
                </button>
                <!-- LOGIN -->

                <div class="login-link">
                    Already have an account?
                    <a href="login.jsp">
                        Login
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>