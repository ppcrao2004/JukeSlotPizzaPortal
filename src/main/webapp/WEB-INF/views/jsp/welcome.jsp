<%@page session="true" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
    <html lang="en" style="overflow-y: hidden;">
        <head>
            <META name="viewport" content="width=device-width, initial-scale=1.0">
            <META name="viewport" content="initial-scale=0.66, user-scalable=no">
            <!--<title>Happy Joes</title> -->

            <c:url var="home" value="/" scope="request"/>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/main.css"/>
            <script src="${pageContext.request.contextPath}/resources/core/js/jquery-3.4.1.min.js"></script>
           <!--<script src="${pageContext.request.contextPath}/resources/core/js/main.js"></script>-->
            <!-- Compiled and minified CSS -->
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/core/css/materialize.min.css"/>
            <!-- Compiled and minified JavaScript -->
            <script src="${pageContext.request.contextPath}/resources/core/js/materialize.min.js"></script>
            <link rel="stylesheet"
                  href="https://fonts.googleapis.com/css?family=Tangerine">
            <style>
                textFont {
                    font-family: 'Tangerine', serif;
                    font-size: 28px;
                    text-shadow: 4px 4px 4px #aaa;
                }
            </style>
        </head>
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
        <body  class ="starter-template">
             <div class="maincontainer">
                 <!--<div class="imageText" id ="imageText" style="text-align: center">
                 </div> -->
                <div class="maincontainer-image fade" style="
    padding-top: 105px;
    padding-bottom: 80px;
    overflow-y: hidden;
    ">
                    <img id="image" alt="" style="padding-bottom: 80px;">

                </div>
                 <div class="footer-main" style="height: 80px;">
               <form class="form-group">
                   <button   type="submit" id="btn-nav"  height="80px;  " class="buttonContainer"  formaction="${pageContext.request.contextPath}/checkout">TAP FOR START</button>
               </form>
             </div>
             </div>


        </body>

    <script>
        $(document).ready(function (e) {
            sessionStorage.clear();
            $.ajax({
                type: "GET",
                contentType: "application/json",
                url: "/template/catetory/list",
                dataType: 'json',
                timeout: 100000,
                success: function (data) {
                    sessionStorage.setItem('WelcomeCategoryList', JSON.stringify(data));
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

            $('#myModal').css('display' ,'block');
        });

        function empty()
        {
            let siteIDName;
            siteIDName = document.getElementById("siteID").value;
            if (siteIDName == null || siteIDName == "") {
                $('#error').css("display" ,"block");
            }else{
                sessionStorage.setItem('siteID',siteIDName);
                homePageLoad();
            };
        }

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
                    let bgColor =data.data.back_ground_color;
                    sessionStorage.setItem("backGroundColor",bgColor);
                    $('.starter-template').css('background-color' , bgColor);
                    $('.navbar-header').css('background-color' ,bgColor);
                    //$('#imageText').append(data.data.slogan);
                   // $("#imageText").css({"background-color":data.data.frame_color});
                   // $("#imageText").css({"font-size":data.data.font_size});
                   // $("#imageText").css({"font-family":data.data.font_family});
                   // $("#imageText").css({"color":data.data.text_color});
                    $("#btn-nav").css({"background-color":data.data.order_now_button});
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
                    let slideImage=0;
                    function nextSlide() {

                        $("#image").fadeOut(100);
                        document.getElementById("image").setAttribute("src", img_array[slideImage]);
                        $("#image").fadeIn(100);
                      //  end();
                        slideImage++;
                        if(slideImage==img_array.length){
                            slideImage=0;
                        }
                        setTimeout(nextSlide,3000);

                    }
                    nextSlide();
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
<div id="myModal" class="modal" style="position: fixed;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    background: #fff;
    height: 100%;
    width: 100%;
    background: #000;
     max-height: 100%;">

    <!-- Modal content -->
    <div class="modal-content" style="text-align: center;
    position: relative;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 2px;
    border: 1px solid #fff;
    width: 300px;">
        <span  style="color:#fff; padding-left: 20px;
    margin-bottom: 20px;
    display: inline-block;"> Please input site ID</span><br/>
        <select id ="siteID" style="display: inline-block; width: 216px; color:#ff3d00;" name="id" required>
            <option value="16thstreet-0001">16thstreet</option>
            <option value="TomCoffee-0001">TomCoffee</option>
            <option value="BellaNapoli-0001">BellaNapoli</option>
            <option value="SoupDive-0001">SoupDive</option>
            <option value="MelbourneSeafood-0001">MelbourneSeafood</option>
            <option value="Rocatone-0001" selected>Rocatone</option>
            <option value="Chocolatte-0001">Chocolatte</option>
            <option value="DBosWings-0001">DBosWings</option>
            <option value="GenesPoBoys-0001">GenesPoBoys</option>
            <option value="Jukeslot-USA-Northeast-NJ-SITE_1">Jukeslot</option>
            <option value="Kingsway-0001">Kingsway</option>
            <option value="TestC-USA-Northeast-NJ-Africal">TestC</option>
        </select><br/>
        <p id ="error" style="color: #C53131;display: none"> Please Enter Site ID</p>
        <button type="submit"  style=" position: relative;
    overflow: hidden;
    padding: 16px 32px;
    margin: 0 auto;
    text-align: center;
    margin: 20px;
    background: grey;
    /* outline: none; */
    border: none;" value="submit"  onclick=" return empty()">COMMIT </button>
    </div>

</div>
