
$(document).ready(function (e) {
    homePageLoad();
    increaseItemCount();
    decreaseItemCount();
    removeItem();
});



    //let items = $('.footer1 .checkoutbutton').find('.column');
  //  console.log("items", items);
  //  console.log("items length", items.length);
    //if(selectedItemId ===  $('.checkoutbutton').find('.column img').attr('id')) {
    /*  for(let i =0;i<items.length;i++) {
          console.log("items " , items[i].find('img'));
          if(items[i].find('img').attr('id') ===selectedItemId ) {
              $(items[i]).remove();
          }
      }

    //}
    console.log("Final Cart Cart Items before storage", finalCart);
    sessionStorage.setItem("finalCart", JSON.stringify(finalCart));

    console.log("Final Cart Cart Items after storage", finalCart);

    if (finalCart.cartItems.length === 0) {
        $('.footer1').remove();

    }
    /*else {
        for (let i = 0; i < finalCart.cartItems.length; i++) {
            let col = "<div class ='column zoom ' style='display: inline-block;background: #fff; margin-right: 20px; float: left;'>" +
                "<button id = " + finalCart.cartItems[i].id + " onclick='removeItem(this)' style ='margin: 0;height: 15px;width: 15px;float: right; position: relative; padding: 1px 1px;'>" +
                "<i  class='material-icons' style='font-size: 10px;'>close</i></button>"   +
                '<p style=" margin: 0;width: 150px;"> ' + finalCart.cartItems[i].price + '</p> ' +
                '<img  style="height:70px; width:70px; padding: 0 10px;background: #fff; margin: 0; float: right" src =' + finalCart.cartItems[i].imageURL + '>' +
                '<a class ="selectItem" style="background: #fff ; margin :0;' +
                'display: block;width: 180px; text-align: center; color: #C53131;text-transform: uppercase;font-weight: 800;">' +
                '' + finalCart.cartItems[i].itemName + '</a>' +
                "</div>";
            $('.checkoutbutton').append(col);
        } */

    //}


function increaseItemCount(item) {
    let selectedItem =$(item).parent();
    let selectedItemId =$(selectedItem).find('.selectItem').attr('id');
    let itemCount =$(selectedItem).find('#itemCount').text();
    let cartItemCount =parseInt(itemCount);
    cartItemCount =cartItemCount+1;
    let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
    //let id =$('.card-image').find('img').attr('id');
    //let cartItemCount =$('#itemCount').text();
   // cartItemCount =parseInt(cartItemCount);
   // cartItemCount =cartItemCount+1;
    // let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
    $.each(finalCart.cartItems, function( index, value ) {
        if(value.id===selectedItemId){
            value.count =cartItemCount;
        }
    });
    sessionStorage.setItem("finalCart" ,JSON.stringify( finalCart));
    let itemPrice =getPrice();
    finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
    let totalItemcost= 0;
    $.each(finalCart.cartItems, function( index, value ) {
        if(value.id===selectedItemId){
            totalItemcost = value.totalItemcost ;
        }
    });
    $(selectedItem).find('#itemCount').text(cartItemCount);
    $(selectedItem).find('.cartItemPrice .price').text(currency(totalItemcost, { formatWithSymbol: true }).format());


}

function decreaseItemCount(item) {
    let removedItem =$(item);
    let selectedItem =$(item).parent();
    let selectedItemId =$(selectedItem).find('.selectItem').attr('id');
    let itemCount =$(selectedItem).find('#itemCount').text();
    let cartItemCount =parseInt(itemCount);
    cartItemCount = cartItemCount - 1;
    let finalCart= JSON.parse(sessionStorage.getItem("finalCart"));
    if(cartItemCount !=0) {

        $.each(finalCart.cartItems, function( index, value ) {
            if(value.id===selectedItemId){
                value.count =cartItemCount;
            }
        });
        sessionStorage.setItem("finalCart" ,JSON.stringify( finalCart));
        let itemPrice =getPrice();
        finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        let totalItemcost= 0;
        $.each(finalCart.cartItems, function( index, value ) {
            if(value.id===selectedItemId){
                totalItemcost = value.totalItemcost ;
            }
        });
        $(selectedItem).find('.cartItemPrice .price').text(currency(totalItemcost, { formatWithSymbol: true }).format());
        $(selectedItem).find('#itemCount').text(cartItemCount);
    }
    else{
        cartItemCount =0;
      let selectedItemBtn= $(selectedItem).find('.show');
        show(selectedItemBtn);
       /* $(selectedItem).remove();
        if(finalCart.cartItems.length ==0) {
            history.go(-1);
            history.go(-1);
        }
        else {
            $.each(finalCart.cartItems, function (index, value) {
                finalCart.cartItems = finalCart.cartItems.filter(cartItem => cartItem.id != selectedItemId);
                sessionStorage.setItem("finalCart", JSON.stringify(finalCart));
                getPrice();

            });
        }*/

    }

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
                console.log("totalItemcost" ,totalItemcost);
            });
        });

        priceOnButton = currency(priceOnButton, { precision: 2 }).multiply(cartItemElement.count).value;
        cartItemElement.totalItemcost = currency(currency(totalItemcost, { precision: 2 })
            .multiply(cartItemElement.count).value, { formatWithSymbol: true }).format();
        addCartButtonPrice = cartItemElement.totalItemcost;
    });
    finalCart.cartTotalPrice = currency(priceOnButton, { formatWithSymbol: true }).format();
    sessionStorage.setItem("finalCart" ,JSON.stringify( finalCart));
    console.log("addCartButtonPrice" ,addCartButtonPrice);
    return addCartButtonPrice

}

/*

function getCategoryList() {
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: "${home}template/catetory/list",
        dataType: 'json',
        timeout: 100000,
        success: function (data) {
            console.log("companySiteIdList: ", data);
            sessionStorage.setItem('categoryList', JSON.stringify(data));
            let companySiteIdList;
            for (let i = 0; i < data.data.size; i++) {
                companySiteIdList.push(data.data.list[0].site_code);
            }
            console.log("SUCCESS: ", companySiteIdList);

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
*/


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
function show(item) {
    let selectedItemId = $(item).attr('id');
    let removedItem = $(item).parent().parent();
    if($('.row').hasClass('selected-item')){
        $('.row').removeClass('selected-item');
    }
    else {
        $(removedItem).addClass('selected-item');
        $('#window').removeClass('hidden');
        $('#window').addClass('show');
    }


   // let selectedItemId=$('.selected').find('.column p').attr('id');

};

function exit() {
    $('#window').removeClass('show');
    $('#window').addClass('hidden');
    if($('.row').hasClass('selected-item')){
        $('.row').removeClass('selected-item');
    }

};
function removeItem() {
        let selectedItemId = $('.selected-item').find('.column p').attr('id');
        $('.selected-item').remove();
        let finalCart = JSON.parse(sessionStorage.getItem("finalCart"));
        finalCart.cartItems = finalCart.cartItems.filter(cartItem => cartItem.id != selectedItemId);
        sessionStorage.setItem("finalCart", JSON.stringify(finalCart));
        getPrice();
        $('#window').removeClass('show');
        $('#window').addClass('hidden');
        finalCart = JSON.parse(sessionStorage.getItem("finalCart"));


    if(finalCart.cartItems.length ==0) {
        history.go(-1);
        history.go(-1);
    }

}


