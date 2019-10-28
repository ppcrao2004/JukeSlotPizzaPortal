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
<div class ='summaryInnerContent'>
<div class ='summary-content'>
    <div class ="header" style="width: 100%;
    display: inline-block;
    padding-top: 100px;">
        <h1 style="font-size: 30px!important; text-align: center; margin: 0; margin-top: 20px;">Your Order</h1>
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
    </div>
    <div class ='innerContent' style="padding:0 20px;margin-bottom: 50px;">
        <div class ='btnContainer'>
<button  class ='backBtn' onclick="previousStep()" >BACK</button>
<div class ='personalinfo-cartPrice' style="float: right"></div>
        </div>
<div class ='summary-tipcontent'>
<p>Please check your order</p>
<div class ='cartItems'></div>
<div class ='' style="width: 100%; display: inline-block;">
<button   onclick="removeContent()" style=" background: #fff;
        border: 1px solid;
        border-radius: 25px;
        border: 1px solid #000;
        width: 107px;
font-weight: 600;
font-size: 10px;
    float: left;
    background: #0000005e !important;
    color: #fff;">DONT TIP</button>
<button onclick="TipAddition()" style=" background: #fff;
border: 1px solid;
border-radius: 25px;
float: right;
border: 1px solid #000;
width: 107px;
font-weight: 600;">TIP</button>
</div>
</div>
<div class ='tip-content' style="width:100% ;display: none;">
    <h4 style="text-align: center;">Select a tip amount</h4>
    <div class ='' style="width:100%;">
    <button class ='tipPercentage' onclick="percentageCal(this)">1%</button>
    <button class ='tipPercentage' onclick="percentageCal(this)">2%</button>
    <button class ='tipPercentage' onclick="percentageCal(this)">3%</button>
    <button class ='tipPercentage' onclick="percentageCal(this)">4%</button>
    <button class ='tipPercentage' onclick="percentageCal(this)">5%</button>
    <button class ='tipPercentage' onclick="percentageCal(this)">6%</button>
    <button class ='tipPercentage' onclick="percentageCal(this)">7%</button>
    <button class ='tipPercentage' onclick="percentageCal(this)">8%</button>
    <button class ='tipPercentage' onclick="percentageCal(this)">9%</button>
    </div>
    <div style="text-align: center;    margin-top: 50px;">
    <input style="border: 1px solid #9e9e9e; width: 10%;background: #fff;text-align: center;" type="text" value ='$0.00' name="name" class="invalid">
    </div>
</div>

</div>
</div>
</div>
<div class ="footer" style="background: #efefef;height: 45px;position: fixed;margin-bottom: 0px;">
    <form class="formaction">
        <button  formaction="/mainMenu"  style="float: left; padding:8px;width:200px; font-weight:600;font-size: 18px;border-radius: 25px;border: 1px solid #000;">
            Continue Shopping
        </button>
        <button class="nextBtn" formaction="/summaryAfterTip" style="float: right">
            NEXT
        </button>
    </form>
</div>
</div>
<div class ='btnContainer-two' style="display: none;">
    <button  class ='backBtn' onclick="previous()" >BACK</button>
    <div class ='personalinfo-cartPrice' style="float: right"></div>

</div>
</body>
<script>
    function previous() {
        $('.summary-tipcontent').css('display','block');

    }
    function nextPage() {

  $('.innerContent').css('display' ,'none');
  $('.summary-tipcontent').css('display','none');
  $('.btnContainer-two').css('display' ,'block');
        
    }
    function removeContent() {
        $('.summary-tipcontent').css('display','none');
        $('.btnContainer').css('display' ,'block');

    }
    function TipAddition(){
        $('.summary-tipcontent').css('display','none');
   $('.tip-content').css('display' ,'block');
   $('.btnContainer').css('display' ,'none');
    }
    function previousStep(){
        history.go(-1);
    }
    function percentageCal(item){

        let selectedItem = $('item');
        if($(selectedItem).hasClass('selected')){

            $(selectedItem).removeClass('selected');
        }
        else {
            $(selectedItem).addClass('selected');
        }
    }
    $(document).ready(function () {

        let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        $('.personalinfo-cartPrice').text('You Pay  :'+sessionStorage.getItem("customerPayPrice"));

        finalCart.cartItems.forEach(cartItem => {
            let choices = '';
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