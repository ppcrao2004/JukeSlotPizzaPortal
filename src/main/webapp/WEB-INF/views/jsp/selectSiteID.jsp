<%@page session="true" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
    <html lang="en" style="overflow: auto; position: fixed;">


        <body  style="overflow-y: hidden;width:100%;" class ="starter-template" >

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
                <form class="formaction">
                    <button type="submit"  style=" position: relative;
    overflow: hidden;
    padding: 16px 32px;
    margin: 0 auto;
    text-align: center;
    margin: 20px;
    background: grey;
    /* outline: none; */
    border: none;" value="submit"  formaction="/welcome" onclick=" return empty()">COMMIT </button>
                </form>
            </div>

        </div>

        </body>


    <script>
        $(document).ready(function (e) {
           sessionStorage.clear();



           // $('#myModal').css('display' ,'block');

        });

        function empty()
        {
            let siteIDName;
            siteIDName = document.getElementById("siteID").value;
            if (siteIDName == null || siteIDName == "") {
                $('#error').css("display" ,"block");
            }else{
                sessionStorage.setItem('siteID',siteIDName);

            };
        }

      /*  function homePageLoad() {
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
        function siteConfiguration() {
            $.ajax({
                type: "GET",
                contentType: "application/json",
                url: "/template/site/configuration/"+sessionStorage.getItem('siteID'),
                dataType: 'json',
                timeout: 100000,
                success: function (data) {
                    sessionStorage.setItem('siteConfiguration', JSON.stringify(data));
                    let taxRate =data.data.tax_rate;
                    if(taxRate <1) {
                        taxRate = taxRate*100;
                    }
                    sessionStorage.setItem("taxRate",taxRate);
                    console.log(taxRate);
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

        }*/
    </script>

    </html>
