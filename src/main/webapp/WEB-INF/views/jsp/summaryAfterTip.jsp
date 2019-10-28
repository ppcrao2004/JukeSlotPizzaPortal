<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <title>Happy Joes</title> -->
    <script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/resources/core/js/currency.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/core/js/materialize.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/materialize.min.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/materialize-stepper@2.1.4/materialize-stepper.css" rel="stylesheet"/>
</head>

<%@include file="header.jsp" %>
<body style="background: #efefef;">
<div class ='summaryInnerContent'>
    <div class ='summary-content'>
        <div class ="header" style="width: 100%;
    display: inline-block;
    padding-top: 100px;">
            <h1 style="font-size: 30px!important; text-align: center; margin: 0; margin-top: 20px;">Your Order</h1>
            <form>
                <ul class="stepper parallel horizontal" style="min-height: unset;">
                    <li class="step ">
                        <div class="step-title waves-effect waves-dark">View Order</div>
                    </li>
                    <li class="step">
                        <div class="step-title waves-effect waves-dark">Personal Info</div>

                    </li>
                    <li class="step">
                        <div class="step-title waves-effect waves-dark">Payment Method</div>
                    </li>
                    <li class="step active">
                        <div class="step-title waves-effect waves-dark">Summary</div>
                    </li>
                </ul>
            </form>
        </div>
<div class ='btnContainer-two'>
    <button class="backBtn" onclick="previousStep()">BACK</button>
    <div class ='personalinfo-cartPrice' style="float: right"></div>
</div></div>
</div>
</body>
<script>
    function previous() {
        $('.summary-tipcontent').css('display','block');

    }
    function nextPage() {

        $('.innerContent').css('display' ,'none');
        $('.summary-tipcontent').css('display','none');
        $('.btnContainer-two').css('display' ,'block');

    }
    function removeContent() {
        $('.summary-tipcontent').css('display','none');
        $('.btnContainer').css('display' ,'block');

    }
    function TipAddition(){
        $('.summary-tipcontent').css('display','none');
        $('.tip-content').css('display' ,'block');
        $('.btnContainer').css('display' ,'none');
    }
    function previousStep(){
        history.go(-1);
    }
    function previousStep(){
        history.go(-1);
    }

    $(document).ready(function () {
        let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        $('.personalinfo-cartPrice').text('You Pay  :'+sessionStorage.getItem("customerPayPrice"));


    });
</script>
</html>