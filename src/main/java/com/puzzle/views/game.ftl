<!doctype html>
<html lang="en">
   <head>
      <title>SLOnline</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
       
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>
 body {
         padding-top: 70px;
         }

#solve_div{display:none;}
          canvas {
  background-color: white;

}
         .bd-placeholder-img {
         font-size: 1.125rem;
         text-anchor: middle;
         -webkit-user-select: none;
         -moz-user-select: none;
         -ms-user-select: none;
         user-select: none;
         }
         @media (min-width: 768px) {
         .bd-placeholder-img-lg {
         font-size: 3.5rem;
         }
         }
</style>     
   </head>
    <body>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
         <a class="navbar-brand" href="#">SLOnline</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
               <li class="nav-item active">
                  <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="/sl/game">Solve</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="/sl/game">Design</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="/sl/game">Rules & Techniques</a>
               </li>
            </ul>
         </div>
      </nav>
        
      <main role="main">
         <div class="container">
            <div class ="row">
                <div  id=dim_div>
               <div class = "col-sm-12">
                  <p>Enter a puzzle dimension <a class="btn btn-secondary" onclick="draw()"; role="button">Go&raquo;</a></p>
                   
                   
               </div>
                <div class="col-xs-2s">
                  <input type="text" class="form-control mb-2 mx-2 " id="dim_input">
               </div>
                </div>
                <div class = "col-sm-12" id="solve_div">
                    <p><a onclick="show_dim()" href="">Enter new dimension</a></p>
                  <p>Enter your puzzle on the grid then click solve <a class="btn btn-secondary" onclick="solve()"; role="button">Solve&raquo;</a></p>
                   
               </div>
               
            </div>
            <div class="row">
               <div class ="col-sm-12 ">
                  <canvas id="gameboard">
                     <p>Canvas not supported on your browser</p>
                  </canvas>
               </div>
            </div>
             
            <hr>
         </div>
      </main>
     <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
//Constants
var SPACE = 50;
var PAD = 50;
var POINT_RAD = 5;


//Attributes
var size;
var N=0;
var points=[];
var countsquares=[];
var countvals=[];

//Functions
//function to show dimension div
function show_dim(){
   document.getElementById('dim_div').style.display="block";
      document.getElementById('solve_div').style.display="none";
}
//function draw and hold point data
function point(x,y,rad,sa,ea,clock,ctx){
    this.x=x;
    this.y=y;
    this.rad=rad;
    this.sa=sa;
    this.ea=ea;
    this.ctx=ctx;
    this.draw=function(){
        ctx.beginPath();
        ctx.arc(this.x,this.y,this.rad,this.sa,this.ea,this.clock);
        ctx.closePath();
        ctx.fill();
    }
    
}
//function to define a square between points on the board
function countNumSquare(x1,y1,x2,y2,canvas,val,ctx,i,j){
    this.x1=x1;
    this.x2=x2;
    this.y1=y1;
    this.y2=y2;
    this.val=val;
    this.ctx=ctx;
    let squareVal=-1;
    this.i=i;
    this.j=j;
   
        //add an event listener to listen in defined space 
        window.addEventListener('click',function(e){
            var rect=canvas.getBoundingClientRect();
            var xCoord = e.x-rect.left;
            var yCoord = e.y -rect.top;
           if(xCoord>x1 &&xCoord<x2 &&yCoord>y1 &&yCoord<y2){
               if(squareVal<4){
                   ctx.clearRect(x1+10,y1+10,40,30);
                   squareVal=squareVal+1;
                   ctx.fillText(squareVal, ((x1+x2)/2), ((y1+y2)/2)); 
                   countvals[j][i]=squareVal;
                   console.log(i);
                   console.log(j);
                   console.log(countvals);
               }
               if(squareVal==4){
                    ctx.clearRect(x1+10,y1+10,40,30);
                   squareVal=-1;
                   ctx.fillText(" ", ((x1+x2)/2), ((y1+y2)/2)); 
                    countvals[i][j]=squareVal;
                     console.log(countvals);
               }
               console.log(xCoord+" "+yCoord+" "+val); 
           } 
        });

    
}
//function to draw the board
function draw(){
    //hide the dimension selector
    document.getElementById('dim_div').style.display="none";
      document.getElementById('solve_div').style.display="block";
    //create the canvas
    N=document.getElementById('dim_input').value;
    var canvas = document.getElementById('gameboard');
    size = 80*N;
    canvas.width = size;
    canvas.height = size;
    
    if(canvas.getContext){
        var ctx = canvas.getContext('2d');
         points=[];
        ctx.clearRect(0,0,canvas.width,canvas.height);
        ctx.font = "20px Arial";
        
        //create the gameboard
        for(var i =0;i<N;i++){
            var boardRow=[];
            for(var j = 0;j<N;j++){   
                var curPoint = new point((i*SPACE)+PAD, (j*SPACE)+PAD, 5, 0, Math.PI*2, false,ctx)
                boardRow.push(curPoint);
                curPoint.draw();
            }
            points.push(boardRow);
        }
        console.log("Points Array");
        console.log(points);
        //create the count squares
        for(var i=0;i<(N-1);i++){
            var countRow=[];
            var valRow=[];
            for(var j=0;j<(N-1);j++){   
                var squarestring="square "+i+j;
            var curSquare=new countNumSquare(points[i][j].x,points[i][j].y,points[i+1][j].x,points[i][j+1].y,canvas,squarestring,ctx,i,j);
                
            console.log(curSquare);
                countRow.push(curSquare);
                valRow.push(-1);
                  }
            countsquares.push(countRow);
            countvals.push(valRow);
        }
     
        console.log(countsquares);
        console.log(countvals);
        
        
        
    }
    
    
    
}

//Function to solve
function solve(){

var countArrayString="";
for(var i = 0; i<N-1;i++){
 for(var j = 0;j<N-1;j++){
 countArrayString+= countvals[i][j]+" ";
 console.log(countvals[i][j]);
 
 }

}
console.log(countArrayString); 


				var xhr = createCORSRequest('GET', "http://localhost:8080/sl/solve/?puzzledim="+N+"&countvals="+countArrayString); // Request type and URL
				
				if (!xhr) {
  					alert("CORS not supported");
				}

				// CORS requests are Asynchronous, i.e. we do not wait for a response, instead we define an action
				// to do when the response arrives 
				xhr.onload = function(e) {
 					var responseText = xhr.response; // the text of the response
					console.log(responseText); // lets produce an alert
				};
				
				// We have done everything we need to prepare the CORS request, so send it
				xhr.send();
}
		function createCORSRequest(method, url) {
			    var xhr = new XMLHttpRequest();
			    if ("withCredentials" in xhr) {

			        // Check if the XMLHttpRequest object has a "withCredentials" property.
			        // "withCredentials" only exists on XMLHTTPRequest2 objects.
			        xhr.open(method, url, true);

			    } else if (typeof XDomainRequest != "undefined") {

			        // Otherwise, check if XDomainRequest.
			        // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
			        xhr = new XDomainRequest();
			        xhr.open(method, url);
			    } else {

			        // Otherwise, CORS is not supported by the browser.
			        xhr = null;

			    }
			    return xhr;
			}



</script>
   </body>
</html>