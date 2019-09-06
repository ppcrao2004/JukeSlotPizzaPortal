<%--
  Created by IntelliJ IDEA.
  User: ppcra
  Date: 8/25/2019
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Happy Joes</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>
        <script src="${pageContext.request.contextPath}/resources/core/js/jquery.1.10.2.min.js"></script>
    </head>

    <nav class="navbar navbar-inverse">
        <div class="container">
            <div class="navbar-header" style="background:black; display: flex;">
                <div class="navbar-header-image">
                    <a class="navbar-brand" >
                        <img src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/logo_happyjoes.png" alt="LOGO"></a>
                </div>
                <div class ="navbar-header-text" style="padding-top: 30px; display: inline-block;">
                    <span class="headerTitle" style="color:#fff;font-size:24px;">Good times to be together</span>
                </div>
            </div>
        </div>
    </nav>
    <div class ="checkout-page-conatiner">
        <div class="header" style="text-align: center;">
<h1 style="background:#fff ;height: 50px;    color: #d24f4f;"> Let 's get started!</h1>
        </div>

 <div class ="checkout-container" style="
    display: flex;
    height: auto;">
     <div id="checkout-inner"  class="checkout-inner" style="display: flex;text-align: center; margin: auto;">


     </div>
 </div>
    </div>

    <script>
        jQuery(document).ready(function($) {
            var tbl=$("<table/>").attr("id","mytable");
            $("#checkout-inner").append(tbl);
            searchViaAjax();
        });

        function searchViaAjax() {
            $.ajax({
                type : "GET",
                contentType : "application/json",
                url : "${home}template/menu/list",
                dataType : 'json',
                timeout : 100000,
                success : function(data) {

                   // $.each(data.data, function(i, item) {
                        for (var i = 0; i < data.data.length; i ++) {
                            console.log(data.data[i].image);
                            console.log(data.data);
                            // $('#checkout-inner').append("<img id='theImg'/>");
                            // document.getElementById("theImg").setAttribute("src" ,data.data[i].image);
                            if (i < data.data.length) {
                                var tr = "<tr>";
                                var td1 = "<td>" + '<img  style="height:200px; width:200px; padding: 10px;background: #fff;" src = ' + data.data[i].image +'> '+ '<p style="padding: 10px;background: #fff;margin: 0; text-align: center; color: #C53131;; text-transform: uppercase;font-weight: 800;">'+ data.data[i].title+'</p>'+"</td> ";
                                var td2 = "<td>" + '<img  style="height:200px; width:200px; padding: 10px;background: #fff;" src = ' + data.data[i + 1].image +'> ' + '<p style="padding: 10px;background: #fff;margin: 0;text-align: center; color: #C53131;; text-transform: uppercase;font-weight: 800;">'+ data.data[i+1].title+'</p>'+"</td>";
                                var td3 = "<td>" + '<img  style="height:200px; width:200px; padding: 10px;background: #fff;" src = ' + data.data[i + 2].image + '> ' + '<p style="padding: 10px;background: #fff;margin: 0;text-align: center; color: #C53131;; text-transform: uppercase;font-weight: 800;">'+ data.data[i+2].title+'</p>'+"</td>";
                                var td4 = "<td>" + '<img  style="height:200px; width:200px; padding: 10px;background: #fff;" src = ' + data.data[i + 3].image + '> ' +'<p style="padding: 10px;background: #fff;margin: 0;text-align: center; color: #C53131;; text-transform: uppercase;font-weight: 800;">'+ data.data[i+3].title+'</p>'+ "</td></tr>";


                            }

                            $("#mytable").append(tr + td1 + td2+td3+td4);
                            i=i+4;


                            // document.getElementsByClassName("theImg").setAttribute("src" ,data.data[i].image);
                            // $('<img/>').attr('src' , data.data[i].image).appendTo($('#checkout-inner'));

                            // });
                          //  console.log("SUCCESS: ", data.data.length);
                        }


                },
                error : function(e) {
                    console.log("ERROR: ", e);
                    display(e);
                },
                done : function(e) {
                    console.log("DONE");
                    enableSearchButton(true);
                }
            });



        }
    </script>
</html>
