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
<body style="background: #efefef">
<div class ='orderReview-content' style="z-index:999;">
<div class ="header" style="width: 100%;
    display: inline-block;
    padding-top: 100px;">
    <h1 style="font-size: 30px!important; text-align: center; margin: 0; margin-top: 20px;">Your Order</h1>
    <form>
    <ul class="stepper parallel horizontal" style="min-height: unset;">
        <li class="step active">
            <div class="step-title waves-effect waves-dark">View Order</div>
        </li>
        <li class="step">
            <div class="step-title waves-effect waves-dark">Personal Info</div>

        </li>
        <li class="step">
            <div class="step-title waves-effect waves-dark">Payment Method</div>
        </li>
        <li class="step">
            <div class="step-title waves-effect waves-dark">Summary</div>
        </li>
    </ul>
</form>
</div>
<div  style="margin-bottom: 60px;padding: 0 20px;" class ="cartItems"></div>
<div style="float: right; bottom: 0; margin-bottom: 50px; padding-left: 80%; width: 100%;">
    <p style='font-weight:800;' class ='tax'>Tax</p>
    <p style="font-weight:800;" class ='personalinfo-cartPrice'>You Pay</p>
</div>
</div>
<div class ="footer" style="background: #efefef;height: 45px;position: fixed;margin-bottom:0px;">
    <form class="formaction">
        <button  formaction="/mainMenu" style="float: left; padding:8px;width:200px; font-weight:600;font-size: 18px;border-radius: 25px;border: 1px solid #000;">
            Continue Shopping
        </button>
        <button class="nextBtn" formaction="/personInfo"  style="float: right;width: 200px; padding:8px;font-size: 18px; font-weight:600;font-size: 18px;">
            NEXT
        </button>
    </form>
</div>
</body>
<script>
    $(document).ready(function() {
        let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        finalCart.cartItems.forEach(cartitem => {
            let col = "<div class='row' style=' display:flex;margin:0; padding: 0;padding-top: 5px;'>" +
                "<button onclick=' return decreaseItemCount(this)' id='decreaseCount' class='col'  style='display: inline;height: 25px;padding: 0px 0;background: #000;color: #fff;'>" +
                "<i class='material-icons'>remove</i></button>" +
                "<p id='itemCount' class='col' style='margin: 0;display: table-row; font-size: 17px;padding: 0;margin: 0;'>" +cartitem.count+
                "</p>" +
                "<button  onclick='  increaseItemCount(this)' id='increaseCount' class='col'  style='display: inline;height: 25px;padding: 0px 0;background: #000;color: #fff;'>" +
                "<i class='material-icons'> add </i></button>" +
                "<div class ='column zoom ' style='display: inline-block; flex:80%!important; max-width: unset; margin-right: 20px; float: left;'>" +
                '<p id = '+cartitem.id+ ' class ="selectItem" style=" margin :0;' +

                'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                '' + cartitem.itemName + '</p>' +
                "</div>"+
                 "<div class= 'cartItemPrice' style='flex: 20%;justify-content: end;display: inline-block;'>"+
                '<div  class ="price" style=" font-weight:800;margin: 0; display: inline-block;"> ' +cartitem.totalItemcost+ '</div> ' +
                "<button  class ='show'  onclick='show(this)' id="+cartitem.id+"  style ='margin: 0;height: 15px;width: 15px; position: relative; padding: 1px 1px; float:right;'>" +
                "<i    class='material-icons' style='font-size: 10px'>close</i></button>" +
                "</div>"+
                "</div>";
            $('body').append(col);


        });
        $('.row').appendTo($('.cartItems'));
        let taxRate = JSON.parse(sessionStorage.getItem("taxRate"));

        function increaseItemCount() {
            let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
            //let id =$('.card-image').find('img').attr('id');
            //let cartItemCount =$('#itemCount').text();
            // cartItemCount =parseInt(cartItemCount);
            // cartItemCount =cartItemCount+1;
            // let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
            $.each(finalCart.cartItems, function( index, value ) {
                if(value.id===id){
                    value.count =cartItemCount;
                }
            });
            sessionStorage.setItem("finalCart" ,JSON.stringify( finalCart));
            let itemPrice =getPrice();
            $('#checkoutButton').html('ADD TO CART'+currency(itemPrice, { formatWithSymbol: true }).format());
            $('#itemCount').html(cartItemCount);

        }

    $('.tax').text('Tax :'+sessionStorage.getItem("taxPay"));
    $('.personalinfo-cartPrice').text('You Pay  :'+sessionStorage.getItem("customerPayPrice"));
    });
</script>
</html>
<div  class ='hidden' id="window"
        style="position: absolute;
        border: 1px solid;
        width:270px;
       /* left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);*/
        background: #fff;
          left: 10%;
         top: 50%;
        right: 10%;
        margin-left: auto;
        margin-right: auto;
        height: 58px;">
    <div>
    <p style="display: inline-block;width: 100%;
    margin: 0;">Are You Sure Want To Delete This Item</p>
    </div>
<div  style=" position: absolute;
     bottom: 0;
     width: 100%;">
    <button  style="padding:0;width:48%;
    bottom: 0;"  onclick="removeItem()" value="Continue">
        Yes
    </button>
    <button  onclick="exit()" style="padding:0;width:48%;
    bottom: 0;">No</button>
</div>
</div>

