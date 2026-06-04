<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    .page-header{
        display:flex;
        justify-content:space-between;
        align-items:center;
        margin-bottom:30px;
    }

    .page-header h1{
        color:#222;
        font-size:32px;
        margin-bottom:5px;
    }

    .page-header p{
        color:#777;
    }

    .stats-grid{
        display:grid;
        grid-template-columns:repeat(5,1fr);
        gap:20px;
        margin-bottom:25px;
    }

    .stat-card{
        background:white;
        border-radius:20px;
        padding:25px;
        box-shadow:0 5px 20px rgba(0,0,0,.05);
    }

    .stat-card h2{
        color:#ff6b00;
        margin-bottom:10px;
    }

    .stat-card span{
        color:#666;
    }

    .dashboard-card{
        background:white;
        border-radius:20px;
        padding:25px;
        box-shadow:0 5px 20px rgba(0,0,0,.05);
        margin-bottom:25px;
    }

    .dashboard-card h3{
        margin-bottom:20px;
        color:#222;
    }

    .grid-two{
        width: 100%;
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

    .best-item{
        display:flex;
        justify-content:space-between;
        padding:15px 0;
        border-bottom:1px solid #eee;
    }

    .progress-item{
        margin-bottom:20px;
    }

    .progress-item p{
        margin-bottom:10px;
    }

    .progress-bar{
        width:100%;
        height:10px;
        background:#eee;
        border-radius:20px;
        overflow:hidden;
    }

    .progress-fill{
        height:100%;
        background:#ff6b00;
    }

    @media(max-width:992px){

        .stats-grid{
            grid-template-columns:1fr 1fr;
        }

        .grid-two{
            grid-template-columns:1fr;
        }
    }

</style>

<div class="page-header">

    <div>

        <h1>Restaurant Statistics</h1>

        <p>
            Monitor restaurant performance.
        </p>

    </div>

</div>

<!-- STATISTICS -->

<div class="stats-grid">
    <div class="stat-card">

        <h2>${totalAdmins}</h2>

        <span>Total Administrator</span>

    </div>

    <div class="stat-card">

        <h2>${totalCustomers}</h2>

        <span>Total Customers</span>

    </div>

    <div class="stat-card">

        <h2>${totalMenus}</h2>

        <span>Total Menu Items</span>

    </div>

    <div class="stat-card">

        <h2>${totalOrders}</h2>

        <span>Total Orders</span>

    </div>

    <div class="stat-card">

        <h2>${totalRevenue} RMB</h2>

        <span>Total Revenue</span>

    </div>

</div>

<!-- ORDERS + REVENUE -->

<div class="grid-two">

    <div class="dashboard-card">

        <table class="activity-table">

            <h3>All Users</h3>

            <thead>

            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Phone number</th>
                <th>Email</th>
                <th>Role</th>
            <tr>

            </thead>

            <tbody>

            <c:forEach var="user" items="${users}">

                <tr>

                    <td>${user.id}</td>
                    <td>${user.first_name}</td>
                    <td>${user.last_name}</td>
                    <td>${user.phone_number}</td>
                    <td>${user.email}</td>
                    <td>${user.role}</td>

                </tr>

            </c:forEach>

            </tbody>

        </table>

        <h3>All Orders</h3>

        <table class="activity-table">

            <thead>

            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Date</th>
                <th>Status</th>
                <th>Total</th>
            <tr>

            </thead>

            <tbody>

            <c:forEach var="order" items="${orders}">

                <tr>

                    <td>${order.order_id}</td>
                    <td>${order.client_id}</td>
                    <td>${order.order_date}</td>
                    <td>${order.status}</td>
                    <td>${order.total} RMB</td>

                </tr>

            </c:forEach>

            </tbody>

        </table>

    </div>

</div>

<!-- ORDER STATUS -->

<div class="dashboard-card">

    <h3>Order Status</h3>

    <div class="progress-item">

        <p>Completed (${completedPercent}%)</p>

        <div class="progress-bar">

            <div class="progress-fill"
                 style="width:${completedPercent}%">
            </div>

        </div>

    </div>

    <div class="progress-item">

        <p>Pending (${pendingPercent}%)</p>

        <div class="progress-bar">

            <div class="progress-fill"
                 style="width:${pendingPercent}%">
            </div>

        </div>

    </div>

    <div class="progress-item">

        <p>Cancelled (${cancelledPercent}%)</p>

        <div class="progress-bar">

            <div class="progress-fill"
                 style="width:${cancelledPercent}%">
            </div>

        </div>

    </div>

</div>