<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RAMUO - Dashboard Statistics</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: #f5f5f5;
            overflow-x: hidden;
        }

        .page-content {
            flex: 1;
            padding: 30px;
            background: #f5f5f5;
            max-width: 1600px;
            margin: 0 auto;
            width: 100%;
        }

        /* ================= TITLE ================= */
        .page-title {
            font-size: 32px;
            font-weight: 700;
            color: #222;
            margin-bottom: 5px;
        }

        .breadcrumb-custom {
            background: transparent;
            padding: 0;
            margin-bottom: 25px;
        }

        .breadcrumb-custom a {
            color: #ff7300;
            text-decoration: none;
        }

        .breadcrumb-custom .separator {
            color: #999;
            margin: 0 8px;
        }

        /* ================= STATS CARDS ================= */
        .stats-card {
            background: #fff;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
            border: 1px solid #eee;
            height: 100%;
            transition: transform 0.2s;
        }

        .stats-card:hover {
            transform: translateY(-3px);
        }

        .stats-number {
            font-size: 36px;
            font-weight: 700;
            color: #ff7300;
            margin-bottom: 5px;
        }

        .stats-label {
            font-size: 15px;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
        }

        .stats-trend {
            font-size: 12px;
            color: #4caf50;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .stats-trend.negative {
            color: #f44336;
        }

        .stats-trend.neutral {
            color: #888;
        }

        /* ================= CHART CARDS ================= */
        .chart-card {
            background: #fff;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
            border: 1px solid #eee;
            height: 100%;
        }

        .chart-title {
            font-size: 18px;
            font-weight: 600;
            color: #222;
            margin-bottom: 20px;
        }

        /* ================= ORDER STATUS ================= */
        .status-item {
            margin-bottom: 20px;
        }

        .status-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .status-name {
            font-weight: 500;
            color: #555;
        }

        .status-percent {
            font-weight: 600;
            color: #ff7300;
        }

        .progress-bar-custom {
            height: 8px;
            background: #f0f0f0;
            border-radius: 10px;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            border-radius: 10px;
        }

        .progress-fill.completed {
            background: #4caf50;
            width: 80%;
        }

        .progress-fill.pending {
            background: #ffc107;
            width: 15%;
        }

        .progress-fill.cancelled {
            background: #f44336;
            width: 5%;
        }

        /* ================= BEST SELLING ITEMS ================= */
        .best-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #f0f0f0;
        }

        .best-item:last-child {
            border-bottom: none;
        }

        .item-rank {
            width: 30px;
            height: 30px;
            background: #f5f5f5;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            color: #ff7300;
            font-size: 14px;
        }

        .item-info {
            flex: 1;
            margin-left: 12px;
        }

        .item-name {
            font-weight: 600;
            color: #222;
            font-size: 14px;
        }

        .item-orders {
            font-size: 12px;
            color: #888;
        }

        .item-value {
            font-weight: 600;
            color: #ff7300;
        }

        /* ================= CUSTOMER ANALYTICS ================= */
        .analytics-card {
            background: #fff;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
            border: 1px solid #eee;
            height: 100%;
        }

        .analytics-item {
            text-align: center;
            padding: 15px;
            border-bottom: 1px solid #f0f0f0;
        }

        .analytics-item:last-child {
            border-bottom: none;
        }

        .analytics-number {
            font-size: 28px;
            font-weight: 700;
            color: #ff7300;
        }

        .analytics-label {
            font-size: 13px;
            color: #555;
            margin-top: 5px;
        }

        .analytics-trend {
            font-size: 11px;
            color: #4caf50;
            margin-top: 5px;
        }

        /* ================= RECENT ACTIVITY TABLE ================= */
        .activity-table {
            width: 100%;
        }

        .activity-table th {
            font-weight: 600;
            color: #555;
            font-size: 12px;
            padding-bottom: 12px;
            border-bottom: 2px solid #f0f0f0;
            text-transform: uppercase;
        }

        .activity-table td {
            padding: 14px 0;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
            font-size: 13px;
        }

        .customer-name {
            font-weight: 600;
            color: #222;
        }

        .action-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 15px;
            font-size: 11px;
            font-weight: 600;
        }

        .action-placed {
            background: #e3f2fd;
            color: #1976d2;
        }

        .action-payment {
            background: #e8f5e9;
            color: #388e3c;
        }

        .action-registration {
            background: #fff3e0;
            color: #f57c00;
        }

        .action-cancelled {
            background: #ffebee;
            color: #d32f2f;
        }

        .time-text {
            color: #888;
            font-size: 12px;
        }

        /* ================= HEADER ================= */
        .header-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            background: #fff;
            padding: 15px 25px;
            border-radius: 15px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
            border: 1px solid #eee;
        }

        .admin-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .admin-avatar {
            width: 45px;
            height: 45px;
            background: #ff7300;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-weight: bold;
            font-size: 1.1rem;
        }

        /* ================= FOOTER ================= */
        .footer-links {
            display: flex;
            gap: 25px;
            flex-wrap: wrap;
        }

        .footer-links a {
            color: #888;
            text-decoration: none;
            font-size: 13px;
            transition: 0.2s;
        }

        .footer-links a:hover {
            color: #ff7300;
        }

        hr {
            opacity: 0.5;
        }

        canvas {
            max-height: 250px;
        }

        @media (max-width: 768px) {
            .page-content {
                padding: 20px;
            }

            .page-title {
                font-size: 26px;
            }

            .stats-number {
                font-size: 28px;
            }
        }
    </style>
</head>

<body>

<div class="page-content">

    <!-- HEADER -->
    <div class="header-top">
        <div>
            <h1 class="page-title" style="margin-bottom: 0;">Welcome Admin</h1>
        </div>
        <div class="admin-info">
            <i class="fa-regular fa-bell" style="font-size: 20px; color: #888; cursor: pointer;"></i>
            <div class="admin-avatar">AD</div>
        </div>
    </div>

    <!-- BREADCRUMB -->
    <div class="breadcrumb-custom">
        <a href="#">Dashboard</a>
        <span class="separator">></span>
        <span style="color: #ff7300;">Statistics</span>
    </div>

    <!-- STATS CARDS ROW -->
    <div class="row g-4 mb-4">
        <div class="col-md-3 col-sm-6">
            <div class="stats-card">
                <div class="stats-number">1,250</div>
                <div class="stats-label">Total Orders</div>
                <div class="stats-trend">
                    <i class="fa-solid fa-arrow-up"></i> +12.5% vs last 7 days
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="stats-card">
                <div class="stats-number">¥8,560</div>
                <div class="stats-label">Revenue Today</div>
                <div class="stats-trend">
                    <i class="fa-solid fa-arrow-up"></i> +18.3% vs yesterday
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="stats-card">
                <div class="stats-number">540</div>
                <div class="stats-label">Active Customers</div>
                <div class="stats-trend">
                    <i class="fa-solid fa-arrow-up"></i> +8.7% vs last 7 days
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="stats-card">
                <div class="stats-number">42</div>
                <div class="stats-label">Menu Items</div>
                <div class="stats-trend neutral">
                    <i class="fa-solid fa-minus"></i> 0% vs last 7 days
                </div>
            </div>
        </div>
    </div>

    <!-- CHARTS ROW 1 -->
    <div class="row g-4 mb-4">
        <div class="col-lg-6">
            <div class="chart-card">
                <div class="chart-title">
                    <i class="fa-solid fa-chart-line me-2" style="color: #ff7300;"></i>
                    Orders Trend (Last 7 Days)
                </div>
                <canvas id="ordersTrendChart"></canvas>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="chart-card">
                <div class="chart-title">
                    <i class="fa-solid fa-chart-pie me-2" style="color: #ff7300;"></i>
                    Order Status
                </div>
                <div class="status-item">
                    <div class="status-header">
                        <span class="status-name">Completed</span>
                        <span class="status-percent">80% (1,000)</span>
                    </div>
                    <div class="progress-bar-custom">
                        <div class="progress-fill completed"></div>
                    </div>
                </div>
                <div class="status-item">
                    <div class="status-header">
                        <span class="status-name">Pending</span>
                        <span class="status-percent">15% (188)</span>
                    </div>
                    <div class="progress-bar-custom">
                        <div class="progress-fill pending"></div>
                    </div>
                </div>
                <div class="status-item">
                    <div class="status-header">
                        <span class="status-name">Cancelled</span>
                        <span class="status-percent">5% (62)</span>
                    </div>
                    <div class="progress-bar-custom">
                        <div class="progress-fill cancelled"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- CHARTS ROW 2 -->
    <div class="row g-4 mb-4">
        <div class="col-lg-6">
            <div class="chart-card">
                <div class="chart-title">
                    <i class="fa-solid fa-chart-column me-2" style="color: #ff7300;"></i>
                    Monthly Revenue (¥)
                </div>
                <canvas id="monthlyRevenueChart"></canvas>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="row g-4">
                <div class="col-12">
                    <div class="chart-card">
                        <div class="chart-title">
                            <i class="fa-solid fa-trophy me-2" style="color: #ff7300;"></i>
                            Top 5 Best Selling Items
                        </div>
                        <div class="best-item">
                            <div class="item-rank">1</div>
                            <div class="item-info">
                                <div class="item-name">Grilled Chicken</div>
                                <div class="item-orders">320 Orders</div>
                            </div>
                            <div class="item-value">¥10,240</div>
                        </div>
                        <div class="best-item">
                            <div class="item-rank">2</div>
                            <div class="item-info">
                                <div class="item-name">Beef Steak</div>
                                <div class="item-orders">280 Orders</div>
                            </div>
                            <div class="item-value">¥11,200</div>
                        </div>
                        <div class="best-item">
                            <div class="item-rank">3</div>
                            <div class="item-info">
                                <div class="item-name">Fried Rice</div>
                                <div class="item-orders">254 Orders</div>
                            </div>
                            <div class="item-value">¥5,080</div>
                        </div>
                        <div class="best-item">
                            <div class="item-rank">4</div>
                            <div class="item-info">
                                <div class="item-name">Caesar Salad</div>
                                <div class="item-orders">210 Orders</div>
                            </div>
                            <div class="item-value">¥3,150</div>
                        </div>
                        <div class="best-item">
                            <div class="item-rank">5</div>
                            <div class="item-info">
                                <div class="item-name">Pizza Royale</div>
                                <div class="item-orders">186 Orders</div>
                            </div>
                            <div class="item-value">¥5,580</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- CUSTOMER ANALYTICS & RECENT ACTIVITY -->
    <div class="row g-4 mb-4">
        <div class="col-lg-4">
            <div class="analytics-card">
                <div class="chart-title">
                    <i class="fa-solid fa-users me-2" style="color: #ff7300;"></i>
                    Customer Analytics
                </div>
                <div class="analytics-item">
                    <div class="analytics-number">75</div>
                    <div class="analytics-label">New Customers</div>
                    <div class="analytics-trend">
                        <i class="fa-solid fa-arrow-up"></i> +15.6% vs last 7 days
                    </div>
                </div>
                <div class="analytics-item">
                    <div class="analytics-number">465</div>
                    <div class="analytics-label">Returning Customers</div>
                    <div class="analytics-trend">
                        <i class="fa-solid fa-arrow-up"></i> +7.2% vs last 7 days
                    </div>
                </div>
                <div class="analytics-item">
                    <div class="analytics-number">¥72</div>
                    <div class="analytics-label">Avg. Order Value</div>
                    <div class="analytics-trend">
                        <i class="fa-solid fa-arrow-up"></i> +5.8% vs last 7 days
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="chart-card">
                <div class="chart-title">
                    <i class="fa-regular fa-clock me-2" style="color: #ff7300;"></i>
                    Recent Activity
                </div>
                <div class="table-responsive">
                    <table class="activity-table w-100">
                        <thead>
                        <tr>
                            <th>Customer</th>
                            <th>Action</th>
                            <th>Order / Info</th>
                            <th>Time</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><span class="customer-name">Jean Dupont</span></td>
                            <td><span class="action-badge action-placed">Placed an Order</span></td>
                            <td>#1245 • ¥105.00</td>
                            <td class="time-text">10 min ago</td>
                        </tr>
                        <tr>
                            <td><span class="customer-name">Alice Smith</span></td>
                            <td><span class="action-badge action-payment">Payment Completed</span></td>
                            <td>#1244 • ¥45.50</td>
                            <td class="time-text">15 min ago</td>
                        </tr>
                        <tr>
                            <td><span class="customer-name">Kevin Lee</span></td>
                            <td><span class="action-badge action-registration">New Registration</span></td>
                            <td>New Customer</td>
                            <td class="time-text">22 min ago</td>
                        </tr>
                        <tr>
                            <td><span class="customer-name">Maria Chen</span></td>
                            <td><span class="action-badge action-cancelled">Order Cancelled</span></td>
                            <td>#1243 • ¥23.00</td>
                            <td class="time-text">35 min ago</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- FOOTER -->
    <footer class="mt-4 pt-3">
        <hr class="my-4">
        <div class="d-flex justify-content-between align-items-center flex-wrap">
            <div class="text-muted small">© 2024 RAMUO RESTAURANT. All rights reserved.</div>
            <div class="footer-links">
                <a href="#">Privacy Policy</a>
                <a href="#">Terms of Service</a>
                <a href="#">Help</a>
            </div>
        </div>
    </footer>

</div>

<script>
    // Orders Trend Chart (Line Chart)
    const ordersCtx = document.getElementById('ordersTrendChart').getContext('2d');
    new Chart(ordersCtx, {
        type: 'line',
        data: {
            labels: ['May 19', 'May 20', 'May 21', 'May 22', 'May 23', 'May 24', 'May 25'],
            datasets: [{
                label: 'Orders',
                data: [120, 145, 132, 168, 189, 175, 198],
                borderColor: '#ff7300',
                backgroundColor: 'rgba(255, 115, 0, 0.1)',
                tension: 0.4,
                fill: true,
                pointBackgroundColor: '#ff7300',
                pointBorderColor: '#fff',
                pointRadius: 5,
                pointHoverRadius: 7
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Number of Orders'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Date'
                    }
                }
            }
        }
    });

    // Monthly Revenue Chart (Bar Chart)
    const revenueCtx = document.getElementById('monthlyRevenueChart').getContext('2d');
    new Chart(revenueCtx, {
        type: 'bar',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            datasets: [{
                label: 'Revenue (¥)',
                data: [4.2, 5.1, 6.8, 7.2, 8.5, 9.3, 10.1, 10.8, 9.6, 8.9, 9.5, 11.2],
                backgroundColor: '#ff7300',
                borderRadius: 8,
                barPercentage: 0.7
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Revenue (¥ thousand)'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Month'
                    }
                }
            }
        }
    });
</script>

</body>
</html>