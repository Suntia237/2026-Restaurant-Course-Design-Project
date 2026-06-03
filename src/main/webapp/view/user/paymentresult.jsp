<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .result-container{
        display:flex;
        justify-content:center;
        align-items:center;
        height:70vh;
    }

    .result-card{
        width:40vw;
        background:white;
        border-radius:20px;
        padding:3vw;
        text-align:center;
        box-shadow:0px 5px 20px rgba(0,0,0,0.05);
    }

    .success-icon{
        font-size:5vw;
        color:#28a745;
        margin-bottom:2vh;
    }

    .error-icon{
        font-size:5vw;
        color:#dc3545;
        margin-bottom:2vh;
    }

    .result-card h1{
        color:#222;
        margin-bottom:2vh;
    }

    .result-card p{
        color:#777;
        margin-bottom:3vh;
    }

    .home-btn{
        border:none;
        background:#ff6b00;
        color:white;
        padding:1vw 2vw;
        border-radius:12px;
        cursor:pointer;
        font-weight:600;
    }

    .home-btn:hover{
        background:#e65f00;
    }

</style>

<div class="result-container">

    <div class="result-card">

        <% String paymentSuccess = request.getParameter("paymentSuccess"); %>

        <% if(paymentSuccess != null && paymentSuccess.equals("true")){ %>

            <div class="success-icon">
                ✅
            </div>

            <h1>Payment Successful</h1>

            <p>
                Your order has been placed successfully.<br>
                Thank you for choosing RAMIJO Restaurant.
            </p >

        <% } else { %>

            <div class="error-icon">
                ❌
            </div>

            <h1>Payment Unsuccessful</h1>

            <p>
                We could not process your payment.
                Please try again or choose another payment method.
            </p >

        <% } %>

        <a href="/home">
            <button class="home-btn">
                Back to Home
            </button>
        </a >

    </div>
</div>