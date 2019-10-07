<%--
  Created by IntelliJ IDEA.
  User: ppcra
  Date: 8/25/2019
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>

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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<%@include file="header.jsp" %>
<body>
<div class ='checkoutbutton'>
<h1 style="text-align: center; color:#C53131"> Please check your order...</h1>
    <button type="submit" id="btn-search" style=" display: inline-block;
    margin: 0px;
    position: relative;
    overflow: hidden;
    padding: 0;
    background: #C53131;
    border: none;
    color: #fff;
    font-size: 20px;
    width:100%;
    height: 50px;"  class="btn btn-primary btn-lg" >Your Order</button>

</div>
<div class ='items' style=" display: flex;
justify-content: center;
    width: 100%;
    justify-content: center;"></div>

<div class ="footer" style="background: #C53131; height: 50px; margin:0px;">
    <form class="formaction">
    <button   formaction="/mainMenu" id="increaseCount" class="col  row col s2 m3" style="display: inline;margin: 0px;font-size: 10px;float: left; background: rgb(221, 221, 221); font-size:20px;">
        Continue Shopping</button>

    <button style="background: #C53131;margin:0;height: 50px; border:none; font-size:20px;" type="submit" id="checkoutButton" class=" row col s10 m9 checkoutButtonText"
                                 formaction="/orderReview">checkout</button></form>
</div>
</body>
<script>
    $(document).ready(function(){

        let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        finalCart.cartItems.forEach(cartitem => {
            let col = "<div class ='column zoom ' style='display: inline-block;background: rgb(221, 221, 221); flex:50%; margin-right: 20px; float: left;'>" +
                '<a class ="selectItem" style=" margin :0;' +
                'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                '' + cartitem.itemName + '</a>' +

                '<img  style="height:70px; width:70px; padding: 0 10px; background: rgb(221, 221, 221) margin: 0; float: right" src =' + cartitem.imageURL + '>' +
                "<p>" +'Quantity - '+cartitem.count+ "</p>"+
                '<p style=" margin: 0;width: 150px;"> ' +cartitem.totalItemcost+ '</p> ' +
                "</div>";
            $('.checkoutbutton').append(col);
        });
        $('.column').appendTo($('.items'));
    });
</script>

</html>