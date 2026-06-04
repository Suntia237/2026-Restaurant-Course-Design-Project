<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    body{
        background:#f8f9fc;
        font-family:'Segoe UI',sans-serif;
    }

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
                        <h3>128</h3>
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
                        <h3>18</h3>
                        <small>Pending Orders</small>
                    </div>

                </div>

            </div>

            <div class="col-lg-3">

                <div class="stats-card">

                    <div class="stats-icon yellow">
                        <i class="fa-solid fa-clock"></i>
                    </div>

                    <div>
                        <h3>12</h3>
                        <small>Preparing</small>
                    </div>

                </div>

            </div>

            <div class="col-lg-3">

                <div class="stats-card">

                    <div class="stats-icon purple">
                        <i class="fa-solid fa-box"></i>
                    </div>

                    <div>
                        <h3>84</h3>
                        <small>Completed Orders</small>
                    </div>

                </div>

            </div>

        </div>

        <!-- SEARCH -->

        <div class="search-box p-3 mt-4">

            <div class="input-group">

                <span class="input-group-text bg-white border-0">
                    <i class="fa-solid fa-search"></i>
                </span>

                <input type="text"
                       class="form-control border-0"
                       placeholder="Search order, customer or menu...">

            </div>

        </div>

        <!-- CONTENT -->

        <div class="row mt-4">

            <!-- PENDING ORDERS -->

            <div class="col-lg-6">

                <div class="dashboard-card">

                    <h5 class="section-title mb-4">
                        Pending Orders
                    </h5>

                    <div class="order-row">

                        <img src="images/pizza.jpg"
                             class="food-image">

                        <div class="flex-grow-1">

                            <strong>Order #1258</strong><br>

                            Pizza Margherita, Orange Juice

                            <div class="text-muted small">
                                John Dupont
                            </div>

                        </div>

                        <div class="text-end">

                            <strong>$25.00</strong><br>

                            <button class="btn btn-sm btn-outline-secondary">
                                Details
                            </button>

                            <button class="btn btn-sm btn-confirm">
                                Confirm
                            </button>

                        </div>

                    </div>

                    <div class="order-row">

                        <img src="images/burger.jpg"
                             class="food-image">

                        <div class="flex-grow-1">

                            <strong>Order #1257</strong><br>

                            Burger, Fries, Soda

                            <div class="text-muted small">
                                Paul Martin
                            </div>

                        </div>

                        <div class="text-end">

                            <strong>$15.50</strong><br>

                            <button class="btn btn-sm btn-outline-secondary">
                                Details
                            </button>

                            <button class="btn btn-sm btn-confirm">
                                Confirm
                            </button>

                        </div>

                    </div>

                    <div class="order-row">

                        <img src="images/salad.jpg"
                             class="food-image">

                        <div class="flex-grow-1">

                            <strong>Order #1256</strong><br>

                            Caesar Salad

                            <div class="text-muted small">
                                Marie Claire
                            </div>

                        </div>

                        <div class="text-end">

                            <strong>$12.00</strong><br>

                            <button class="btn btn-sm btn-outline-secondary">
                                Details
                            </button>

                            <button class="btn btn-sm btn-confirm">
                                Confirm
                            </button>

                        </div>

                    </div>

                </div>

            </div>

            <!-- ORDER HISTORY -->

            <div class="col-lg-6">

                <div class="dashboard-card">

                    <h5 class="section-title mb-4">
                        Order History
                    </h5>

                    <div class="order-row">

                        <img src="images/pizza.jpg"
                             class="food-image">

                        <div class="flex-grow-1">

                            <strong>Order #1254</strong><br>

                            Four Cheese Pizza

                            <div class="text-muted small">
                                Sophia Lefevre
                            </div>

                        </div>

                        <span class="status-badge completed">
                            Completed
                        </span>

                        <div class="ms-3">
                            <strong>$22.00</strong>
                        </div>

                    </div>

                    <div class="order-row">

                        <img src="images/burger.jpg"
                             class="food-image">

                        <div class="flex-grow-1">

                            <strong>Order #1253</strong><br>

                            Burger Classic

                            <div class="text-muted small">
                                David King
                            </div>

                        </div>

                        <span class="status-badge completed">
                            Completed
                        </span>

                        <div class="ms-3">
                            <strong>$14.00</strong>
                        </div>

                    </div>

                    <div class="order-row">

                        <img src="images/salad.jpg"
                             class="food-image">

                        <div class="flex-grow-1">

                            <strong>Order #1252</strong><br>

                            Caesar Salad

                            <div class="text-muted small">
                                Emma Taylor
                            </div>

                        </div>

                        <span class="status-badge completed">
                            Completed
                        </span>

                        <div class="ms-3">
                            <strong>$11.50</strong>
                        </div>

                    </div>

                    <div class="order-row">

                        <img src="images/pizza.jpg"
                             class="food-image">

                        <div class="flex-grow-1">

                            <strong>Order #1251</strong><br>

                            Pizza Margherita

                            <div class="text-muted small">
                                Alain M.
                            </div>

                        </div>

                        <span class="status-badge cancelled">
                            Cancelled
                        </span>

                        <div class="ms-3">
                            <strong>$18.00</strong>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>