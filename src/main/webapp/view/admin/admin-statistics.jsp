<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RAMIJO Restaurant - Statistics</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        *{margin:0;padding:0;box-sizing:border-box;}
        body{background:#f5f6fa;font-family:'Segoe UI',sans-serif;}
        .wrapper{display:flex;min-height:100vh;}

        /* SIDEBAR */
        .sidebar{
            width:260px;
            background:#fff;
            padding:25px;
            box-shadow:2px 0 10px rgba(0,0,0,.05);
            display:flex;
            flex-direction:column;
            justify-content:space-between;
        }
        .logo h1{color:#ff7a00;font-size:28px;font-weight:800;}
        .logo span{font-size:12px;letter-spacing:3px;}
        .nav-links a{
            display:block;
            padding:12px;
            margin-bottom:10px;
            border-radius:12px;
            text-decoration:none;
            color:#444;
        }
        .nav-links a:hover,.active-link{
            background:#fff3e8;
            color:#ff7a00!important;
        }
        .logout a{text-decoration:none;color:#ff7a00;font-weight:600;}

        /* CONTENT */
        .main-content{flex:1;padding:30px;}

        .dashboard-banner{
            height:280px;
            border-radius:15px;
            overflow:hidden;
            position:relative;
            background:url('/images/pizza.jpg') center/cover no-repeat;
        }
        .banner-overlay{
            position:absolute;
            inset:0;
            background:rgba(0,0,0,.55);
        }
        .banner-content{
            position:relative;
            z-index:2;
            padding:40px;
            color:#fff;
        }
        .banner-title{
            font-size:42px;
            font-weight:700;
        }

        .primary-btn{
            background:#ff7a00;
            color:#fff;
            border:none;
        }
        .primary-btn:hover{
            background:#e56d00;
            color:#fff;
        }

        .dashboard-card{
            background:#fff;
            border-radius:12px;
            padding:25px;
            box-shadow:0 2px 10px rgba(0,0,0,.08);
        }

        .section-title{
            font-size:18px;
            font-weight:600;
        }

        .stat-card{
            background:#fff;
            border-radius:10px;
            padding:20px;
            text-align:center;
            border:1px solid #eee;
            height:100%;
        }

        .stat-number{
            font-size:30px;
            font-weight:bold;
            margin-top:10px;
        }

        .best-item{
            display:flex;
            justify-content:space-between;
            padding:12px 0;
            border-bottom:1px solid #eee;
        }

        .activity-table td,
        .activity-table th{
            padding:12px;
        }

        canvas{
            max-height:320px;
        }
    </style>
</head>
<body>

<div class="wrapper">

    <div class="sidebar">

        <div>

            <div class="logo">
                <h1>RAMIJO</h1>
                <span>RESTAURANT</span>
            </div>

            <div class="nav-links mt-4">
                <a href="/admin-home">🏠 Home</a>
                <a href="/admin-account">👤 My Account</a>
                <a href="/admin-menu">🍽 Menu Management</a>
                <a href="/admin-orders">📦 Orders</a>
                <a href="/statistics" class="active-link">📊 Statistics</a>
            </div>

        </div>

        <div class="logout">
            <a href="/logout">🚪 Logout</a>
        </div>

    </div>

    <div class="main-content">

        <div class="dashboard-banner">
            <div class="banner-overlay"></div>

            <div class="banner-content">
                <p class="text-warning fw-bold">RAMIJO RESTAURANT</p>
                <h1 class="banner-title">Restaurant Statistics</h1>
                <p>Monitor revenue, orders and customer growth.</p>
                <button class="btn primary-btn">
                    <i class="fa-solid fa-chart-line"></i> Export Report
                </button>
            </div>
        </div>

        <div class="row mt-4 g-3">

            <div class="col-md-3">
                <div class="stat-card">
                    <i class="fa-solid fa-cart-shopping fa-2x text-warning"></i>
                    <div class="stat-number">1250</div>
                    <small>Total Orders</small>
                </div>
            </div>

            <div class="col-md-3">
                <div class="stat-card">
                    <i class="fa-solid fa-dollar-sign fa-2x text-success"></i>
                    <div class="stat-number">$8,560</div>
                    <small>Total Revenue</small>
                </div>
            </div>

            <div class="col-md-3">
                <div class="stat-card">
                    <i class="fa-solid fa-users fa-2x text-primary"></i>
                    <div class="stat-number">540</div>
                    <small>Customers</small>
                </div>
            </div>

            <div class="col-md-3">
                <div class="stat-card">
                    <i class="fa-solid fa-utensils fa-2x text-danger"></i>
                    <div class="stat-number">42</div>
                    <small>Menu Items</small>
                </div>
            </div>

        </div>

        <div class="row mt-4">

            <div class="col-lg-6">
                <div class="dashboard-card">
                    <h5 class="section-title mb-3">Orders Trend</h5>
                    <canvas id="ordersChart"></canvas>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="dashboard-card">
                    <h5 class="section-title mb-3">Monthly Revenue</h5>
                    <canvas id="revenueChart"></canvas>
                </div>
            </div>

        </div>

        <div class="row mt-4">

            <div class="col-lg-6">
                <div class="dashboard-card">
                    <h5 class="section-title mb-3">Top Selling Dishes</h5>

                    <div class="best-item"><span>Pizza Margherita</span><strong>320</strong></div>
                    <div class="best-item"><span>Classic Burger</span><strong>280</strong></div>
                    <div class="best-item"><span>Grilled Steak</span><strong>240</strong></div>
                    <div class="best-item"><span>Caesar Salad</span><strong>210</strong></div>
                    <div class="best-item"><span>Orange Juice</span><strong>180</strong></div>

                </div>
            </div>

            <div class="col-lg-6">
                <div class="dashboard-card">
                    <h5 class="section-title mb-3">Order Status</h5>

                    <p>Completed (80%)</p>
                    <div class="progress mb-3"><div class="progress-bar bg-success" style="width:80%"></div></div>

                    <p>Pending (15%)</p>
                    <div class="progress mb-3"><div class="progress-bar bg-warning" style="width:15%"></div></div>

                    <p>Cancelled (5%)</p>
                    <div class="progress"><div class="progress-bar bg-danger" style="width:5%"></div></div>

                </div>
            </div>

        </div>

        <div class="dashboard-card mt-4">
            <h5 class="section-title mb-3">Recent Activity</h5>

            <table class="table activity-table">
                <thead>
                <tr>
                    <th>Customer</th>
                    <th>Action</th>
                    <th>Order</th>
                    <th>Time</th>
                </tr>
                </thead>
                <tbody>
                <tr><td>Jean Dupont</td><td>Placed Order</td><td>#1258</td><td>10 min ago</td></tr>
                <tr><td>Alice Smith</td><td>Payment Completed</td><td>#1257</td><td>20 min ago</td></tr>
                <tr><td>Kevin Lee</td><td>New Registration</td><td>Customer</td><td>35 min ago</td></tr>
                <tr><td>Maria Chen</td><td>Order Cancelled</td><td>#1255</td><td>1 hour ago</td></tr>
                </tbody>
            </table>
        </div>

    </div>
</div>

<script>
    new Chart(document.getElementById('ordersChart'),{
        type:'line',
        data:{
            labels:['Mon','Tue','Wed','Thu','Fri','Sat','Sun'],
            datasets:[{
                data:[120,145,132,168,189,175,198],
                borderColor:'#ff7a00',
                backgroundColor:'rgba(255,122,0,0.1)',
                fill:true,
                tension:.4
            }]
        },
        options:{plugins:{legend:{display:false}}}
    });

    new Chart(document.getElementById('revenueChart'),{
        type:'bar',
        data:{
            labels:['Jan','Feb','Mar','Apr','May','Jun'],
            datasets:[{
                data:[4200,5100,6800,7200,8500,9300],
                backgroundColor:'#ff7a00'
            }]
        },
        options:{plugins:{legend:{display:false}}}
    });
</script>

</body>
</html>