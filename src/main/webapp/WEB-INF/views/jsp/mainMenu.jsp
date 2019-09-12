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
                                sessionStorage.setItem(data.data[i].title,JSON.stringify(data.data[i]));
                            }
                               var col2 = "<div class ='column zoom mainMenuItems '  onclick='selectSubMenuItem(this)'>" +
                            '<img style="height:200px; width:200px; padding: 10px;background: #fff;" src ='+ data.data[i].image +'>'+
                                   '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                                   'display: inline-block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
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
       /* function  selectMenuItem(menuItemTitle) {
            console.log(menuItemTitle);
            $("#subMenuItems").empty();
            $('.mainMenuItems').css('opacity' ,'0.5');
            $(menuItemTitle).css('opacity' ,'1');
            var menuitemtitle=  $(menuItemTitle).text();
            $("#row").css('flex-wrap' ,'nowrap');

            if(sessionStorage.key(menuitemtitle)!= null ){
                var catego = JSON.parse(sessionStorage.getItem(menuitemtitle)).categories;
                for (var j = 0; j <= catego.length - 1; j++) {
                    var col = "<div class ='column zoom'  style='display: inline-block' onclick='selectSubMenuItem(this)'>" +
                        '<img style="height:200px; width:200px; padding: 10px;background: #fff;" src =' + catego[j].image + '>' +
                        '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                        'display: inline-block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                        '' + catego[j].title + '</a>' +
                        "</div>";

                    $("#subMenuItems").append(col);
                }

            }else{
                //TODO error message;
                console.log("reached else");
            }

        }*/
        function selectSubMenuItem (menuTitle) {
            var menuItemTitle= $(menuTitle).text();
            $("#row").css('flex-wrap' ,'nowrap');
            $("#subMenuItems").empty();
            $('.mainMenuItems').css('opacity' ,'0.5');
            $(menuTitle).css('opacity' ,'1');
            console.log("menuItemTitle",menuItemTitle);

            if(sessionStorage.key(menuItemTitle)!= null ){
                $.ajax({
                    type : "GET",
                    contentType : "application/json",
                    url : "/template/category/list/"+JSON.parse(sessionStorage.getItem(menuItemTitle)).id,
                    dataType : 'json',
                    timeout : 100000,
                    success : function(data) {
                        console.log("category list menuiD",data);
                        for (var i = 0; i <= data.data.length-1;i++) {
                             if(data.data[i].has_sub_category == true && data.data[i].active_item==true) {
                                 var col = "<div class ='column zoom'  style='display: inline-block'  onclick='selectSubMenuItem(this)'>" +
                                     '<img style="height:200px; width:200px;padding: 10px;background: #fff;" src ='+ data.data[i].image +'>'+
                                     '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                                     'display: inline-block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                                     ''+ data.data[i].title+'</a>'+
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
            }else{

            }





        }

    </script>
</html>
