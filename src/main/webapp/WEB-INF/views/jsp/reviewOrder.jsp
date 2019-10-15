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
<div class ='inner'  style="overflow-y: scroll;">
<div class ='items' style=" display: flex;
justify-content: center;
    width: 100%;
    justify-content: center;"></div>
<div class ='item-choice' style="
justify-content: center;
    width: 100%;
    justify-content: center;
    display: inline-block;
    padding-left: 10%;
    padding-right: 10%;
margin-bottom: 30px;"></div>
</div>


<div class ="footer" style=" background:none;height: 50px; margin:0px;position: fixed;">
    <form class="formaction" style="margin-bottom: 0">
    <button  style ='width: 31%;font-size:15px;float: left;padding-bottom: 0;
    margin-bottom: 0;
    height: 50px;'  formaction="/mainMenu" class="col  row col s2 m3" style="display: inline;margin: 0px;font-size: 10px;float: left; background: rgb(221, 221, 221); font-size:20px;">
        Continue Shopping</button>

    <button style="background: #C53131;margin:0;height: 50px;width: 69%; border:none; font-size:20px;" type="submit" id="checkoutButton" class=" row col s10 m9 checkoutButtonText"
                                 formaction="/orderReview">checkout</button></form>
</div>
</body>
<script>
    $(document).ready(function(){
        let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));

        finalCart.cartItems.forEach(cartitem => {
            let itemDescription = JSON.parse(sessionStorage.getItem(cartitem.id)).description;
                let col = "<div class ='column zoom ' style=' height:170px;display: inline-block;background: rgb(221, 221, 221); flex:50%; margin-right: 20px; float: left;'>" +
                '<a class ="selectItem" style=" margin :0;' +
                'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                '' + cartitem.itemName + '</a>' +

                '<img  style="height:70px; width:70px; padding: 0 10px; background: rgb(221, 221, 221) margin: 0; float: right" src =' + cartitem.imageURL + '>' +
                "<p>" +'Quantity - '+cartitem.count+ "</p>"+
                    "<p  style=' font-size:10px;color: #C53131;'>"+itemDescription+"</p>"+
                '<p style=" margin: 0;width: 150px;"> ' +cartitem.totalItemcost+ '</p> ' +
                "</div>";
            $('.checkoutbutton').append(col);
        });
        $('.column').appendTo($('.items'));
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/template/item/list/recommends/"+sessionStorage.getItem("siteID"),
            dataType: 'json',
            timeout: 100000,
            success: function (data) {
                sessionStorage.setItem('OrderRecommendations', JSON.stringify(data));
                let OrderRecommendations =JSON.parse(sessionStorage.getItem("OrderRecommendations"));
                OrderRecommendations.data.forEach(cartitem => {
                    let col ="<div class ='column zoom choice' style='display: inline-block;margin-right: 20px; width: 250px;'> "+
                             '<img  id = '+cartitem.id +' style=" width:40%; float:left; display:inline-block; padding: 5px;background:#fff; display:inline-block; height:100px;width:90px;" src ='+ cartitem.image +'>'+
                        "<div  class ='right'style='float:right;width:140px;'>"+
                        '<p class="title" >'+cartitem.title+'</p>'+
                            "<div >"+
                               '<button onclick="decreaseCount(this)" id="decreaseCount" class="col" style="display: inline-block;height: 35px;padding:0;">'+
                               '<i class="material-icons">'+'remove'+'</i>'+
                                '</button>'+
                                '<p  class="quantity" id="itemCount" class="col" style="margin: 0;padding: 0;display: inline-block; background: rgb(221, 221, 221);padding-top: 5px;">'+1+'</p>'+
                               '<button  onClick="increaseCount(this)" id="increaseCount" class="col" style="display: inline-block;padding:0;height: 35px; ">'+
                              '<i class="material-icons"> '+"add"+'</i>'+
                             '</button>'+
                            '</div>'+
                        '<button onclick="addToOrder(this)" class="backBtn" style="padding:0;margin-top: 10px;width:120px;">'+'Add To My Order'+'</button>'+
                          '</div>'+

                    '</div>';
                       $('.items').append(col);

                });


               $('.choice').appendTo($('.item-choice'));
            },
            error: function (e) {
                console.log("ERROR: ", e);
                display(e);
            },
            done: function (e) {
                console.log("DONE");
                enableSearchButton(true);
            }
        });

    });
    function addToOrder(item){
        let selectedItem =$(item).parent().parent();
        let selectedItemID =$(selectedItem).find('img').attr('id');
        let selectedItemTitle =$(selectedItem).find('.title').text();
        let quantity =parseInt($(selectedItem).find('.quantity').text());
        let selectedImageUrl =$(selectedItem).find('img').attr('src');
        console.log('' ,selectedImageUrl);
        let selectedItemDescription='';
        let selectedItemPrice;
        let selectedItemSpicyLevel='';
        let totalItemCost ='';
        let  recommendedItems =JSON.parse(sessionStorage.getItem("OrderRecommendations"));
        if(recommendedItems.data.some(recommendedItem =>recommendedItem.id === selectedItemID)){
            recommendedItems.data.forEach(recommendedItem => {
                console.log("Total Item cost", recommendedItem.totalItemcost);
                if (recommendedItem.id === selectedItemID) {
                    selectedItemPrice =recommendedItem.price;
                    console.log(recommendedItem.description);
                    if(null=== recommendedItem.description){
                        selectedItemDescription ='';
                    }
                    else {
                        selectedItemDescription = recommendedItem.description;
                    }
                    selectedItemPrice =currency(recommendedItem.price, { formatWithSymbol: true }).format();
                  totalItemCost =currency(currency(recommendedItem.price,{ precision: 2 }).multiply(quantity).value, { formatWithSymbol: true }).format();
                   // priceOnButton = currency(priceOnButton, { precision: 2 }).multiply(quantity){ formatWithSymbol: true }.value;
                    console.log(selectedItemPrice);
                    if(selectedItemPrice === '$0.00')
                    {
                        selectedItemPrice ='Free';
                    }
                    selectedItemSpicyLevel =recommendedItem.spicy_levels;
                }
            });
            }
        let spicyLevel = (selectedItemSpicyLevel === '' || selectedItemSpicyLevel.length == 0) ? 0
            :selectedItemSpicyLevel[0] ;
        let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        let cartArrayItem = {id:selectedItemID, count:quantity,itemName: selectedItemTitle,price:selectedItemPrice ,
            totalItemcost:selectedItemPrice,imageURL:selectedImageUrl,spicyLevel:spicyLevel, modifiers:[]};
        finalCart.cartItems.push(cartArrayItem);
        sessionStorage.setItem("finalCart",JSON.stringify(finalCart));
         getPrice();
       // let selectedItemPrice =$(item)
        let col = "<div class ='column zoom recomended ' style=' height:170px;display: inline-block;background: rgb(221, 221, 221); flex:50%; margin-right: 20px; float: left;'>" +
            '<a class ="selectItem" style=" margin :0;' +
            'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' + selectedItemTitle + '</a>' +

            '<img  style="height:70px; width:70px; padding: 0 10px; background: rgb(221, 221, 221) margin: 0; float: right" src =' + selectedImageUrl + '>' +
            "<p style='font-size: 10px;'>" +'Quantity - '+quantity+ "</p>"+
            "<p style='color: #C53131;font-size: 10px;'>"+selectedItemDescription+"</p>"+
            '<p style=" margin: 0;width: 150px;"> ' +totalItemCost+ '</p> ' +
            "</div>";
        $('.checkoutbutton').append(col);
        $('.recomended').appendTo($('.items'));


    }
    function increaseCount(item) {
        let selectedItem =$(item).parent();
        let count =parseInt($(selectedItem).find('.quantity').text());
        $(selectedItem).find('.quantity').text(count+1);
        getPrice();

    }
    function decreaseCount() {

        let selectedItem =$(item).parent();
        let count =parseInt($(selectedItem).find('.quantity').text());
        $(selectedItem).find('.quantity').text(count-1);
        getPrice();
    }
</script>

</html>