<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RAMUO - Menu Management</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

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

        .main-container {
            display: flex;
            width: 100%;
            min-height: 100vh;
        }

        .content-area {
            width: 100%;
            display: flex;
            flex-direction: column;
        }

        .page-content {
            flex: 1;
            padding: 30px;
            background: #f5f5f5;
        }

        /* ================= TITLE ================= */
        .page-title {
            font-size: 32px;
            font-weight: 700;
            color: #222;
            margin-bottom: 5px;
        }

        .page-subtitle {
            color: #777;
            margin-bottom: 30px;
        }

        /* ================= CARD ================= */
        .card-box {
            background: #fff;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
            border: 1px solid #eee;
        }

        .section-title {
            font-size: 22px;
            font-weight: 600;
            color: #222;
        }

        .section-subtitle {
            color: #888;
            font-size: 14px;
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
            font-size: 42px;
            font-weight: 700;
            color: #ff7300;
            margin-bottom: 5px;
        }

        .stats-label {
            font-size: 16px;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .stats-desc {
            font-size: 13px;
            color: #888;
            margin-bottom: 0;
        }

        /* ================= SEARCH BAR ================= */
        .search-container {
            margin-bottom: 25px;
        }

        .search-input {
            height: 48px;
            border-radius: 12px;
            border: 1px solid #ddd;
            padding-left: 45px;
            font-size: 14px;
        }

        .search-input:focus {
            box-shadow: none;
            border-color: #ff7300;
        }

        .search-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: #aaa;
            z-index: 10;
        }

        /* ================= MENU TABLE ================= */
        .menu-table {
            width: 100%;
        }

        .menu-table th {
            font-weight: 600;
            color: #555;
            font-size: 14px;
            padding-bottom: 15px;
            border-bottom: 2px solid #f0f0f0;
        }

        .menu-table td {
            padding: 18px 0;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
        }

        .menu-item-title {
            font-weight: 600;
            color: #222;
            margin-bottom: 5px;
            font-size: 16px;
        }

        .menu-item-desc {
            font-size: 13px;
            color: #888;
            margin-bottom: 0;
        }

        .category-badge {
            background: #f0f0f0;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 13px;
            color: #555;
            display: inline-block;
        }

        .price {
            font-weight: 700;
            color: #ff7300;
            font-size: 16px;
        }

        .action-icons {
            display: flex;
            gap: 12px;
        }

        .action-icon {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            background: #f5f5f5;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: 0.2s;
            color: #777;
        }

        .action-icon:hover {
            background: #ff7300;
            color: #fff;
        }

        /* ================= PAGINATION ================= */
        .pagination-info {
            color: #888;
            font-size: 14px;
        }

        .pagination-nav {
            display: flex;
            gap: 8px;
        }

        .page-btn {
            width: 38px;
            height: 38px;
            border-radius: 8px;
            border: 1px solid #ddd;
            background: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: 0.2s;
            color: #555;
        }

        .page-btn.active {
            background: #ff7300;
            border-color: #ff7300;
            color: #fff;
        }

        .page-btn:hover:not(.active) {
            border-color: #ff7300;
            color: #ff7300;
        }

        /* ================= CATEGORIES SIDEBAR ================= */
        .categories-sidebar {
            background: #fff;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
            border: 1px solid #eee;
        }

        .categories-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #222;
        }

        .category-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #f0f0f0;
            cursor: pointer;
            transition: 0.2s;
        }

        .category-item:hover {
            color: #ff7300;
        }

        .category-name {
            font-size: 14px;
            color: #555;
        }

        .category-count {
            background: #f0f0f0;
            padding: 2px 8px;
            border-radius: 15px;
            font-size: 12px;
            color: #777;
        }

        .category-item.active .category-name {
            color: #ff7300;
            font-weight: 500;
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

        @media (max-width: 768px) {
            .page-content {
                padding: 20px;
            }

            .page-title {
                font-size: 26px;
            }

            .stats-number {
                font-size: 32px;
            }

            .menu-table th,
            .menu-table td {
                font-size: 13px;
            }
        }
    </style>
</head>

<body>

<div class="main-container">
    <div class="content-area">
        <main class="page-content">

            <!-- PAGE TITLE -->
            <h1 class="page-title">Hello, Admin! 👋</h1>
            <p class="page-subtitle">Menu Management • Home > Menus</p>

            <!-- STATS CARDS ROW -->
            <div class="row g-4 mb-4">
                <div class="col-md-6">
                    <div class="stats-card">
                        <div class="stats-number">24</div>
                        <div class="stats-label">Total Menus</div>
                        <p class="stats-desc">All available dishes</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="stats-card">
                        <div class="stats-number">20</div>
                        <div class="stats-label">Active Menus</div>
                        <p class="stats-desc">Currently available</p>
                    </div>
                </div>
            </div>

            <!-- SEARCH BAR + CATEGORIES ROW -->
            <div class="row g-4">
                <!-- LEFT COLUMN: MENU LIST -->
                <div class="col-lg-9">
                    <div class="card-box">
                        <!-- SEARCH -->
                        <div class="search-container position-relative">
                            <i class="fa-solid fa-search search-icon"></i>
                            <input type="text" class="form-control search-input" placeholder="Search for a menu...">
                        </div>

                        <!-- MENU TABLE -->
                        <div class="table-responsive">
                            <table class="menu-table">
                                <thead>
                                <tr>
                                    <th>DISH</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th style="width: 100px;">Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="menu-item-title">🍕 Pizza Margherita</div>
                                        <div class="menu-item-desc">Tomato, mozzarella, fresh basil</div>
                                    </td>
                                    <td><span class="category-badge">Pizzas</span></td>
                                    <td class="price">€12.50</td>
                                    <td>
                                        <div class="action-icons">
                                            <div class="action-icon"><i class="fa-regular fa-pen-to-square"></i></div>
                                            <div class="action-icon"><i class="fa-regular fa-copy"></i></div>
                                            <div class="action-icon"><i class="fa-regular fa-trash-can"></i></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="menu-item-title">🍔 Classic Burger</div>
                                        <div class="menu-item-desc">Ground steak, cheddar, lettuce, tomato, house sauce</div>
                                    </td>
                                    <td><span class="category-badge">Burgers</span></td>
                                    <td class="price">€10.90</td>
                                    <td>
                                        <div class="action-icons">
                                            <div class="action-icon"><i class="fa-regular fa-pen-to-square"></i></div>
                                            <div class="action-icon"><i class="fa-regular fa-copy"></i></div>
                                            <div class="action-icon"><i class="fa-regular fa-trash-can"></i></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="menu-item-title">🥗 Caesar Salad</div>
                                        <div class="menu-item-desc">Grilled chicken, lettuce, parmesan, caesar sauce</div>
                                    </td>
                                    <td><span class="category-badge">Salads</span></td>
                                    <td class="price">€8.50</td>
                                    <td>
                                        <div class="action-icons">
                                            <div class="action-icon"><i class="fa-regular fa-pen-to-square"></i></div>
                                            <div class="action-icon"><i class="fa-regular fa-copy"></i></div>
                                            <div class="action-icon"><i class="fa-regular fa-trash-can"></i></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="menu-item-title">🥩 Grilled Steak</div>
                                        <div class="menu-item-desc">Grilled entrecôte, homemade fries, choice of sauce</div>
                                    </td>
                                    <td><span class="category-badge">Main Courses</span></td>
                                    <td class="price">€18.90</td>
                                    <td>
                                        <div class="action-icons">
                                            <div class="action-icon"><i class="fa-regular fa-pen-to-square"></i></div>
                                            <div class="action-icon"><i class="fa-regular fa-copy"></i></div>
                                            <div class="action-icon"><i class="fa-regular fa-trash-can"></i></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="menu-item-title">🧃 Fresh Orange Juice</div>
                                        <div class="menu-item-desc">Freshly squeezed orange juice</div>
                                    </td>
                                    <td><span class="category-badge">Beverages</span></td>
                                    <td class="price">€3.50</td>
                                    <td>
                                        <div class="action-icons">
                                            <div class="action-icon"><i class="fa-regular fa-pen-to-square"></i></div>
                                            <div class="action-icon"><i class="fa-regular fa-copy"></i></div>
                                            <div class="action-icon"><i class="fa-regular fa-trash-can"></i></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="menu-item-title">🍫 Chocolate Lava Cake</div>
                                        <div class="menu-item-desc">Served with vanilla ice cream</div>
                                    </td>
                                    <td><span class="category-badge">Desserts</span></td>
                                    <td class="price">€6.50</td>
                                    <td>
                                        <div class="action-icons">
                                            <div class="action-icon"><i class="fa-regular fa-pen-to-square"></i></div>
                                            <div class="action-icon"><i class="fa-regular fa-copy"></i></div>
                                            <div class="action-icon"><i class="fa-regular fa-trash-can"></i></div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- PAGINATION -->
                        <div class="d-flex justify-content-between align-items-center flex-wrap mt-4 pt-2">
                            <div class="pagination-info">Showing 1 to 6 of 24 menus</div>
                            <div class="pagination-nav">
                                <div class="page-btn"><i class="fa-solid fa-chevron-left"></i></div>
                                <div class="page-btn active">1</div>
                                <div class="page-btn">2</div>
                                <div class="page-btn">3</div>
                                <div class="page-btn">4</div>
                                <div class="page-btn"><i class="fa-solid fa-chevron-right"></i></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- RIGHT COLUMN: CATEGORIES -->
                <div class="col-lg-3">
                    <div class="categories-sidebar">
                        <div class="categories-title">
                            <i class="fa-solid fa-tag me-2"></i> Categories
                        </div>
                        <div class="category-item active">
                            <span class="category-name">Types</span>
                            <span class="category-count">2</span>
                        </div>
                        <div class="category-item">
                            <span class="category-name">Food</span>
                            <span class="category-count">5</span>
                        </div>
                        <div class="category-item">
                            <span class="category-name">Beverages</span>
                            <span class="category-count">6</span>
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
                        <a href="#">Terms of Use</a>
                        <a href="#">Help</a>
                    </div>
                </div>
            </footer>

        </main>
    </div>
</div>

</body>
</html>