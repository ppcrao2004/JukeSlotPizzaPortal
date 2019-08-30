<%--
  Created by IntelliJ IDEA.
  User: ppcra
  Date: 8/25/2019
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Happy Joes</title>
        <spring:url value="${home}resources/core/css/hello.css" var="coreCss" />
        <spring:url value="${home}resources/core/css/bootstrap.min.css"	var="bootstrapCss" />
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <link href="${bootstrapCss}" rel="stylesheet" />
        <link href="${coreCss}" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>

        <spring:url value="/resources/core/js/jquery.1.10.2.min.js"
                    var="jqueryJs" />
        <script src="${jqueryJs}"></script>
    </head>
<body bgcolor="#fffff": >
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <div class="navbar-header-image">
                <a class="navbar-brand" >
                    <img src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/logo_happyjoes.png"></a>
            </div>
            <div class ="navbar-header-text" style="padding-top: 30px; display: inline-block;">
                <span class="headerTitle" style="color:#fff;font-size:24px;">Good times to be together</span>
            </div>
        </div>
    </div>
</nav>
<div class ="checkout-page-conatiner"  style=" background: #C53131">
    <div class="header" style="text-align: center;">
        <h1 style="background:#fff ;height: 50px;    color: #C53131;"> What is your preference</h1>
    </div>

    <div class ="checkout-container" style="
    display: flex;
    height: 50%;">
        <div class="checkout-inner" style="display: flex;text-align: center; margin: auto;">
            <div class="left" style="display: inline-block;
     height: 87px;
    width: 115px;
    background: #fff;
    margin-right: 100px;
    padding:10px;
    padding-bottom: 40px;">
                <a href="${pageContext.request.contextPath}/mainMenu" style="text-decoration: none;">
                <img  src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/dinne_in.png" alt="Eat In">
                    <p style="color: #C53131;">Dine In</p>
                </a>
            </div>
            <div class="right" style="
     display: inline-block;
    background: #fff;
    height: 87px;
    width: 115px;
    padding: 10px;
    padding-bottom: 40px;">
                <a href="${pageContext.request.contextPath}/mainMenu" style="text-decoration: none;">
                <img  src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/carry_out.png" alt="Take Out"  />
                <p style="color: #C53131;">Carry out</p>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="col-sm-offset-2 col-sm-10">
        <button style=" height: 80px;
    width: 100%;
    background: #000000f5;
    color: #fff;
    bottom: 0;
    position: absolute;"
                type="submit" id="btn-search"
                class="btn btn-primary btn-lg" >TAP IN ONE SERVICE TO CONTINUE</button>
    </div>
</div>
</body>

</html>
