<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .sidebar{
        width:15%;
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
        font-size: 16px;
        font-weight:800;
    }

    .logo span{
        color:#111;
        letter-spacing: 2px;
        font-size: 10px;
    }

    .nav-links{
        list-style:none;
        margin-top: 20px;
    }

    .nav-links div{
        margin-bottom: 10px;
    }

    .nav-links div a{
        text-decoration:none;
        color: #444;
        font-size: 12px;
        display:block;
        padding: 10px;
        border-radius:12px;
        transition:0.3s;
    }

    .nav-links div.active a,
    .nav-links div a:hover{
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

        <div class="nav-links">
            <div>
                <a href="/home">
                    🏠 Home
                </a>
            </div>

            <div>
                <a href="/account">
                    👤 My Account
                </a>
            </div>

            <div>
                <a href="/order">
                    📦 Orders
                </a>
            </div>

            <div>
                <a href="/menu">
                    🍔 Menu
                </a>
            </div>

            <div>
                <a href="/about">
                    ℹ About Us
                </a>
            </div>

        </div>

    </div>

    <!-- LOGOUT -->

    <div class="logout">
        <a href="/logout">
            🚪 Logout
        </a>
    </div>


</div>