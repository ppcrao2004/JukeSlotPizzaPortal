<%--
  Created by IntelliJ IDEA.
  User: ppcra
  Date: 8/25/2019
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<header>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <META name="viewport" content="initial-scale=0.66, user-scalable=no">
        <title>Happy Joes</title>

        <script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.4.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
       <script src="${pageContext.request.contextPath}/resources/core/js/currency.min.js"></script>
    <!-- Compiled and minified CSS -->

    <!-- Compiled and minified JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/core/js/materialize.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/materialize.min.css"/>
    <%@include file="header.jsp" %>
    </header>


    <body style="background: #000">
    <div class ="checkout-page-conatiner">
        <div class="header" style="text-align: center;">
           <h1 style="background:#fff ;color: #d24f4f;background: #fff;height: 20px;font-size: 20px;margin: 10px 0;"> Let 's get started!</h1>
        </div>

         <div class ="checkout-container" style="
            display: flex;
            height: auto;
            width: 100%;
            overflow-x: scroll;">
             <div id="checkout-inner"  class="checkout-inner" style="display: flex; margin: auto;max-height: 100vh;">
             </div>
         </div>
    </div>
    </body>

    <script>
        $(document).ready(function() {
            let tb1 =$("<div/>").attr("id" ,"row");
            let menuItems ="<div id ='subMenuItems'>"+ "</div>";
            $("body").append(menuItems);
            $("#checkout-inner").append(tb1);
            mainMenuLoad();
        });

        function mainMenuLoad() {
            $.ajax({
                type : "GET",
                contentType : "application/json",
                url : "/template/menu/list/"+sessionStorage.getItem("siteID"),
                dataType : 'json',
                timeout : 100000,
                success : function(data) {
                    sessionStorage.setItem('menuList',JSON.stringify(data));
                        for (let i = 0; i <= data.data.length-1;i++) {
                            if (data.data[i].has_category === false && data.data[i].has_item === true){
                                sessionStorage.setItem(data.data[i].id,JSON.stringify(data.data[i]));
                                let col2 = "<div class ='column zoom mainMenuItems '  onclick='itemListMenu(this)'>" +
                                    '<img  id = '+data.data[i].id +' style="height:200px; width:200px; padding: 10px;background: #fff;" src ='+ data.data[i].image +'>'+
                                    '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                                    'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                                    ''+ data.data[i].title+'</a>'+
                                    "</div>";
                                $("#row").append(col2);
                            }else{
                                sessionStorage.setItem(data.data[i].id,JSON.stringify(data.data[i]));
                                let col2 = "<div class ='column zoom mainMenuItems '  onclick='categoryList(this)'>" +
                                    '<img  id = '+data.data[i].id +' style="height:200px; width:200px; padding: 10px;background: #fff;" src ='+ data.data[i].image +'>'+
                                    '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                                    'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                                    ''+ data.data[i].title+'</a>'+
                                    "</div>";
                                $("#row").append(col2);
                            }

                        }
                },
                error : function(e) {
                    console.log("ERROR: ", e);
                    display(e);
                }

            });

        }

        function categoryList(menuID) {
            $("#subMenuItems").empty();
            let menuItemId =$(menuID).find('img').attr('id');
            $("#row").css('flex-wrap' ,'nowrap');
            $(".navbar").append($('#row'));
            $(".header").find('h1').css('display' ,'none');
            $('.mainMenuItems').css('opacity' ,'0.5');
            $(menuID).css('opacity' ,'1');


            /* category List AJAX Call */
            $.ajax({
                type : "GET",
                contentType : "application/json",
                url : "/template/category/list/"+menuItemId,
                dataType : 'json',
                timeout : 100000,
                success : function(data) {
                    sessionStorage.setItem('categoryListMenuId',JSON.stringify(data));
                    for (let i = 0; i <= data.data.length-1;i++) {
                        if (data.data[i].has_sub_category === true) {
                            sessionStorage.setItem(data.data[i].id, JSON.stringify(data.data[i]));
                            let col = "<div class ='column zoom'  style='display: block'  onclick='selectSubMenuItem(this)'>" +
                                '<img  id = ' + data.data[i].id + ' style="height:200px; width:200px;padding: 10px;background: #fff;" src =' + data.data[i].image + '>' +
                                '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                                'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                                '' + data.data[i].title + '</a>' +
                                "</div>";

                            $("#subMenuItems").append(col);

                        } else {
                            let col = "<div class ='column zoom'  style='display: block'  onclick='selectSubCategoryItem(this)'>" +
                                '<img  id = ' + data.data[i].id + ' style="height:200px; width:200px;padding: 10px;background: #fff;" src =' + data.data[i].image + '>' +
                                '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                                'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                                '' + data.data[i].title + '</a>' +
                                "</div>";

                            $("#subMenuItems").append(col);

                        }
                    }
                },
                error : function(e) {
                    console.log("ERROR: ", e);
                    display(e);
                }

            });
        }
        function itemListMenu(menuID) {
            $("#subMenuItems").empty();
            let menuMenuId =$(menuID).find('img').attr('id');
            console.log("Menu menu ID:", menuMenuId);
            $("#row").css('flex-wrap' ,'nowrap');
            $(".navbar").append($('#row'));
            $(".header").find('h1').css('display' ,'none');
            $('.mainMenuItems').css('opacity' ,'0.5');
            $(menuID).css('opacity' ,'1');
            /* category List AJAX Call */
            $.ajax({
                type : "GET",
                contentType : "application/json",
                url : "/template/item/list/menu/"+menuMenuId,
                dataType : 'json',
                timeout : 100000,
                success : function(data) {
                    sessionStorage.setItem('itemListMenuMenuId',JSON.stringify(data));
                    for (let i = 0; i <= data.data.length-1;i++) {
                        sessionStorage.setItem(data.data[i].id, JSON.stringify(data.data[i]));
                        let item_cost = data.data[i].price.toFixed(2);
                        let col = "<div class ='column zoom categoryItem'   onclick='customizeItems(this)' style='display: block'>" +
                            '<p style=" margin: 0; background: #fff; text-align:right ;width: 200px;"> $' + item_cost + '</p> ' +
                            '<img  id = ' + data.data[i].id + ' style="height:200; width:200; padding: 0 10px;background: #fff; margin: 0;" src =' + data.data[i].image + '>' +
                            '<a class ="selectItem" style="background: #fff ; margin :0;' +
                            'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                            '' + data.data[i].title + '</a>' +
                            "</div>";
                        $("#subMenuItems").append(col);

                    }
                },
                error : function(e) {
                    console.log("ERROR: ", e);
                    display(e);
                }
            });
        }


        function selectSubMenuItem (categoryID) {
            $("#subMenuItems").empty();
            let categoryItemID = $(categoryID).find('img').attr('id');
            $("#row").css('flex-wrap', 'nowrap');
            $(".navbar").append($('#row'));
            $(".header").find('h1').css('display' ,'none');
            if (sessionStorage.key(categoryItemID) != null) {
                let categoryItemgetSubCategory = JSON.parse(sessionStorage.getItem(categoryItemID));
                for (let i = 0; i <= categoryItemgetSubCategory.sub_categories.length - 1; i++) {
                    let col = "<div class ='column zoom'  style='display: block;' onclick='selectSubCategoryItem(this)'>" +
                       //     show_image(categoryItemgetSubCategory.sub_categories[i].image,200,200,10,'#fff',categoryItemgetSubCategory.sub_categories[i].id,'testSelectSubcatImage',)
                        '<img  id = ' + categoryItemgetSubCategory.sub_categories[i].id + ' style="height:200px; width:200px; padding: 10px;background: #fff;" src =' +
                        categoryItemgetSubCategory.sub_categories[i].image + '>'
                        +
                        '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                        'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                        '' + categoryItemgetSubCategory.sub_categories[i].title + '</a>' +
                        "</div>";
                    $("#subMenuItems").append(col);
                }

            }
        }

            function selectSubCategoryItem(Item) {
                let categoryId = $(Item).find('img').attr('id');
                $("#subMenuItems").empty();
                if (sessionStorage.key(categoryId) != null) {

                    $.ajax({
                        type: "GET",
                        contentType: "application/json",
                        url: "/template/item/list/" + categoryId,
                        dataType: 'json',
                        timeout: 100000,
                        success: function (data) {
                            for (let i = 0; i <= data.data.length - 1; i++) {
                                sessionStorage.setItem(data.data[i].id, JSON.stringify(data));
                                console.log("Item List Category: ",data)
                                if (data.data[i].active_item == true) {
                                    let item_cost = data.data[i].item_cost.toFixed(2);
                                    let col = "<div class ='column zoom categoryItem'   onclick='customizeCategory(this)' style='display: block'>" +
                                        '<p style=" margin: 0; background: #fff; text-align:right ;width: 200px;"> $' + item_cost + '</p> ' +
                                        '<img  id = ' + data.data[i].id + ' style="height:200px; width:200px; padding: 0 10px;background: #fff; margin: 0;" src =' + data.data[i].image + '>' +
                                        '<a class ="selectItem" style="background: #fff ; margin :0;' +
                                        'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                                        '' + data.data[i].title + '</a>' +
                                        "</div>";

                                    $("#subMenuItems").append(col);
                                }

                            }
                        },
                        error: function (e) {
                            console.log("ERROR: ", e);
                            display(e);
                        }
                    });
                }
        }

        function customizeCategory(item) {
            $('#modalPopup').css('display', 'block');
            let addonItem = $(item);
            $('.selectedAddonItem').append(addonItem);
            let itemPrice = $(addonItem).find('p');
            let itemName = $(addonItem).find('a');
            let id = $(addonItem).find('img').attr('id');
            $('#row').css('display', 'none');
            let itemDetail = JSON.parse(sessionStorage.getItem(id));
            $("#subMenuItems").empty();
            $('.ItemPrice').append(itemPrice);
            $('.ItemPrice').append(itemName);
           // let choice = itemDetail.modifiers;
            for(let p=0 ; p <= itemDetail.data.length-1 ; p++){
                for (let j = 0; j <= itemDetail.data[p].modifiers.length - 1; j++) {
                    let div = "<div id ='modifiers' style='display: flex; width: 100%;'>" +
                        ' <p>' + itemDetail.data[p].modifiers[j].heading + '</p>' +
                        "</div>";
                    $('#itemModifierImage').append(div);
                    for (let k = 0; k <= itemDetail.data[p].modifiers[j].choices.length - 1; k++) {
                        let col = "<div class ='column zoom ' style='display: inline-block;' >" +
                            '<p style=" margin: 0; background: #fff; text-align:right ;width: 150px;"> $' + itemDetail.data[p].modifiers[j].choices[k].choice_cost + '</p> ' +
                            '<img  style="height:150px; width:150px; padding: 0 10px;background: #fff; margin: 0;" src =' + itemDetail.data[p].modifiers[j].choices[k].image + '>' +
                            '<a class ="selectItem" style="background: #fff ; margin :0;' +
                            'display: block;width: 150px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                            '' + itemDetail.data[p].modifiers[j].choices[k].choice_name + '</a>' +
                            "</div>";
                        $('#itemModifierImage').append(col);
                    }

                }
            }
        }
        function customizeItems(item) {
            $('#modalPopup').css('display' ,'block');
            let addonItem=$(item);
            $('.selectedAddonItem').append(addonItem);
            let itemPrice = $(addonItem).find('p');
            console.log(itemPrice);
            let itemName = $(addonItem).find('a');
            let id=  $(addonItem).find('img').attr('id');
            $('#row').css('display' ,'none');
            let itemDetail= JSON.parse(sessionStorage.getItem(id));
            $("#subMenuItems").css('display' ,'none');
            $('.ItemPrice').append(itemPrice);
            var cartPrice = $(itemPrice).text();
            $('.ItemPrice').append(itemName);
           let choice = itemDetail.modifiers;
             for(let j=0 ; j <= itemDetail.modifiers.length -1 ; j++){
                 let div = "<div id ='modifiers' style='display: flex; width: 100%;'>"+
                     ' <p>'+itemDetail.modifiers[j].heading +'</p>'+

                     "</div>";
                 $('#itemModifierImage').append(div);
                 for(let k=0 ; k<=itemDetail.modifiers[j].choices.length-1 ; k++){
                     let col = "<div class ='column zoom ' style='display: inline-block;' onclick='addToCart(this)'>" +
                         '<p style=" margin: 0; background: #fff; text-align:right ;width: 150px;"> $' + itemDetail.modifiers[j].choices[k].choice_cost+ '</p> ' +
                         '<img  style="height:150px; width:150px; padding: 0 10px;background: #fff; margin: 0;" src =' + itemDetail.modifiers[j].choices[k].image+ '>' +
                         '<a class ="selectItem" style="background: #fff ; margin :0;' +
                         'display: block;width: 150px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                         '' + itemDetail.modifiers[j].choices[k].choice_name + '</a>' +
                         "</div>";
                     $('#itemModifierImage').append(col);
                 }

             }
             let itemCount =1;
            let button = "<div class='footer1 row' style='width: 100%;bottom: 0;position: fixed;margin: 0;z-index: 2000;background: rgb(221, 221, 221);height: 50px;'>"+
                "<div class ='orderButton ' style='position: relative;bottom: 0;'>"+
                 "<div class=' row col s1 m3' style='background: rgb(221, 221, 221);margin:0; padding: 0;padding-top: 5px;'>"+
                "<button  id ='increaseCount' class='col' onclick='decreaseItemCount(this)' style='display: inline;height: 35px; '>"+'-'+"</button>"+
                 "<p id = 'itemCount' class='col' style='margin: 0;padding: 0;display: table-row; background: rgb(221, 221, 221);padding-top: 5px;'>"+itemCount +"</p>"+
                "<button id = 'decreaseCount' class='col' onclick='increaseItemCount(this)' style='display: inline;height: 35px;'>"+'+'+"</button>"+
                    "</div>"+
                "<button id ='checkoutButton' class=' row col s11 m9' style='background: #C53131;margin:0;height: 50px;'>"+
                "<p  style='padding: 0;margin:0; display: inline-block;' class ='checkoutButtonText'>" +'ADD TO CART'+"</p>"+
                cartPrice+"</button>"+
                "</div>"+ "</div>";
            //$('#itemModifierImage').append(button);
            $('.checkout-container').append(button);


        }
        function addToCart(item) {
            let itemprice = $(item).find('p').text();
            itemprice= currency(itemprice).value;
            let cartPrice =  currency($('#checkoutButton').text()).value;
            console.log(cartPrice);
            if($(item).hasClass("selected") ===true)
            {
                $(item).removeClass('selected');
                let cartTotal= currency(cartPrice).subtract(itemprice).value;
                $('#checkoutButton').html('ADD TO CART $'+currency(cartTotal).value);
            }
            else {
                $(item).addClass('selected');
                cartPrice= currency(cartPrice).add(itemprice).value;
                $('#checkoutButton').html('ADD TO CART $'+currency(cartPrice).value);
            }
            $(item.active).css('outline-color' , 'red');

        }
        function increaseItemCount() {
            let cartPrice =  currency($('.ItemPrice').find('p').text()).value;
            let cartItemCount =$('#itemCount').text();
            cartItemCount =parseInt(cartItemCount);
            cartItemCount =cartItemCount+1;
            let cartTotal=currency(cartPrice).multiply(cartItemCount).value;
            let cartPriceValue= currency(cartTotal , { precision: 2 });
            console.log("cart price value final",cartPriceValue);
            $('#checkoutButton').html('ADD TO CART'+currency(cartPriceValue, { formatWithSymbol: true }).format());
            $('#itemCount').html(cartItemCount);

        }
        function decreaseItemCount(itemCount) {
            let cartPrice =  currency($('.ItemPrice').find('p').text()).value;
            let cartItemCount =$('#itemCount').text();
            cartItemCount =parseInt(cartItemCount);
            cartItemCount =cartItemCount-1;
            let cartTotal=currency(cartPrice).multiply(cartItemCount).value;
            let cartPriceValue= currency(cartTotal , { precision: 2 });

            if(cartItemCount === 0)
            {
                $('#checkoutButton').html('ADD TO CART $0');
                $("#subMenuItems").css('display' ,'flex');
                $("#subMenuItems").empty();
                $('.mainMenuItems').css('opacity' ,'1');
                $('#modalPopup').css('display' ,'none');
                $("#row").css('display' ,'flex');
                $("#row").css('flex-wrap' ,'wrap');
                $(".header").find('h1').css('display' ,'block');
                $('#checkout-inner').html($('#row'));
                $('.checkout-container').append($('.footer1'));
                $('#checkoutButton').html('ADD TO CART' + currency(cartPriceValue, {formatWithSymbol: true}).format());
                $('#itemCount').html(cartItemCount);

            }
            else {
                $('#checkoutButton').html('ADD TO CART' + currency(cartPriceValue, {formatWithSymbol: true}).format());
                $('#itemCount').html(cartItemCount);
            }

        }

    </script>
</html>

<div id ="modalPopup" style="display: none ;    position: relative;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    height: 100%;">
    <div id = "modalPopupInner">
        <div class ="selectedAddonItem">
        </div>
        <div class ="itemPriceLabel" style="background: rgb(221, 221, 221);">
           <p class ="ItemPrice" style=" margin-top:0;">Price from </p>
            <div class="itemText">
               <h1 style="margin-top: 0;font-size: 20px;height: 50px;">Build  Your Own Pizza</h1>
               <p>Have it your way</p>
            </div>
        </div>
        <div class ="itemModifierHeading" >
            <div id="itemModifierImage">
        </div>
        </div>

        </div>
    </div>


