<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .payment-header{
        margin-bottom:30px;
    }

    .payment-header h1{
        font-size:32px;
        color:#222;
        margin-bottom:8px;
    }

    .payment-header p{
        color:#777;
    }

    /* PAYMENT STEPS */

    .steps-container{
        display:flex;
        justify-content:space-between;
        gap:15px;
        margin-bottom:30px;
    }

    .step-card{
        flex:1;
        background:white;
        padding:20px;
        border-radius:20px;
        box-shadow:0 5px 20px rgba(0,0,0,0.05);
        text-align:center;
    }

    .step-card.active{
        border:2px solid #ff6b00;
    }

    .step-number{
        width:40px;
        height:40px;
        border-radius:50%;
        background:#ff6b00;
        color:white;
        display:flex;
        align-items:center;
        justify-content:center;
        margin:auto;
        margin-bottom:10px;
        font-weight:bold;
    }

    /* MAIN PAYMENT */

    .payment-layout{
        display:flex;
        gap:25px;
    }

    .payment-left{
        flex:2;
    }

    .payment-right{
        flex:1;
    }

    /* PAYMENT METHODS */

    .payment-methods{
        background:white;
        padding:25px;
        border-radius:20px;
        box-shadow:0 5px 20px rgba(0,0,0,0.05);
        margin-bottom:20px;
    }

    .payment-methods h3{
        margin-bottom:20px;
        color:#222;
    }

    .method-grid{
        display:flex;
        gap:15px;
    }

    .method-card{
        flex:1;
        border:2px solid #eee;
        border-radius:15px;
        padding:20px;
        text-align:center;
        cursor:pointer;
        transition:0.3s;
    }
    img{
    width: 20px;
    height:auto;

    .method-card:hover{
        border-color:#ff6b00;
    }

    .method-card.active{
        border-color:#ff6b00;
        background:#fff8f2;
    }

    .method-card h4{
        margin-top:10px;
        color:#333;
    }

    /* PAYMENT CONTENT */

    .payment-box{
        background:white;
        border-radius:20px;
        padding:30px;
        box-shadow:0 5px 20px rgba(0,0,0,0.05);
    }

    .qr-container{
        text-align:center;
    }

    .qr-container img{
        width:260px;
        height:260px;
        object-fit:cover;
    }

    .amount{
        font-size:32px;
        color:#ff6b00;
        font-weight:700;
        margin-top:20px;
    }

    .expire{
        margin-top:10px;
        color:#888;
    }

    /* ORDER SUMMARY */

    .summary-card{
        background:white;
        border-radius:20px;
        padding:25px;
        box-shadow:0 5px 20px rgba(0,0,0,0.05);
        position:sticky;
        top:20px;
    }

    .summary-card h3{
        margin-bottom:20px;
    }

    .summary-item{
        display:flex;
        justify-content:space-between;
        margin-bottom:15px;
    }

    .summary-total{
        border-top:1px solid #eee;
        padding-top:15px;
        margin-top:15px;
        font-weight:bold;
        color:#ff6b00;
        font-size:22px;
    }

    /* BUTTONS */

    .payment-actions{
        margin-top:30px;
        display:flex;
        gap:15px;

    }

    .btn-success{
        flex:1;
        border:none;
        background-color:orange;
        color:white;
        padding:15px;
        border-radius:12px;
        cursor:pointer;
        font-weight:600;
    }

    .btn-cancel{
        flex:1;
        border:none;
        background-color:orange;
        color:white;
        padding:15px;
        border-radius:12px;
        cursor:pointer;
        font-weight:600;
    }

    @media(max-width:992px){

        .payment-layout{
            flex-direction:column;
        }

        .steps-container{
            flex-direction:column;
        }

        .method-grid{
            flex-direction:column;
        }

    }

</style>

<!-- HEADER -->

<div class="payment-header">

    <h1>Payment</h1>

    <p>
        Complete your order securely.
    </p >

</div>

<!-- STEPS -->

<div class="steps-container">

    <div class="step-card">
        <div class="step-number">1</div>
        Cart
    </div>

    <div class="step-card">
        <div class="step-number">2</div>
        Payment Method
    </div>

    <div class="step-card active">
        <div class="step-number">3</div>
        Payment
    </div>

    <div class="step-card">
        <div class="step-number">4</div>
        Confirmation
    </div>

</div>

<!-- MAIN LAYOUT -->

<div class="payment-layout">

    <!-- LEFT -->

    <div class="payment-left">

        <!-- METHODS -->

        <div class="payment-methods">

            <h3>Select Payment Method</h3>

            <div class="method-grid">
                <form action="/payment" method="post">
                    <button name="payMethod" value="/images/wechatcode.jpg">
                        <div class="method-card active">
                             <img src="/images/wechat.png" alt="wechat">
                            <h4>WeChat Pay</h4>
                        </div>
                    </button>

                    <button name="payMethod" value="/images/alipaycode.jpg">
                        <div class="method-card">
                         <img src="/images/alipay.png" alt="alipay">
                            <h4>AliPay</h4>
                        </div>
                    </button>

                    <div class="method-card">
                        💵
                        <h4>Cash</h4>
                    </div>
                </form>

            </div>

        </div>

        <!-- QR PAYMENT -->

        <div class="payment-box">

            <div class="qr-container">

                <img src="${payMethod}" alt="QR Code">

                <div class="amount">
                    ${totalAmount} RMB
                </div>

                <div class="expire">
                    Expires in 09:45
                </div>

            </div>

            <div class="payment-actions">

                <button class="btn-success">
                    I Have Paid
                </button>

                <button class="btn-cancel">
                    Cancel Payment
                </button>

            </div>

        </div>

    </div>

    <!-- RIGHT -->

    <div class="payment-right">

        <div class="summary-card">

            <h3>Order Summary</h3>

            <div class="summary-item">
                <span>Items</span>
                <span>${cartCount}</span>
            </div>

            <div class="summary-item">
                <span>Subtotal</span>
                <span>${subtotal} RMB</span>
            </div>

            <div class="summary-item">
                <span>Delivery</span>
                <span>${deliveryFee} RMB</span>
            </div>

            <div class="summary-total">
                ${totalAmount} RMB
            </div>

        </div>

    </div>

</div>