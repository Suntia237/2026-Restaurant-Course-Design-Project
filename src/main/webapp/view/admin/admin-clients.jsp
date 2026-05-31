<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RAMUO - Admin Clients</title>

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

        .page-content {
            flex: 1;
            padding: 30px;
            background: #f5f5f5;
            max-width: 1400px;
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

        .page-subtitle {
            color: #777;
            margin-bottom: 30px;
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

        /* ================= CLIENTS TABLE ================= */
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

        .clients-table {
            width: 100%;
        }

        .clients-table th {
            font-weight: 600;
            color: #555;
            font-size: 13px;
            padding-bottom: 15px;
            border-bottom: 2px solid #f0f0f0;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .clients-table td {
            padding: 18px 0;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
        }

        .client-name {
            font-weight: 600;
            color: #222;
            margin-bottom: 5px;
            font-size: 15px;
        }

        .client-email {
            font-size: 12px;
            color: #888;
            margin-bottom: 0;
        }

        .contact-phone {
            font-weight: 500;
            color: #333;
            font-size: 14px;
        }

        .contact-location {
            font-size: 12px;
            color: #888;
            margin-top: 3px;
        }

        .status-badge {
            display: inline-block;
            padding: 5px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-active {
            background: #d4edda;
            color: #155724;
        }

        .status-vip {
            background: #fff3cd;
            color: #856404;
        }

        .status-inactive {
            background: #f8d7da;
            color: #721c24;
        }

        .total-spent {
            font-weight: 700;
            color: #ff7300;
            font-size: 15px;
        }

        .action-icons {
            display: flex;
            gap: 10px;
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
            cursor: pointer;
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

        .notification-icon {
            font-size: 20px;
            color: #888;
            cursor: pointer;
            transition: color 0.2s;
        }

        .notification-icon:hover {
            color: #ff7300;
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

            .clients-table th,
            .clients-table td {
                font-size: 12px;
            }

            .action-icons {
                flex-wrap: wrap;
            }

            .header-top {
                flex-direction: column;
                gap: 15px;
                align-items: flex-start;
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
            <i class="fa-regular fa-bell notification-icon"></i>
            <div class="admin-avatar">AD</div>
        </div>
    </div>

    <!-- BREADCRUMB -->
    <div class="breadcrumb-custom">
        <a href="#">Dashboard</a>
        <span class="separator">></span>
        <span style="color: #ff7300;">Clients</span>
    </div>

    <!-- STATS CARDS ROW -->
    <div class="row g-4 mb-4">
        <div class="col-md-6">
            <div class="stats-card">
                <div class="stats-number">540</div>
                <div class="stats-label">Total Clients</div>
                <p class="stats-desc">All registered customers</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="stats-card">
                <div class="stats-number">5</div>
                <div class="stats-label">Total Administrators</div>
                <p class="stats-desc">System administrators</p>
            </div>
        </div>
    </div>

    <!-- CLIENTS TABLE -->
    <div class="card-box">
        <div class="d-flex justify-content-between align-items-center flex-wrap mb-4">
            <h2 class="section-title">All Clients (540)</h2>
        </div>

        <!-- SEARCH -->
        <div class="search-container position-relative">
            <i class="fa-solid fa-search search-icon"></i>
            <input type="text" id="searchInput" class="form-control search-input" placeholder="Search client by name, email or phone...">
        </div>

        <!-- TABLE -->
        <div class="table-responsive">
            <table class="clients-table w-100">
                <thead>
                <tr>
                    <th>CLIENT</th>
                    <th>CONTACT</th>
                    <th>TOTAL ORDERS</th>
                    <th>TOTAL SPENT</th>
                    <th>STATUS</th>
                    <th>ACTIONS</th>
                </tr>
                </thead>
                <tbody id="clientsTableBody">
                <!-- Client 1 -->
                <tr>
                    <td>
                        <div class="client-name">Jean Dupont</div>
                        <div class="client-email">jean.dupont@email.com</div>
                    </td>
                    <td>
                        <div class="contact-phone">+237 6 12 34 56 78</div>
                        <div class="contact-location">Yaoundé, Cameroon</div>
                    </td>
                    <td>25</td>
                    <td class="total-spent">¥85,500</td>
                    <td>
                        <span class="status-badge status-active">Active</span>
                    </td>
                    <td>
                        <div class="action-icons">
                            <div class="action-icon"><i class="fa-regular fa-pen-to-square"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-trash-can"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-eye"></i></div>
                        </div>
                    </td>
                </tr>
                <!-- Client 2 -->
                <tr>
                    <td>
                        <div class="client-name">Alice Smith</div>
                        <div class="client-email">alice.smith@email.com</div>
                    </td>
                    <td>
                        <div class="contact-phone">+237 6 98 76 54 32</div>
                        <div class="contact-location">Douala, Cameroon</div>
                    </td>
                    <td>18</td>
                    <td class="total-spent">¥62,300</td>
                    <td>
                        <span class="status-badge status-active">Active</span>
                    </td>
                    <td>
                        <div class="action-icons">
                            <div class="action-icon"><i class="fa-regular fa-pen-to-square"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-trash-can"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-eye"></i></div>
                        </div>
                    </td>
                </tr>
                <!-- Client 3 -->
                <tr>
                    <td>
                        <div class="client-name">Kevin Lee</div>
                        <div class="client-email">kevin.lee@email.com</div>
                    </td>
                    <td>
                        <div class="contact-phone">+237 6 45 21 98 76</div>
                        <div class="contact-location">Bafoussam, Cameroon</div>
                    </td>
                    <td>12</td>
                    <td class="total-spent">¥35,200</td>
                    <td>
                        <span class="status-badge status-active">Active</span>
                    </td>
                    <td>
                        <div class="action-icons">
                            <div class="action-icon"><i class="fa-regular fa-pen-to-square"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-trash-can"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-eye"></i></div>
                        </div>
                    </td>
                </tr>
                <!-- Client 4 - VIP -->
                <tr>
                    <td>
                        <div class="client-name">Maria Chen</div>
                        <div class="client-email">maria.chen@email.com</div>
                    </td>
                    <td>
                        <div class="contact-phone">+237 6 77 33 22 11</div>
                        <div class="contact-location">Yaoundé, Cameroon</div>
                    </td>
                    <td>30</td>
                    <td class="total-spent">¥92,750</td>
                    <td>
                        <span class="status-badge status-vip">VIP</span>
                    </td>
                    <td>
                        <div class="action-icons">
                            <div class="action-icon"><i class="fa-regular fa-pen-to-square"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-trash-can"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-eye"></i></div>
                        </div>
                    </td>
                </tr>
                <!-- Client 5 - Inactive -->
                <tr>
                    <td>
                        <div class="client-name">Paul Martin</div>
                        <div class="client-email">paul.martin@email.com</div>
                    </td>
                    <td>
                        <div class="contact-phone">+237 6 88 99 00 11</div>
                        <div class="contact-location">Douala, Cameroon</div>
                    </td>
                    <td>8</td>
                    <td class="total-spent">¥18,400</td>
                    <td>
                        <span class="status-badge status-inactive">Inactive</span>
                    </td>
                    <td>
                        <div class="action-icons">
                            <div class="action-icon"><i class="fa-regular fa-pen-to-square"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-trash-can"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-eye"></i></div>
                        </div>
                    </td>
                </tr>
                <!-- Client 6 -->
                <tr>
                    <td>
                        <div class="client-name">Sophie Lemine</div>
                        <div class="client-email">sophie.lemine@email.com</div>
                    </td>
                    <td>
                        <div class="contact-phone">+237 6 66 44 33 22</div>
                        <div class="contact-location">Yaoundé, Cameroon</div>
                    </td>
                    <td>15</td>
                    <td class="total-spent">¥47,600</td>
                    <td>
                        <span class="status-badge status-active">Active</span>
                    </td>
                    <td>
                        <div class="action-icons">
                            <div class="action-icon"><i class="fa-regular fa-pen-to-square"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-trash-can"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-eye"></i></div>
                        </div>
                    </td>
                </tr>
                <!-- Client 7 -->
                <tr>
                    <td>
                        <div class="client-name">David K.</div>
                        <div class="client-email">david.k@email.com</div>
                    </td>
                    <td>
                        <div class="contact-phone">+237 6 55 66 77 88</div>
                        <div class="contact-location">Douala, Cameroon</div>
                    </td>
                    <td>22</td>
                    <td class="total-spent">¥71,900</td>
                    <td>
                        <span class="status-badge status-active">Active</span>
                    </td>
                    <td>
                        <div class="action-icons">
                            <div class="action-icon"><i class="fa-regular fa-pen-to-square"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-trash-can"></i></div>
                            <div class="action-icon"><i class="fa-regular fa-eye"></i></div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- PAGINATION -->
        <div class="d-flex justify-content-between align-items-center flex-wrap mt-4 pt-2">
            <div class="pagination-info" id="paginationInfo">Showing 1 to 7 of 540 clients</div>
            <div class="pagination-nav">
                <div class="page-btn" onclick="previousPage()"><i class="fa-solid fa-chevron-left"></i></div>
                <div class="page-btn active" onclick="goToPage(1)">1</div>
                <div class="page-btn" onclick="goToPage(2)">2</div>
                <div class="page-btn" onclick="goToPage(3)">3</div>
                <div class="page-btn" onclick="goToPage(4)">4</div>
                <div class="page-btn" onclick="nextPage()"><i class="fa-solid fa-chevron-right"></i></div>
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
    // Search functionality
    document.getElementById('searchInput').addEventListener('keyup', function() {
        let searchValue = this.value.toLowerCase();
        let rows = document.querySelectorAll('#clientsTableBody tr');
        let visibleCount = 0;

        rows.forEach(row => {
            let text = row.textContent.toLowerCase();
            if(text.includes(searchValue)) {
                row.style.display = '';
                visibleCount++;
            } else {
                row.style.display = 'none';
            }
        });

        document.getElementById('paginationInfo').innerHTML = `Showing 1 to ${visibleCount} of ${visibleCount} clients`;
    });

    function previousPage() {
        console.log('Previous page');
    }

    function nextPage() {
        console.log('Next page');
    }

    function goToPage(page) {
        console.log('Go to page ' + page);
        document.querySelectorAll('.page-btn').forEach(btn => {
            if(btn.textContent == page) {
                btn.classList.add('active');
            } else if(!btn.querySelector('i')) {
                btn.classList.remove('active');
            }
        });
    }
</script>

</body>
</html>