<div class="sidebar">

    <div class="logo">

        <h1>RAMIJO</h1>
        <span>RESTAURANT</span>

    </div>

    <ul>

        <li>
            <a href="/admin-home">
                📊 Dashboard
            </a>
        </li>

        <li>
            <a href="/admin-menu">
                🍽 Menu Management
            </a>
        </li>

        <li>
            <a href="admin-orders">
                📦 Orders
            </a>
        </li>

        <li>
            <a href="/admin-account">
                ⚙ Account & Settings
            </a>
        </li>

    </ul>

    <a class="logout" href="../logout">
        Logout
    </a>

</div>

<style>

.sidebar{
    width:18vw;
    min-width:250px;
    background:white;
    border-right:1px solid #eee;
    display:flex;
    flex-direction:column;
}

.logo{
    padding:2vw;
}

.logo h1{
    color:#ff7a00;
    font-size:2vw;
}

.logo span{
    letter-spacing:0.4vw;
    color:#555;
}

.sidebar ul{
    list-style:none;
    padding:1vw;
}

.sidebar ul li{
    margin-bottom:1vh;
}

.sidebar ul li a{

    display:block;
    text-decoration:none;
    color:#222;

    padding:1vw;
    border-radius:12px;
    transition:0.3s;

}

.sidebar ul li a:hover{

    background:#fff4eb;
    color:#ff7a00;

}

.logout{

    margin-top:auto;
    padding:2vw;

    text-decoration:none;
    color:red;
    font-weight:bold;

}

</style>