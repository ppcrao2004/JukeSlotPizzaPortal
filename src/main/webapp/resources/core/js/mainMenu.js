$(document).ready(function (e) {
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

function exit() {
    $('#window').removeClass('show');
    $('#window').addClass('hidden');
    if($('.row').hasClass('selected-item')){
        $('.row').removeClass('selected-item');
    }
    $('#subMenuItems').css('z-index' ,'0');
    $('#subMenuItems').css('pointer-events' ,'all');
    $('#subMenuItems').css('position' ,'static');

};