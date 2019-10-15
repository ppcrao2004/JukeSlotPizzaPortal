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
<body>
<div class ="header">
    <h1>Your Order</h1>
</div>


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
<button class ='backBtn' onclick="previousStep()">BACK</button>
<div class ='price' style="float: right"></div>
<p>Please select a payment method</p>
<div class="checkout-inner">
    <div class="left zoom">
        <a href="${pageContext.request.contextPath}/mainMenu"  style="text-decoration: none;">
            <img  src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/cash.png" alt="CASH">
            <p style="color: #C53131; font-size: 20px ; font-style: oblique ; margin: 6px">Cash payment</p>
        </a>
    </div>
    <div class="right zoom">
        <a href="${pageContext.request.contextPath}/mainMenu" style="text-decoration: none;" >
            <img  src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/credit.png" alt="CREDITCARD"  />
            <p style="color: #C53131; font-size: 20px ; font-style: oblique ; margin: 6px">Card Payment</p>
        </a>
    </div>
</div>
<div class ="footer" style="background: #fff; height: 45px;position: fixed;">
    <form class="formaction">
        <button  formaction="/mainMenu"  style="float: left;font-size: 20px;">
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
        $('.price').text('You Pay' +finalCart.cartTotalPrice);
    })
</script>
</html>