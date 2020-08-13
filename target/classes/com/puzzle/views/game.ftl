<!doctype html>
<html lang="en">
   <head>
      <title>SLOnline</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
      <link rel="shortcut icon" href="#" />
       
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,800;1,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css2?family=Russo+One&family=Zilla+Slab+Highlight:wght@700&display=swap" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
      #choice-div{

      }

      #new-game-choice-div{
        display:none;
      }
    #seed_input{
    
    height: calc(0.5em + .75rem + 2px);
    border-radius:0;
    
    
    }
    #game-instructions{
         margin-left: -10px;
    }

    #seed-button{
 
      font-size: 12px;
      background-color:transparent;
    }
    #seed-text{
    font-size: 12px;
    margin-top:15px;
        padding-left: 10px;
    }
    #display-seed-div{
    font-weight:bold;
    margin-top:5px;
    }
 body {
         padding-top: 70px;
        font-family: 'Roboto', sans-serif;
        font-size: 16px;
        font-weight: 500;
        background-color: #fafafa;
         }
#gameboard {
      display:none;
         margin-top: 20px;
  background-color: white;
  -webkit-box-shadow: 3px 7px 3px 1px rgba(0,0,0,0.3);
-moz-box-shadow: 3px 7px 3px 1px rgba(0,0,0,0.3);
box-shadow: 3px 7px 3px 1px rgba(0,0,0,0.3);
 border:5px solid #333B38;
   style="z-index: 1;
   left:0px;
    top:0px;


}
#board-div{
 position:relative;
}
#solutionLayer{
 position:absolute;
      position: absolute;
    left: 20px;
    top: 5px;

      style="z-index: 2;
}


.form-check{
  margin-top: 10px;
     padding-left: 2.1rem;
}

#wrong-moves-button{
  font-size: 10px;
  background-color: transparent;
  display:none;
   margin-top: 10px;
}
      .bd-placeholder-img {
         font-size: 1.125rem;
         text-anchor: middle;
         -webkit-user-select: none;
         -moz-user-select: none;
         -ms-user-select: none;
         user-select: none;
         }
         .navbar-brand{
           font-family: 'Roboto', sans-serif;
          font-size:20px;
           
         }
         #dim_input{
    display: block;
    width: 40%;
    padding: .375rem .75rem;
    font-size: 1.1rem;
    font-weight: 600;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    border: 1.5px solid #ced4da;
    border-radius: 0.1rem;

         }
   
         #statsDisplay{
          margin-top: 20px;
          display:none;
         }
#puzzle-div{
  display:none;
}

         .diff-button{
              margin-right: .8rem;
              border-radius:0;
              font-size: 20px;
         }
         .puzzle-button{
          
               margin-right: .8rem;
               margin-top: .8rem;

              border-radius:0;
              font-size: 20px;
         }
         #puzzle-button-div{
     
         }

         #button-div{
              padding-left: 10px;
         }

         #help_button{
               color: black;
    background-color: #fafafa;
    border: 1px solid black;
    margin-left: -30px;
 
    margin-bottom: 5px;
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
         <a class="navbar-brand" href="#">SlitherLink Online</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
               <li class="nav-item active">
                  <a class="nav-link" href="/sl">Home <span class="sr-only"></span></a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="/sl/solve">Solve & Design</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="/sl/game">Play</a>
               </li>
             
            </ul>
         </div>
      </nav>
        
      <main role="main">
       <div class="container">
        <div class="row">
          <div class="col-sm-12">
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="help_button">
 <i class="fa fa-question-circle" aria-hidden="true"></i> How to play

</button>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">How to Play SlitherLink</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <ul>
          <li>
     Link the dots by clicking in the space between them.Try to form a single continous loop where the squares with clues are surrounded with the number of links equal to the value of the clue.
   </li>
    <li>
     If you want to mark a direction the loop cannot go click twice to display the x.
     </li>
   <li>
     If you want to remove a link you have placed, click twice to clear.
   </li>
   <li>
     To check if you have the correct solution click Check Solution. If you have made any wrong moves it will display them.
   </li>
   <li>
     To hide the wrong moves, click hide wrong moves
   </li>
     To show the answer click show answer. This will end the game.
   </ul>
    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</div>

          <div id="choice-div" class="row">
   <div class = "col-sm-12">
                  <p id="game-instructions">Enter a puzzle dimension from 5 to 10 and choose a puzzle difficulty.</p>
                   
               </div>
               <div class="col-xs-2s">
                  <input type="text" class="form-control mb-2 mx-2 " id="dim_input">
               </div>
               <div class = "col-sm-12"id="button-div">
                <a class="btn btn-secondary diff-button" onclick="loadPuzzle('easy')"; role="button">Easy</a>
                <a class="btn btn-secondary diff-button" onclick="loadPuzzle('medium')"; role="button">Medium</a>
            <a class="btn btn-secondary diff-button" onclick="loadPuzzle('difficult')"; role="button">Difficult</a>
               </div>
               <div class = "col-sm-12" id=seed-text>
                  <p>You can also enter a seed to retrieve a specific puzzle.</p>
                   
               </div>
                 <div class="col-xs-2s">
                  <input type="text" class="form-control mb-2 mx-2 " id="seed_input">
               </div>
               <div class = "col-sm-12"id="button-div">
                <a class="btn btn-secondary diff-button" onclick="loadSeed()"; role="button" id="seed-button">Retrieve Puzzle</a>

             </div>

          </div>
          <div class = "col-sm-12" id = "new-game-choice-div">  
           <a onclick="dispChoiceDiv()" href=""; ">Get new puzzle</a>
          </div>
        
             <div class = "row" id="puzzle-div">
              <div class = "col-sm-12"id="button-div">
                <a class="btn btn-secondary diff-button " id="wrong-moves-button" onclick=""; role="button">Hide Wrong Moves</a>
            
               </div>
               <div class ="col-sm-12 " id="board-div">
                  <canvas id="gameboard">
                     <p>Canvas not supported on your browser</p>
                  </canvas>
                   <canvas id="solutionLayer">
                     <p>Canvas not supported on your browser</p>
                  </canvas>

               </div>
               <div class="col-sm-12" id="display-seed-div">
                <p id="display-seed-text"></p>
               </div>
                <div class = "col-sm-12"id="puzzle-button-div">
                <a class="btn btn-secondary puzzle-button" onclick="showCorrect()"; role="button">Check Solution</a>
             <a class="btn btn-secondary puzzle-button" onclick="showAnswer()"; role="button">Show Answer</a>
               </div>

             </div>
            <hr>

         </div>
      </main>
     <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
//constants
var SPACE = 50;
var PAD = 50;
var POINT_RAD = 5;
//global variables
var N; //board size dimension
var size; //canvas size
var points = []; //points array
var pointsRot = [];
var flatPoints;
var edges = [] //edges array
var countsquares = []; //square num array
var activeEdges = [];
var solutionEdges = [];
var listeners = [];
var countArr;
var solutionArr;
var canvas;
var ctx;
var correctLayer;
var ctxCL;
var seed;

function point(x, y, rad, sa, ea, clock, ctx) {
    this.x = x;
    this.y = y;
    this.rad = rad;
    this.sa = sa;
    this.ea = ea;
    this.ctx = ctx;
    this.draw = function() {
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.rad, this.sa, this.ea, this.clock);
        ctx.closePath();
        ctx.fill();
    }

}




function edge(x1, y1, x2, y2, inSolution, canvas, ctx, vert, point1, point2,active,iterator) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.inSolution = inSolution;
    this.canvas = canvas;
    this.ctx = ctx;
    this.vert = vert;
    this.point1 = point1;
    this.point2 = point2;
    this.active=active;
    this.iterator=iterator;
    let activeStates = [true, false, false];
  let toggleActive= function a (){
      if (iterator == 2) {
                    iterator = -1;
                }

                if (iterator < 2) {
                    iterator++;
                }
      active=activeStates[iterator];
      console.log("ACTIVE IS "+active);
      console.log("iterator is "+iterator);
    };
    
  
    let listFunc = function(e) {
        var rect = canvas.getBoundingClientRect();
        var xCoord = e.x - rect.left;
        var yCoord = e.y - rect.top;

        if (vert == true) {
            if (yCoord > y1 + POINT_RAD && yCoord < y2 - POINT_RAD && Math.abs(xCoord - x1) < 10) {
              



                toggleActive();
                console.log("active " + active);
                console.log("iterator " + iterator);;
                if (active == true) {


                    console.log("active edges");
                    console.log(activeEdges);
                    activeEdges.push([point1, point2, x1, y1, x2, y2]);
                    ctx.beginPath();
                    ctx.lineWidth = 5;
                    ctx.moveTo(x1, y1);
                    ctx.lineTo(x2, y2);
                    ctx.stroke();




                }
                if (active == false) {
                    if (iterator == 1) {
                                              for (var i = 0; i < activeEdges.length; i++) {
  if (activeEdges[i][0] == point1&&activeEdges[i][1] ==point2 &&activeEdges[i][2] == x1&&activeEdges[i][3] == y1 &&activeEdges[i][4] == x2&&activeEdges[i][5] == y2) {
    activeEdges.splice(i, 1);
  }
}
                        console.log("active edges");
                        console.log(activeEdges);
                        ctx.clearRect(x1 - POINT_RAD, y1 + POINT_RAD, 8, 40);
                        ctx.font = "800 10px Arial";
                        ctx.fillText("X", (((x1 + x2) / 2) - 5), ((y1 + y2) / 2) + 5);
                    }
                    if (iterator == 2) {



                        console.log("active edges");

                        console.log(activeEdges);

                        ctx.clearRect(x1 - POINT_RAD, y1 + POINT_RAD, 8, 40);


                    }



                }
            }
        }
        if (vert == false) {

            if (xCoord > x1 + POINT_RAD && xCoord < x2 - POINT_RAD && Math.abs(yCoord - y1) < 10) {

              




                  toggleActive();
                console.log("active " + active);
                console.log("iterator " + iterator);
                console.log("");
                if (active == true) {
                    console.log("active edges");
                    console.log(activeEdges);
                    activeEdges.push([point1, point2, x1, y1, x2, y2]);
                    ctx.beginPath();
                    ctx.lineWidth = 5;
                    ctx.moveTo(x1, y1);
                    ctx.lineTo(x2, y2);
                    ctx.stroke();
                }


                if (active == false) {

                    if (iterator == 1) {
                    
                        for (var i = 0; i < activeEdges.length; i++) {
  if (activeEdges[i][0] == point1&&activeEdges[i][1] ==point2 &&activeEdges[i][2] == x1&&activeEdges[i][3] == y1 &&activeEdges[i][4] == x2&&activeEdges[i][5] == y2) {
    activeEdges.splice(i, 1);
  }
}
                        console.log("active edges");
                        console.log(activeEdges);
                        ctx.clearRect(x1 + POINT_RAD, y1 - POINT_RAD, 40, 8)
                        ctx.font = "800 10px Arial";
                        ctx.fillText("X", (((x1 + x2) / 2) - 5), ((y1 + y2) / 2) + 5);
                    }
                    if (iterator == 2) {
                        console.log("active edges");
                        console.log(activeEdges);
                        console.log("active edges");
                        console.log(activeEdges);
                        ctx.clearRect(x1 + POINT_RAD, y1 - POINT_RAD, 40, 10);
                    }
                }


            }
        }




    }

    listeners.push(listFunc);


    window.addEventListener('click', listFunc);



}
//make sure to input correct logic after show answer
function showAnswer() {
    //activeEdges=[]
    document.getElementById('puzzle-button-div').style.display = "none";

    ctxCL.clearRect(0, 0, size, size);
    for (var i = 0; i < edges.length; i++) {
        if (edges[i].vert == true) {
            ctx.clearRect(edges[i].x1 - POINT_RAD, edges[i].y1 + POINT_RAD, 8, 40);

        }
        if (edges[i].vert == false) {
            ctx.clearRect(edges[i].x1 + POINT_RAD, edges[i].y1 - POINT_RAD, 40, 8);
        }
    }

    for (var i = 0; i < N * N; i++) {

        ctx.beginPath();
        ctx.lineWidth = 5;
        ctx.moveTo(flatPoints[solutionArr[i][0]].x, flatPoints[solutionArr[i][0]].y);
        ctx.lineTo(flatPoints[solutionArr[i][1]].x, flatPoints[solutionArr[i][1]].y);
        ctx.stroke();


    }
    for (var i = 0; i < listeners.length; i++) {
        window.removeEventListener('click', listeners[i]);
    }


}

function dispChoiceDiv() {
    document.getElementById('choice-div').style.display = "inline-block";
    document.getElementById('new-game-choice-div').style.display = "none";
    document.getElementById('puzzle-div').style.display = "none";

}

function showCorrect() {
    console.log("function has begun");

    var wrongMove = false;
    var correct = false;
    correctLayer.width = size;
    correctLayer.height = size;

    //for all input edges check if correct.
    var match = 0;
    var numEdges = 0;
    for (var i = 0; i < solutionArr.length; i++) {
        if (solutionArr[i][0] != solutionArr[i][1]) {
            numEdges++;
        }
    }

    console.log("The number of edges is " + numEdges);
    for (var i = 0; i < activeEdges.length; i++) {
        console.log(activeEdges[i]);

        console.log(checkCorrect(activeEdges[i][0], activeEdges[i][1]));
        if (!checkCorrect(activeEdges[i][0], activeEdges[i][1])) {
            wrongMove = true;
            ctxCL.beginPath();
            ctxCL.lineWidth = 5;
            ctxCL.moveTo(activeEdges[i][2], activeEdges[i][3]);
            ctxCL.lineTo(activeEdges[i][4], activeEdges[i][5]);
            ctxCL.strokeStyle = "red";
            ctxCL.stroke();

        }
        //if correct highlight all in green 

        if (checkCorrect(activeEdges[i][0], activeEdges[i][1])) {
            match++;
            console.log("The number of matches is " + match);
        }


    }

    if (match == numEdges && activeEdges.length == numEdges) {

        console.log("The correct answer has been input");
        for (var i = 0; i < activeEdges.length; i++) {

            ctxCL.beginPath();
            ctxCL.lineWidth = 5;
            ctxCL.moveTo(activeEdges[i][2], activeEdges[i][3]);
            ctxCL.lineTo(activeEdges[i][4], activeEdges[i][5]);
            ctxCL.strokeStyle = "green";
            ctxCL.stroke();



        }
        document.getElementById('puzzle-button-div').style.display = "none";
        for (var i = 0; i < listeners.length; i++) {
            window.removeEventListener('click', listeners[i]);
        }



    }


    console.log("drawing correct layer");
    if (wrongMove) {
        document.getElementById('wrong-moves-button').style.display = "inline-block";
        document.getElementById('wrong-moves-button').onclick = function erase() {
            console.log("erase");
            ctxCL.clearRect(0, 0, size, size);
            document.getElementById('wrong-moves-button').style.display = "none";


        }

    }



}

function checkCorrect(a, b) {
    let correct = false;
    for (var i = 0; i < solutionArr.length; i++) {


        if ((solutionArr[i][0] == a && solutionArr[i][1] == b) || (solutionArr[i][0] == b && solutionArr[i][1] == a)) {
            console.log("Solution Arr i 0 is " + solutionArr[i][0]);
            console.log("Solution Arr i 1 is " + solutionArr[i][1]);
            correct = true;
        }

    }
    return correct;
}

function countNumSquare(x1, y1, x2, y2, val, ctx, squareVal) {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
    this.val = val;
    this.ctx = ctx;
    this.squareVal = squareVal;
    if (squareVal != -1) {
        ctx.fillText(squareVal, (((x1 + x2) / 2) - 5), ((y1 + y2) / 2) + 5);
    }

    if (squareVal == -1) {
        ctx.fillText(" ", (((x1 + x2) / 2) - 5), ((y1 + y2) / 2) + 5);
    }
};


function draw() {

    document.getElementById('choice-div').style.display = "none";
    document.getElementById('new-game-choice-div').style.display = "inline-block";


    for (var i = 0; i < listeners.length; i++) {
        window.removeEventListener('click', listeners[i]);
    }

    document.getElementById('display-seed-text').innerHTML = "SEED: " + seed;

    canvas = document.getElementById('gameboard');

    document.getElementById('gameboard').style.display = "block";
    document.getElementById('puzzle-div').style.display = "block";
    document.getElementById('puzzle-button-div').style.display = "block";
    correctLayer = document.getElementById('solutionLayer');
    ctxCL = correctLayer.getContext('2d');
    if (N > 7) {
        size = 55 * N;
    }
    if (N <= 7) {
        size = 60 * N;
    }

    canvas.width = size;
    canvas.height = size;
     
    if (canvas.getContext) {
        ctx = canvas.getContext('2d');

        points = [];
        pointsRot = [];
        edges = [];
        activeEdges = [];
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctxCL.clearRect(0, 0, canvas.width, canvas.height);
        ctx.font = "800 20px Arial";

        //create the gameboard
        for (var i = 0; i < N; i++) {
            var boardRow = [];
            for (var j = 0; j < N; j++) {
                var curPoint = new point((i * SPACE) + PAD, (j * SPACE) + PAD, 5, 0, Math.PI * 2, false, ctx)
                boardRow.push(curPoint);
                curPoint.draw();
            }
            points.push(boardRow);
        }
        console.log("Points Array");
        console.log(points);

        for (var i = 0; i < N; i++) {
            pointsRot.push([]);
        }
        for (var i = 0; i < N; i++) {
            for (var j = 0; j < N; j++) {
                pointsRot[j].push(points[i][j]);
            }
        }

        console.log("Rot Points");
        console.log(pointsRot);
        console.log("Flattened Points Rot");
        flatPoints = pointsRot.flat();
        console.log(flatPoints);

        //create the count squares
        for (var i = 0; i < (N - 1); i++) {
            var countRow = [];
            for (var j = 0; j < (N - 1); j++) {
                var squarestring = "square " + i + j;
                var curSquare = new countNumSquare(points[i][j].x, points[i][j].y, points[i + 1][j].x, points[i][j + 1].y, squarestring, ctx, countArr[j][i]);
                countRow.push(curSquare);
                console.log(curSquare);
            }
            countsquares.push(countRow);

        }

        console.log(countsquares);


        for (var i = 0; i < N * N; i++) {
            console.log(i);
            var curEdge;
            if (i + 1 < flatPoints.length && ((i + 1) % (N) != 0)) {
                curEdge = new edge(flatPoints[i].x, flatPoints[i].y, flatPoints[i + 1].x, flatPoints[i + 1].y, false, canvas, ctx, false, i, i + 1,false,-1);
                console.log("+1 curEdge" + curEdge);
                edges.push(curEdge);

            }
            if (i + N < flatPoints.length) {
                curEdge = new edge(flatPoints[i].x, flatPoints[i].y, flatPoints[i + N].x, flatPoints[i + N].y, false, canvas, ctx, true, i, i + N,false,-1);
                console.log("+N curEdge" + curEdge);
                edges.push(curEdge);
            }


        }


        console.log("Edges");
        console.log(edges);




    }

};



function loadSeed() {

    seed = document.getElementById("seed_input").value;
    var seedArr = seed.split("-");
    seed = document.getElementById("seed_input").value = " ";

    console.log("seed arr is " + seedArr);
    var inputDim = seedArr[0].trim();
    N = parseInt(inputDim);
    var inputDiff = seedArr[1].trim();
    var inputSeed = seedArr[2].trim();
    var xhr = createCORSRequest('GET', "http://localhost:8080/sl/load/?inputPuzzleDim=" + inputDim + "&inputDiff=" + inputDiff + "&seed=" + inputSeed);
    if (!xhr) {
        alert("CORS not supported");
    }
    xhr.onload = function(e) {
        var responseText = xhr.response;
        console.log(responseText);
        console.log(typeof responseText);
        var obj = JSON.parse(responseText);
        console.log(obj);
        countArr = JSON.parse(obj.count);
        console.log("CountArr is " + typeof countArr);
        solutionArr = JSON.parse(obj.pairs);
        console.log("SolutionArr is  " + typeof solutionArr);

        seed = obj.seed;
        console.log(seed);

        draw();


    }
    xhr.send();


}

function loadPuzzle(diff) {
    this.diff = diff;
    console.log("The puzzle difficulty is " + diff);
    N = parseInt(document.getElementById("dim_input").value);
    document.getElementById('dim_input').value = "";
    console.log("The size dimension is " + N);
    var xhr = createCORSRequest('GET', "http://localhost:8080/sl/gen/?puzzledim=" + N + "&diff=" + diff);
    if (!xhr) {
        alert("CORS not supported");
    }
    xhr.onload = function(e) {
        var responseText = xhr.response;
        console.log(responseText);
        console.log(typeof responseText);
        var obj = JSON.parse(responseText);
        console.log(obj);
        countArr = JSON.parse(obj.count);
        console.log("CountArr is " + typeof countArr);
        solutionArr = JSON.parse(obj.pairs);
        console.log("SolutionArr is  " + typeof solutionArr);

        seed = obj.seed;
        console.log(seed);

        draw();


    }
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