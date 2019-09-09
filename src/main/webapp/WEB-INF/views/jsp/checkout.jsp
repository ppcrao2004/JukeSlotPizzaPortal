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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Happy Joes</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>
        <script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.4.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
    </head>
    <%@include file="header.jsp" %>

    <body >


        <div class ="maincontainer">
            <div class="header" style="text-align: center;">
                <h1 style="background:#fff ;height: 50px;  color: #C53131;"> What is your preference</h1>
            </div>

            <div class ="checkout-container">
                <div class="checkout-inner">
                    <div class="left">
                        <a href="${pageContext.request.contextPath}/mainMenu"  style="text-decoration: none;">
                        <img  src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/dinne_in.png" alt="Eat In">
                            <p style="color: #C53131; font-size: 20px ; font-style: oblique ; margin: 6px">Dine In</p>
                        </a>
                    </div>
                    <div class="right">
                        <a href="${pageContext.request.contextPath}/mainMenu" style="text-decoration: none;" >
                        <img  src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/carry_out.png" alt="Take Out"  />
                        <p style="color: #C53131; font-size: 20px ; font-style: oblique ; margin: 6px">Carry out</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <div >
                <a type="submit" id="btn-search"
                        class="btn btn-primary btn-lg" >TAP IN ONE SERVICE TO CONTINUE</a>
            </div>
        </div>
    </body>
 </html>
