<%--
  Created by IntelliJ IDEA.
  User: ppcra
  Date: 8/25/2019
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <html lang="en" style="overflow-y: hidden;">
 <head>
     <%@ page contentType="text/html;charset=UTF-8" language="java" %>
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <META name="viewport" content="initial-scale=0.66, user-scalable=no">
     <!-- <title>Happy Joes</title> -->
     <script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.4.1.min.js"></script>
     <script src="${pageContext.request.contextPath}/resources/core/js/currency.min.js"></script>
     <!-- Compiled and minified JavaScript -->
     <script src="${pageContext.request.contextPath}/resources/core/js/materialize.min.js"></script>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/materialize.min.css"/>
     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
 </head>


    <body >
            <div style="text-align: center;width: 100%;background: #ffffff; padding-top: 100px;">
                <span style="background:#fff ;height: 50px; font-size: 6vw;  color: #C53131;"> What is your preference ? </span>
            </div>
            <div class ="maincontainer" style="padding-top: 10px;">
            <div class ="checkout-container" style="background: #000">
                <div class="checkout-inner">
                    <div class="left zoom">
                        <a href="${pageContext.request.contextPath}/mainMenu"  style="text-decoration: none;">
                        <img  src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/dinne_in.png" alt="Eat In">
                            <p style="color: #C53131; font-size: 20px ; font-style: oblique ; margin: 6px">EAT IN</p>
                        </a>
                    </div>
                    <div class="right zoom">
                        <a href="${pageContext.request.contextPath}/mainMenu" style="text-decoration: none;" >
                        <img  src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/carry_out.png" alt="Take Out"  />
                        <p style="color: #C53131; font-size: 20px ; font-style: oblique ; margin: 6px">TAKE AWAY</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer" style="position: fixed;">
            <div class="footerContainer" >
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
    height: 80px;
"
                        class="btn btn-primary btn-lg" >SELECT A SERVICE TO CONTINUE</button>
            </div>
        </div>
    </body>
 <script>
 $(document).ready(function() {
     let finalCart = {cartTotalPrice: 0 , cartItems: []};
     sessionStorage.setItem("finalCart",JSON.stringify(finalCart));
     homePageLoad();

 });
 function homePageLoad() {
     $('#myModal').css('display' ,'none');
     $.ajax({
         type: "GET",
         contentType: "application/json",
         url: "/template/homepage/"+sessionStorage.getItem('siteID'),
         dataType: 'json',
         timeout: 100000,
         success: function (data) {
             sessionStorage.setItem('welcomeService', JSON.stringify(data));
             if (data.data.logo != null) {
                 document.getElementById("logoimage").src = data.data.logo;


             } else {
                 document.getElementById("logoimage").src = "/resources/core/images/mipmap-port-1800x1030/logo_happyjoes.png";
             }

             if (data.data.back_ground_color != null) {
                 $('.starter-template').css = ("background-color", "data.data.back_ground_color");
             } else {
                 $('.starter-template').css("background-color", "#000");
             }

             //  let imageHome = document.getElementById("image").setAttribute("src",img_array);
             let img_array=[];
             for(let i=0 ; i<=data.data.display_images.length-1;i++)
             {
                 img_array.push(data.data.display_images[i].image);
             }

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

 }
 </script>

 </html>
