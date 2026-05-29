<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .sidebar{
        width:18vw;
        height:100vh;
        background:white;
        padding:2vw;
        display:flex;
        flex-direction:column;
        justify-content:space-between;
        box-shadow:2px 0px 10px rgba(0,0,0,0.05);
    }

    .logo h1{
        color:#ff6b00;
        font-size:2.2vw;
        font-weight:800;
    }

    .logo span{
        color:#111;
        letter-spacing:0.3vw;
        font-size:0.9vw;
    }

    .nav-links{
        list-style:none;
        margin-top:3vh;
    }

    .nav-links li{
        margin-bottom:2vh;
    }

    .nav-links li a{
        text-decoration:none;
        color:#444;
        font-size:1vw;
        display:block;
        padding:1vw;
        border-radius:12px;
        transition:0.3s;
    }

    .nav-links li.active a,
    .nav-links li a:hover{
        background:#fff3e8;
        color:#ff6b00;
    }

    .logout a{
        text-decoration:none;
        color:#ff6b00;
        font-weight:600;
        font-size:1vw;
    }

</style>

<div class="sidebar">

    <!-- LOGO -->

    <div>

        <div class="logo">

            <h1>RAMIJO</h1>
            <span>RESTAURANT</span>

        </div>

        <!-- MENU -->

        <ul class="nav-links">
            <li>
                <a href="${pageContext.request.contextPath}/home">
                    🏠 Home
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/account">
                    👤 My Account
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/order">
                    📦 Orders
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/menu">
                    🍔 Menu
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/about">
                    ℹ About Us
                </a>
            </li>

        </ul>

    </div>

    <!-- LOGOUT -->

    <div class="logout">
        <a href="/logout">
            🚪 Logout
        </a>
    </div>


</div>