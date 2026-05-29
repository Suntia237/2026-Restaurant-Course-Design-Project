<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>RAMIJO Restaurant</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins', sans-serif;
        }

        body{
            background:#f5f5f5;
            overflow-x:hidden;
        }

        .main-container{
            display:flex;
            width:100%;
            min-height:100vh;
        }

        .content-area{
            width:100%;
            display:flex;
            flex-direction:column;
        }

        .page-content{
            flex:1;
            padding:30px;
            background:#f5f5f5;
        }

        /* ================= TITLE ================= */

        .page-title{
            font-size:32px;
            font-weight:700;
            color:#222;
            margin-bottom:5px;
        }

        .page-subtitle{
            color:#777;
            margin-bottom:30px;
        }

        /* ================= CARD ================= */

        .card-box{
            background:#fff;
            border-radius:15px;
            padding:25px;
            margin-bottom:25px;
            box-shadow:0 4px 12px rgba(0,0,0,0.06);
            border:1px solid #eee;
        }

        .section-title{
            font-size:22px;
            font-weight:600;
            color:#222;
        }

        .section-subtitle{
            color:#888;
            font-size:14px;
        }

        /* ================= PROFILE ================= */

        .profile-container{
            position:relative;
            width:100px;
            height:100px;
            margin:auto;
        }

        .profile-image{
            width:100%;
            height:100%;
            border-radius:50%;
            object-fit:cover;
            border:3px solid #f1f1f1;
        }

        .camera-icon{
            position:absolute;
            bottom:0;
            right:0;
            width:30px;
            height:30px;
            border-radius:50%;
            background:#fff;
            border:1px solid #ddd;
            display:flex;
            align-items:center;
            justify-content:center;
            cursor:pointer;
        }

        /* ================= FORM ================= */

        .form-label{
            font-weight:500;
            color:#555;
            margin-bottom:8px;
        }

        .form-control{
            height:48px;
            border-radius:10px;
            border:1px solid #ddd;
        }

        .form-control:focus{
            box-shadow:none;
            border-color:#ff7300;
        }

        .input-group-text{
            background:#fff;
            border-radius:0 10px 10px 0;
        }

        /* ================= BUTTONS ================= */

        .btn-orange{
            background:#ff7300;
            color:#fff;
            border:none;
            padding:12px 22px;
            border-radius:10px;
            font-weight:500;
            transition:0.3s;
        }

        .btn-orange:hover{
            background:#e56600;
            color:#fff;
        }

        .btn-delete{
            border:1px solid #ff4d4d;
            background:#fff;
            color:#ff4d4d;
            padding:12px 22px;
            border-radius:10px;
            transition:0.3s;
            font-weight:500;
        }

        .btn-delete:hover{
            background:#ff4d4d;
            color:#fff;
        }

        /* ================= ACCOUNT ID ================= */

        .account-id{
            display:flex;
            align-items:center;
            gap:10px;
            background:#fafafa;
            border:1px solid #eee;
            padding:10px 18px;
            border-radius:10px;
            font-size:14px;
            color:#444;
        }

        /* ================= RESPONSIVE ================= */

        @media(max-width:768px){

            .page-content{
                padding:20px;
            }

            .page-title{
                font-size:26px;
            }

            .account-id{
                margin-top:15px;
            }

        }

    </style>

</head>

<body>

<div class="main-container">

    <!-- NAVBAR -->
    <%-- <jsp:include page="navbar.jsp"/> --%>

    <!-- CONTENT -->
    <div class="content-area">

        <!-- HEADER -->
        <%-- <jsp:include page="header.jsp"/> --%>

        <!-- PAGE -->
        <main class="page-content">

            <!-- PAGE TITLE -->
            <h1 class="page-title">
                My Account & Settings
            </h1>

            <p class="page-subtitle">
                Manage your personal information,
                security, and preferences.
            </p>

            <!-- ================= PERSONAL INFO ================= -->

            <div class="card-box">

                <!-- TOP HEADER -->
                <div class="d-flex justify-content-between
                            align-items-center
                            flex-wrap mb-4">

                    <div>

                        <h3 class="section-title mb-1">
                            Personal Information
                        </h3>

                        <p class="section-subtitle mb-0">
                            Update your personal information.
                        </p>

                    </div>

                    <!-- ACCOUNT ID -->
                    <div class="account-id">

                        <span>
                            <i class="fa-regular fa-id-card"></i>
                            Account ID :
                        </span>

                        <strong>000${user.id}</strong>

                    </div>

                </div>

                <!-- FORM -->
                <form action="/account"
                      method="post">

                    <div class="row align-items-start">

                        <!-- PROFILE IMAGE -->
                        <div class="col-md-2 text-center mb-4">

                            <div class="profile-container">

                                <img src="images/orange.png"
                                     alt="Profile"
                                     class="profile-image">

                                <div class="camera-icon">
                                    <i class="fa-solid fa-camera"></i>
                                </div>

                            </div>

                        </div>

                        <!-- INPUTS -->
                        <div class="col-md-10">

                            <div class="row">

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">
                                        First Name
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           value=${user.first_name}>

                                </div>

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">
                                        Last Name
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           value=${user.last_name}>

                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">
                                        Email
                                    </label>

                                    <input type="email"
                                           class="form-control"
                                           value=${user.email}>

                                </div>

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">
                                        Phone Number
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           value=${user.phone_number}>

                                </div>

                            </div>

                            <!-- ACTION BUTTONS -->
                            <div class="d-flex justify-content-end
                                        flex-wrap gap-3 mt-4">

                                <!-- DELETE -->
                                <button type="button"
                                        class="btn-delete">

                                    <i class="fa-regular fa-trash-can"></i>
                                    Delete My Account

                                </button>

                                <!-- SAVE -->
                                <button type="submit"
                                        class="btn-orange">

                                    <i class="fa-solid fa-floppy-disk"></i>
                                    Save Changes

                                </button>

                            </div>

                        </div>

                    </div>

                </form>

            </div>

            <!-- ================= PASSWORD SECTION ================= -->

            <div class="card-box">

                <h3 class="section-title mb-1">
                    Change Password
                </h3>

                <p class="section-subtitle mb-4">
                    Make sure to use a strong password.
                </p>

                <form action="ChangePasswordServlet"
                      method="post">

                    <div class="row">

                        <!-- CURRENT PASSWORD -->
                        <div class="col-md-4 mb-3">

                            <label class="form-label">
                                Current Password
                            </label>

                            <div class="input-group">

                                <input type="password"
                                       class="form-control"
                                       placeholder="Current Password">

                                <span class="input-group-text">
                                    <i class="fa-regular fa-eye"></i>
                                </span>

                            </div>

                        </div>

                        <!-- NEW PASSWORD -->
                        <div class="col-md-4 mb-3">

                            <label class="form-label">
                                New Password
                            </label>

                            <div class="input-group">

                                <input type="password"
                                       class="form-control"
                                       placeholder="New Password">

                                <span class="input-group-text">
                                    <i class="fa-regular fa-eye"></i>
                                </span>

                            </div>

                        </div>

                        <!-- CONFIRM PASSWORD -->
                        <div class="col-md-4 mb-3">

                            <label class="form-label">
                                Confirm Password
                            </label>

                            <div class="input-group">

                                <input type="password"
                                       class="form-control"
                                       placeholder="Confirm Password">

                                <span class="input-group-text">
                                    <i class="fa-regular fa-eye"></i>
                                </span>

                            </div>

                        </div>

                    </div>

                    <!-- UPDATE BUTTON -->
                    <div class="text-end mt-3">

                        <button type="submit"
                                class="btn-orange">

                            <i class="fa-solid fa-lock"></i>
                            Update Password

                        </button>

                    </div>

                </form>

            </div>

        </main>

        <!-- FOOTER -->
        <%-- <jsp:include page="footer.jsp"/> --%>

    </div>

</div>

</body>
</html>