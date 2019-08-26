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
        <title>Happy Joes</title>


        <spring:url value="/resources/core/css/hello.css" var="coreCss" />
        <spring:url value="/resources/core/css/bootstrap.min.css"	var="bootstrapCss" />
        <spring:url value="/resources/core/css/main.css"	var="coreCss" />
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <link href="${bootstrapCss}" rel="stylesheet" />
        <link href="${coreCss}" rel="stylesheet" />

        <spring:url value="/resources/core/js/jquery.1.10.2.min.js"
                    var="jqueryJs" />
        <script src="${jqueryJs}"></script>
    </head>

    <nav class="navbar navbar-inverse">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" >
                    <img src="${pageContext.request.contextPath}/resources/core/images/mipmap-port-1800x1030/logo_happyjoes.png"></a>
                <span class="headerTitle">Good times to be together</span>
            </div>
        </div>
    </nav>


</html>
