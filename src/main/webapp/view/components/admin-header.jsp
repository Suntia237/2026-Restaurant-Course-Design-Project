<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">

    <div class="header-left">
        <h2>
        👋 Welcome Admin
        </h2>
    </div>

    <div class="header-right">

        <img src="/images/orange.jpg">

        <div>
            <strong>RAMIJO ADMIN</strong>
            <p>Administrator</p>
        </div>

    </div>

</div>

<style>
    .header{
        width:100%;
        height:10vh;
        background:white;
        display:flex;
        justify-content:space-between;
        align-items:center;
        padding:0 2vw;
        box-shadow:0px 2px 10px rgba(0,0,0,0.05);
    }

    .header-left h2{
        font-size:1.4vw;
        color:#222;
    }

    .header-right{
        display:flex;
        align-items:center;
        gap:2vw;
    }

    .notification{
        font-size:1.4vw;
        cursor:pointer;
    }

    .profile{
        display:flex;
        align-items:center;
        gap:1vw;
    }

    .profile img{
        width:3vw;
        height:3vw;
        border-radius:50%;
        object-fit:cover;
    }

    .profile span{
        font-size:1vw;
        font-weight:600;
    }

</style>