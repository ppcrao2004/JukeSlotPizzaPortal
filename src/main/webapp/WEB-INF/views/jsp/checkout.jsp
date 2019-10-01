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
 <html lang="en">
 <head>
     <%@ page contentType="text/html;charset=UTF-8" language="java" %>
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <META name="viewport" content="initial-scale=0.66, user-scalable=no">
     <!-- <title>Happy Joes</title> -->
     <script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.4.1.min.js"></script>
     <script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
     <script src="${pageContext.request.contextPath}/resources/core/js/currency.min.js"></script>
     <!-- Compiled and minified JavaScript -->
     <script src="${pageContext.request.contextPath}/resources/core/js/materialize.min.js"></script>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/materialize.min.css"/>
     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
 </head>


    <body >
            <div style="text-align: center;width: 100%;background: #ffffff">
                <span style="background:#fff ;height: 50px; font-size: 6vw; color: #C53131;"> What is your preference ? </span>
            </div>
            <div class ="maincontainer">
            <div class ="checkout-container">
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
        <div class="footer">
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
 </html>
