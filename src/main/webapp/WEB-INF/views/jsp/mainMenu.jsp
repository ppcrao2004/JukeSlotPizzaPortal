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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Happy Joes</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>
        <script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.4.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
    </head>

    <%@include file="header.jsp" %>
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
           /* var tbl=$("<table/>").attr("id","mytable");
            $("#checkout-inner").append(tbl);*/
           var tb1 =$("<div/>").attr("id" ,"row");
            var menuItems ="<div id ='subMenuItems'>"+ "</div>";
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
                        for (var i = 0; i <= data.data.length-1;i++) {
                            if(data.data[i].has_category == true||data.data[i].has_item == true) {
                                sessionStorage.setItem(data.data[i].id,JSON.stringify(data.data[i]));
                            }
                               var col2 = "<div class ='column zoom mainMenuItems '  onclick='categoryList(this)'>" +
                            '<img  id = '+data.data[i].id +' style="height:200px; width:200px; padding: 10px;background: #fff;" src ='+ data.data[i].image +'>'+
                                   '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                                   'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                                   ''+ data.data[i].title+'</a>'+
                                   "</div>";

                            $("#row").append(col2);
                        }
                },
                error : function(e) {
                    console.log("ERROR: ", e);
                    display(e);
                }

            });

        }

        function bigImg(x) {
            x.style.height = "250px";
            x.style.width = "250px";
        }

        function normalImg(x) {
            x.style.height = "200px";
            x.style.width = "200px";
        }

        function categoryList(menuID) {
            $("#subMenuItems").empty();
            var menuItemId =$(menuID).find('img').attr('id');


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
                    console.log("category list menuiD",data);
                    sessionStorage.setItem('categoryListMenuId',JSON.stringify(data));
                    for (var i = 0; i <= data.data.length-1;i++) {
                            sessionStorage.setItem(data.data[i].id,JSON.stringify(data.data[i]));
                            var col = "<div class ='column zoom'  style='display: block'  onclick='selectSubMenuItem(this)'>" +
                                 '<img  id = '+data.data[i].id +' style="height:200px; width:200px;padding: 10px;background: #fff;" src ='+ data.data[i].image +'>'+
                                 '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                                 'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                                 ''+ data.data[i].title+'</a>'+
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
            var categoryItemID = $(categoryID).find('img').attr('id');
            console.log(categoryItemID);


            $("#row").css('flex-wrap', 'nowrap');
            $(".navbar").append($('#row'));
            $(".header").find('h1').remove();
            $('.mainMenuItems').css('opacity', '0.5');
            $(categoryID).css('opacity', '1');

            if (sessionStorage.key(categoryItemID) != null) {
                var categoryItemgetSubCategory = JSON.parse(sessionStorage.getItem(categoryItemID));
                console.log(categoryItemgetSubCategory);

                for (var i = 0; i <= categoryItemgetSubCategory.sub_categories.length - 1; i++) {
                    //  console.log(menuCategory.categories[i].id);
                    if (categoryItemgetSubCategory.sub_categories[i] === undefined) {

                    } else {
                        var col = "<div class ='column zoom'  style='display: block;' onclick='selectSubCategoryItem(this)'>" +

                            '<img  id = ' + categoryItemgetSubCategory.sub_categories[i].id + ' style="height:200px; width:200px; padding: 10px;background: #fff;" src =' +
                            categoryItemgetSubCategory.sub_categories[i].image + '>' +
                            '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                            'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                            '' + categoryItemgetSubCategory.sub_categories[i].title + '</a>' +
                            "</div>";
                        $("#subMenuItems").append(col);
                    }
                }


            }
        }
            function selectSubCategoryItem(Item) {
                var categoryId = $(Item).find('img').attr('id');
                console.log(' category IDS: ', categoryId);
                $("#subMenuItems").empty();
                if (sessionStorage.key(categoryId) != null) {

                    $.ajax({
                        type: "GET",
                        contentType: "application/json",
                        url: "/template/item/list/" + categoryId,
                        dataType: 'json',
                        timeout: 100000,
                        success: function (data) {
                            console.log("Item List Cat ID Service Response :", data);


                            for (var i = 0; i <= data.data.length - 1; i++) {
                                sessionStorage.setItem(data.data[i].id , JSON.stringify(data));
                                console.log(data.data[i].item_cost);
                                if (data.data[i].active_item == true) {
                                    console.log("image:", data.data[i].image);
                                    var col = "<div class ='column zoom categoryItem'   onclick='' style='display: block'>" +
                                         '<p style=" margin: 0; background: #fff; text-align:right ;width: 170px;"> $'+data.data[i].item_cost+'</p> ' +
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
    </script>
</html>

<div class ="modalPopup">

</div>
