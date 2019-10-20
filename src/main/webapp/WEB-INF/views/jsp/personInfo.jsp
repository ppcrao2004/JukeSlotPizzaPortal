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
<body style="background: #efefef">
<div class ='personalInfo-content'>

    <div class ="header" style="width: 100%;
    display: inline-block;
    padding-top: 100px;">
        <h1 style="font-size: 30px!important; text-align: center; margin: 0; margin-top: 20px;">Your Order</h1>
        <form>
            <ul class="stepper parallel horizontal" style="min-height: unset;">
                <li class="step">
                    <div class="step-title waves-effect waves-dark">View Order</div>
                </li>
                <li class="step active">
                    <div class="step-title waves-effect waves-dark">Personal Info</div>

                </li>
                <li class="step">
                    <div class="step-title waves-effect waves-dark">Payment Method</div>
                </li>
                <li class="step">
                    <div class="step-title waves-effect waves-dark">Summary</div>
                </li>
            </ul>
        </form>
        <div style="padding:0 20px;">
<button  class ='backBtn' onclick="previousStep()" >Back</button>
<div class ='cartPrice' style="float: right;font-weight: 600;"></div>


<form class="formaction" id ='personalinfo-form' style="background: #efefef;height: 45px;position: fixed;margin-bottom: 10px;width: 100%;">
    Please Enter Your Name: <input style="border: 1px solid #9e9e9e; width: 80%;background: #fff;" type="text"  name="name" class="invalid" required>
            <div class ='error_showmessage' style="display: inline-block;color:#000" >Required *</div>
</form>
</div>
</div>
</div>
<div class ="footer" style="background: #efefef;height: 45px;position: fixed;margin-bottom: 0px;">
    <form class="formaction" >
        <button  formaction="/mainMenu"  style="float: left; padding:8px;width:200px; font-weight:600;font-size: 18px;border-radius: 25px;border: 1px solid #000;">
            Continue Shopping
        </button>
        <input  id ='sub' class ='nextBtn'  value="NEXT"  method ='post'  formaction="/paymentMethod"  type="submit" onclick="validation()" style=" float: right;
    width: 200px;
    padding: 8px;
    font-weight: 600;
    font-size: 18px;
"/>
        </input>
    </form>

</div>
</body>
<script>
   function previousStep(){
       history.go(-1);
    }

   $(document).ready(function () {
       let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
       //$('.price').text('You Pay' +finalCart.cartTotalPrice);
       $('.cartPrice').text('You Pay  :'+sessionStorage.getItem("customerPayPrice"));
       console.log('reached');
      $('#personalinfo-form').on("keyup" ,function() {
          var input = $('#personalinfo-form').find('input');
          var is_name = input.val();
          if (is_name) {
              input.removeClass("invalid").addClass('valid');
              input.removeClass("valid").removeClass('error_show');
              document.getElementById('sub'). removeAttribute('disabled');
              $('.error_showmessage').css('color' , '#000');
          } else {
              $('.error_showmessage').css('color' , 'red');
              input.removeClass("valid").addClass('error_show');
              document.getElementById('sub').setAttribute('disabled' ,'true');

          }
      })


   })

</script>
</html>