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
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <META name="viewport" content="initial-scale=0.66, user-scalable=no">
    <!-- <title>Happy Joes</title> -->
    <script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/core/js/currency.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/core/js/materialize.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/core/js/mainMenu.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/materialize.min.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
    <body style="background: #BBDEFB" onLoad ="fadeIn()">
    <div id ="wrapper">
        <nav class="navbar" style="height:unset;line-height:unset;  ">
            <div class="navbar-container">
                <div class="navbar-header">
                    <div class="navbar-header-image">
                        <a class="navbar-brand">
                            <img id="logoimage" alt="">
                        </a>
                    </div>
                    <!-- <div class="navbar-header-text">
                         <span class="headerTitle" style="alignment: center">Good times to be together</span>
                     </div> -->
                </div>
            </div>
        </nav>
    </div>

    <div style="text-align: center;width: 100%;background: #ffffff;" class="selection-header">
        <span style="background:#fff ;height: 50px; margin-top:100px;margin-bottom:10px; display:inline-block;font-size: 30px; color: #C53131;"> Let 's get started! </span>
    </div>
        <div class ="checkout-page-conatiner" id ="checkout-page-conatiner">
         <div class ="checkout-container" style="display: flex;height: auto;width: 100%;overflow-x: scroll;">
             <div id="checkout-inner"  class="checkout-block" style="display: flex; margin: auto;">
             </div>
         </div>
    </div>
    </body>

    <script>
        $(document).ready(function() {
            homePageLoad();
            removeItemConfirm();
            let tb1 =$("<div/>").attr("id" ,"row");
            let menuItems ="<div id ='subMenuItems'>"+ "</div>";
            $("body").append(menuItems);
            $("body").css("background",sessionStorage.getItem("backGroundColor"));
            $("#checkout-inner").append(tb1);
            //Initializing  Cart and saving into session , same finalCart should be used all over the flow.
            mainMenuLoad();
           /* window.onscroll = function() {scrollFunction()};
           function scrollFunction() {
                let header =$('#wrapper');
                let sticky = $('#wrapper').offset().top;
                if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
                    $('#wrapper').find('#row img').css('width' , '80px');
                    $('#wrapper').find('#row img').css('height' , '80px');
                    $('#wrapper').find('#row a').css('width' , '80px');
                    $('#wrapper').find('#row a').css('font-size' , '10px');
                    $('#wrapper').find('#row a').css('padding' , '0px');

                        header.addClass("sticky");
                    }
                 else {
                    $('#wrapper').find('#row img').css('width' , '150px');;
                    $('#wrapper').find('#row img').css('height' , '150px');
                    $('#wrapper').find('#row a').css('width' , '150px');
                    $('#wrapper').find('#row a').css('font-size' , '15px');
                    $('#wrapper').find('#row a').css('padding' , '10px');
                    header.removeClass("sticky");
                }
            }*/
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


                data.data.forEach(dataData => {
                    if (dataData.has_category === false && dataData.has_item === true){
                        sessionStorage.setItem(dataData.id,JSON.stringify(dataData));
                        let col2 = "<div class ='column zoom mainMenuItems '   onclick='itemListMenu(this)'>" +
                            '<img  id = '+dataData.id +' style=" padding: 10px;background: #fff; display:inline-block;" src ='+ dataData.image +'>'+
                            '<a class ="selectItem" style="background: #fff ;padding: 10px;display:inline-block; margin :0;' +
                            'display: inline-block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                            ''+ dataData.title+'</a>'+
                            "</div>";
                        $("#row").append(col2);
                    }else{
                        sessionStorage.setItem(dataData.id,JSON.stringify(dataData));
                        let col2 = "<div class ='column zoom mainMenuItems '  onclick='categoryList(this)'>" +
                            '<img  id = '+dataData.id +' style=" padding: 10px;background: #fff;display:inline-block;" src ='+ dataData.image +'>'+
                            '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                            'display: inline-block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                            ''+ dataData.title+'</a>'+
                            "</div>";
                        $("#row").append(col2);
                       // delay(5000).fadeIn();
                        //$("#row").append(col2).delay(2000).fadeIn();
                       // $('.column').css('opacity' ,'1');


                       // fadeIn();
                    }
                });
                let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
                if(finalCart.cartItems.length !=0)
                {
                let button = "<div class='footer1 row' style='width: 100%;bottom: 0; position: fixed;margin: 0;z-index: 2000;background: rgb(221, 221, 221);height: auto'>" +
                    "<div class ='orderButton ' style='position: relative;bottom: 0;'>" +
                    "<div class=' row col s12 ' style='background: rgb(221, 221, 221);margin:0; padding: 0;padding-top: 5px;'>" +
                    "<form class='formaction'>"+
                    "<button  style='background: #C53131;margin:0;height: 50px; " +
                    " type='submit' id='checkoutButton' class='checkoutButtonText row col s12' formaction='${pageContext.request.contextPath}/reviewOrder'>"+
                    'checkout'+
                    "</button>"+
                    "</form>"+
                    "</div>" + "</div>"+"<div class ='checkoutbutton' style='flex-wrap: nowrap;display: inline-flex;overflow-x: scroll;width: 100vw;'>"+"</div>";
                if( $('.checkout-container').find('.footer1').attr('class') ==undefined) {
                    $('.checkout-container').append(button);
                }
                finalCart.cartItems.forEach(cartitem => {
                    let col = "<div class ='column zoom ' style='display: inline-block;background: #fff; margin-right: 20px; float: left;'>" +
                        "<button id = "+cartitem.id +" onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px;'>" +
                        "<i  class='material-icons' style='font-size: 10px;'>close</i></button>" +
                        '<p style=" margin: 0;width: 150px;"> ' +cartitem.totalItemcost+ '</p> ' +
                        '<img  style="height:70px; width:70px; padding: 0 10px;background: #fff; margin: 0; float: right" src =' + cartitem.imageURL + '>' +
                        '<a class ="selectItem" style="background: #fff ; margin :0;' +
                        'display: block;width: 180px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                        '' + cartitem.itemName + '</a>' +
                        "<p>" +'Quantity - '+cartitem.count+ "</p>"+
                        "</div>";
                    $('.checkoutbutton').append(col);
                    console.log(cartitem.modifiers.choices);
                });
                }

                // for (let i = 0; i <= data.data.length-1;i++) {
                //     if (data.data[i].has_category === false && data.data[i].has_item === true){
                //         sessionStorage.setItem(data.data[i].id,JSON.stringify(data.data[i]));
                //         let col2 = "<div class ='column zoom mainMenuItems '  onclick='itemListMenu(this)'>" +
                //             '<img  id = '+data.data[i].id +' style=" padding: 10px;background: #fff;" src ='+ data.data[i].image +'>'+
                //             '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                //             'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                //             ''+ data.data[i].title+'</a>'+
                //             "</div>";
                //         $("#row").append(col2);
                //     }else{
                //         sessionStorage.setItem(data.data[i].id,JSON.stringify(data.data[i]));
                //         let col2 = "<div class ='column zoom mainMenuItems '  onclick='categoryList(this)'>" +
                //             '<img  id = '+data.data[i].id +' style=" padding: 10px;background: #fff;" src ='+ data.data[i].image +'>'+
                //             '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                //             'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                //             ''+ data.data[i].title+'</a>'+
                //             "</div>";
                //         $("#row").append(col2);
                //     }
                // }
            },
            error : function(e) {
                console.log("ERROR: ", e);
                display(e);
            }
        });

    }

    function categoryList(menuID) {
        $("#subMenuItems").empty();
        $("#subMenuItems").css('display' ,'flex');
        $("#subMenuItems").css('margin-top' ,'250px');
        let menuItemId =$(menuID).find('img').attr('id');
        $("#row").css('flex-wrap' ,'nowrap');
        $(".navbar").append($('#row'));
        //$(".header").find('h1').css('display' ,'none');
        $('.selection-header').remove();
        $('.mainMenuItems').css('opacity' ,'0.5');
        $(menuID).css('opacity' ,'1');
        $(menuID).attr('id' ,'active');
        /* category List AJAX Call */
        $.ajax({
            type : "GET",
            contentType : "application/json",
            url : "/template/category/list/"+menuItemId,
            dataType : 'json',
            timeout : 100000,
            success : function(data) {
                sessionStorage.setItem('categoryListMenuId',JSON.stringify(data));
                data.data.forEach(dataData => {
                    if (dataData.has_sub_category === true) {
                        sessionStorage.setItem(dataData.id, JSON.stringify(dataData));
                        let col = "<div class ='column zoom'  style='display: block'  onclick='selectSubMenuItem(this)'>" +
                            '<img  id = ' + dataData.id + ' style="padding: 10px;background: #fff;" src =' + dataData.image + '>' +
                            '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                            'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                            '' + dataData.title + '</a>' +
                            "</div>";
                        $("#subMenuItems").append(col);
                    } else {
                        let col = "<div class ='column zoom'  style='display: block'  onclick='selectSubCategoryItem(this)'>" +
                            '<img  id = ' + dataData.id + ' style="padding: 10px;background: #fff;" src =' + dataData.image + '>' +
                            '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                            'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                            '' + dataData.title + '</a>' +
                            "</div>";
                        $("#subMenuItems").append(col);
                    }
                });
                // for (let i = 0; i <= data.data.length-1;i++) {
                //     if (data.data[i].has_sub_category === true) {
                //         sessionStorage.setItem(data.data[i].id, JSON.stringify(data.data[i]));
                //         let col = "<div class ='column zoom'  style='display: block'  onclick='selectSubMenuItem(this)'>" +
                //             '<img  id = ' + data.data[i].id + ' style="padding: 10px;background: #fff;" src =' + data.data[i].image + '>' +
                //             '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                //             'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                //             '' + data.data[i].title + '</a>' +
                //             "</div>";
                //         $("#subMenuItems").append(col);
                //     } else {
                //         let col = "<div class ='column zoom'  style='display: block'  onclick='selectSubCategoryItem(this)'>" +
                //             '<img  id = ' + data.data[i].id + ' style="padding: 10px;background: #fff;" src =' + data.data[i].image + '>' +
                //             '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                //             'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                //             '' + data.data[i].title + '</a>' +
                //             "</div>";
                //         $("#subMenuItems").append(col);
                //     }
                // }
            },
            error : function(e) {
                console.log("ERROR: ", e);
                display(e);
            }

        });
    }
    function itemListMenu(menuID) {
        $("#subMenuItems").empty();
        $('.selection-header').empty();
        let menuMenuId =$(menuID).find('img').attr('id');
        $("#row").css('flex-wrap' ,'nowrap');
        $(".navbar").append($('#row'));
        $(".header").find('h1').css('display' ,'none');
        $("#subMenuItems").css('display' ,'flex');
        $("#subMenuItems").css('margin-top' ,'250px');
        $(menuID).removeAttr('id');
        $('.mainMenuItems').css('opacity' ,'0.5');
        $(menuID).css('opacity' ,'1');
        $(menuID).attr('id' ,'active');
        /* category List AJAX Call */
        $.ajax({
            type : "GET",
            contentType : "application/json",
            url : "/template/item/list/menu/"+menuMenuId,
            dataType : 'json',
            timeout : 100000,
            success : function(data) {
                sessionStorage.setItem('itemListMenuMenuId',JSON.stringify(data));
                data.data.forEach(dataData => {
                    sessionStorage.setItem(dataData.id, JSON.stringify(dataData));
                    let item_cost =currency(dataData.price, { formatWithSymbol: true }).format();
                    if(item_cost =='$0.00')
                    {
                        item_cost  ="Free";
                    }
                    let col = "<div class ='column zoom categoryItem'   onclick='customizeItems(this)' style='display: block'>" +
                        '<p class="red-text text-darken-2" style=" margin: 0; background: #fff; text-align:right ;width: 200px;font-weight: 600;">'+item_cost+'</p> ' +
                        '<img  id = ' + dataData.id + ' style=" padding: 0 10px;background: #fff; margin: 0;" src =' + dataData.image + '>' +
                        '<a class ="selectItem" style="background: #fff ; margin :0;' +
                        'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                        '' + dataData.title + '</a>' +
                        "</div>";
                    $("#subMenuItems").append(col);
                });



                // for (let i = 0; i <= data.data.length-1;i++) {
                //     sessionStorage.setItem(data.data[i].id, JSON.stringify(data.data[i]));
                //     let item_cost = data.data[i].price.toFixed(2);
                //     let col = "<div class ='column zoom categoryItem'   onclick='customizeItems(this)' style='display: block'>" +
                //         '<p style=" margin: 0; background: #fff; text-align:right ;width: 200px;"> $' + item_cost + '</p> ' +
                //         '<img  id = ' + data.data[i].id + ' style=" padding: 0 10px;background: #fff; margin: 0;" src =' + data.data[i].image + '>' +
                //         '<a class ="selectItem" style="background: #fff ; margin :0;' +
                //         'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                //         '' + data.data[i].title + '</a>' +
                //         "</div>";
                //     $("#subMenuItems").append(col);
                // }
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
            categoryItemgetSubCategory.sub_categories.forEach(subCategory => {
                let col = "<div class ='column zoom'  style='display: block;' onclick='selectSubCategoryItem(this)'>" +
                    //     show_image(categoryItemgetSubCategory.sub_categories[i].image,200,200,10,'#fff',categoryItemgetSubCategory.sub_categories[i].id,'testSelectSubcatImage',)
                    '<img  id = ' + subCategory.id + ' style=" padding: 10px;background: #fff;" src =' +
                    subCategory.image + '>'
                    +
                    '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                    'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                    '' + subCategory.title + '</a>' +
                    "</div>";
                $("#subMenuItems").append(col);
            });


            // for (let i = 0; i <= categoryItemgetSubCategory.sub_categories.length - 1; i++) {
            //     let col = "<div class ='column zoom'  style='display: block;' onclick='selectSubCategoryItem(this)'>" +
            //         //     show_image(categoryItemgetSubCategory.sub_categories[i].image,200,200,10,'#fff',categoryItemgetSubCategory.sub_categories[i].id,'testSelectSubcatImage',)
            //         '<img  id = ' + categoryItemgetSubCategory.sub_categories[i].id + ' style=" padding: 10px;background: #fff;" src =' +
            //         categoryItemgetSubCategory.sub_categories[i].image + '>'
            //         +
            //         '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
            //         'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
            //         '' + categoryItemgetSubCategory.sub_categories[i].title + '</a>' +
            //         "</div>";
            //     $("#subMenuItems").append(col);
            // }
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
                    data.data.forEach(dataData => {
                        sessionStorage.setItem(dataData.id, JSON.stringify(dataData));
                        if (dataData.active_item == true) {
                           let item_cost=  currency(dataData.price, { formatWithSymbol: true }).format();
                            if(item_cost == '$0.00'){
                                item_cost ='Free';

                            }
                            let col = "<div class ='column zoom categoryItem'   onclick='customizeCategory(this)' style='display: block'>" +
                                '<p class="red-text text-darken-2" style=" margin: 0; background: #fff; text-align:right ;width: 200px;">'+item_cost+'</p> ' +
                                '<img  id = ' + dataData.id + ' style=" padding: 0 10px;background: #fff; margin: 0;" src =' + dataData.image + '>' +
                                '<a class ="selectItem" style="background: #fff ; margin :0;' +
                                'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                                '' + dataData.title + '</a>' +
                                "</div>";
                            $("#subMenuItems").append(col);
                        }
                    });

                },
                error: function (e) {
                    console.log("ERROR: ", e);
                    display(e);
                }
            });
        }
    }

    function customizeCategory(item) {
        let selectedCartItem = $(item);
        let selectedCartItemId=  $(selectedCartItem).find('img').attr('id');
        let selectedCartItemDetail = JSON.parse(sessionStorage.getItem(selectedCartItemId));
        let selectedCartItemPrice = $(selectedCartItem).find('p').text();
        let selectedCartItemName = $(selectedCartItem).find('a').text();
        let selectedCartItemImgURL = $(item).find('img').attr('src');
        if(selectedCartItemPrice =='Free')
        {
            selectedCartItemPrice ="$0.00";
        }
        if(selectedCartItemDetail.modifiers=== null ||selectedCartItemDetail.has_modifier ===false) {
             let spicyLevel = (selectedCartItemDetail.spicy_levels  === undefined || selectedCartItemDetail.spicy_levels.length == 0) ? 0
                 :selectedCartItemDetail.spicy_levels[0] ;
             let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
            if(finalCart.cartItems.some(cartItemElement =>cartItemElement.id === selectedCartItemId)){
                finalCart.cartItems.forEach(cartItemElement => {
                    if (cartItemElement.id === selectedCartItemId) {
                        cartItemElement.count = parseInt(cartItemElement.count) + 1;
                    }
                });
            } else{
             let cartArrayItem = {id:selectedCartItemId, count:1 ,itemName: selectedCartItemName,price:selectedCartItemPrice ,
                 totalItemcost:selectedCartItemPrice,imageURL:selectedCartItemImgURL,spicyLevel:spicyLevel, modifiers:[]};
                finalCart.cartItems.push(cartArrayItem);
             }

             sessionStorage.setItem("finalCart",JSON.stringify(finalCart));
             getPrice();
             console.log(finalCart);
             let button = "<div class='footer1 row' style='width: 100%;bottom: 0; position: fixed;margin: 0;z-index: 2000;background: rgb(221, 221, 221);height: auto'>" +
                 "<div class ='orderButton ' style='position: relative;bottom: 0;'>" +
                 "<form class='formaction'>"+
                  "<button  style='background: #C53131;margin:0;height: 50px; " +
                 " type='submit' id='checkoutButton' class='checkoutButtonText row col s12' formaction='${pageContext.request.contextPath}/reviewOrder'>"+
                  'checkout'+
                  "</button>"+
                 "</form>"+
                 "</div>" +
                 "<div class ='checkoutbutton' style='flex-wrap: nowrap;display: inline-flex;overflow-x: scroll;width: 100vw;'>"+"</div>"+"</div>";
             if( $('.checkout-container').find('.footer1').attr('class') ==undefined) {
                 $('.checkout-container').append(button);
             }


             finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
             $('.checkoutbutton').empty();
             finalCart.cartItems.forEach(cartitem => {
                 let col = "<div class ='column zoom ' style='display: inline-block; background: #fff;margin-right: 20px;float: left;'>" +
                     "<button  id=" + cartitem.id + " onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px'>" +
                     "<i class='material-icons' style='font-size: 10px'>close</i></button>" +
                     '<p style=" margin: 0;width: 150px;"> ' +cartitem.totalItemcost+ '</p> ' +
                     '<img  style="height:70px; width:70px;float: right; padding: 0 10px;background: #fff; margin: 0;" src =' + cartitem.imageURL + '>' +
                     '<a class ="selectItem" style="background: #fff ; margin :0;' +
                     'display: block;width: 180px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                     '' + cartitem.itemName + '</a>' +
                     "<p class='quantity'>" + 'Quantity - ' + cartitem.count + "</p>" +
                     "</div>";

                 //$('.checkout-container').html(col);
                 $('.checkoutbutton').append(col);
             });

         }
         else {
             $("#subMenuItems").empty();
             $('#modalPopup').css('display', 'block');

             $('#row').css('display', 'none');
             $('#itemModifierImage').append($(item));
            let itemDescription =selectedCartItemDetail.description;
            let description = "<div class='col s12 m7'>"+
                "<div class='card horizontal'>"+
                "<div class='card-stacked'>"+ "<div class='card-content'>"+
                "<p  class='red-text text-darken-2' >"+'Price from'+"<br> <strong class='red-text text-darken-2'>"+selectedCartItemPrice+ "<strong></p>" +
                "<p class='red-text text-darken-2'>"+selectedCartItemName +"</p>" +
                "<p class='red-text text-darken-2'>"+itemDescription+"</p></div></div>" +
                "<div class='card-image'>"+
                "<button  id="+selectedCartItemId+" onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px'>" +
                "<i class='material-icons' style='font-size: 10px'>close</i></button>" +
                "<img  id ="+selectedCartItemId+" style='width: 200px;height: 200px' src="+selectedCartItemImgURL+">"+ "</div> </div>";
            $('#itemModifierImage').empty();
            $('#itemModifierImage').append(description);
            if(selectedCartItemPrice =='Free')
            {
                selectedCartItemPrice ='$0.00';
            }
             let spicyLevel = (selectedCartItemDetail.spicy_levels  === undefined || selectedCartItemDetail.spicy_levels.length == 0) ? 0
                 :selectedCartItemDetail.spicy_levels[0] ;
             let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
             let cartArrayItem = {id:selectedCartItemId, count:1 ,itemName: selectedCartItemName,price:selectedCartItemPrice ,
                 totalItemcost:selectedCartItemPrice,imageURL:selectedCartItemImgURL,spicyLevel:spicyLevel, modifiers:[]};

             selectedCartItemDetail.modifiers.forEach(modifierItem => {
                 let modifier = {modifierID: modifierItem.id,modifierHeading:modifierItem.heading,numberOfOptions:modifierItem.number_of_options,choices:[]};
                 cartArrayItem.modifiers.push(modifier);
                 let div = "<div id ="+modifierItem.id+" class ='modifiers' allowedchoices = "+modifierItem.number_of_options+" " +
                     "style='width: 100%;'>" +
                     ' <p  style="font-size: 15px; font-weight: 600 ;color: crimson;color: #D32F2F !important;"><strong>' + modifierItem.heading + '</strong></p><br>' +
                     "</div>";
                 $('#itemModifierImage').append(div);

                 modifierItem.choices.forEach(choice => {
                     let col = "<div  class ='column zoom addToCart ' style='display: inline-block; margin-right: 20px;' onclick='addToCart(this)' >" +
                         '<p style=" margin: 0;  text-align:right ;width: 150px;"> $' +choice.choice_cost+ '</p> ' +
                         '<img  id ='+choice.id+' style="height:150px; width:150px; padding: 0 10px;background: #fff; margin: 0;" ' +
                         'src =' + choice.image + '>' +
                         '<a class ="selectItem" style="background: #fff ; margin :0;' +
                         'display: block;width: 150px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                         '' + choice.choice_name + '</a>' +
                         "</div>";
                     $('.modifiers').append(col);
                 });
                 $('.modifiers').addClass('choices').removeClass('modifiers');
                 $("#subMenuItems").css('display' ,'none');
             });

             finalCart.cartItems.push(cartArrayItem);
             sessionStorage.setItem("finalCart",JSON.stringify(finalCart));
            let count =1;
            $('.footer1').remove();
            if(selectedCartItemPrice =='$0.00')
            {
                selectedCartItemPrice ='Free';
            }

            let button = "<div class='footer1 row' style='width: 100%;bottom: 0;position: fixed;margin: 0;z-index: 2000;background: rgb(221, 221, 221);height: auto;'>" +
                "<div class ='orderButton ' style='position: relative;bottom: 0;'>" +
                "<div class=' row col s1 m3' style='background: rgb(221, 221, 221);margin:0; padding: 0;padding-top: 5px;'>" +
                "<button  id ='increaseCount' class='col' onclick='decreaseItemCount(this)' style='display: inline;height: 35px; '>" +
                "<i class='material-icons'>remove</i></button>" +
                "<p id = 'itemCount' class='col' style='margin: 0;padding: 0;display: table-row; background: rgb(221, 221, 221);padding-top: 5px;'>" + count + "</p>" +
                "<button id = 'decreaseCount' class='col' onclick='increaseItemCount(this)' style='display: inline;height: 35px;'><i class='material-icons'>add</i></button>" +
                "</div>" +
                "<button id ='checkoutButton' class=' row col s11 m9' style='background: #C53131;margin:0;height: 50px;' onclick='mainmenunavigation()'>" +
                "<p  style='padding: 0;margin:0; display: inline-block;' class ='checkoutButtonText'>" + 'ADD TO CART' + "</p>" +selectedCartItemPrice+ "</button>" +
                "</div>" + "</div>";

            if( $('.checkout-container').find('.footer1').attr('class') ==undefined) {
                $('.checkout-container').append(button);
            }

        }
    }

    function customizeItems(item) {
        let selectedCartItem=$(item);
        let selectedCartItemPrice = $(selectedCartItem).find('p').text();
        let selectedCartItemName = $(selectedCartItem).find('a').text();
        let selectedCartItemId=  $(selectedCartItem).find('img').attr('id');
        let selectedCartItemImgURL = $(item).find('img').attr('src');
        if(selectedCartItemPrice =='Free')
        {
            selectedCartItemPrice ='$0.00';
        }
        let selectedCartItemDetail= JSON.parse(sessionStorage.getItem(selectedCartItemId));
        if(selectedCartItemDetail.modifiers == null) {
            let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
            if(finalCart.cartItems.length ===0){
                finalCart.cartItems.push({id:selectedCartItemId, count:1 ,itemName: selectedCartItemName,price:selectedCartItemPrice ,
                    totalItemcost:selectedCartItemPrice,imageURL:selectedCartItemImgURL,modifiers:[]});
                sessionStorage.setItem("finalCart" ,JSON.stringify(finalCart));
            } else {
                if(finalCart.cartItems.some(cartItemElement =>cartItemElement.id === selectedCartItemId)){
                    finalCart.cartItems.forEach(cartItemElement => {
                        if (cartItemElement.id === selectedCartItemId) {
                           cartItemElement.count = parseInt(cartItemElement.count) + 1;
                         }
                    });
                }else{
                    let cartArrayItem = {id: selectedCartItemId,count: 1,itemName: selectedCartItemName,
                        price: selectedCartItemPrice,totalItemcost: selectedCartItemPrice,imageURL: selectedCartItemImgURL,modifiers: []
                    };
                    finalCart.cartItems.push(cartArrayItem);
                }
                sessionStorage.setItem("finalCart" ,JSON.stringify(finalCart));
                     // finalCart.cartItems.forEach(cartItemElement => {
                     //     if (cartItemElement.id === selectedCartItemId) {
                     //
                     //       // $(selectedCartItem).find('.quantity').text('Quantity'+count);
                     //        cartItemElement.count = parseInt(cartItemElement.count) + 1;
                     //         sessionStorage.setItem("finalCart" ,JSON.stringify(finalCart));
                     //      } else {
                     //            let count =1;
                     //             cartArrayItem = {id: selectedCartItemId,count: count,itemName: selectedCartItemName,
                     //                   price: selectedCartItemPrice,totalItemcost: selectedCartItemPrice,imageURL: selectedCartItemImgURL,modifiers: []
                     //               };
                     //                finalCart.cartItems.push(cartArrayItem);
                     //         sessionStorage.setItem("finalCart" ,JSON.stringify(finalCart));
                     //      }
                     // });
            }

            //JSON.parse(sessionStorage.getItem("finalCart")).;
//            finalCart.cartItems.cartTotalPrice = getPrice();
           // sessionStorage.setItem("finalCart" ,JSON.stringify(finalCart));
            getPrice();


              /*  else{
                    cartArrayItem = {id:selectedCartItemId, count:1 ,itemName: selectedCartItemName,price:selectedCartItemPrice ,
                        totalItemcost:selectedCartItemPrice,imageURL:selectedCartItemImgURL,modifiers:[]};
                    let col = "<div class ='column zoom ' style='display: inline-block; background: #fff;margin-right: 20px;float: left;'>" +
                        "<button  id="+selectedCartItemId+" onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px'>" +
                        "<i class='material-icons' style='font-size: 10px'>close</i></button>" +
                        '<p style=" margin: 0;width: 150px;"> ' +selectedCartItemPrice+ '</p> ' +
                        '<img  id ='+selectedCartItemId +' style="height:70px; width:70px;float: right; padding: 0 10px;background: #fff; margin: 0;" src =' + selectedCartItemImgURL + '>' +
                        '<a class ="selectItem" style="background: #fff ; margin :0;' +
                        'display: block;width: 180px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                        '' + selectedCartItemName + '</a>' +
                        "</div>";
                }*/

            let button = "<div class='footer1 row' style='width: 100%;bottom: 0;position: fixed;margin: 0;z-index: 2000;background: rgb(221, 221, 221);height: auto'>" +
                "<div class ='orderButton ' style='position: relative;bottom: 0;'>" +
                "<div class=' row col s12 ' style='background: rgb(221, 221, 221);margin:0; padding: 0;padding-top: 5px;'>" +

                "<form class='formaction'>"+
                "<button  style='background: #C53131;margin:0;height: 50px;'  type='submit' id='checkoutButton' class='row col s12 checkoutButtonText' formaction='${pageContext.request.contextPath}/reviewOrder'>"+
                'checkout'+
                "</button>"+
                "</form>"+
                "</div>" + "</div>"+"<div class ='checkoutbutton' style='flex-wrap: nowrap;display: inline-flex;overflow-x: scroll;width: 100vw;'>"+"</div>";

            if( $('.checkout-container').find('.footer1').attr('class') ==undefined) {
                $('.checkout-container').append(button);
            }
            $('.checkoutbutton').empty();
            finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
            finalCart.cartItems.forEach(cartItemElement => {
                if(cartItemElement.totalItemcost =='$0.00')
                {
                    selectedCartItemPrice ='Free';
                }
                console.log("cartItemElement.count cartItemElement.count",cartItemElement.count);
                console.log("cartItemElement.totalItemcost cartItemElement.totalItemcost",cartItemElement.totalItemcost);
                let col = "<div class ='column zoom ' style='display: inline-block;background: #fff; margin-right: 20px; float: left;'>" +
                    "<button id =" + cartItemElement.id + " onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px;'>" +
                    "<i  class='material-icons' style='font-size: 10px;'>close</i></button>" +
                    '<p style=" margin: 0;width: 150px;"> ' +cartItemElement.totalItemcost+ '</p> ' +
                    '<img  id =' + selectedCartItemId + ' style="height:70px; width:70px; padding: 0 10px;background: #fff; margin: 0; float: right" src =' + cartItemElement.imageURL + '>' +
                    '<a class ="selectItem" style="background: #fff ; margin :0;' +
                    'display: block;width: 180px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                    '' + cartItemElement.itemName + '</a>' +
                    "<p class='quantity'>" + 'Quantity - ' + cartItemElement.count + "</p>" +
                    "</div>";
                    $('.checkoutbutton').append(col);

            });
            $('#checkoutButton').html('checkout');
        }
        else {
            $('#modalPopup').css('display' ,'block');
            $('#row').css('display' ,'none');
            $('.footer1').remove();
            //let selectedCartItemDetail= JSON.parse(sessionStorage.getItem(selectedCartItemId));
            $("#subMenuItems").css('display' ,'none');
            let itemDescription =selectedCartItemDetail.description;
            let PriceFromDisplay = currency(selectedCartItemPrice, { formatWithSymbol: true }).format();
           /* let description = "<div style='inline-flex;' class= 'itemDescription'>"+"<p>"+'Price from'+"</p>"+
                               "<p>"+selectedCartItemPrice+ "</p>"+
                                "<p>"+selectedCartItemName+ "</p>"+
                                "<p>"+itemDescription+ "</p>"+"</div>";*/
            if(selectedCartItemPrice =='$0.00')
            {
                selectedCartItemPrice ='Free';
            }
            $('#itemModifierImage').empty();
            let description = "<div class='col s12 m7'  style='padding-top:105px;'>"+
                               "<div class='card horizontal'>"+
                "<div class='card-stacked'>"+ "<div class='card-content'>"+
                "<p  class='red-text text-darken-2' >"+'Price from'+"<br> <strong class='red-text text-darken-2'>"+PriceFromDisplay+ "<strong></p>" +
                "<p class='red-text text-darken-2'>"+selectedCartItemName+"</p>" +
                "<p class='red-text text-darken-2'>"+itemDescription+"</p></div></div>" +
                "<div class='card-image'>"+
                "<button  id="+selectedCartItemId+" onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px'>" +
                "<i class='material-icons' style='font-size: 10px'>close</i></button>" +
                "<img  id ="+selectedCartItemId+" style='width: 200px;height: 200px' src="+selectedCartItemImgURL+">"+ "</div> </div>";
            $('#itemModifierImage').append(description);
           // $('#itemModifierImage').append($(item));
            let spicyLevel = (selectedCartItemDetail.spicy_levels  === undefined || selectedCartItemDetail.spicy_levels.length == 0) ? 0
                :selectedCartItemDetail.spicy_levels[0] ;
            let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));

            let cartArrayItem = {id:selectedCartItemId, count:1 ,itemName: selectedCartItemName,price:selectedCartItemPrice ,
                totalItemcost:selectedCartItemPrice,imageURL:selectedCartItemImgURL,spicyLevel:spicyLevel, modifiers:[]};
            selectedCartItemDetail.modifiers.forEach(modifierItem => {
                let modifier = {modifierID: modifierItem.id,modifierHeading:modifierItem.heading,numberOfOptions:modifierItem.number_of_options,choices:[]};
                cartArrayItem.modifiers.push(modifier);
                let div = "<div id ="+modifierItem.id+" class ='modifiers' allowedchoices = "+modifierItem.number_of_options+" " +
                    "style='width: 100%;'>" +
                    ' <p style="font-size: 15px;font-weight: 600;color: crimson;color: #D32F2F !important;">' + modifierItem.heading + '</p>' +
                    "</div>";
                $('#itemModifierImage').append(div);
                modifierItem.choices.forEach(choice => {
                  let choice_cost = currency(choice.choice_cost, { formatWithSymbol: true }).format();
                    if(choice_cost =='$0.00')
                    {
                        choice_cost ='Free';
                    }
                    let col = "<div class ='column zoom ' style='display: inline-block; margin-right: 20px;' onclick='addToCart(this)'>" +
                        '<p>'+'<strong class="red-text text-darken-2" style=" margin: 0; text-align:right ;width: 200px;">' +choice_cost+ '</strong> ' +'</p>'+
                        '<img  id ='+ choice.id +' style="height:200px; width:200px; padding: 0 10px;background: #fff; margin: 0;" src ='+ choice.image + '>' +
                        '<a class ="selectItem" style="background: #fff ; margin :0; display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">'+choice.choice_name+ '</a>' +
                        "</div>";
                    $('.modifiers').append(col);
                    if(choice_cost =='Free')
                    {
                        choice_cost ='$0.00';
                    }
                });
                $('.modifiers').addClass('choices').removeClass('modifiers');
            });


            // for (let j = 0; j <= selectedCartItemDetail.modifiers.length - 1; j++) {
            //     let modifier = {modifierID: selectedCartItemDetail.modifiers[j].id,modifierHeading:selectedCartItemDetail.modifiers[j].heading,
            //         numberOfOptions:selectedCartItemDetail.modifiers[j].number_of_options,choices:[]};
            //     cartArrayItem.modifiers.push(modifier);
            //
            //
            //     let div = "<div id ="+selectedCartItemDetail.modifiers[j].id+" class ='modifiers' allowedchoices = "+selectedCartItemDetail.modifiers[j].number_of_options+" " +
            //         "style='display: flex; width: 100%;'>" +
            //         ' <p>' + selectedCartItemDetail.modifiers[j].heading + '</p>' +
            //         "</div>";
            //     $('#itemModifierImage').append(div);
            //
            //
            //     selectedCartItemDetail.modifiers[j].choices.forEach(choice => {
            //         let col = "<div class ='column zoom ' style='display: inline-block;' onclick='addToCart(this)'>" +
            //             '<p>'+'<strong class="red-text text-darken-2" style=" margin: 0; background: #fff; text-align:right ;width: 200px;"> $' +
            //             choice.choice_cost+ '</strong> ' +'</p>'+
            //             '<img  id ='+ choice.id +' style="height:200px; width:200px; padding: 0 10px;background: #fff; margin: 0;" ' +
            //             'src =' + choice.image + '>' +
            //             '<a class ="selectItem" style="background: #fff ; margin :0;' +
            //             'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
            //             '' +  choice.choice_name+ '</a>' +
            //             "</div>";
            //         $('.modifiers').append(col);
            //     });
            //
            //     // for (let k = 0; k <= selectedCartItemDetail.modifiers[j].choices.length - 1; k++) {
            //     //     let col = "<div class ='column zoom ' style='display: inline-block;' onclick='addToCart(this)'>" +
            //     //         '<p>'+'<strong class="red-text text-darken-2" style=" margin: 0; background: #fff; text-align:right ;width: 200px;"> $' +
            //     //         selectedCartItemDetail.modifiers[j].choices[k].choice_cost+ '</strong> ' +'</p>'+
            //     //         '<img  id ='+ selectedCartItemDetail.modifiers[j].choices[k].id +' style="height:200px; width:200px; padding: 0 10px;background: #fff; margin: 0;" ' +
            //     //         'src =' + selectedCartItemDetail.modifiers[j].choices[k].image + '>' +
            //     //         '<a class ="selectItem" style="background: #fff ; margin :0;' +
            //     //         'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
            //     //         '' +  selectedCartItemDetail.modifiers[j].choices[k].choice_name+ '</a>' +
            //     //         "</div>";
            //     //     $('.modifiers').append(col);
            //     // }
            //     $('.modifiers').addClass('choices').removeClass('modifiers');
            // }
            finalCart.cartItems.push(cartArrayItem);
            sessionStorage.setItem("finalCart",JSON.stringify(finalCart));
            if(selectedCartItemPrice =='$0.00')
            {
                selectedCartItemPrice ='Free';
            }
            let button = "<div class='footer1 row' style='width: 100%;bottom: 0;position: fixed;margin: 0;z-index: 2000;background: rgb(221, 221, 221);height: auto;'>" +
                "<div class ='orderButton ' style='position: relative;bottom: 0;'>" +
                "<div class=' row col s1 m3' style='background: rgb(221, 221, 221);margin:0; padding: 0;padding-top: 5px;'>" +
                "<button  id ='increaseCount' class='col' onclick='decreaseItemCount(this)' style='display: inline;height: 35px; '><i class='material-icons'>remove</i></button>" +
                "<p id = 'itemCount' class='col' style='margin: 0;padding: 0;display: table-row; background: rgb(221, 221, 221);padding-top: 5px;'>" + cartArrayItem.count + "</p>" +
                "<button id = 'decreaseCount' class='col' onclick='increaseItemCount(this)' style='display: inline;height: 35px;'><i class='material-icons'>add</i></button>" +
                "</div>" +
                "<button id ='checkoutButton' class=' row col s11 m9' style='background: #C53131;margin:0;height: 50px;' onclick='mainmenunavigation()'>" +
                "<p  style='padding: 0;margin:0; display: inline-block;' class ='checkoutButtonText'>" + 'ADD TO CART' + "</p>" +selectedCartItemPrice + "</button>" +
                "</div>" + "</div>";
            //$('#itemModifierImage').append(button);
            $('.checkout-container').append(button);
        }
    }
    function addToCart(item) {
        let allowedchoices =$(item).parent().attr('allowedchoices');
        let modifierId =$(item).parent().attr('id');
        let selectedCartItemId =$('.card-image').find('img').attr('id');
        let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
        let itemPrice = $(item).find('p').text();
        let itemID = $(item).find('img').attr('id');
        let itemImageURL = $(item).find('img').attr('src');
        let itemName = $(item).find('a').text();
        let quantityCount = $('#itemCount').text();
        if($(item).hasClass("selected") ===true){
            $(item).removeClass('selected');
            allowedchoices =allowedchoices+1;
            $(item).parent().attr('allowedchoices', allowedchoices);
            finalCart.cartItems.forEach(cartItemElement => {
                if(cartItemElement.id == selectedCartItemId){
                    let cartItemListChoices = cartItemElement.choices;
                    cartItemElement.choices.forEach(choices => {
                        if(itemID == choices.id){
                            cartItemElement.choices.splice(cartItemElement.choices.indexOf(choices),1);
                        }
                    });


                }
            });
        }else {
          //  let noChoices = finalCart.cartItems.choices.length;

            $(item).addClass('selected');
            /* if(allowedchoices ==0) {
                for(let i =0;i<finalCart.cartItems.length;i++) {
                    if (finalCart.cartItems[i].id === selectedCartItemId) {
                        // let choice ={id:itemID,price:itemPrice ,name:itemName,imageURL:itemImageURL }
                        console.log($(finalCart.cartItems[i].choices));
                        let choice_id= $(finalCart.cartItems[i].choices) ;
                        //console.log("S" ,s);
                        //console.log(" s id" , s.id);
                       // console.log(s[0].id);
                        //console.log($(finalCart.cartItems[i].choices[0].id).parent());
                        let items = $('.selected');
                        $.each(items ,function(i ,value){
                            if($(value).find('img').attr('id') == choice_id[0].id){
                                $(value).removeClass('selected');

                            }

                        });

                        finalCart.cartItems[i].choices.splice(0 ,1);

                    }
                }
                finalCart.cartItems.forEach(cartItemElement => {
                    if (cartItemElement.id == selectedCartItemId) {
                        let choice = {id: itemID, price: itemPrice, name: itemName, imageURL: itemImageURL}
                        cartItemElement.choices.push(choice);
                    }
                });
            }*/

                finalCart.cartItems.forEach(cartItemElement => {
                    if (cartItemElement.id == selectedCartItemId) {
                        cartItemElement.modifiers.forEach(modifier =>{
                            if(modifierId == modifier.modifierID){
                                if(!( modifier.numberOfOptions >modifier.choices.length)){
                                    var items =$('.selected');
                                    var id = modifier.choices[0].id;
                                    $.each(items ,function(i ,value){
                                        if($(value).find('img').attr('id') == id){
                                            $(value).removeClass('selected');
                                        }
                                    });
                                    modifier.choices.splice(0,1);
                                }
                                let choice = {id: itemID, price: itemPrice, name: itemName, imageURL: itemImageURL}
                                modifier.choices.push(choice);
                            }
                        });
                    }
                });
        }
        sessionStorage.setItem("finalCart",JSON.stringify(finalCart));
        $('#checkoutButton').html('ADD TO CART '+ getPrice());
        $(item.active).css('outline-color' , 'red');
    }
    function getPrice(){
        let priceOnButton=0;
        let addCartButtonPrice=0;
        let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        //Looping CartItems from FinalCart
        finalCart.cartItems.forEach(cartItemElement => {
            priceOnButton= currency(priceOnButton).add(cartItemElement.price).value;
            let totalItemcost= currency(cartItemElement.price).value;
            //Looping Choices from CartItem
            cartItemElement.modifiers.forEach(modifier => {
                modifier.choices.forEach(choices => {
                    priceOnButton= currency(priceOnButton).add(choices.price).value;
                    totalItemcost = currency(totalItemcost).add(choices.price).value;
                });
            });
            // cartItemElement.choices.forEach(choices => {
            //     priceOnButton= currency(priceOnButton).add(choices.price).value;
            //     totalItemcost = currency(totalItemcost).add(choices.price).value;
            // });
            priceOnButton = currency(priceOnButton, { precision: 2 }).multiply(cartItemElement.count).value;
            cartItemElement.totalItemcost = currency(currency(totalItemcost, { precision: 2 })
                .multiply(cartItemElement.count).value, { formatWithSymbol: true }).format();
            addCartButtonPrice = cartItemElement.totalItemcost;
        });
        finalCart.cartTotalPrice = currency(priceOnButton, { formatWithSymbol: true }).format();
        sessionStorage.setItem("finalCart" ,JSON.stringify( finalCart));
        return addCartButtonPrice ;
    }
    function increaseItemCount() {
        let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
        let id =$('.card-image').find('img').attr('id');
        let cartItemCount =$('#itemCount').text();
        cartItemCount =parseInt(cartItemCount);
        cartItemCount =cartItemCount+1;
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
    function decreaseItemCount() {
        let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
        let id =$('.card-image').find('img').attr('id');
        let cartItemCount =$('#itemCount').text();
        cartItemCount =parseInt(cartItemCount);
        cartItemCount =cartItemCount-1;
        $.each(finalCart.cartItems, function( index, value ) {
            if(value.id===id){
                value.count =cartItemCount;
            }
        });
        sessionStorage.setItem("finalCart" ,JSON.stringify( finalCart));
        let itemPrice =getPrice();
        if(cartItemCount === 0)
        {
            $('#checkoutButton').html('ADD TO CART $0');
            $("#subMenuItems").css('display' ,'flex');
            $("#subMenuItems").css('margin-top' ,'250px');
            $("#subMenuItems").empty();
            $('.mainMenuItems').css('opacity' ,'1');
            $('#modalPopup').css('display' ,'none');
            $("#row").css('display' ,'flex');
            $("#row").css('flex-wrap' ,'wrap');
            $(".header").find('h1').css('display' ,'block');
            $('#checkout-inner').html($('#row'));
            //  $('.checkout-container').append($('.footer1'));
            $('#checkoutButton').html('ADD TO CART' + currency(cartItemCount, {formatWithSymbol: true}).format());
            $('#itemCount').html(cartItemCount);
            let finalCart = {cartTotalPrice: 0 , cartItems: []};
            sessionStorage.setItem("finalCart",JSON.stringify(finalCart));
            $('.footer1').remove();
        }
        else {
            $('#checkoutButton').html('ADD TO CART' + currency(itemPrice, {formatWithSymbol: true}).format());
            $('#itemCount').html(cartItemCount);
        }
    }

    function mainmenunavigation() {
        $('.mainMenuItems').css('opacity' ,'1');
        $('#modalPopup').css('display' ,'none');
        $("#row").css('display' ,'flex');
        $("#row").css('padding-top' ,'105px');
        $("#row").css('flex-wrap' ,'wrap');
        $(".header").find('h1').css('display' ,'block');
        $('#checkout-inner').html($('#row'));
        let finalCart =  JSON.parse(sessionStorage.getItem("finalCart"));
        if(finalCart.cartItems.length ===0) {
            $('.checkout-container').find('.addToCartBtn').remove();
        } else{

            let button = "<div class='footer1 row' style='width: 100%;bottom: 0; position: fixed;margin: 0;z-index: 2000;background: rgb(221, 221, 221);height: auto'>" +
                "<div class ='orderButton ' style='position: relative;bottom: 0;'>" +
                "<div class=' row col s12 ' style='background: rgb(221, 221, 221);margin:0; padding: 0;padding-top: 5px;'>" +
                "<form class='formaction'>"+
                "<button  style='background: #C53131;margin:0;height: 50px; " +
                " type='submit' id='checkoutButton' class='checkoutButtonText row col s12' formaction='${pageContext.request.contextPath}/reviewOrder'>"+
                'checkout'+
                "</button>"+
                "</form>"+
                "</div>" + "</div>"+"<div class ='checkoutbutton' style='flex-wrap: nowrap;display: inline-flex;overflow-x: scroll;width: 100vw;'>"+"</div>";
            let itemPrice =$('#itemModifierImage').find('.categoryItem p').text();
            let imgsrc = $('#itemModifierImage').find('.categoryItem img').attr('src');
            let itemName =$('#itemModifierImage').find('.categoryItem a').text();
            $('#itemModifierImage').find('.categoryItem').css('display' , 'inline-block');
            $('.footer1').remove();
            if( $('.checkout-container').find('.footer1').attr('class') ==undefined) {
                //$('.checkout-container').append(button);
            }
            $('.checkout-container').append(button);

            finalCart.cartItems.forEach(cartitem => {
                if(cartitem.totalItemcost =='$0.00')
                {
                    selectedCartItemPrice ='Free';
                }
                let col = "<div class ='column zoom ' style='display: inline-block;background: #fff; margin-right: 20px; float: left;'>" +
                    "<button id = "+cartitem.id +" onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px;'>" +
                    "<i  class='material-icons' style='font-size: 10px;'>close</i></button>" +
                    '<p style=" margin: 0;width: 150px;"> ' +cartitem.totalItemcost+ '</p> ' +
                    '<img  style="height:70px; width:70px; padding: 0 10px;background: #fff; margin: 0; float: right" src =' + cartitem.imageURL + '>' +
                    '<a class ="selectItem" style="background: #fff ; margin :0;' +
                    'display: block;width: 180px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                    '' + cartitem.itemName + '</a>' +
                       "<p>" +'Quantity - '+cartitem.count+ "</p>"+
                    "</div>";
                $('.checkoutbutton').append(col);
                console.log(cartitem.modifiers.choices);
            });

            // for(let i =0;i<finalCart.cartItems.length;i++)
            // {
            //     console.log(finalCart.cartItems[i].id);
            //     console.log(finalCart.cartItems);
            //     let col = "<div class ='column zoom ' style='display: inline-block;background: #fff; margin-right: 20px; float: left;'>" +
            //     "<button id = "+finalCart.cartItems[i].id +" onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px;'>" +
            //         "<i  class='material-icons' style='font-size: 10px;'>close</i></button>" +
            //         '<p style=" margin: 0;width: 150px;"> ' +finalCart.cartItems[i].price+ '</p> ' +
            //         '<img  style="height:70px; width:70px; padding: 0 10px;background: #fff; margin: 0; float: right" src =' + finalCart.cartItems[i].imageURL + '>' +
            //         '<a class ="selectItem" style="background: #fff ; margin :0;' +
            //         'display: block;width: 180px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
            //         '' + finalCart.cartItems[i].itemName + '</a>' +
            //         "</div>";
            //     $('.checkoutbutton').append(col);
            // }
           // $('#subMenuItems').css('display' , 'flex');
        }
    };

    function removeItem(item) {
        if(item !=undefined) {
            let removedItem = $(item).parent();
            if ($('.row .column').hasClass('selected-item')) {
                $('.row .column').removeClass('selected-item');
            } else {
                $(removedItem).addClass('selected-item');
            }
            $('#window').removeClass('hidden');
            $('#window').addClass('show');
            $('#subMenuItems').css('z-index' ,'1000');
            $('#subMenuItems').css('pointer-events' ,'none');
            $('#subMenuItems').css('position' ,'fixed');

        }
    }

       function removeItemConfirm(){
           let selectedItemId = $('.selected-item').find('button').attr('id');
          // let removedItem = $(item).parent();
           $('#row').css('display' , 'flex' );
           $('#subMenuItems').css('display' , 'flex');
           $("#subMenuItems").css('margin-top' ,'250px');
           $('#modalPopup').css('display' ,'none');
           let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
           for (let i = 0; i < finalCart.cartItems.length; i++) {
               if (finalCart.cartItems[i].id === selectedItemId) {
                   finalCart.cartItems.splice(i, 1);
                   console.log('removed items array', finalCart.cartItems);

               }
           }
           $('.selected-item').remove();
           let items = $('.footer1 .checkoutbutton').find('.column');
           sessionStorage.setItem("finalCart", JSON.stringify(finalCart));
           finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
           console.log("Final Cart Cart Items after storage", finalCart);

           if (finalCart.cartItems.length === 0) {
               $('.footer1').remove();

           }
           getPrice();
           $('#window').addClass('hidden');
           $('#window').removeClass('show');
           $('#subMenuItems').css('z-index' ,'0');
           $('#subMenuItems').css('pointer-events' ,'all');
           $('#subMenuItems').css('position' ,'static');

       }
       function fadeIn() {
           $('img').css('opacity', '1');
       }
</script>
</html>

<div id ="modalPopup" style="display: none ;    position: relative;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    height: 100%;">
    <div id = "modalPopupInner">
        <!-- <div class ="selectedAddonItem">
         </div>
         <div class ="itemPriceLabel" style="background: rgb(221, 221, 221);">
            <p class ="ItemPrice" style=" margin-top:0;">Price from </p>
             <div class="itemText">
                <h1 style="margin-top: 0;font-size: 20px;height: 50px;"></h1>
                <p>Have it your way</p>
             </div>
         </div>-->
        <div class ="itemModifierHeading" >
            <div id="itemModifierImage">
            </div>
        </div>

    </div>
</div>
<div  class ='hidden modal' id="window"
      style="position: absolute;
        border: 1px solid;
        width:270px;
        z-index:1100;
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
    bottom: 0;"  onclick="removeItemConfirm()" value="Continue">
            Yes
        </button>
        <button  onclick="exit()" style="padding:0;width:48%;
    bottom: 0;">No</button>
    </div>
</div>


<%--For Each Example   arr.forEach(element => {  console.log(element); });--%>


