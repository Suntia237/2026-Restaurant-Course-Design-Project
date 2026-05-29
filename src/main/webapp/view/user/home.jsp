<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    .hero-section{
        width:100%;
        height:35vh;
        border-radius:25px;
        overflow:hidden;
        background-image:url('/images/restofood.png');
        background-size:cover;
        background-position:center;
        margin-bottom:3vh;
    }

    .hero-overlay{
        width:100%;
        height:100%;
        background:rgba(0,0,0,0.5);
        display:flex;
        align-items:center;
        padding-left:4vw;
    }

    .hero-text span{
        color:#ffb067;
        font-weight:600;
        letter-spacing:0.1vw;
        font-size:20px;
    }

    .hero-text h1{
        color:white;
        font-size:3vw;
        margin:1vh 0;
    }

    .hero-text p{
        color:#ddd;
        margin-bottom:2vh;
        font-size:1.2vw;
        font-weight:bold;
    }

    .hero-text button{
        padding:1vw 2vw;
        border:none;
        border-radius:12px;
        background:#ff6b00;
        color:white;
        cursor:pointer;
        font-weight:600;
        font-size:1vw;
    }

    /* CARDS */

    .cards{
        display:flex;
        gap:2vw;
        margin-bottom:2vh;
    }

    .info-card,
    .address-card{
        flex:1;
        background:white;
        padding:2vw;
        border-radius:20px;
        box-shadow:0px 5px 20px rgba(0,0,0,0.05);
    }

    .info-card h3,
    .address-card h3{
        margin-bottom:2vh;
        color:#222;
    }

    .info-card p,
    .address-card p{
        color:#666;
        line-height:2;
    }
    /* FOOD SLIDER */

    .food-slider-container{

        width:100%;

        margin-bottom:3vh;
    }

    .slider-title{
        margin-bottom:2vh;
    }

    .slider-title h2{
     font-size:2vw;
     color:#222;
    }

    .slider-title p{
        color:#777;
        margin-top:0.5vh;
     }

    .food-slider{
        width:100%;
        overflow:hidden;
        position:relative;
    }

    .food-track{
        display:flex;
        gap:2vw;
        width:max-content;
        animation:scrollFood 25s linear infinite;
    }

    .food-card{
         width:18vw;
         min-width:18vw;
         background:white;
         border-radius:20px;
         overflow:hidden;
         box-shadow:0px 5px 20px rgba(0,0,0,0.08);
         transition:0.3s;
    }

    .food-card:hover{
         transform:translateY(-0.5vh);
    }

    .food-card img{
        width:100%;
        height:22vh;
        object-fit:cover;
    }

    .food-card h3{
        padding:1vw 1vw 0.5vw 1vw;
        color:#222;
    }

    .food-card p{
        padding:0 1vw;
        color:#777;
        font-size:0.9vw;
    }

    .food-card span{
        display:block;
        padding:1vw;
        color:#ff6b00;
        font-weight:700;
        font-size:1.1vw;
    }

    @keyframes scrollFood{
         0%{
         transform:translateX(0);
    }
         100%{
         transform:translateX(-50%);
    }
    }

    /* ORDERS */

    .orders-card{
        background:white;
        padding:2vw;
        border-radius:20px;
        margin-bottom:2vh;
        box-shadow:0px 5px 20px rgba(0,0,0,0.05);
    }

    .orders-card h3{
        margin-bottom:2vh;
    }

    .order{
        display:flex;
        justify-content:space-between;
        padding:1vh 0;
        border-bottom:1px solid #eee;
    }

    /* ABOUT */

    .about-card{
        background:white;
        padding:2vw;
        border-radius:20px;
        display:flex;
        justify-content:space-between;
        align-items:center;
        box-shadow:0px 5px 20px rgba(0,0,0,0.05);
    }

    .about-text{
        width:50%;
    }

    .about-text h2{
        font-size:2vw;
        margin-bottom:2vh;
    }

    .about-text p{
        color:#666;
        margin-bottom:2vh;
        line-height:1.8;
    }

    .about-text button{
        padding:1vw 2vw;
        border:none;
        border-radius:10px;
        background:#ff6b00;
        color:white;
        cursor:pointer;
    }

    .about-card img{
        width:25vw;
        border-radius:20px;
        object-fit:cover;
    }

</style>

<!-- HERO -->

<div class="hero-section">

    <div class="hero-overlay">

        <div class="hero-text">

            <span>WELCOME TO RAMIJO</span>

            <h1>

                A Unique Culinary Experience

            </h1>

            <p>
                Delicious meals prepared with
                fresh and high quality ingredients.
            </p>

            <button>
                View Menu
            </button>

        </div>

    </div>

</div>
<!-- FOOD SLIDER -->

<div class="food-slider-container">

    <div class="slider-title">

        <h2>Popular Meals</h2>

        <p>Discover our delicious dishes</p>

    </div>

    <div class="food-slider">

        <div class="food-track">
            <c:forEach var="menu" items="${menus}">

                <div class="food-card">

                    <img src="${pageContext.request.contextPath}/images/${menu.img_url}"
                         alt="Image">

                    <h6>${menu.menu_name}</h6>
                    <p>${menu.price} FCFA<p>

                </div>

            </c:forEach>

        </div>

    </div>

</div>

<!-- INFO CARDS -->

<div class="cards">

    <div class="info-card">

        <h3>👤 Account Information</h3>

        <p><strong>Name:</strong>${user.getFirst_name()} ${user.getLast_name()}</p>
        <p><strong>Email:</strong>${user.getEmail()}</p>
        <p><strong>Phone:</strong>${user.getPhone_number()}</p>

    </div>
    <!-- ORDERS -->

    <div class="orders-card">

        <h3>📦 Pending Orders</h3>

        <div class="order">

            <p>Pizza Royale + Orange Juice</p>

            <span>25 €</span>

        </div>

        <div class="order">

            <p>Burger Classic + Fries</p>

            <span>15 €</span>

        </div>

        <div class="order">

            <p>Caesar Salad + Mineral Water</p>

            <span>12 €</span>

        </div>

    </div>

</div>



<!-- ABOUT -->

<div class="about-card">

    <div class="about-text">

        <h2>

            Our Passion,
            Your Pleasure

        </h2>

        <p>

            At RAMIJO Restaurant,
            every meal is prepared with passion,
            freshness and quality ingredients.

        </p>

        <a href="/view/about.jsp"
            <button>Learn More</button>
        </a>

    </div>

    <img src="/images/resto.png" alt="Restaurant">

</div>