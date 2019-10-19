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
<div class ="header">
    <h1>Your Order</h1>
</div>


<form>
    <ul class="stepper parallel horizontal" style="min-height: unset;">
        <li class="step ">
            <div class="step-title waves-effect waves-dark">View Order</div>


        </li>
        <li class="step">
            <div class="step-title waves-effect waves-dark">Personal Info</div>

        </li>
        <li class="step">
            <div class="step-title waves-effect waves-dark">Payment Method</div>
        </li>
        <li class="step active">
            <div class="step-title waves-effect waves-dark">Summary</div>
        </li>
    </ul>
</form>
<button  class ='backBtn' onclick="previousStep()" >BACK</button>
<div class ='personalinfo-cartPrice' style="float: right"></div>
<p>Please check your order</p>
<div class ='cartItems'></div>
<div class ='' style="width: 100%; display: inline-block;">
<button   style=" background: #fff;
        border: 1px solid;
        border-radius: 25px;
        border: 1px solid #000;
        width: 107px;
font-weight: 600;
font-size: 10px;
    float: left;
    background: #0000005e !important;
    color: #fff;">DONT TIP</button>
<button style=" background: #fff;
border: 1px solid;
border-radius: 25px;
float: right;
border: 1px solid #000;
width: 107px;
font-weight: 600;">TIP</button>
</div>
<div class ="footer" style="background: #fff;height: 45px;position: fixed;margin-bottom: 10px;">
    <form class="formaction">
        <button  formaction="/mainMenu"  style="float: left; padding:8px;width:200px; font-weight:600;font-size: 18px;border-radius: 25px;border: 1px solid #000;">
            Continue Shopping
        </button>
        <button  class="nextBtn" formaction="/summary"  style="float: right">
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
        $('.personalinfo-cartPrice').text('You Pay  :'+sessionStorage.getItem("customerPayPrice"));
        let choices = '';
        finalCart.cartItems.forEach(cartItem => {
            cartItem.modifiers.forEach(modifier => {
                modifier.choices.forEach(choice => {
                    choices = choices +choice.name+',';
                });
            });
            let col = '<div class="cartItem">' +
                    '<div style="width:80%; float: left">'+
                '<p>' + cartItem.itemName + '</p>' +
                '<p>' +choices+'</p>' +
                    '</div>'+
                '<p style="float: right;">'+cartItem.totalItemcost+'</p>' +


                '</div>';

            $('.cartItems').append(col);

        });

    })
</script>
</html>