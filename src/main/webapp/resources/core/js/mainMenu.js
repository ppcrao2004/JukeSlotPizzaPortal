$(document).ready(function (e) {
    homePageLoad();
    mainMenuLoad();
    animate();
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
function mainMenuLoad() {
    $.ajax({
        type : "GET",
        contentType : "application/json",
        url : "/template/menu/list/"+sessionStorage.getItem("siteID"),
        dataType : 'json',
        timeout : 100000,
        success : function(data) {
            sessionStorage.setItem('menuList',JSON.stringify(data));
            let timeoutCount = 0;
            data.data.forEach(dataData => {
                timeoutCount=timeoutCount+500;
                if (dataData.has_category === false && dataData.has_item === true){
                    sessionStorage.setItem(dataData.id,JSON.stringify(dataData));
                    let col2 = "<div class ='column zoom mainMenuItems '  style='opacity: 0.2' onclick='itemListMenu(this)'>" +
                        '<img  id = '+dataData.id +' style=" padding: 10px;background: #fff; display:inline-block;" src ='+ dataData.image +'>'+
                        '<a class ="selectItem" style="background: #fff ;padding: 10px;display:inline-block; margin :0;' +
                        'display: inline-block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                        ''+ dataData.title+'</a>'+
                        "</div>";
                    $('#row').append(col2);
                    let id =dataData.id;
                    let temp =$('#'+id).parent();
                   animate(temp ,timeoutCount);
                }else{
                    sessionStorage.setItem(dataData.id,JSON.stringify(dataData));
                    let col2 = "<div class ='column zoom mainMenuItems ' style='opacity: 0.2'  onclick='categoryList(this)'>" +
                        '<img  id = '+dataData.id +' style=" padding: 10px;background: #fff;display:inline-block;" src ='+ dataData.image +'>'+
                        '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                        'display: inline-block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                        ''+ dataData.title+'</a>'+
                        "</div>";
                    // $("#row").find('img').show('slow');.slideToggle();
                    $('#row').append(col2);
                    let id =dataData.id;
                    let temp =$('#'+id).parent();
                    console.log(temp);
                    animate(temp ,timeoutCount);
                }
            });
            let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
            if(finalCart.cartItems.length !=0)
            {
             $('.footer1').css('display' ,'block');
                let col;
                finalCart.cartItems.forEach(cartitem => {
                    if(undefined ==cartitem.secondaryId) {
                        col = "<div class ='column zoom ' style='display: inline-block;background: #fff; margin-right: 20px; float: left;'>" +
                            "<button id = " + cartitem.id + " onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px;'>" +
                            "<i  class='material-icons' style='font-size: 10px;'>close</i></button>" +
                            '<p style=" margin: 0;width: 150px;"> ' + cartitem.totalItemcost + '</p> ' +
                            '<img  style="height:70px; width:70px; padding: 0 10px;background: #fff; margin: 0; float: right" src =' + cartitem.imageURL + '>' +
                            '<a class ="selectItem" style="background: #fff ; margin :0;' +
                            'display: block;width: 180px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                            '' + cartitem.itemName + '</a>' +
                            "<p>" + 'Quantity - ' + cartitem.count + "</p>" +
                            "</div>";
                    }
                    else{
                        col = "<div class ='column zoom ' style='display: inline-block;background: #fff; margin-right: 20px; float: left;'>" +
                            "<button id = " + cartitem.id + "  secondaryId = "+cartitem.secondaryId+" onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px;'>" +
                            "<i  class='material-icons' style='font-size: 10px;'>close</i></button>" +
                            '<p style=" margin: 0;width: 150px;"> ' + cartitem.totalItemcost + '</p> ' +
                            '<img  style="height:70px; width:70px; padding: 0 10px;background: #fff; margin: 0; float: right" src =' + cartitem.imageURL + '>' +
                            '<a class ="selectItem" style="background: #fff ; margin :0;' +
                            'display: block;width: 180px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                            '' + cartitem.itemName + '</a>' +
                            "<p>" + 'Quantity - ' + cartitem.count + "</p>" +
                            "</div>";
                    }
                    $('.checkoutbutton').append(col);

                });
            }
        },
        error : function(e) {
            console.log("ERROR: ", e);
            display(e);
        }
    });

}
function categoryList(menuID) {
    $("#subMenuItems").empty();
    $("#subMenuItems").css('display' ,'flex');
    $("#subMenuItems").css('margin-top' ,'150px');
    let menuItemId =$(menuID).find('img').attr('id');
    $("#row").css('flex-wrap' ,'nowrap');
    $(".navbar").append($('#row'));
    $('.selection-header').empty();
    $('.mainMenuItems').css('opacity' ,'0.5');
    $(menuID).css('opacity' ,'1');
    $(menuID).attr('id' ,'active');
    /* category List AJAX Call */
    $.ajax({
        type : "GET",
        contentType : "application/json",
        url : "/template/category/list/"+menuItemId,
        dataType : 'json',
        timeout : 100000,
        success : function(data) {
            sessionStorage.setItem('categoryListMenuId',JSON.stringify(data));

            let timeoutCount = 0;
            data.data.forEach(dataData => {

                timeoutCount=timeoutCount+500;
                if (dataData.has_sub_category === true) {
                    sessionStorage.setItem(dataData.id, JSON.stringify(dataData));
                    let col = "<div class ='column zoom'  style='display: block;' onclick='selectSubMenuItem(this)'>" +
                        '<img  id = ' + dataData.id + ' style="padding: 10px;background: #fff;" src =' + dataData.image + '>' +
                        '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                        'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                        '' + dataData.title + '</a>' +
                        "</div>";
                    $("#subMenuItems").append(col);
                    let id =dataData.id;
                    let temp =$('#'+id).parent();
                    //console.log($(+dataData.id));
                    animate(temp ,timeoutCount)
                } else {
                    let col = "<div class ='column zoom'  style='display: block; opacity: 0.2;'  onclick='selectSubCategoryItem(this)'>" +
                        '<img  id = ' + dataData.id + ' style="padding: 10px;background: #fff;" src =' + dataData.image + '>' +
                        '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                        'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                        '' + dataData.title + '</a>' +
                        "</div>";
                    $("#subMenuItems").append(col);
                    let id =dataData.id;
                    let temp =$('#'+id).parent();
                   animate(temp ,timeoutCount);
                }
            });

        },
        error : function(e) {
            console.log("ERROR: ", e);
            display(e);
        }

    });
}
function itemListMenu(menuID) {
    $("#subMenuItems").empty();
    $('.selection-header').empty();
    let menuMenuId =$(menuID).find('img').attr('id');
    $("#row").css('flex-wrap' ,'nowrap');
    $(".navbar").append($('#row'));
    $(".header").find('h1').css('display' ,'none');
    $("#subMenuItems").css('display' ,'flex');
    $("#subMenuItems").css('margin-top' ,'150px');
    $(menuID).removeAttr('id');
    $('.mainMenuItems').css('opacity' ,'0.5');
    $(menuID).css('opacity' ,'1');
    $(menuID).attr('id' ,'active');
    /* category List AJAX Call */
    $.ajax({
        type : "GET",
        contentType : "application/json",
        url : "/template/item/list/menu/"+menuMenuId,
        dataType : 'json',
        timeout : 100000,
        success : function(data) {
            sessionStorage.setItem('itemListMenuMenuId',JSON.stringify(data));
            let timeoutCount=0;
            data.data.forEach(dataData => {

                timeoutCount=timeoutCount+500;
                sessionStorage.setItem(dataData.id, JSON.stringify(dataData));
                let item_cost =currency(dataData.price, { formatWithSymbol: true }).format();
                if(item_cost =='$0.00')
                {
                    item_cost  ="Free";
                }
                let col = "<div class ='column zoom categoryItem'   onclick='customizeItems(this)' style='display: block;'>" +
                    '<p class="red-text text-darken-2" style=" margin: 0; background: #fff; text-align:right ;width: 200px;font-weight: 600;">'+item_cost+'</p> ' +
                    '<img  id = ' + dataData.id + ' style=" padding: 0 10px;background: #fff; margin: 0;" src =' + dataData.image + '>' +
                    '<a class ="selectItem" style="background: #fff ; margin :0;' +
                    'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                    '' + dataData.title + '</a>' +
                    "</div>";
                $("#subMenuItems").append(col);
                let id =dataData.id;
                let temp =$('#'+id).parent();
                animate(temp ,timeoutCount);

            });
        },
        error : function(e) {
            console.log("ERROR: ", e);
            display(e);
        }
    });
}
function selectSubMenuItem (categoryID) {
    $("#subMenuItems").empty();
    let categoryItemID = $(categoryID).find('img').attr('id');
    $("#row").css('flex-wrap', 'nowrap');
    $(".navbar").append($('#row'));
    $(".header").find('h1').css('display' ,'none');
    if (sessionStorage.key(categoryItemID) != null) {
        let categoryItemgetSubCategory = JSON.parse(sessionStorage.getItem(categoryItemID));
        let timeoutCount =0;
        categoryItemgetSubCategory.sub_categories.forEach(subCategory => {
            timeoutCount =timeoutCount+500;
            let col = "<div class ='column zoom'  style='display: block;opacity: 1' onclick='selectSubCategoryItem(this)'>" +
                '<img  id = ' + subCategory.id + ' style=" padding: 10px;background: #fff;" src =' +
                subCategory.image + '>'
                +
                '<a class ="selectItem" style="background: #fff ;padding: 10px; margin :0;' +
                'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                '' + subCategory.title + '</a>' +
                "</div>";
            $("#subMenuItems").append(col);
            let id =dataData.id;
            let temp =$('#'+id).parent();
            animate(temp ,timeoutCount);
        });
    }
}
function selectSubCategoryItem(Item) {
    let categoryId = $(Item).find('img').attr('id');
    $("#subMenuItems").empty();
    if (sessionStorage.key(categoryId) != null) {
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/template/item/list/" + categoryId,
            dataType: 'json',
            timeout: 100000,
            success: function (data) {
                let timeoutCount =0;
                data.data.forEach(dataData => {
                    timeoutCount =timeoutCount+500;
                    sessionStorage.setItem(dataData.id, JSON.stringify(dataData));
                    if (dataData.active_item == true) {
                        let item_cost=  currency(dataData.price, { formatWithSymbol: true }).format();
                        if(item_cost == '$0.00'){
                            item_cost ='Free';

                        }
                        let col = "<div class ='column zoom categoryItem'   onclick='customizeCategory(this)' style='display: block;opacity: 1;'>" +
                            '<p class="red-text text-darken-2" style=" margin: 0; background: #fff; text-align:right ;width: 200px;">'+item_cost+'</p> ' +
                            '<img  id = ' + dataData.id + ' style=" padding: 0 10px;background: #fff; margin: 0;" src =' + dataData.image + '>' +
                            '<a class ="selectItem" style="background: #fff ; margin :0;' +
                            'display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                            '' + dataData.title + '</a>' +
                            "</div>";
                        $("#subMenuItems").append(col);
                        let id =dataData.id;
                        let temp =$('#'+id).parent();
                        animate(temp ,timeoutCount)
                    }
                });

            },
            error: function (e) {
                console.log("ERROR: ", e);
                display(e);
            }
        });
    }
}
function customizeCategory(item) {
    let selectedCartItem = $(item);
    let selectedCartItemId=  $(selectedCartItem).find('img').attr('id');
    let selectedCartItemDetail = JSON.parse(sessionStorage.getItem(selectedCartItemId));
    let selectedCartItemPrice = $(selectedCartItem).find('p').text();
    let selectedCartItemName = $(selectedCartItem).find('a').text();
    let selectedCartItemImgURL = $(item).find('img').attr('src');
    if(selectedCartItemPrice =='Free')
    {
        selectedCartItemPrice ="$0.00";
    }
    if(selectedCartItemDetail.modifiers=== null ||selectedCartItemDetail.has_modifier ===false) {
        let spicyLevel = (selectedCartItemDetail.spicy_levels  === undefined || selectedCartItemDetail.spicy_levels.length == 0) ? 0
            :selectedCartItemDetail.spicy_levels[0] ;
        let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        if(finalCart.cartItems.some(cartItemElement =>cartItemElement.id === selectedCartItemId)){
            finalCart.cartItems.forEach(cartItemElement => {
                if (cartItemElement.id === selectedCartItemId) {
                    cartItemElement.count = parseInt(cartItemElement.count) + 1;
                }
            });
        } else{
            let cartArrayItem = {id:selectedCartItemId, count:1 ,itemName: selectedCartItemName,price:selectedCartItemPrice ,
                totalItemcost:selectedCartItemPrice,imageURL:selectedCartItemImgURL,spicyLevel:spicyLevel, modifiers:[]};
            finalCart.cartItems.push(cartArrayItem);
        }

        sessionStorage.setItem("finalCart",JSON.stringify(finalCart));
        getPrice();
        console.log(finalCart);
        $('.footer1').css('display' ,'block');

        finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        $('.checkoutbutton').empty();
        let timeoutCount =0;
        finalCart.cartItems.forEach(cartitem => {
            timeoutCount =timeoutCount+500;

            let col = "<div class ='column zoom ' style='display: inline-block; background: #fff;margin-right: 20px;float: left;'>" +
                "<button  id=" + cartitem.id + " onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px'>" +
                "<i class='material-icons' style='font-size: 10px'>close</i></button>" +
                '<p style=" margin: 0;width: 150px;"> ' +cartitem.totalItemcost+ '</p> ' +
                '<img  style="height:70px; width:70px;float: right; padding: 0 10px;background: #fff; margin: 0;" src =' + cartitem.imageURL + '>' +
                '<a class ="selectItem" style="background: #fff ; margin :0;' +
                'display: block;width: 180px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                '' + cartitem.itemName + '</a>' +
                "<p class='quantity'>" + 'Quantity - ' + cartitem.count + "</p>" +
                "</div>";

            //$('.checkout-container').html(col);
            $('.checkoutbutton').append(col);
            let id =cartitem.id;
            let temp =$('#'+id).parent();
            //console.log($(+dataData.id));
            console.log(temp);

            $(temp).animate({
                opacity: 1
            }, timeoutCount,'swing');
        });

    }
    else {
        $("#subMenuItems").empty();
        $('#modalPopup').css('display', 'block');

        $('#row').css('display', 'none');
        $('#itemModifierImage').append($(item));
        let itemDescription =selectedCartItemDetail.description;
        let description = "<div class='col s12 m7'>"+
            "<div class='card horizontal'>"+
            "<div class='card-stacked'>"+ "<div class='card-content'>"+
            "<p  class='red-text text-darken-2' >"+'Price from'+"<br> <strong class='red-text text-darken-2'>"+selectedCartItemPrice+ "<strong></p>" +
            "<p class='red-text text-darken-2'>"+selectedCartItemName +"</p>" +
            "<p class='red-text text-darken-2'>"+itemDescription+"</p></div></div>" +
            "<div class='card-image'>"+
            "<button  id="+selectedCartItemId+" onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px'>" +
            "<i class='material-icons' style='font-size: 10px'>close</i></button>" +
            "<img  id ="+selectedCartItemId+" style='width: 200px;height: 200px' src="+selectedCartItemImgURL+">"+ "</div> </div>";
        $('#itemModifierImage').empty();
        $('#itemModifierImage').append(description);
        if(selectedCartItemPrice =='Free')
        {
            selectedCartItemPrice ='$0.00';
        }
        let spicyLevel = (selectedCartItemDetail.spicy_levels  === undefined || selectedCartItemDetail.spicy_levels.length == 0) ? 0
            :selectedCartItemDetail.spicy_levels[0] ;
        let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        //Check in final cart , Is Item already exist
        let cartArrayItem;
        if(finalCart.cartItems.some(cartItemElement =>cartItemElement.id === selectedCartItemId)) {
            finalCart.cartItems.forEach(cartItemElement => {
                if (cartItemElement.id === selectedCartItemId) {
                    cartArrayItem = {id:selectedCartItemId,secondaryId:getRandomNumber(),count:1 ,itemName: selectedCartItemName,price:selectedCartItemPrice ,
                        totalItemcost:selectedCartItemPrice,imageURL:selectedCartItemImgURL,spicyLevel:spicyLevel, modifiers:[]};
                }
            });
        }else{
            cartArrayItem = {id:selectedCartItemId,count:1 ,itemName: selectedCartItemName,price:selectedCartItemPrice ,
                totalItemcost:selectedCartItemPrice,imageURL:selectedCartItemImgURL,spicyLevel:spicyLevel, modifiers:[]};
        }

        // let cartArrayItem = {id:selectedCartItemId,count:1 ,itemName: selectedCartItemName,price:selectedCartItemPrice ,
        //     totalItemcost:selectedCartItemPrice,imageURL:selectedCartItemImgURL,spicyLevel:spicyLevel, modifiers:[]};

        selectedCartItemDetail.modifiers.forEach(modifierItem => {
            let modifier = {modifierID: modifierItem.id,modifierHeading:modifierItem.heading,numberOfOptions:modifierItem.number_of_options,choices:[]};
            cartArrayItem.modifiers.push(modifier);
            let div = "<div id ="+modifierItem.id+" class ='modifiers' allowedchoices = "+modifierItem.number_of_options+" " +
                "style='width: 100%;'>" +
                ' <p  style="font-size: 15px; font-weight: 600 ;color: crimson;color: #D32F2F !important;"><strong>' + modifierItem.heading + '</strong></p><br>' +
                "</div>";
            $('#itemModifierImage').append(div);

            modifierItem.choices.forEach(choice => {
                let col = "<div  class ='column zoom addToCart ' style='display: inline-block; margin-right: 20px;' onclick='addToCart(this)' >" +
                    '<p style=" margin: 0;  text-align:right ;width: 150px;"> $' +choice.choice_cost+ '</p> ' +
                    '<img  id ='+choice.id+' style="height:150px; width:150px; padding: 0 10px;background: #fff; margin: 0;" ' +
                    'src =' + choice.image + '>' +
                    '<a class ="selectItem" style="background: #fff ; margin :0;' +
                    'display: block;width: 150px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                    '' + choice.choice_name + '</a>' +
                    "</div>";
                $('.modifiers').append(col);
            });
            $('.modifiers').addClass('choices').removeClass('modifiers');
            $("#subMenuItems").css('display' ,'none');
        });

        finalCart.cartItems.push(cartArrayItem);
        sessionStorage.setItem("finalCart",JSON.stringify(finalCart));
        let count =1;
        $('.footer1').css('display' ,'none');
        if(selectedCartItemPrice =='$0.00')
        {
            selectedCartItemPrice ='Free';
        }
        let button = "<div class='footer2 row' style='width: 100%;bottom: 0;position: fixed;margin: 0;z-index: 2000;background: rgb(221, 221, 221);height: auto;'>" +
            "<div class ='orderButton ' style='position: relative;bottom: 0;'>" +
            "<div class=' row col s1 m3' style='background: rgb(221, 221, 221);margin:0; padding: 0;padding-top: 5px;'>" +
            "<button  id ='increaseCount' class='col' onclick='decreaseItemCount(this)' style='display: inline;height: 35px; '><i class='material-icons'>remove</i></button>" +
            "<p id = 'itemCount' class='col' style='margin: 0;padding: 0;display: table-row; background: rgb(221, 221, 221);padding-top: 5px;'>" + cartArrayItem.count + "</p>" +
            "<button id = 'decreaseCount' class='col' onclick='increaseItemCount(this)' style='display: inline;height: 35px;'><i class='material-icons'>add</i></button>" +
            "</div>" +
            "<button id ='checkoutButton' class=' row col s11 m9' style='background: #C53131;margin:0;height: 50px;' onclick='mainmenunavigation()'>" +
            "<p  style='padding: 0;margin:0; display: inline-block;' class ='checkoutButtonText'>" + 'ADD TO CART' + "</p>" +selectedCartItemPrice + "</button>" +
            "</div>" + "</div>";
        //$('#itemModifierImage').append(button);
        $('.checkout-container').append(button);

    }
}
function getRandomNumber() {
    let randomNumber = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
    console.log("Random NUmber :",randomNumber);
    return randomNumber;
}
function customizeItems(item) {
    let selectedCartItem=$(item);
    let selectedCartItemPrice = $(selectedCartItem).find('p').text();
    let selectedCartItemName = $(selectedCartItem).find('a').text();
    let selectedCartItemId=  $(selectedCartItem).find('img').attr('id');
    let selectedCartItemImgURL = $(item).find('img').attr('src');
    if(selectedCartItemPrice =='Free')
    {
        selectedCartItemPrice ='$0.00';
    }
    let selectedCartItemDetail= JSON.parse(sessionStorage.getItem(selectedCartItemId));
    if(selectedCartItemDetail.modifiers == null) {
        let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
        if(finalCart.cartItems.length ===0){
            finalCart.cartItems.push({id:selectedCartItemId, count:1 ,itemName: selectedCartItemName,price:selectedCartItemPrice ,
                totalItemcost:selectedCartItemPrice,imageURL:selectedCartItemImgURL,modifiers:[]});
            sessionStorage.setItem("finalCart" ,JSON.stringify(finalCart));
        } else {
            if(finalCart.cartItems.some(cartItemElement =>cartItemElement.id === selectedCartItemId)){
                finalCart.cartItems.forEach(cartItemElement => {
                    if (cartItemElement.id === selectedCartItemId) {
                        cartItemElement.count = parseInt(cartItemElement.count) + 1;
                    }
                });
            }else{
                let cartArrayItem = {id: selectedCartItemId,count: 1,itemName: selectedCartItemName,
                    price: selectedCartItemPrice,totalItemcost: selectedCartItemPrice,imageURL: selectedCartItemImgURL,modifiers: []
                };
                finalCart.cartItems.push(cartArrayItem);
            }
            sessionStorage.setItem("finalCart" ,JSON.stringify(finalCart));

        }
        getPrice();
        $('.footer1').css('display' ,'block');
        $('.checkoutbutton').empty();
        finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
        finalCart.cartItems.forEach(cartItemElement => {
            if(cartItemElement.totalItemcost =='$0.00')
            {
                selectedCartItemPrice ='Free';
            }
            let col = "<div class ='column zoom ' style='display: inline-block;background: #fff;margin-right: 20px;float: left;'>" +
                "<button id =" + cartItemElement.id + " onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px;'>" +
                "<i  class='material-icons' style='font-size: 10px;'>close</i></button>" +
                '<p style=" margin: 0;width: 150px;"> ' +cartItemElement.totalItemcost+ '</p> ' +
                '<img  id =' + selectedCartItemId + ' style="height:70px; width:70px; padding: 0 10px;background: #fff; margin: 0; float: right" src =' + cartItemElement.imageURL + '>' +
                '<a class ="selectItem" style="background: #fff ; margin :0;' +
                'display: block;width: 180px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                '' + cartItemElement.itemName + '</a>' +
                "<p class='quantity'>" + 'Quantity - ' + cartItemElement.count + "</p>" +
                "</div>";
            $('.checkoutbutton').append(col);

        });
        $('#checkoutButton').html('checkout');
    }
    else {
        $('#modalPopup').css('display' ,'block');
        $('#row').css('display' ,'none');
        $('.footer1').css('display' ,'none');
        //let selectedCartItemDetail= JSON.parse(sessionStorage.getItem(selectedCartItemId));
        $("#subMenuItems").css('display' ,'none');
        let itemDescription =selectedCartItemDetail.description;
        let PriceFromDisplay = currency(selectedCartItemPrice, { formatWithSymbol: true }).format();
        /* let description = "<div style='inline-flex;' class= 'itemDescription'>"+"<p>"+'Price from'+"</p>"+
                            "<p>"+selectedCartItemPrice+ "</p>"+
                             "<p>"+selectedCartItemName+ "</p>"+
                             "<p>"+itemDescription+ "</p>"+"</div>";*/
        if(selectedCartItemPrice =='$0.00')
        {
            selectedCartItemPrice ='Free';
        }
        $('#itemModifierImage').empty();
        let description = "<div class='col s12 m7' >"+
            "<div class='card horizontal'>"+
            "<div class='card-stacked'>"+ "<div class='card-content'>"+
            "<p  class='red-text text-darken-2' >"+'Price from'+"<br> <strong class='red-text text-darken-2'>"+PriceFromDisplay+ "<strong></p>" +
            "<p class='red-text text-darken-2'>"+selectedCartItemName+"</p>" +
            "<p class='red-text text-darken-2'>"+itemDescription+"</p></div></div>" +
            "<div class='card-image'>"+
            "<button  id="+selectedCartItemId+" onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px'>" +
            "<i class='material-icons' style='font-size: 10px'>close</i></button>" +
            "<img  id ="+selectedCartItemId+" style='width: 200px;height: 200px' src="+selectedCartItemImgURL+">"+ "</div> </div>";
        $('#itemModifierImage').append(description);
        // $('#itemModifierImage').append($(item));
        let spicyLevel = (selectedCartItemDetail.spicy_levels  === undefined || selectedCartItemDetail.spicy_levels.length == 0) ? 0
            :selectedCartItemDetail.spicy_levels[0] ;
        let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        let cartArrayItem;
        if(finalCart.cartItems.some(cartItemElement =>cartItemElement.id === selectedCartItemId)) {
            finalCart.cartItems.forEach(cartItemElement => {
                if (cartItemElement.id === selectedCartItemId) {
                    cartArrayItem = {id:selectedCartItemId,secondaryId:getRandomNumber(),count:1 ,itemName: selectedCartItemName,price:selectedCartItemPrice ,
                        totalItemcost:selectedCartItemPrice,imageURL:selectedCartItemImgURL,spicyLevel:spicyLevel, modifiers:[]};
                }
            });
        }else{
            cartArrayItem = {id:selectedCartItemId,count:1 ,itemName: selectedCartItemName,price:selectedCartItemPrice ,
                totalItemcost:selectedCartItemPrice,imageURL:selectedCartItemImgURL,spicyLevel:spicyLevel, modifiers:[]};
        }

        selectedCartItemDetail.modifiers.forEach(modifierItem => {
            let modifier = {modifierID: modifierItem.id,modifierHeading:modifierItem.heading,numberOfOptions:modifierItem.number_of_options,choices:[]};
            cartArrayItem.modifiers.push(modifier);
            let div = "<div id ="+modifierItem.id+" class ='modifiers' allowedchoices = "+modifierItem.number_of_options+" " +
                "style='width: 100%;'>" +
                ' <p style="font-size: 30px;font-weight: 700;color: crimson;color: #D32F2F !important;">' + modifierItem.heading + '</p>' +
                "</div>";
            $('#itemModifierImage').append(div);
            let timeoutCount =0;
            modifierItem.choices.forEach(choice => {
                timeoutCount=timeoutCount+500;
                let choice_cost = currency(choice.choice_cost, { formatWithSymbol: true }).format();
                if(choice_cost =='$0.00')
                {
                    choice_cost ='Free';
                }
                let col = "<div class ='column zoom ' style='display: inline-block; margin-right: 20px;opacity: 0.2;' onclick='addToCart(this)'>" +
                    '<p>'+'<strong class="red-text text-darken-2" style=" margin: 0; text-align:right ;width: 200px;">' +choice_cost+ '</strong> ' +'</p>'+
                    '<img  id ='+ choice.id +' style="height:200px; width:200px; padding: 0 10px;background: #fff; margin: 0;" src ='+ choice.image + '>' +
                    '<a class ="selectItem" style="background: #fff ; margin :0; display: block;width: 200px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">'+choice.choice_name+ '</a>' +
                    "</div>";
                $('.modifiers').append(col);
                let id =choice.id;
                let temp =$('#'+id).parent();
                //console.log($(+dataData.id));
                console.log(temp);

                $(temp).animate({
                    opacity: 1
                }, timeoutCount,'swing');
                if(choice_cost =='Free')
                {
                    choice_cost ='$0.00';
                }
            });
            $('.modifiers').addClass('choices').removeClass('modifiers');
        });

        finalCart.cartItems.push(cartArrayItem);
        sessionStorage.setItem("finalCart",JSON.stringify(finalCart));
        if(selectedCartItemPrice =='$0.00')
        {
            selectedCartItemPrice ='Free';
        }

        let button = "<div class='footer2 row' style='width: 100%;bottom: 0;position: fixed;margin: 0;z-index: 2000;background: rgb(221, 221, 221);height: auto;'>" +
            "<div class ='orderButton ' style='position: relative;bottom: 0;'>" +
            "<div class=' row col s1 m3' style='background: rgb(221, 221, 221);margin:0; padding: 0;padding-top: 5px;'>" +
            "<button  id ='increaseCount' class='col' onclick='decreaseItemCount(this)' style='display: inline;height: 35px; '><i class='material-icons'>remove</i></button>" +
            "<p id = 'itemCount' class='col' style='margin: 0;padding: 0;display: table-row; background: rgb(221, 221, 221);padding-top: 5px;'>" + cartArrayItem.count + "</p>" +
            "<button id = 'decreaseCount' class='col' onclick='increaseItemCount(this)' style='display: inline;height: 35px;'><i class='material-icons'>add</i></button>" +
            "</div>" +
            "<button id ='checkoutButton' class=' row col s11 m9' style='background: #C53131;margin:0;height: 50px;' onclick='mainmenunavigation()'>" +
            "<p  style='padding: 0;margin:0; display: inline-block;' class ='checkoutButtonText'>" + 'ADD TO CART' + "</p>" +selectedCartItemPrice + "</button>" +
            "</div>" + "</div>";
        //$('#itemModifierImage').append(button);
        $('.checkout-container').append(button);
    }
}
function addToCart(item) {
    let allowedchoices =$(item).parent().attr('allowedchoices');
    let modifierId =$(item).parent().attr('id');
    let selectedCartItemId =$('.card-image').find('img').attr('id');
    let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
    let itemPrice = $(item).find('p').text();
    let itemID = $(item).find('img').attr('id');
    let itemImageURL = $(item).find('img').attr('src');
    let itemName = $(item).find('a').text();
    let quantityCount = $('#itemCount').text();
    if($(item).hasClass("selected") ===true){
        $(item).removeClass('selected');
        allowedchoices =allowedchoices+1;
        $(item).parent().attr('allowedchoices', allowedchoices);
        finalCart.cartItems.forEach(cartItemElement => {
            if(cartItemElement.id == selectedCartItemId){
                let cartItemListChoices = cartItemElement.choices;
                cartItemElement.choices.forEach(choices => {
                    if(itemID == choices.id){
                        cartItemElement.choices.splice(cartItemElement.choices.indexOf(choices),1);
                    }
                });


            }
        });
    }else {
        //  let noChoices = finalCart.cartItems.choices.length;

        $(item).addClass('selected');
        /* if(allowedchoices ==0) {
            for(let i =0;i<finalCart.cartItems.length;i++) {
                if (finalCart.cartItems[i].id === selectedCartItemId) {
                    // let choice ={id:itemID,price:itemPrice ,name:itemName,imageURL:itemImageURL }
                    console.log($(finalCart.cartItems[i].choices));
                    let choice_id= $(finalCart.cartItems[i].choices) ;
                    //console.log("S" ,s);
                    //console.log(" s id" , s.id);
                   // console.log(s[0].id);
                    //console.log($(finalCart.cartItems[i].choices[0].id).parent());
                    let items = $('.selected');
                    $.each(items ,function(i ,value){
                        if($(value).find('img').attr('id') == choice_id[0].id){
                            $(value).removeClass('selected');

                        }

                    });

                    finalCart.cartItems[i].choices.splice(0 ,1);

                }
            }
            finalCart.cartItems.forEach(cartItemElement => {
                if (cartItemElement.id == selectedCartItemId) {
                    let choice = {id: itemID, price: itemPrice, name: itemName, imageURL: itemImageURL}
                    cartItemElement.choices.push(choice);
                }
            });
        }*/

        finalCart.cartItems.forEach(cartItemElement => {
            if (cartItemElement.id == selectedCartItemId) {
                cartItemElement.modifiers.forEach(modifier =>{
                    if(modifierId == modifier.modifierID){
                        if(!( modifier.numberOfOptions >modifier.choices.length)){
                            var items =$('.selected');
                            var id = modifier.choices[0].id;
                            $.each(items ,function(i ,value){
                                if($(value).find('img').attr('id') == id){
                                    $(value).removeClass('selected');
                                }
                            });
                            modifier.choices.splice(0,1);
                        }
                        let choice = {id: itemID, price: itemPrice, name: itemName, imageURL: itemImageURL}
                        modifier.choices.push(choice);
                    }
                });
            }
        });
    }
    sessionStorage.setItem("finalCart",JSON.stringify(finalCart));
    $('#checkoutButton').html('ADD TO CART '+ getPrice());
    $(item.active).css('outline-color' , 'red');
}
function getPrice(){
    let priceOnButton=0;
    let addCartButtonPrice=0;
    let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
    //Looping CartItems from FinalCart
    finalCart.cartItems.forEach(cartItemElement => {
        priceOnButton= currency(priceOnButton).add(cartItemElement.price).value;
        let totalItemcost= currency(cartItemElement.price).value;
        //Looping Choices from CartItem
        cartItemElement.modifiers.forEach(modifier => {
            modifier.choices.forEach(choices => {
                priceOnButton= currency(priceOnButton).add(choices.price).value;
                totalItemcost = currency(totalItemcost).add(choices.price).value;
            });
        });
        // cartItemElement.choices.forEach(choices => {
        //     priceOnButton= currency(priceOnButton).add(choices.price).value;
        //     totalItemcost = currency(totalItemcost).add(choices.price).value;
        // });
        priceOnButton = currency(priceOnButton, { precision: 2 }).multiply(cartItemElement.count).value;
        cartItemElement.totalItemcost = currency(currency(totalItemcost, { precision: 2 })
            .multiply(cartItemElement.count).value, { formatWithSymbol: true }).format();
        addCartButtonPrice = cartItemElement.totalItemcost;
    });
    finalCart.cartTotalPrice = currency(priceOnButton, { formatWithSymbol: true }).format();
    sessionStorage.setItem("finalCart" ,JSON.stringify( finalCart));
    return addCartButtonPrice ;
}
function increaseItemCount() {
    let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
    let id =$('.card-image').find('img').attr('id');
    let cartItemCount =$('#itemCount').text();
    cartItemCount =parseInt(cartItemCount);
    cartItemCount =cartItemCount+1;
    // let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
    $.each(finalCart.cartItems, function( index, value ) {
        if(value.id===id){
            value.count =cartItemCount;
        }
    });
    sessionStorage.setItem("finalCart" ,JSON.stringify( finalCart));
    let itemPrice =getPrice();
    $('#checkoutButton').html('ADD TO CART'+currency(itemPrice, { formatWithSymbol: true }).format());
    $('#itemCount').html(cartItemCount);

}
function decreaseItemCount() {
    let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
    let id =$('.card-image').find('img').attr('id');
    let cartItemCount =$('#itemCount').text();
    cartItemCount =parseInt(cartItemCount);
    cartItemCount =cartItemCount-1;
    $.each(finalCart.cartItems, function( index, value ) {
        if(value.id===id){
            value.count =cartItemCount;
        }
    });
    sessionStorage.setItem("finalCart" ,JSON.stringify( finalCart));
    let itemPrice =getPrice();
    if(cartItemCount === 0)
    {
        $('#checkoutButton').html('ADD TO CART $0');
        $("#subMenuItems").css('display' ,'flex');
        // $("#row").css('margin-top' ,'100px');
        $("#subMenuItems").empty();
        $('.mainMenuItems').css('opacity' ,'1');
        $("#subMenuItems"). find('.column').css('opacity' ,'1');
        $('#modalPopup').css('display' ,'none');
        $("#row").css('display' ,'flex');
        $("#row").css('flex-wrap' ,'wrap');
        $(".header").find('h1').css('display' ,'block');
        $('#checkout-inner').html($('#row'));
        //  $('.checkout-container').append($('.footer1'));
        $('#checkoutButton').html('ADD TO CART' + currency(cartItemCount, {formatWithSymbol: true}).format());
        $('#itemCount').html(cartItemCount);
        let finalCart = {cartTotalPrice: 0 , cartItems: []};
        sessionStorage.setItem("finalCart",JSON.stringify(finalCart));
        $('.footer2').css('display' ,'none');
    }
    else {
        $('#checkoutButton').html('ADD TO CART' + currency(itemPrice, {formatWithSymbol: true}).format());
        $('#itemCount').html(cartItemCount);
    }
}
function mainmenunavigation() {
    let choice ='true';
    let finalCart =  JSON.parse(sessionStorage.getItem("finalCart"));
    finalCart.cartItems.forEach(cartitem => {
        cartitem.modifiers.forEach(modifierItem => {
            if(modifierItem.numberOfOptions ===1 && modifierItem.choices.length !=1){
                choice ='false';
            }
        });
    });
    if(choice === 'false'){
        $('#popup').removeClass('hidden');
        $('#popup').addClass('show');
        $('#modalPopup').css('position' ,'relative');
        $('body').css('overflow-y' , 'hidden');
    }
    else{
        $('.mainMenuItems').css('opacity' ,'1');
        $('#modalPopup').css('display' ,'none');
        $("#row").css('display' ,'flex');
        //$("#row").css('padding-top' ,'105px');
        $("#row").css('flex-wrap' ,'wrap');
        $('#checkout-inner').html($('#row'));
        if(finalCart.cartItems.length ===0) {
            $('.checkout-container').find('.addToCartBtn').remove();
        }
        else{
            let itemPrice =$('#itemModifierImage').find('.categoryItem p').text();
            let imgsrc = $('#itemModifierImage').find('.categoryItem img').attr('src');
            let itemName =$('#itemModifierImage').find('.categoryItem a').text();
            $('#itemModifierImage').find('.categoryItem').css('display' , 'inline-block');
            //$('.footer1').remove();
          $('.footer2').remove();
            $('.footer1').css('display' ,'block');
            $('.footer1 .checkoutbutton').empty();

            finalCart.cartItems.forEach(cartitem => {
                if(cartitem.totalItemcost =='$0.00')
                {
                    selectedCartItemPrice ='Free';
                }
                let col;
                if(cartitem.secondaryId ==undefined){
                    col = "<div class ='column zoom ' style='display: inline-block;background: #fff; margin-right: 20px; float: left;'>" +
                        "<button id = " + cartitem.id + "   onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px;'>" +
                        "<i  class='material-icons' style='font-size: 10px;'>close</i></button>" +
                        '<p style=" margin: 0;width: 150px;"> ' + cartitem.totalItemcost + '</p> ' +
                        '<img  style="height:70px; width:70px; padding: 0 10px;background: #fff; margin: 0; float: right" src =' + cartitem.imageURL + '>' +
                        '<a class ="selectItem" style="background: #fff ; margin :0;' +
                        'display: block;width: 180px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                        '' + cartitem.itemName + '</a>' +
                        "<p>" + 'Quantity - ' + cartitem.count + "</p>" +
                        "</div>";
                }
                else {
                    col = "<div class ='column zoom ' style='display: inline-block;background: #fff; margin-right: 20px; float: left;'>" +
                        "<button id = " + cartitem.id + " secondaryId =" + cartitem.secondaryId + "  onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px;'>" +
                        "<i  class='material-icons' style='font-size: 10px;'>close</i></button>" +
                        '<p style=" margin: 0;width: 150px;"> ' + cartitem.totalItemcost + '</p> ' +
                        '<img  style="height:70px; width:70px; padding: 0 10px;background: #fff; margin: 0; float: right" src =' + cartitem.imageURL + '>' +
                        '<a class ="selectItem" style="background: #fff ; margin :0;' +
                        'display: block;width: 180px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                        '' + cartitem.itemName + '</a>' +
                        "<p>" + 'Quantity - ' + cartitem.count + "</p>" +
                        "</div>";
                }
                $('.checkoutbutton').append(col);
            });
        }
    }
};

function removeItem(item) {
    if(item !=undefined) {
        let removedItem = $(item).parent();
        if ($('.row .column').hasClass('selected-item')) {
            $('.row .column').removeClass('selected-item');
        } else {
            $(removedItem).addClass('selected-item');
        }
        $('#window').removeClass('hidden');
        $('#window').addClass('show');
        $('#subMenuItems').css('z-index' ,'1000');
        $('#subMenuItems').css('pointer-events' ,'none');
        $('#subMenuItems').css('position' ,'fixed');

    }
}

function removeItemConfirm(){
    let secondaryId;
    let selectedItemId = $('.selected-item').find('button').attr('id');
    if(null === $('.selected-item').find('button').attr('secondaryId')){

    }
    else{
        secondaryId= $('.selected-item').find('button').attr('secondaryId');
    }
    // let removedItem = $(item).parent();
    $('#row').css('display' , 'flex' );
    $('#subMenuItems').css('display' , 'flex');
    $("#subMenuItems").css('margin-top' ,'150px');
    $('#modalPopup').css('display' ,'none');
    let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
    for (let i = 0; i < finalCart.cartItems.length; i++) {
        if (finalCart.cartItems[i].id === selectedItemId && null ==secondaryId ) {
            finalCart.cartItems.splice(i, 1);
            console.log('removed items array', finalCart.cartItems);

        }
        else if(finalCart.cartItems[i].id === selectedItemId &&finalCart.cartItems[i].secondaryId ===secondaryId){
            finalCart.cartItems.splice(i, 1);

        }
        else if(finalCart.cartItems[i].id === selectedItemId &&finalCart.cartItems[i].secondaryId ===secondaryId) {


        }
    }
    $('.selected-item').remove();
    let items = $('.footer1 .checkoutbutton').find('.column');
    sessionStorage.setItem("finalCart", JSON.stringify(finalCart));
    finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
    console.log("Final Cart Cart Items after storage", finalCart);

    if (finalCart.cartItems.length === 0) {
        $('.footer1').css('display' ,'none');

    }
    getPrice();
    $('#window').addClass('hidden');
    $('#window').removeClass('show');
    $('#subMenuItems').css('z-index' ,'0');
    $('#subMenuItems').css('pointer-events' ,'all');
    $('#subMenuItems').css('position' ,'static');

}
function exitpopup(){
    $('#popup').removeClass('show');
    $('#popup').addClass('hidden');
    $('#modalPopup').css('position' ,'relative');
    $('body').css('overflow-y' , 'scroll');

}
function animate(item ,timeoutCount) {
    let selectedItem =$(item);
    let timeoutcount = timeoutCount;
    $(selectedItem).animate({
        opacity: 1,
        flex: '50%',
        width:'50%',
        height:'250px',
        width:'250px'
    }, timeoutcount,'swing');
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