<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <title>Happy Joes</title> -->
    <script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/resources/core/js/currency.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/core/js/materialize.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/materialize.min.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/materialize-stepper@2.1.4/materialize-stepper.css" rel="stylesheet"/>
</head>

<%@include file="header.jsp" %>
<body style="background: #efefef;">
<div class ='paymentMethod-content'>

    <div class ="header" style="width: 100%;
    display: inline-block;
    padding-top: 100px;">
        <h1 style="font-size: 30px!important; text-align: center; margin: 0; margin-top: 20px;">Your Order</h1>
        <form>
            <ul class="stepper parallel horizontal" style="min-height: unset;">
                <li class="step">
                    <div class="step-title waves-effect waves-dark">View Order</div>
                </li>
                <li class="step">
                    <div class="step-title waves-effect waves-dark">Personal Info</div>

                </li>
                <li class="step active">
                    <div class="step-title waves-effect waves-dark">Payment Method</div>
                </li>
                <li class="step">
                    <div class="step-title waves-effect waves-dark">Summary</div>
                </li>
            </ul>
        </form>
    </div>
    <div style="padding:0 20px;">
<button class ='backBtn' onclick="previousStep()">BACK</button>
<div class ='personalinfo-cartPrice' style="float: right"></div>
        <h1 style="font-size: 20px!important; text-align: center; margin: 0; margin-top: 20px;">Please select a payment method</h1>

<div class="checkout-inner" style="padding-top: 0;">
    <div class="left zoom" style="width:50%;padding: 20px;">
        <a href="#"  style="text-decoration: none;">
            <img style="height: 150px;width: 150px;" src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/cash.png" alt="CASH">
            <p style="color: #C53131; font-size: 20px ; font-style: oblique ; margin: 6px">Cash payment</p>
        </a>
    </div>
    <div class="right zoom" style="width:50%;padding: 20px;">
        <a href="#" style="text-decoration: none;" >
            <img style="height: 150px;width: 150px;" src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/credit.png" alt="CREDITCARD"  />
            <p style="color: #C53131; font-size: 20px ; font-style: oblique ; margin: 6px">Card Payment</p>
        </a>
    </div>
</div>
</div>

</div>
<div class ="footer" style="background: #efefef;height: 45px;position: fixed;margin-bottom: 0px;">
    <form class="formaction">
        <button  formaction="/mainMenu"  style="float: left; padding:8px;width:200px; font-weight:600;font-size: 18px;border-radius: 25px;border: 1px solid #000;">
            Continue Shopping
        </button>
        <button class="nextBtn" formaction="/summary"  style="float: right">
            NEXT
        </button>
    </form>
</div>
</body>
<script>
    function previousStep(){
        history.go(-1);
    }
    $(document).ready(function () {
        let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        //$('.price').text('You Pay' +finalCart.cartTotalPrice);
        $('.personalinfo-cartPrice').text('You Pay  :'+sessionStorage.getItem("customerPayPrice"));
    })
</script>
</html>