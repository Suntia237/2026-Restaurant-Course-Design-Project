<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    /* PAGE HEADER */

    .page-header{
        margin-bottom:3vh;
    }

    .page-header h1{
        font-size:2vw;
        color:#222;
        margin-bottom:0.5vh;
    }

    .page-header p{
        color:#777;
    }

    /* STATS */

    .stats-container{
        display:flex;
        gap:2vw;
        margin-bottom:3vh;
    }

    .stats-card{
        flex:1;
        background:white;
        padding:2vw;
        border-radius:20px;
        box-shadow:0px 5px 20px rgba(0,0,0,0.05);
    }

    .stats-card h2{
        color:#ff6b00;
        font-size:2.5vw;
        margin-bottom:1vh;
    }

    .stats-card p{
        color:#777;
    }

    /* CONTENT LAYOUT */

    .content-wrapper{
        display:flex;
        flex-direction: column;
        gap:2vw;
    }

    .menus-section{
        flex:3;
    }

    .categories-section{
        flex:1;
    }

    /* MENU GRID */

    .menu-grid{
        display:grid;
        grid-template-columns:repeat(auto-fill,minmax(200px,1fr));
        gap:2vw;
    }

    .menu-card{
        background:white;
        border-radius:20px;
        overflow:hidden;
        box-shadow:0px 5px 20px rgba(0,0,0,0.05);
        transition:0.3s;
    }

    .menu-card:hover{
        transform:translateY(-5px);
    }

    .menu-card img{
        width:100%;
        height:220px;
        object-fit:cover;
    }

    .menu-info{
        padding:1vw;
    }

    .menu-info h4{
        color:#222;
        margin-bottom:1vh;
    }

    .menu-info p{
        color:#777;
        margin-bottom:1vh;
        font-size:0.9vw;
    }

    .price{
        color:#ff6b00;
        font-weight:700;
        font-size:1.1vw;
    }

    /* ACTIONS */

    .menu-actions{
        display:flex;
        justify-content:space-between;
        padding:1vw;
        border-top:1px solid #eee;
    }

    .menu-actions a{
        text-decoration:none;
        background:#ff6b00;
        color:white;
        padding:0.6vw 1vw;
        border-radius:10px;
        font-size:0.8vw;
        transition:0.3s;
    }

    .menu-actions a:hover{
        background:#e45f00;
    }

    /* CATEGORY CARD */

    .category-card{
        background:white;
        border-radius:20px;
        padding:2vw;
        box-shadow:0px 5px 20px rgba(0,0,0,0.05);
    }

    .category-card h3{
        color:#222;
        margin-bottom:2vh;
    }

    .category-item{
        display:flex;
        justify-content:space-between;
        padding:1vh 0;
        border-bottom:1px solid #eee;
    }

    .category-item span:first-child{
        color:#555;
    }

    .category-item span:last-child{
        background:#f3f3f3;
        padding:0.3vh 0.8vw;
        border-radius:20px;
        color:#777;
        font-size:0.8vw;
    }

    .category-section {
        flex: 1;
        margin-bottom: 2vh;
    }

    .category-header {
        margin-bottom: 2vh;
        padding-bottom: 1vh;
        border-bottom: 2px solid #ff6b00;
    }

    .category-header h2 {
        color: #222;
        font-size: 1.5vw;
    }

    /* RESPONSIVE */

    @media(max-width:992px){

        .content-wrapper{
            flex-direction:column;
        }

        .stats-container{
            flex-direction:column;
        }

        .page-header h1{
            font-size:30px;
        }

        .stats-card h2{
            font-size:32px;
        }

        .menu-info p,
        .price,
        .menu-actions a,
        .category-item span:last-child,
        .search-box input{
            font-size:14px;
        }

        /* FIXED: Added responsive styles for category-header */
        .category-header h2 {
            font-size: 20px;
        }
    }

    /* Style pour le bouton Add Menu */
    .add-menu-btn {
        background-color: #4CAF50;
        color: white;
        padding: 0.8vw 1.5vw;
        border-radius: 10px;
        text-decoration: none;
        font-size: 0.9vw;
        transition: background 0.3s;
        display: inline-block;
    }

    .add-menu-btn:hover {
        background-color: #45a049;
    }

</style>

<!-- PAGE HEADER -->

<div class="page-header">

    <h1>Menu Management</h1>

    <p>
        Manage restaurant menus and categories.
    </p>

</div>

<!-- BUTTON ADD MENU -->
<div style="margin-bottom:3vh; display:flex; justify-content:flex-end;">
    <a href="${pageContext.request.contextPath}/addMenu" class="add-menu-btn">+ Add Menu</a>
</div>

<!-- STATS -->

<div class="stats-container">

    <div class="stats-card">

        <h2>${totalMenus}</h2>

        <p>Total Menus</p>

    </div>

    <div class="stats-card">

        <h2>${totalDishes}</h2>

        <p>Dishes</p>

    </div>

    <div class="stats-card">

        <h2>${totalDrinks}</h2>

        <p>Drinks</p>

    </div>

</div>

<!-- CONTENT -->

<div class="content-wrapper">

    <!-- DISHES SECTION - FIXED: Changed from category-section to menus-section -->
    <div class="menus-section">
        <div class="category-header">
            <h2>🍽️ Dishes</h2>
        </div>

        <div class="menu-grid">
            <c:forEach var="dish" items="${dishes}">
                <div class="menu-card">
                    <img src="/images/${dish.img_url}"
                         alt="${dish.menu_name}">
                    <div class="menu-info">
                        <h4>${dish.menu_name}</h4>
                        <span class="price">${dish.price} RMB</span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- DRINKS SECTION - FIXED:-->
    <div class="menus-section">
        <div class="category-header">
            <h2>🥤 Drinks</h2>
        </div>

        <div class="menu-grid">
            <c:forEach var="drink" items="${drinks}">
                <div class="menu-card">
                    <img src="/images/${drink.img_url}"
                         alt="${drink.menu_name}">
                    <div class="menu-info">
                        <h4>${drink.menu_name}</h4>
                        <span class="price">${drink.price} RMB</span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</div>