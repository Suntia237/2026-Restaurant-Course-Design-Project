<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    .topbar{
        background:white;
        padding:15px 30px;
        border-bottom:1px solid #ececec;
    }

    .dashboard-card{
        background:white;
        border-radius:12px;
        padding:20px;
        border:1px solid #eeeeee;
    }

    .stats-card{
        background:white;
        border-radius:12px;
        padding:20px;
        border:1px solid #eeeeee;
        display:flex;
        align-items:center;
        gap:15px;
        height:100%;
    }

    .stats-icon{
        width:50px;
        height:50px;
        border-radius:50%;
        display:flex;
        justify-content:center;
        align-items:center;
        font-size:20px;
    }

    .orange{
        background:#fff0e5;
        color:#ff6b00;
    }

    .green{
        background:#ebfff0;
        color:#1ba71b;
    }

    .yellow{
        background:#fff7e2;
        color:#f5a623;
    }

    .purple{
        background:#f3ecff;
        color:#7b4dff;
    }

    .section-title{
        font-size:18px;
        font-weight:600;
    }

    .order-row{
        display:flex;
        align-items:center;
        border-bottom:1px solid #f1f1f1;
        padding:12px 0;
    }

    .orders-container{
        display:grid;
        grid-template-columns:repeat(auto-fill,minmax(380px,1fr));
        gap:20px;
        margin-top:20px;
    }

    .order-card{
        background:white;
        border-radius:18px;
        padding:20px;
        border:1px solid #eeeeee;
        box-shadow:0 3px 10px rgba(0,0,0,0.05);
    }

    .order-header{
        display:flex;
        justify-content:space-between;
        align-items:center;
        margin-bottom:15px;
        padding-bottom:10px;
        border-bottom:1px solid #f0f0f0;
    }

    .order-id{
        font-size:18px;
        font-weight:700;
        color:#222;
    }

    .customer-name{
        color:#777;
        font-size:14px;
    }

    .order-items{
        margin:15px 0;
    }

    .order-item{
        display:flex;
        justify-content:space-between;
        padding:8px 0;
        border-bottom:1px dashed #f2f2f2;
    }

    .item-name{
        color:#333;
    }

    .item-qty{
        font-weight:600;
        color:#ff6b00;
    }

    .order-footer{
        margin-top:15px;
    }

    .order-total{
        display:flex;
        justify-content:space-between;
        font-size:18px;
        font-weight:700;
        color:#ff6b00;
        margin-bottom:15px;
    }

    .order-actions{
        display:flex;
        gap:10px;
    }

    .btn-confirm{
        flex:1;
        background:#ff6b00;
        color:white;
        border:none;
        border-radius:10px;
        padding:10px;
    }

    .btn-cancel{
        flex:1;
        background:#dc3545;
        color:white;
        border:none;
        border-radius:10px;
        padding:10px;
    }

    .food-image{
        width:65px;
        height:65px;
        border-radius:10px;
        object-fit:cover;
        margin-right:15px;
    }

    .status-badge{
        font-size:12px;
        padding:5px 12px;
        border-radius:20px;
    }

    .completed{
        background:#e8f8eb;
        color:#1c9c39;
    }

    .cancelled{
        background:#ffe8eb;
        color:#e63946;
    }

    .activity-table{
        width:100%;
        border-collapse:collapse;
    }

    .activity-table th{
        text-align:left;
        padding:15px;
        background:#fafafa;
    }

    .activity-table td{
        padding:15px;
        border-bottom:1px solid #eee;
    }

    .btn-confirm{
        background:#ff6b00;
        color:white;
        border:none;
    }

    .btn-confirm:hover{
        background:#e55f00;
        color:white;
    }

    .search-box{
        background:white;
        border-radius:10px;
        border:1px solid #e5e5e5;
    }

    .page-title{
        font-weight:700;
    }

</style>

<div class="container-fluid">

    <div class="container-fluid p-4">

        <!-- PAGE TITLE -->

        <h2 class="page-title">Orders</h2>

        <small class="text-muted">
            Home > Orders
        </small>

        <!-- STATISTICS -->

        <div class="row mt-4 g-3">

            <div class="col-lg-3">

                <div class="stats-card">

                    <div class="stats-icon orange">
                        <i class="fa-solid fa-clipboard-list"></i>
                    </div>

                    <div>
                        <h3>${totalOrders}</h3>
                        <small>Total Orders</small>
                    </div>

                </div>

            </div>

            <div class="col-lg-3">

                <div class="stats-card">

                    <div class="stats-icon green">
                        <i class="fa-solid fa-circle-check"></i>
                    </div>

                    <div>
                        <h3>${pendingOrdersCount}</h3>
                        <small>Pending Orders</small>
                    </div>

                </div>

            </div>

            <div class="col-lg-3">
                <div class="stats-card">

                    <div class="stats-icon purple">
                        <i class="fa-solid fa-box"></i>
                    </div>

                    <div>
                        <h3>${completedOrdersCount}</h3>
                        <small>Completed Orders</small>
                    </div>

                </div>
            </div>

            <div class="col-lg-3">
                <div class="stats-card">

                    <div class="stats-icon purple">
                        <i class="fa-solid fa-box"></i>
                    </div>

                    <div>
                        <h3>${cancelledOrdersCount}</h3>
                        <small>Cancelled Orders</small>
                    </div>

                </div>
            </div>

        </div>

        <!-- CONTENT -->

        <div class="row mt-4">

            <!-- PENDING ORDERS -->

            <div class="dashboard-card">

                <h5 class="section-title mb-4">
                    Pending Orders
                </h5>

                <div class="orders-container">

                    <c:forEach var="order" items="${pendingOrders}">

                        <div class="order-card">

                            <div class="order-header">

                                <div>

                                    <div class="order-id">
                                        Order #${order.order_id}
                                    </div>

                                    <div class="customer-name">
                                        ${order.customerName}
                                    </div>

                                    <div class="customer-name">
                                        Table ${order.tableNumber}
                                    </div>

                                </div>

                                <span class="status-badge">
                                    Pending
                                </span>

                            </div>

                            <div class="order-items">

                                <c:forEach var="item"
                                           items="${order.items}">

                                    <div class="order-item">

                                        <span class="item-name">
                                            ${item.menuName}
                                        </span>

                                        <span class="item-qty">
                                            x${item.quantity}
                                        </span>

                                    </div>

                                </c:forEach>

                            </div>

                            <div class="order-footer">

                                <div class="order-total">

                                    <span>Total</span>

                                    <span>
                                        ${order.totalAmount} FCFA
                                    </span>

                                </div>

                                <div class="order-actions">

                                    <form action="admin-orders"
                                          method="post">

                                        <input type="hidden"
                                               name="orderId"
                                               value="${order.order_id}">

                                        <button type="submit"
                                                name="action"
                                                value="confirm"
                                                class="btn-confirm">

                                            Confirm

                                        </button>

                                        <button type="submit"
                                                name="action"
                                                value="cancel"
                                                class="btn-cancel">

                                            Cancel

                                        </button>

                                    </form>

                                </div>

                            </div>

                        </div>

                    </c:forEach>

                </div>

            </div>

        <h3>Order History</h3>

            <table class="activity-table">

                <thead>

                <tr>
                    <th>Order ID</th>
                    <th>User ID</th>
                    <th>Date</th>
                    <th>Status</th>
                <tr>

                </thead>

                <tbody>

                <c:forEach var="order" items="${orders}">

                    <tr>

                        <td>${order.order_id}</td>
                        <td>${order.client_id}</td>
                        <td>${order.order_date}</td>
                        <td>${order.status}</td>

                    </tr>

                </c:forEach>

                </tbody>

            </table>

        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>