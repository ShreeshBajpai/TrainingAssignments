function bitcoin(){
    var price = prompt("Enter the amount");
    var bit_price = 30000;
    var number = bit_price / price;
    document.getElementById("btn1").innerHTML="Total amount ="+number;
   
}

function tether(){
    var price = prompt("Enter the amount");
    var tether_price = 600;
    var number = bit_price / price;
    document.getElementById("btn2").innerHTML="Total amount ="+number;
   
}

function ethereum(){
    var price = prompt("Enter the amount");
    var eth_price = 3500;
    var number = bit_price / price;
    document.getElementById("btn3").innerHTML="Total amount ="+number;
}
