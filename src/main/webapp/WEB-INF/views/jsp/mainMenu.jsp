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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>
        <script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.4.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
    <%@include file="header.jsp" %>
    </header>


    <body style="background: #C53131">
    <div class ="checkout-page-conatiner">
        <div class="header" style="text-align: center;">
           <h1 style="background:#fff ;height: 50px;    color: #d24f4f;"> Let 's get started!</h1>
        </div>

         <div class ="checkout-container" style="
            display: flex;
            height: auto;
            width: 100%;
            overflow-x: scroll;">
             <div id="checkout-inner"  class="checkout-inner" style="display: flex;text-align: center; margin: auto;">
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
                            if(data.data[i].has_category === true) {
                                sessionStorage.setItem(data.data[i].id,JSON.stringify(data.data[i]));
                               let col2 = "<div class ='column zoom mainMenuItems '  onclick='categoryList(this)'>" +
                            '<img  id = '+data.data[i].id +' style="height:200px; width:200px; padding: 10px;background: #fff;" src ='+ data.data[i].image +'>'+
                                   '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                                   'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                                   ''+ data.data[i].title+'</a>'+
                                   "</div>";
                                $("#row").append(col2);
                            }else if (data.data[i].has_category === false && data.data[i].has_item === true){
                                sessionStorage.setItem(data.data[i].id,JSON.stringify(data.data[i]));
                                let col2 = "<div class ='column zoom mainMenuItems '  onclick='itemListMenu(this)'>" +
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
            $(".header").find('h1').remove();
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
            $(".header").find('h1').remove();
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
                            '<p style=" margin: 0; background: #fff; text-align:right ;width: 170px;"> $' + item_cost + '</p> ' +
                            '<img  id = ' + data.data[i].id + ' style="height:150px; width:150px; padding: 0 10px;background: #fff; margin: 0;" src =' + data.data[i].image + '>' +
                            '<a class ="selectItem" style="background: #fff ; margin :0;' +
                            'display: block;width: 170px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
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
            $(".header").find('h1').remove();
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
                                if (data.data[i].active_item == true) {
                                    let item_cost = data.data[i].item_cost.toFixed(2);
                                    let col = "<div class ='column zoom categoryItem'   onclick='customizeItems(this)' style='display: block'>" +
                                        '<p style=" margin: 0; background: #fff; text-align:right ;width: 170px;"> $' + item_cost + '</p> ' +
                                        '<img  id = ' + data.data[i].id + ' style="height:150px; width:150px; padding: 0 10px;background: #fff; margin: 0;" src =' + data.data[i].image + '>' +
                                        '<a class ="selectItem" style="background: #fff ; margin :0;' +
                                        'display: block;width: 170px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
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
        function customizeItems(item) {
            $('#modalPopup').css('display' ,'block');
            let x =$('#subMenuItems');
            console.log(x);
            $('#modalPopupInner').append(x);
            let id=  $('#subMenuItems').find('img').attr('id');
            $('#row').css('display' ,'none');
            let itemDetail= sessionStorage.getItem(id);
            console.log("itemDetail:",itemDetail );
            for(let j=0 ; j <= itemDetail.modifiers.length -1 ; j++){
                console.log("Item Detail :",itemDetail.modifiers[j].screen_title)
                console.log("Item Choice:", itemDetail.choices)
            }
        }
    </script>
</html>

<div id ="modalPopup" style="display: none ;    position: relative;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    height: 100%;">
    <div id = "modalPopupInner"></div>
</div>
