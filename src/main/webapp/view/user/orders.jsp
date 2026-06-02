<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

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

    .orders-container{
        display:flex;
        gap:2vw;
    }

    .orders-list{
        flex:3;
    }

    .orders-summary{
        flex:1;
    }

    /* ORDER CARD */

    .order-card{
        display:flex;
        align-items:center;
        justify-content:space-between;
        background:white;
        border-radius:20px;
        padding:1vw;
        margin-bottom:1.5vh;
        box-shadow:0px 5px 20px rgba(0,0,0,0.05);
        transition:0.3s;
    }

    .order-card:hover{
        transform:translateY(-3px);
    }

    .order-left{
        display:flex;
        gap:1vw;
        align-items:center;
    }

    .order-left img{
        width:100px;
        height:100px;
        border-radius:15px;
        object-fit:cover;
    }

    .order-info h4{
        color:#222;
        margin-bottom:0.5vh;
    }

    .order-info p{
        color:#777;
        font-size:0.9vw;
        margin-bottom:0.3vh;
    }

    .order-status{
        font-weight:bold;
    }

    .completed{
        color:#28a745;
    }

    .pending{
        color:#ff9800;
    }

    .cancelled{
        color:#dc3545;
    }

    .order-price{
        color:#ff6b00;
        font-weight:700;
        font-size:1.2vw;
    }

    .details-btn{
        background:#ff6b00;
        color:white;
        border:none;
        border-radius:10px;
        padding:0.8vw 1.2vw;
        cursor:pointer;
        transition:0.3s;
    }

    .details-btn:hover{
        background:#e55d00;
    }

    /* SUMMARY CARD */

    .summary-card{
        background:white;
        border-radius:20px;
        padding:2vw;
        box-shadow:0px 5px 20px rgba(0,0,0,0.05);
        position:sticky;
        top:20px;
    }

    .summary-card h3{
        margin-bottom:2vh;
        color:#222;
    }

    .summary-item{
        display:flex;
        justify-content:space-between;
        margin-bottom:1.5vh;
        color:#555;
    }

    .summary-item span:last-child{
        font-weight:bold;
    }

    .summary-total{
        border-top:1px solid #eee;
        padding-top:1.5vh;
        margin-top:1vh;
        font-size:1.1vw;
        font-weight:bold;
        color:#ff6b00;
    }

    @media(max-width:992px){

        .orders-container{
            flex-direction:column;
        }

        .order-card{
            flex-direction:column;
            gap:15px;
            align-items:flex-start;
        }

        .order-left{
            flex-direction:column;
            align-items:flex-start;
        }

        .order-info p{
            font-size:14px;
        }

        .page-header h1{
            font-size:30px;
        }

        .order-price{
            font-size:20px;
        }
    }

</style>

<!-- PAGE HEADER -->

<div class="page-header">

    <h1>My Orders</h1>

    <p>
        Track all your orders and view their status.
    </p>

</div>

<div class="orders-container">

    <!-- LEFT SECTION -->

    <div class="orders-list">

        <c:forEach var="order" items="${orders}">

            <div class="order-card">

                <div class="order-left">

                    <img
                        src="${pageContext.request.contextPath}/images/${order.image}"
                        alt="Order Image">

                    <div class="order-info">

                        <h4>Order #${order.orderId}</h4>

                        <p>${order.orderDate}</p >

                        <p>${order.itemCount} item(s)</p >

                        <p class="order-status
                            ${order.status eq 'Completed' ? 'completed' :
                              order.status eq 'Pending' ? 'pending' :
                              'cancelled'}">

                            ${order.status}

                        </p >

                    </div>

                </div>

                <div class="order-price">

                    ${order.totalPrice} RMB

                </div>

                <button class="details-btn">

                    View Details

                </button>

            </div>

        </c:forEach>

    </div>

    <!-- RIGHT SECTION -->

    <div class="orders-summary">

        <div class="summary-card">

            <h3>Order Summary</h3>

            <div class="summary-item">
                <span>Total Orders</span>
                <span>${totalOrders}</span>
            </div>

            <div class="summary-item">
                <span>Completed</span>
                <span>${completedOrders}</span>
            </div>

            <div class="summary-item">
                <span>Pending</span>
                <span>${pendingOrders}</span>
            </div>

            <div class="summary-item">
                <span>Cancelled</span>
                <span>${cancelledOrders}</span>
            </div>

            <div class="summary-total">

                Total Spent:
                ${totalSpent} RMB

            </div>

        </div>

    </div>

</div>