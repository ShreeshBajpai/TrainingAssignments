function bitcoin(){
    var price = prompt("Enter the amount");
    var bit_price = 300000;
    var number = bit_price % price;
    document.getElementById("btn1").innerHTML="Total amount ="+number;
   
}

function tether(){
    var price = prompt("Enter the amount");
    var bit_price = 600;
    var number = bit_price % price;
    document.getElementById("btn2").innerHTML="Total amount ="+number;
   
}

function ethereum(){
    var price = prompt("Enter the amount");
    var bit_price = 306700;
    var number = bit_price % price;
    document.getElementById("btn3").innerHTML="Total amount ="+number;
}
