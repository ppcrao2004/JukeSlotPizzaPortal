<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <META name="viewport" content="initial-scale=0.66, user-scalable=no">
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

<div class ="cartItems"></div>

</body>
<script>
    $(document).ready(function() {
        let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        finalCart.cartItems.forEach(cartitem => {
            let col = "<div class='row' style='background:#fff; display:flex;margin:0; padding: 0;padding-top: 5px;'>" +
                "<button id='increaseCount' class='col'  style='display: inline;height: 35px;'><i class='material-icons'>remove</i></button>" +
                "<p id='itemCount' class='col' style='margin: 0;padding: 0;display: table-row; background: rgb(221, 221, 221);padding-top: 5px;'>" +cartitem.count+
                "</p>" +
                "<button id='decreaseCount' class='col'  style='display: inline;height: 35px;'><i class='material-icons'> add </i></button>" +
                "<div class ='column zoom ' style='display: inline-block; flex:80%!important; max-width: unset; margin-right: 20px; float: left;'>" +
                '<a class ="selectItem" style=" margin :0;' +
                'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                '' + cartitem.itemName + '</a>' +
                "</div>"+
                 "<div class= 'cartItemPrice' style='flex: 20%;justify-content: end;display: inline-block;'>"+
                '<div style=" margin: 0; display: inline-block;"> ' +cartitem.totalItemcost+ '</div> ' +
                "<button  id="+cartitem.id+"  style ='margin: 0;height: 15px;width: 15px; position: relative; padding: 1px 1px; float:right;'>" +
                "<i class='material-icons' style='font-size: 10px'>close</i></button>" +
                "</div>"+
                "</div>";
            $('body').append(col);

        });
        $('.row').appendTo($('.cartItems'));
    });
</script>
</html>