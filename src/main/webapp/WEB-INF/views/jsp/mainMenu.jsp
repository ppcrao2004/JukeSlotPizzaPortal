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
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <META name="viewport" content="initial-scale=0.66, user-scalable=no">
    <!-- <title>Happy Joes</title> -->
    <script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/core/js/currency.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/core/js/materialize.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/core/js/mainMenu.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/materialize.min.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
    <body style="background: #BBDEFB">
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

    <div style="text-align: center;width: 100%;background: #ffffff; margin-top:100px" class="selection-header">
        <span style="background:#fff ;height: 50px;margin-bottom:10px; display:inline-block;font-size: 30px; color: #C53131;"> Let 's get started! </span>
    </div>
        <div class ="checkout-page-conatiner" id ="checkout-page-conatiner">
         <div class ="checkout-container" style="display: flex;height: auto;width: 100%;overflow-x: scroll;">
             <div id="checkout-inner"  class="checkout-block" style="display: flex; margin: auto;">
             </div>
         </div>

        </div>
    <div class='footer1 row' style='display:none;width: 100%;bottom: 0; position: fixed;margin: 0;z-index: 2000;background: rgb(221, 221, 221);height: auto'>
        <div class ='orderButton ' style='position: relative;bottom: 0;'>
            <div class=' row col s12 ' style='background: rgb(221, 221, 221);margin:0; padding: 0;padding-top: 5px;'>
                <form class='formaction'>
                    <button  style='background: #C53131;margin:0;height: 50px;' type='submit' id='checkoutButton' class='checkoutButtonText row col s12'
                             formaction='${pageContext.request.contextPath}/reviewOrder'>
                        checkout </button>
                </form>
            </div>
        </div>
        <div class ='checkoutbutton' style='flex-wrap: nowrap;display: inline-flex;overflow-x: scroll;width: 100vw;'>
        </div>
    </div>
    </body>

    <script>
        $(document).ready(function() {
           // homePageLoad();
           // removeItemConfirm();
            let tb1 =$("<div/>").attr("id" ,"row");
            let menuItems ="<div id ='subMenuItems' style='overflow-x: hidden;'>"+ "</div>";
            $("body").append(menuItems);
            $("body").css("background",sessionStorage.getItem("backGroundColor"));
            $("#checkout-inner").append(tb1);
            //Initializing  Cart and saving into session , same finalCart should be used all over the flow.
            //mainMenuLoad();
        });
</script>
</html>

<div id ="modalPopup" style="display: none ;    position: relative;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    height: 100%;">
    <div id = "modalPopupInner">
        <!-- <div class ="selectedAddonItem">
         </div>
         <div class ="itemPriceLabel" style="background: rgb(221, 221, 221);">
            <p class ="ItemPrice" style=" margin-top:0;">Price from </p>
             <div class="itemText">
                <h1 style="margin-top: 0;font-size: 20px;height: 50px;"></h1>
                <p>Have it your way</p>
             </div>
         </div>-->
        <div class ="itemModifierHeading" >
            <div id="itemModifierImage">
            </div>
        </div>

    </div>
</div>
<div  class ='hidden modal' id="window"
      style="position: absolute;
        border: 1px solid;
        width:270px;
        z-index:1100;
       /* left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);*/
        background: #fff;
          left: 10%;
         top: 50%;
        right: 10%;
        margin-left: auto;
        margin-right: auto;
        height: 58px;">
    <div>
        <p style="display: inline-block;width: 100%;
    margin: 0;">Are You Sure Want To Delete This Item</p>
    </div>
    <div  style=" position: absolute;
     bottom: 0;
     width: 100%;">
        <button  style="padding:0;width:48%;
    bottom: 0;"  onclick="removeItemConfirm()" value="Continue">
            Yes
        </button>
        <button  onclick="exit()" style="padding:0;width:48%;
    bottom: 0;">No</button>
    </div>
</div>

<div  class ='hidden modal' id="popup"
      style="position: fixed;
        border: 1px solid;
        width:270px;
        z-index:1100;
       /* left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);*/
        background: #fff;
          left: 10%;
         top: 50%;
        right: 10%;
        margin-left: auto;
        margin-right: auto;
        height: 58px;">
    <div>
        <p style="display: inline-block;width: 100%;
    margin: 0;">Select One option from each modifier</p>
    </div>
    <div  style=" position: absolute;
     bottom: 0;
     width: 100%;">
        <button  onclick="exitpopup()" style="padding:0;width:100%;
    bottom: 0;">OK</button>
    </div>
</div>

<!-- Modal Structure -->
<%--<div id="popup" class="hidden modal modal-fixed-footer">
    <div class="modal-content">
        <h4>Modal Header</h4>
        <p>A bunch of text</p>
    </div>
    <div class="modal-footer" style=" position: absolute;
     bottom: 0;
     width: 100%;">
        <button  onclick="exitpopup()" style="padding:0;width:100%;
    bottom: 0;" class="modal-close waves-effect waves-green btn-flat">OK</button>
    </div>
</div>
<%--For Each Example   arr.forEach(element => {  console.log(element); });--%>


