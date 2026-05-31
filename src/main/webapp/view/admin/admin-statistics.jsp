<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .page-title{
        font-size:32px;
        font-weight:700;
        color:#2c3e50;
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
        box-shadow:0 2px 10px rgba(0,0,0,.05);
    }

    .stats-icon{
        width:60px;
        height:60px;
        border-radius:50%;
        display:flex;
        justify-content:center;
        align-items:center;
        font-size:24px;
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

    .dashboard-card{
        background:white;
        border-radius:12px;
        padding:20px;
        border:1px solid #eeeeee;
        box-shadow:0 2px 10px rgba(0,0,0,.05);
        height:100%;
    }

    .section-title{
        font-size:18px;
        font-weight:600;
        margin-bottom:20px;
    }

    .growth{
        font-size:12px;
        color:#28a745;
        font-weight:600;
    }

    .chart-container{
        height:280px;
    }

    .pie-container{
        display:flex;
        justify-content:center;
        align-items:center;
        margin-top:20px;
    }

    .status-list{
        margin-top:20px;
    }

    .status-item{
        display:flex;
        justify-content:space-between;
        margin-bottom:12px;
    }

    .status-dot{
        width:10px;
        height:10px;
        border-radius:50%;
        display:inline-block;
        margin-right:8px;
    }

    .food-item{
        display:flex;
        align-items:center;
        margin-bottom:15px;
        padding-bottom:12px;
        border-bottom:1px solid #f1f1f1;
    }

    .food-item:last-child{
        border-bottom:none;
    }

    .food-image{
        width:60px;
        height:60px;
        border-radius:10px;
        object-fit:cover;
        margin-right:12px;
    }

    .analytics-card{
        background:#fafafa;
        border-radius:10px;
        padding:15px;
        display:flex;
        align-items:center;
        margin-bottom:15px;
    }

    .analytics-icon{
        width:50px;
        height:50px;
        border-radius:50%;
        display:flex;
        justify-content:center;
        align-items:center;
        margin-right:12px;
        font-size:20px;
    }

    .activity-table th{
        color:#777;
        font-size:14px;
    }

    .badge-custom{
        padding:5px 12px;
        border-radius:20px;
        font-size:12px;
    }

    .badge-success{
        background:#e8f8eb;
        color:#1c9c39;
    }

    .badge-primary{
        background:#dbeafe;
        color:#0d6efd;
    }

    .badge-danger{
        background:#ffe8eb;
        color:#e63946;
    }

</style>

<div class="container-fluid p-4">

    <h2 class="page-title">
        Statistics
    </h2>

    <small class="text-muted">
        Dashboard > Statistics
    </small>

    <!-- TOP STATISTICS -->

    <div class="row mt-4 g-3">

        <div class="col-lg-3">

            <div class="stats-card">

                <div class="stats-icon orange">
                    <i class="fa-solid fa-bag-shopping"></i>
                </div>

                <div>

                    <h3>1,250</h3>

                    <small>Total Orders</small>

                    <div class="growth">
                        ↑ 12.5% vs last 7 days
                    </div>

                </div>

            </div>

        </div>

        <div class="col-lg-3">

            <div class="stats-card">

                <div class="stats-icon green">
                    <i class="fa-solid fa-coins"></i>
                </div>

                <div>

                    <h3>¥8,560</h3>

                    <small>Revenue Today</small>

                    <div class="growth">
                        ↑ 18.3% vs yesterday
                    </div>

                </div>

            </div>

        </div>

        <div class="col-lg-3">

            <div class="stats-card">

                <div class="stats-icon yellow">
                    <i class="fa-solid fa-users"></i>
                </div>

                <div>

                    <h3>540</h3>

                    <small>Active Customers</small>

                    <div class="growth">
                        ↑ 8.7%
                    </div>

                </div>

            </div>

        </div>

        <div class="col-lg-3">

            <div class="stats-card">

                <div class="stats-icon purple">
                    <i class="fa-solid fa-utensils"></i>
                </div>

                <div>

                    <h3>42</h3>

                    <small>Menu Items</small>

                    <div class="text-muted small">
                        No change
                    </div>

                </div>

            </div>

        </div>

    </div>

    <!-- ORDERS TREND + ORDER STATUS -->

    <div class="row mt-4">

        <div class="col-lg-8">

            <div class="dashboard-card">

                <h5 class="section-title">
                    Orders Trend (Last 7 Days)
                </h5>

                <div class="chart-container">

                    <canvas id="ordersChart"></canvas>

                </div>

            </div>

        </div>

        <div class="col-lg-4">

            <div class="dashboard-card">

                <h5 class="section-title">
                    Order Status
                </h5>

                <div class="pie-container">

                    <canvas id="statusChart"
                            width="220"
                            height="220">
                    </canvas>

                </div>

                <div class="status-list">

                    <div class="status-item">

                        <span>
                            <span class="status-dot bg-success"></span>
                            Completed
                        </span>

                        <strong>80%</strong>

                    </div>

                    <div class="status-item">

                        <span>
                            <span class="status-dot bg-warning"></span>
                            Pending
                        </span>

                        <strong>15%</strong>

                    </div>

                    <div class="status-item">

                        <span>
                            <span class="status-dot bg-danger"></span>
                            Cancelled
                        </span>

                        <strong>5%</strong>

                    </div>

                </div>

            </div>

        </div>

    </div>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <style>

        .page-title{
            font-size:32px;
            font-weight:700;
            color:#2c3e50;
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
            box-shadow:0 2px 10px rgba(0,0,0,.05);
        }

        .stats-icon{
            width:60px;
            height:60px;
            border-radius:50%;
            display:flex;
            justify-content:center;
            align-items:center;
            font-size:24px;
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

        .dashboard-card{
            background:white;
            border-radius:12px;
            padding:20px;
            border:1px solid #eeeeee;
            box-shadow:0 2px 10px rgba(0,0,0,.05);
            height:100%;
        }

        .section-title{
            font-size:18px;
            font-weight:600;
            margin-bottom:20px;
        }

        .growth{
            font-size:12px;
            color:#28a745;
            font-weight:600;
        }

        .chart-container{
            height:280px;
        }

        .pie-container{
            display:flex;
            justify-content:center;
            align-items:center;
            margin-top:20px;
        }

        .status-list{
            margin-top:20px;
        }

        .status-item{
            display:flex;
            justify-content:space-between;
            margin-bottom:12px;
        }

        .status-dot{
            width:10px;
            height:10px;
            border-radius:50%;
            display:inline-block;
            margin-right:8px;
        }

        .food-item{
            display:flex;
            align-items:center;
            margin-bottom:15px;
            padding-bottom:12px;
            border-bottom:1px solid #f1f1f1;
        }

        .food-item:last-child{
            border-bottom:none;
        }

        .food-image{
            width:60px;
            height:60px;
            border-radius:10px;
            object-fit:cover;
            margin-right:12px;
        }

        .analytics-card{
            background:#fafafa;
            border-radius:10px;
            padding:15px;
            display:flex;
            align-items:center;
            margin-bottom:15px;
        }

        .analytics-icon{
            width:50px;
            height:50px;
            border-radius:50%;
            display:flex;
            justify-content:center;
            align-items:center;
            margin-right:12px;
            font-size:20px;
        }

        .activity-table th{
            color:#777;
            font-size:14px;
        }

        .badge-custom{
            padding:5px 12px;
            border-radius:20px;
            font-size:12px;
        }

        .badge-success{
            background:#e8f8eb;
            color:#1c9c39;
        }

        .badge-primary{
            background:#dbeafe;
            color:#0d6efd;
        }

        .badge-danger{
            background:#ffe8eb;
            color:#e63946;
        }

    </style>

    <div class="container-fluid p-4">

        <h2 class="page-title">
            Statistics
        </h2>

        <small class="text-muted">
            Dashboard > Statistics
        </small>

        <!-- TOP STATISTICS -->

        <div class="row mt-4 g-3">

            <div class="col-lg-3">

                <div class="stats-card">

                    <div class="stats-icon orange">
                        <i class="fa-solid fa-bag-shopping"></i>
                    </div>

                    <div>

                        <h3>1,250</h3>

                        <small>Total Orders</small>

                        <div class="growth">
                            ↑ 12.5% vs last 7 days
                        </div>

                    </div>

                </div>

            </div>

            <div class="col-lg-3">

                <div class="stats-card">

                    <div class="stats-icon green">
                        <i class="fa-solid fa-coins"></i>
                    </div>

                    <div>

                        <h3>¥8,560</h3>

                        <small>Revenue Today</small>

                        <div class="growth">
                            ↑ 18.3% vs yesterday
                        </div>

                    </div>

                </div>

            </div>

            <div class="col-lg-3">

                <div class="stats-card">

                    <div class="stats-icon yellow">
                        <i class="fa-solid fa-users"></i>
                    </div>

                    <div>

                        <h3>540</h3>

                        <small>Active Customers</small>

                        <div class="growth">
                            ↑ 8.7%
                        </div>

                    </div>

                </div>

            </div>

            <div class="col-lg-3">

                <div class="stats-card">

                    <div class="stats-icon purple">
                        <i class="fa-solid fa-utensils"></i>
                    </div>

                    <div>

                        <h3>42</h3>

                        <small>Menu Items</small>

                        <div class="text-muted small">
                            No change
                        </div>

                    </div>

                </div>

            </div>

        </div>

        <!-- ORDERS TREND + ORDER STATUS -->

        <div class="row mt-4">

            <div class="col-lg-8">

                <div class="dashboard-card">

                    <h5 class="section-title">
                        Orders Trend (Last 7 Days)
                    </h5>

                    <div class="chart-container">

                        <canvas id="ordersChart"></canvas>

                    </div>

                </div>

            </div>

            <div class="col-lg-4">

                <div class="dashboard-card">

                    <h5 class="section-title">
                        Order Status
                    </h5>

                    <div class="pie-container">

                        <canvas id="statusChart"
                                width="220"
                                height="220">
                        </canvas>

                    </div>

                    <div class="status-list">

                        <div class="status-item">

                        <span>
                            <span class="status-dot bg-success"></span>
                            Completed
                        </span>

                            <strong>80%</strong>

                        </div>

                        <div class="status-item">

                        <span>
                            <span class="status-dot bg-warning"></span>
                            Pending
                        </span>

                            <strong>15%</strong>

                        </div>

                        <div class="status-item">

                        <span>
                            <span class="status-dot bg-danger"></span>
                            Cancelled
                        </span>

                            <strong>5%</strong>

                        </div>

                    </div>

                </div>

            </div>

        </div>
        <!-- RECENT ACTIVITY -->

        <div class="dashboard-card mt-4">

            <h5 class="section-title">
                Recent Activity
            </h5>

            <div class="table-responsive">

                <table class="table activity-table align-middle">

                    <thead>

                    <tr>

                        <th>Customer</th>
                        <th>Action</th>
                        <th>Order ID</th>
                        <th>Amount</th>
                        <th>Date</th>

                    </tr>

                    </thead>

                    <tbody>

                    <tr>

                        <td>Jean Dupont</td>

                        <td>
                        <span class="badge-custom badge-success">
                            New Order
                        </span>
                        </td>

                        <td>#1258</td>

                        <td>¥35.00</td>

                        <td>2026-05-25</td>

                    </tr>

                    <tr>

                        <td>Alice Martin</td>

                        <td>
                        <span class="badge-custom badge-success">
                            Completed
                        </span>
                        </td>

                        <td>#1257</td>

                        <td>¥49.50</td>

                        <td>2026-05-25</td>

                    </tr>

                    <tr>

                        <td>Kevin Lee</td>

                        <td>
                        <span class="badge-custom badge-primary">
                            New Customer
                        </span>
                        </td>

                        <td>-</td>

                        <td>-</td>

                        <td>2026-05-24</td>

                    </tr>

                    <tr>

                        <td>Maria Chen</td>

                        <td>
                        <span class="badge-custom badge-danger">
                            Cancelled
                        </span>
                        </td>

                        <td>#1256</td>

                        <td>¥23.00</td>

                        <td>2026-05-24</td>

                    </tr>

                    <tr>

                        <td>David Smith</td>

                        <td>
                        <span class="badge-custom badge-success">
                            Completed
                        </span>
                        </td>

                        <td>#1255</td>

                        <td>¥41.00</td>

                        <td>2026-05-23</td>

                    </tr>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

    <!-- CHART JS -->

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>

        /* Orders Trend */

        new Chart(
            document.getElementById('ordersChart'),
            {
                type:'line',

                data:{

                    labels:[
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat',
                        'Sun'
                    ],

                    datasets:[{

                        label:'Orders',

                        data:[
                            120,
                            145,
                            160,
                            150,
                            185,
                            210,
                            245
                        ],

                        borderColor:'#ff6b00',

                        backgroundColor:'rgba(255,107,0,0.15)',

                        fill:true,

                        tension:0.4,

                        pointRadius:4,

                        pointBackgroundColor:'#ff6b00'

                    }]

                },

                options:{

                    responsive:true,

                    maintainAspectRatio:false,

                    plugins:{
                        legend:{
                            display:false
                        }
                    }

                }

            }
        );

        /* Revenue Chart */

        new Chart(
            document.getElementById('revenueChart'),
            {
                type:'bar',

                data:{

                    labels:[
                        'Jan',
                        'Feb',
                        'Mar',
                        'Apr',
                        'May',
                        'Jun',
                        'Jul'
                    ],

                    datasets:[

                        {

                            label:'Revenue',

                            data:[
                                6500,
                                7200,
                                6900,
                                8100,
                                8560,
                                9000,
                                9400
                            ],

                            backgroundColor:'#ff6b00',

                            borderRadius:6

                        }

                    ]

                },

                options:{

                    responsive:true,

                    maintainAspectRatio:false,

                    plugins:{
                        legend:{
                            display:false
                        }
                    }

                }

            }
        );

        /* Order Status */

        new Chart(
            document.getElementById('statusChart'),
            {

                type:'doughnut',

                data:{

                    labels:[
                        'Completed',
                        'Pending',
                        'Cancelled'
                    ],

                    datasets:[{

                        data:[
                            80,
                            15,
                            5
                        ],

                        backgroundColor:[
                            '#28a745',
                            '#ffc107',
                            '#dc3545'
                        ],

                        borderWidth:0

                    }]

                },

                options:{

                    responsive:true,

                    cutout:'70%',

                    plugins:{

                        legend:{
                            display:false
                        }

                    }

                }

            }
        );

    </script>