<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    body {
      background-color: #f5f6fa;
      font-family: 'Segoe UI', sans-serif;
    }

    .navbar-custom {
      background: #ffffff;
      padding: 15px 25px;
      border-bottom: 1px solid #eeeeee;
    }

    .dashboard-banner {
      height: 300px;
      border-radius: 15px;
      overflow: hidden;
      position: relative;
      background: url('/images/pizza.jpg') center center/cover no-repeat;
    }

    .banner-overlay {
      position: absolute;
      inset: 0;
      background: rgba(0,0,0,.55);
    }

    .banner-content {
      position: relative;
      z-index: 2;
      color: white;
      padding: 40px;
    }
    .text-warning{
      font-size: 20px;
    }

    .banner-title {
      font-size: 45px;
      font-weight: 700;
    }

    .primary-btn {
      background: #ff7a00;
      color: white;
      border: none;
    }

    .primary-btn:hover {
      background: #e86d00;
      color: white;
    }

    .dashboard-card {
      background: white;
      border-radius: 12px;
      padding: 50px;
      box-shadow: 0 2px 10px rgba(0,0,0,.08);
    }

    .section-title {
      font-size: 18px;
      font-weight: 600;
    }

    .order-item {
      display: flex;
      align-items: center;
      margin-bottom: 18px;
      border-bottom: 1px solid #f1f1f1;
      padding-bottom: 12px;
    }

    .order-image {
      width: 70px;
      height: 70px;
      border-radius: 10px;
      object-fit: cover;
      margin-right: 15px;
    }

    .menu-image {
      width: 100%;
      height: 90px;
      object-fit: cover;
      border-radius: 10px;
    }

    .stat-card {
      background: white;
      border-radius: 10px;
      padding: 20px;
      text-align: center;
      border: 1px solid #f0f0f0;
    }

    .stat-number {
      font-size: 28px;
      font-weight: bold;
    }

</style>

<div class="container-fluid">

  <!-- Hero Banner -->

  <div class="dashboard-banner mt-4">

    <div class="banner-overlay"></div>

    <div class="banner-content">

      <p class="text-warning fw-bold">
        WELCOME TO RAMIJO RESTAURANT
      </p>

      <h1 class="banner-title">
        Manage Your Restaurant
        <br>
        With Ease
      </h1>

      <p>
        Track your orders, manage menus and grow your business.
      </p>
        <a href="/admin-order">
          <button class="btn primary-btn">
            <i class="fa-solid fa-cart-shopping"></i>
            View Orders
          </button>
      </a>
        <a href="/admin-menu">
          <button class="btn btn-outline-light ms-2">
            <i class="fa-solid fa-plus"></i>
            Add Menu
          </button>
        </a>

    </div>

  </div>

  <!-- Main Content -->

  <div class="row mt-4">

    <!-- Pending Orders -->

    <div class="col-lg-6">

      <div class="dashboard-card">

        <div class="d-flex justify-content-between mb-3">

          <h5 class="section-title">
            Pending Orders
          </h5>

          <span class="badge bg-warning text-dark">
                        18
                    </span>

        </div>

        <div class="order-item">

          <img src="images/pizza.jpg"
               class="order-image">

          <div class="flex-grow-1">

            <strong>Order #1258</strong><br>

            Pizza Margherita, Orange Juice

            <div class="text-warning">
              Preparing
            </div>

          </div>

          <strong>25.00RMB</strong>

        </div>

        <div class="order-item">

          <img src="images/burger.jpg"
               class="order-image">

          <div class="flex-grow-1">

            <strong>Order #1257</strong><br>

            Classic Burger, Fries, Soda

            <div class="text-warning">
              Preparing
            </div>

          </div>

          <strong>15.50RMB</strong>

        </div>

        <div class="order-item">

          <img src="/images/salade.jpg"
               class="order-image">

          <div class="flex-grow-1">

            <strong>Order #1256</strong><br>

            Caesar Salad, Mineral Water

            <div class="text-warning">
              Payment Pending
            </div>

          </div>

          <strong>12.00RMB</strong>

        </div>

        <div class="order-item">

          <img src="images/biere.jpg"
               class="order-image">

          <div class="flex-grow-1">

            <strong>Order #1255</strong><br>

            Orange Juice, Chocolate Fondant

            <div class="text-warning">
              Preparing
            </div>

          </div>

          <strong>9.50RMB</strong>

        </div>

      </div>

    </div>

    <!-- Right Section -->

    <div class="col-lg-6">

      <!-- Dishes Available -->

      <div class="dashboard-card mb-4">

        <div class="d-flex justify-content-between mb-3">

          <h5 class="section-title">
            Dishes Available
          </h5>

          <a href="#" class="text-decoration-none">
            View Menu →
          </a>

        </div>

        <div class="row">

          <div class="col-md-3">

            <img src="/images/pizza.jpg"
                 class="menu-image">

            <h6 class="mt-2">
              Pizza Margherita
            </h6>

            <small>42 sales</small>

          </div>

          <div class="col-md-3">

            <img src="/images/burger.jpg"
                 class="menu-image">

            <h6 class="mt-2">
              Classic Burger
            </h6>

            <small>38 sales</small>

          </div>

          <div class="col-md-3">

            <img src="/images/steak-frite.jpg"
                 class="menu-image">

            <h6 class="mt-2">
              Grilled Steak
            </h6>

            <small>29 sales</small>

          </div>

          <div class="col-md-3">

            <img src="/images/salade.jpg"
                 class="menu-image">

            <h6 class="mt-2">
              Caesar Salad
            </h6>

            <small>26 sales</small>

          </div>

        </div>

      </div>

      <!-- Statistics -->

      <div class="dashboard-card">

        <h5 class="section-title mb-3">
          Restaurant Statistics
        </h5>

        <div class="row g-3">

          <div class="col-md-6">

            <div class="stat-card">

              <i class="fa-solid fa-cart-shopping fa-2x text-warning"></i>

              <div class="stat-number">
                ${totalOrders}
              </div>

              <small>Total Orders</small>

            </div>

          </div>

          <div class="col-md-6">

            <div class="stat-card">

              <i class="fa-solid fa-clock fa-2x text-success"></i>

              <div class="stat-number">
                ${totalMenus}
              </div>

              <small>Menus</small>

            </div>

          </div>

          <div class="col-md-6">

            <div class="stat-card">

              <i class="fa-solid fa-dollar-sign fa-2x text-warning"></i>

              <div class="stat-number">
                ${totalRevenue}
              </div>

              <small>Total Revenue</small>

            </div>

          </div>

          <div class="col-md-6">

            <div class="stat-card">

              <i class="fa-solid fa-users fa-2x text-primary"></i>

              <div class="stat-number">
                ${totalCustomers}
              </div>

              <small>Registered Customers</small>

            </div>

          </div>

        </div>

      </div>

    </div>

  </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>