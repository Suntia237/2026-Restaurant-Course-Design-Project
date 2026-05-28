<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .account-container{

        width:100%;

        display:flex;

        flex-direction:column;

        gap:3vh;

    }

    /* PAGE TITLE */

    .account-title{

        display:flex;

        justify-content:space-between;

        align-items:center;

    }

    .account-title h1{

        font-size:2.2vw;

        color:#222;

    }

    .account-title p{

        color:#777;

        margin-top:0.5vh;

    }

    /* PROFILE CARD */

    .profile-card{

        width:100%;

        background:white;

        border-radius:25px;

        padding:2vw;

        display:flex;

        align-items:center;

        justify-content:space-between;

        box-shadow:0px 5px 20px rgba(0,0,0,0.06);

    }

    .profile-left{

        display:flex;

        align-items:center;

        gap:2vw;

    }

    .profile-left img{

        width:8vw;

        height:8vw;

        border-radius:50%;

        object-fit:cover;

        border:0.3vw solid #ff6b00;

    }

    .profile-info h2{

        font-size:2vw;

        color:#222;

    }

    .profile-info p{

        color:#777;

        margin-top:1vh;

        line-height:1.8;

    }

    .edit-btn{

        padding:1vw 2vw;

        background:#ff6b00;

        color:white;

        border:none;

        border-radius:12px;

        cursor:pointer;

        font-size:1vw;

        font-weight:600;

        transition:0.3s;

    }

    .edit-btn:hover{

        background:#ff8124;

    }

    /* SETTINGS GRID */

    .settings-grid{

        display:grid;

        grid-template-columns:repeat(2,1fr);

        gap:2vw;

    }

    .setting-card{

        background:white;

        border-radius:20px;

        padding:2vw;

        box-shadow:0px 5px 20px rgba(0,0,0,0.06);

    }

    .setting-card h3{

        margin-bottom:2vh;

        color:#222;

        font-size:1.4vw;

    }

    /* INPUTS */

    .input-group{

        display:flex;

        flex-direction:column;

        margin-bottom:2vh;

    }

    .input-group label{

        margin-bottom:1vh;

        font-weight:600;

        color:#444;

    }

    .input-group input{

        width:100%;

        padding:1vw;

        border:1px solid #ddd;

        border-radius:12px;

        font-size:1vw;

        outline:none;

        transition:0.3s;

    }

    .input-group input:focus{

        border-color:#ff6b00;

    }

    /* BUTTONS */

    .save-btn{

        width:100%;

        padding:1vw;

        border:none;

        border-radius:12px;

        background:#ff6b00;

        color:white;

        font-size:1vw;

        font-weight:600;

        cursor:pointer;

        transition:0.3s;

    }

    .save-btn:hover{

        background:#ff8124;

    }

    .danger-btn{

        width:100%;

        padding:1vw;

        border:none;

        border-radius:12px;

        background:#111;

        color:white;

        font-size:1vw;

        font-weight:600;

        cursor:pointer;

        margin-top:2vh;

        transition:0.3s;

    }

    .danger-btn:hover{

        background:#333;

    }

    /* SWITCH */

    .switch-box{

        display:flex;

        justify-content:space-between;

        align-items:center;

        padding:1vw 0;

        border-bottom:1px solid #eee;

    }

    .switch-box:last-child{

        border-bottom:none;

    }

    .switch-box span{

        color:#444;

        font-size:1vw;

    }

    .switch{

        width:3vw;

        height:1.5vw;

        background:#ff6b00;

        border-radius:2vw;

        position:relative;

        cursor:pointer;

    }

    .switch::before{

        content:"";

        position:absolute;

        width:1.2vw;

        height:1.2vw;

        background:white;

        border-radius:50%;

        top:0.15vw;

        right:0.2vw;

    }

</style>

<div class="account-container">

    <!-- TITLE -->

    <div class="account-title">

        <div>

            <h1>Account & Settings</h1>

            <p>Manage your profile and preferences</p>

        </div>

    </div>

    <!-- PROFILE -->

    <div class="profile-card">

        <div class="profile-left">

            <img src="<%=request.getContextPath()%>/images/profile.png"
                 alt="Profile">

            <div class="profile-info">

                <h2>Jean Dupont</h2>

                <p>

                    jean@email.com <br>
                    +237 6 12 34 56 78

                </p>

            </div>

        </div>

        <button class="edit-btn">

            Edit Profile

        </button>

    </div>

    <!-- SETTINGS -->

    <div class="settings-grid">

        <!-- PERSONAL INFO -->

        <div class="setting-card">

            <h3>Personal Information</h3>

            <div class="input-group">

                <label>First Name</label>

                <input type="text"
                       value="Jean">

            </div>

            <div class="input-group">

                <label>Last Name</label>

                <input type="text"
                       value="Dupont">

            </div>

            <div class="input-group">

                <label>Email</label>

                <input type="email"
                       value="jean@email.com">

            </div>

            <div class="input-group">

                <label>Phone Number</label>

                <input type="text"
                       value="+237 6 12 34 56 78">

            </div>

            <button class="save-btn">

                Save Changes

            </button>

        </div>

        <!-- SECURITY -->

        <div class="setting-card">

            <h3>Security & Preferences</h3>

            <div class="input-group">

                <label>Current Password</label>

                <input type="password"
                       placeholder="Enter current password">

            </div>

            <div class="input-group">

                <label>New Password</label>

                <input type="password"
                       placeholder="Enter new password">

            </div>

            <div class="input-group">

                <label>Confirm Password</label>

                <input type="password"
                       placeholder="Confirm new password">

            </div>

            <!-- SWITCHES -->

            <div class="switch-box">

                <span>Email Notifications</span>

                <div class="switch"></div>

            </div>

            <div class="switch-box">

                <span>Dark Mode</span>

                <div class="switch"></div>

            </div>

            <button class="save-btn">

                Update Password

            </button>

            <button class="danger-btn">

                Delete Account

            </button>

        </div>

    </div>

</div>