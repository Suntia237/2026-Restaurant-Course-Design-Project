<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    .menu-header{
        margin-bottom:3vh;
    }

    .menu-header h1{
        font-size:2vw;
        color:#222;
        margin-bottom:1vh;
    }

    .menu-header p{
        color:#777;
    }

    .category-section{
        margin-bottom:4vh;
    }

    .category-header{
        display:flex;
        justify-content:space-between;
        align-items:center;
        margin-bottom:2vh;
    }

    .category-header h2{
        color:#222;
        font-size:1.5vw;
    }

    .category-header a{
        text-decoration:none;
        color:#ff6b00;
        font-weight:600;
        font-size:0.9vw;
    }

    .menu-grid{
        display:grid;
        grid-template-columns:repeat(4,1fr);
        gap:1.5vw;
    }

    .menu-card{
        background:white;
        border-radius:20px;
        overflow:hidden;
        box-shadow:0px 5px 20px rgba(0,0,0,0.05);
        transition:0.3s;
    }
    .selected-btn{
        background:#ff6b00;
        color:white;
    }

    .selected-btn:hover{
        background:#e65f00;
        color:white;
    }

    .menu-card:hover{
        transform:translateY(-5px);
    }

    .menu-card img{
        width:100%;
        height:22vh;
        object-fit:cover;
    }

    .menu-content{
        padding:1vw;
    }

    .menu-content h5{
        color:#222;
        margin-bottom:0.8vh;
        font-size:1.1vw;
    }

    .menu-content p{
        color:#777;
        font-size:0.85vw;
        min-height:5vh;
    }

    .menu-footer{
        display:flex;
        justify-content:space-between;
        align-items:center;
        margin-top:1.5vh;
    }

    .price{
        color:#ff6b00;
        font-weight:700;
        font-size:1.1vw;
    }

    .add-btn{
        width:2vw;
        height:2vw;
        border:none;
        border-radius:50%;
        background:#fff3e8;
        color:#ff6b00;
        font-size:1vw;
        cursor:pointer;
        font-weight:bold;
    }

    .add-btn:hover{
        background:#ff6b00;
        color:white;
    }

</style>

<!-- PAGE HEADER -->

<div class="menu-header">

    <h1>🍽 Our Menu</h1>

    <p>
        Discover our selection of delicious dishes prepared with fresh ingredients.
    </p>

</div>

<div class="category-section">
    <div class="category-header">
        <h2>🥗 Dishes</h2>
    </div>
    <div class="menu-grid">
        <c:forEach var="dish" items="${dishes}">
            <div class="menu-card">
                <img src="/images/${dish.img_url}"
                     alt="${dish.menu_name}">
                <div class="menu-content">
                    <h5>${dish.menu_name}</h5>
                    <div class="menu-footer">
                        <span class="price">
                            ${dish.price} RMB
                        </span>
                        <form action="/add-to-cart" method="post">

                            <input type="hidden"
                                   name="menuId"
                                   value="${dish.menu_id}">

                            <button type="submit"
                                    class="add-btn ${dish.inCart ? 'selected-btn' : ''}">

                                ${dish.inCart ? '✓' : '+'}

                            </button>

                        </form>
                    </div>

                </div>

            </div>

        </c:forEach>

    </div>

</div>

<!-- DRINKS -->

<div class="category-section">

    <div class="category-header">

        <h2>🥤 Drinks</h2>
    </div>

    <div class="menu-grid">

        <c:forEach var="drink" items="${drinks}">

            <div class="menu-card">

                <img src="/images/${drink.img_url}"
                     alt="${drink.menu_name}">

                <div class="menu-content">

                    <h5>${drink.menu_name}</h5>

                    <div class="menu-footer">

                        <span class="price">
                            ${drink.price} RMB
                        </span>

                        <button class="add-btn ${drink.inCart ? 'selected-btn' : ''}">
                            ${drink.inCart ? '✓' : '+'}
                        </button>

                    </div>

                </div>

            </div>

        </c:forEach>

    </div>
    <a href="/cart">Check cat</a>

</div>