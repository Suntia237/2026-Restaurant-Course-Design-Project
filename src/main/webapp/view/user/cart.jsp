<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    .cart-title{
        margin-bottom:2vh;
    }

    .cart-title h1{
        font-size:2vw;
        color:#222;
    }

    .cart-title p{
        color:#777;
        margin-top:1vh;
    }

    .cart-container{
        display:flex;
        gap:2vw;
    }

    /* LEFT SIDE (ITEMS) */
    .cart-items{
        flex:2;
    }

    .cart-item{
        background:white;
        border-radius:20px;
        display:flex;
        align-items:center;
        justify-content:space-between;
        padding:1.5vw;
        margin-bottom:2vh;
        box-shadow:0px 5px 20px rgba(0,0,0,0.05);
    }

    .item-left{
        display:flex;
        align-items:center;
        gap:1.5vw;
    }

    .item-left img{
        width:8vw;
        height:8vh;
        object-fit:cover;
        border-radius:15px;
    }

    .item-info h4{
        color:#222;
        font-size:1.1vw;
        margin-bottom:0.5vh;
    }

    .item-info p{
        color:#777;
        font-size:0.9vw;
    }

    .price{
        color:#ff6b00;
        font-weight:700;
        font-size:1.1vw;
    }

    .qty-control{
        display:flex;
        align-items:center;
        gap:0.5vw;
    }

    .qty-control button{
        border:none;
        background:#fff3e8;
        color:#ff6b00;
        width:2vw;
        height:2vw;
        border-radius:8px;
        cursor:pointer;
        font-weight:bold;
    }

    .qty-control span{
        font-size:1vw;
        font-weight:600;
    }

    .remove-btn{
        border:none;
        background:transparent;
        color:#ff6b00;
        font-size:1.2vw;
        cursor:pointer;
    }

    /* RIGHT SIDE (SUMMARY) */
    .cart-summary{
        flex:1;
        background:white;
        border-radius:20px;
        padding:2vw;
        box-shadow:0px 5px 20px rgba(0,0,0,0.05);
        height:fit-content;
    }

    .cart-summary h3{
        margin-bottom:2vh;
        color:#222;
    }

    .summary-line{
        display:flex;
        justify-content:space-between;
        margin-bottom:1.5vh;
        color:#666;
    }

    .total-line{
        display:flex;
        justify-content:space-between;
        font-weight:700;
        color:#222;
        margin-top:2vh;
        font-size:1.2vw;
    }

    .checkout-btn{
        width:100%;
        margin-top:2vh;
        padding:1vw;
        border:none;
        background:#ff6b00;
        color:white;
        font-weight:600;
        border-radius:12px;
        cursor:pointer;
        transition:0.3s;
    }

    .checkout-btn:hover{
        background:#e85f00;
    }

    .empty-cart{
        text-align:center;
        color:#777;
        padding:3vw;
    }

</style>

<!-- PAGE CONTENT -->

<div class="cart-title">

    <h1>🛒 My Cart</h1>

    <p>Review your items before placing your order</p>

</div>

<div class="cart-container">

    <!-- LEFT: ITEMS -->
    <div class="cart-items">

        <c:if test="${empty cartItems}">
            <div class="empty-cart">
                Your cart is empty 🍽
            </div>
        </c:if>

        <c:forEach var="item" items="${cartItems}">

            <div class="cart-item">

                <div class="item-left">

                    <img src="/images/${item.menu.img_url}" alt="food">

                    <div class="item-info">

                        <h4>${item.menu.menu_name}</h4>

                        <span class="price">
                            ${item.menu.price} RMB
                        </span>

                    </div>

                </div>

                <!-- QUANTITY -->
                <form method="post" action="/cart" class="qty-control">

                    <input type="hidden"
                           name="menuId"
                           value="${item.menu.menu_id}">

                    <button name="action"
                            value="subtract">-</button>

                    <span>${item.quantity}</span>

                    <button name="action"
                            value="add">+</button>

                </form>

                <!-- REMOVE -->
                <form action="/cart" method="post">
                    <input type="hidden" name="menuId" value="${item.menu.menu_id}">
                    <button
                        name="action"
                        value="remove"
                        class="remove-btn">Remove</button>
                </form>

            </div>

        </c:forEach>

    </div>

    <!-- RIGHT: SUMMARY -->
    <div class="cart-summary">

        <h3>Order Summary</h3>

        <hr>

        <div class="total-line">
            <span>Total</span>
            <span>${total} RMB</span>
        </div>

        <form action="/payment" method="post">
            <button class="checkout-btn">
                Place Order
            </button>
        </form>

    </div>

</div>