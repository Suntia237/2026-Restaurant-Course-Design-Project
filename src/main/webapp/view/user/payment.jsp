<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    *{
        box-sizing:border-box;
    }

    .payment-header{
        margin-bottom:3vh;
    }

    .payment-header h1{
        font-size:2vw;
        color:#ff6b00;
        margin-bottom:1vh;
    }

    .payment-header p{
        color:#777;
    }

    /* STEPS */

    .steps-container{
        display:flex;
        gap:1vw;
        margin-bottom:3vh;
    }

    .step-card{
        flex:1;
        background:white;
        padding:1vw;
        border-radius:15px;
        text-align:center;
        box-shadow:0 4px 15px rgba(0,0,0,0.05);
    }

    .step-card.active{
        border:2px solid #ff6b00;
    }

    .step-number{
        width:2.5vw;
        height:2.5vw;
        border-radius:50%;
        background:#ff6b00;
        color:white;
        margin:auto;
        margin-bottom:1vh;
        display:flex;
        align-items:center;
        justify-content:center;
        font-weight:bold;
    }

    /* MAIN LAYOUT */

    .payment-layout{
        display:flex;
        gap:2vw;
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
        padding:2vw;
        border-radius:20px;
        margin-bottom:2vh;
        box-shadow:0 5px 20px rgba(0,0,0,0.05);

    }

    .payment-methods h3{
        margin-bottom:2vh;
        color:#222;
    }

    /* TABLE */

    .table-selection{
        margin-bottom:2vh;
    }

    .table-selection label{
        display:block;
        margin-bottom:1vh;
        font-weight:600;
    }

    .table-selection select{

        width:100%;
        padding:12px;
        border:1px solid #ddd;
        border-radius:12px;
        outline:none;

    }

    .table-selection select:focus{
        border-color:#ff6b00;
    }

    /* PAYMENT OPTIONS */

    .method-grid{
        display:flex;
        gap:1vw;
    }

    .payment-option{

        flex:1;

        background:white;

        border:2px solid #eee;

        border-radius:15px;

        padding:1.5vw;

        text-align:center;

        cursor:pointer;

        transition:0.3s;

    }

    .payment-option:hover{

        border-color:#ff6b00;
        background:#fff8f2;

    }

    .payment-option img{

        width:4vw;
        height:4vw;
        object-fit:contain;
        margin-bottom:1vh;

    }

    .payment-option h4{
        color:#333;
    }

    /* QR SECTION */

    .payment-box{

        background:white;

        border-radius:20px;

        padding:2vw;

        box-shadow:0 5px 20px rgba(0,0,0,0.05);

    }

    .qr-container{
        text-align:center;
    }

    .qr-container img{

        width:16vw;
        height:16vw;
        object-fit:contain;

    }

    .amount{

        margin-top:2vh;

        color:#ff6b00;

        font-size:2vw;

        font-weight:bold;

    }

    .expire{

        margin-top:1vh;

        color:#777;

    }

    /* SUMMARY */

    .summary-card{

        background:white;

        padding:2vw;

        border-radius:20px;

        border-top:5px solid #ff6b00;

        box-shadow:0 5px 20px rgba(0,0,0,0.05);

        position:sticky;

        top:20px;

    }

    .summary-card h3{

        margin-bottom:2vh;

    }

    .summary-item{

        display:flex;

        justify-content:space-between;

        margin-bottom:1.5vh;

    }

    .summary-total{

        border-top:1px solid #eee;

        margin-top:2vh;

        padding-top:2vh;

        display:flex;

        justify-content:space-between;

        font-size:1.2vw;

        font-weight:bold;

        color:#ff6b00;

    }

    /* BUTTONS */

    .payment-actions{

        margin-top:3vh;

        display:flex;

        gap:1vw;

    }

    .btn-success{

        flex:1;

        padding:15px;

        border:none;

        border-radius:12px;

        background:#ff6b00;

        color:white;

        cursor:pointer;

        font-weight:600;

    }

    .btn-success:hover{

        background:#ff8124;

    }

    .btn-cancel{

        flex:1;

        padding:15px;

        border:none;

        border-radius:12px;

        background:#222;

        color:white;

        cursor:pointer;

        font-weight:600;

    }

    .btn-cancel:hover{

        background:#444;

    }

    @media(max-width:992px){

        .payment-layout{
            flex-direction:column;
        }

        .method-grid{
            flex-direction:column;
        }

        .steps-container{
            flex-direction:column;
        }

        .qr-container img{
            width:220px;
            height:220px;
        }

    }

</style>

<!-- HEADER -->

<div class="payment-header">

    <h1>Payment</h1>

    <p>Complete your order securely.</p >

</div>

<!-- STEPS -->

<div class="steps-container">

    <div class="step-card">
        <div class="step-number">1</div>
        Menu
    </div>

    <div class="step-card">
        <div class="step-number">2</div>
        Cart
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

<!-- MAIN -->

<div class="payment-layout">

    <div class="payment-left">

        <div class="payment-methods">

            <h3>Select Your Table & Payment Method</h3>

            <div class="table-selection">

                <label>🍽 Select Your Table</label>

                <select name="tableNumber">

                    <option>A1</option>
                    <option>A2</option>
                    <option>A3</option>
                    <option>A4</option>

                    <option>B1</option>
                    <option>B2</option>
                    <option>B3</option>
                    <option>B4</option>

                </select>

            </div>

            <form action="/payment" method="get">

                <div class="method-grid">

                    <button class="payment-option"
                            name="payMethod"
                            value="/images/wechatcode.jpg">

                        <img src="/images/wechat.png" alt="wechat">

                        <h4>WeChat Pay</h4>

                    </button>

                    <button class="payment-option"
                            name="payMethod"
                            value="/images/alipaycode.jpg">

                        <img src="/images/alipay.png" alt="alipay">

                        <h4>AliPay</h4>

                    </button>

                    <button class="payment-option"
                            name="payMethod"
                            value="cash">

                        <h4>💵 Cash</h4>

                    </button>

                </div>

            </form>

        </div>

        <div class="payment-box">

            <div class="qr-container">

                <img src="${payMethod}" alt="QR Code">

                <div class="amount">

                    ${totalAmount} RMB

                </div>

            </div>

            <form class="payment-actions" action="/payment" method="post">

                <button class="btn-success" name="action" value="confrim">

                    Confirm Payment

                </button>

                <button class="btn-cancel" name="action" value="cancel">

                    Cancel Payment

                </button>

            </form>

        </div>

    </div>

    <div class="payment-right">

        <div class="summary-card">

            <h3>Order Summary</h3>

            <div class="summary-item">

                <span>Items</span>

                <span>${cartCount}</span>

            </div>

            <div class="summary-total">

                <span>Total</span>

                <span>${totalAmount} RMB</span>

            </div>

        </div>

    </div>

</div>