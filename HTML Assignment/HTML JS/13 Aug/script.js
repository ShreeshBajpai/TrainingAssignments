 function isMore() {  
   var items = [1, 29, 47];  
   var javaTpoint = [];  
   items.forEach(function(item){  
       javaTpoint.push(item*2);  
   })
  
   document.write(javaTpoint);

// expected output: arr[Output:2,58,94]  
}
document.write("Array Implementation, forEach Function :- ");
isMore();


function showData(name, amt) {
alert(' Hello ' + name + '\n Your entered amount is ' + amt);
}

function getData(callback) {
var name = prompt(" Welcome to the javaTpoint.com \n What is your name?");
var amt = prompt(" Enter some amount...");
callback(name, amt);
}
getData(showData);



function JavaTpoint(value)  
{  
return value >12;  
}  
 // Input array  
var arr = [1,2,3,4,5,6,7,8,9,12,11,14];  
var result = arr.find(JavaTpoint);  
document.write(" <br> Find function in JS:- "+result)   
// expected output: arr[Output:14] 

function Java() {
// JavaScript to illustrate join() method  
  var JavaTpoint = ['core java','C', "JS", "CSS"];  
 
  document.write("<br> Joins the elements of the array <br>");  
  document.write(JavaTpoint.join());  
  document.write("<br>");  
     
  //elements are seperated by dot (.).  
  document.write("elements are seperated by dot (.) :- ");  
  document.write(JavaTpoint.join('.'));  
  document.write("<br>");  
    
  //elements are seperated by hyphen (-).  
  document.write("elements are seperated by hyphen (-) :- ");  
  document.write(JavaTpoint.join('-'));  
  // expected output: arr[core javaC  
  //core java.C  
  //core java-C] 
}
Java();




function map(){
    var JavaTpoint = ['JavaTpoint','C','C++','RDBMS'];  
//Determine the length of each name and save it in an array  
var nameLengths =JavaTpoint.map(function(value, index, array)  
{  
var len =value.length;  
return len;  
});  
document.write("<br> Array using map() method the output is :- " );  
console.log(nameLengths);  
document.write(nameLengths);  
document.write("<br>")  
document.write("Actual array still remain the same :- ");  
document.write(JavaTpoint);  
// expected output: arr[Output:10,1,3,5]  
}
map();

function keys(){
    // JavaScript to illustrate keys() method  
// Creating some typedArrays  
  var A = new Uint8Array([1, 2, 3, 4, 5]);  
  var B = new Uint8Array([5, 10, 15, 20]);  
   
  
   a = A.keys()  
   document.write("<br>"+a.next().value +"<br>");  
      
   b = B.keys()  
   b.next();  
   document.write(b.next().value +"<br>");  
   // expected output: arr[Output:0 1]  
}
keys();

function reduce(){
    // JavaScript to illustrate reduce() method  
let JavaTpoint =[10,20,30];  
// find the sum of all the elements   
let sum=JavaTpoint.reduce(function(passedIn, item)  
{  
return passedIn + item;  
// 5 is intial value   
},5);   
document.write('Array sum is ',sum,'\n');  
// expected output: JavaTpoint [Output: 65]  
}
reduce();