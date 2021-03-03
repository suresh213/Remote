<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.List,java.util.ArrayList,com.remote.dao.*,com.remote.model.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta charset="ISO-8859-1">
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
    <title>Remote|Home</title>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style type="text/css">
        body{
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #1b141a;
        }

        .header{
            display: inline-flex;
            flex-direction: row;
            height: 60px;
        }

        .topbar{
            display: flex;
            float: right;
            margin-left:30px;
            width: 600px;
        }

        .icons{
            padding-top: 20px;
            padding-right: 40px;
            position: relative;
            display: inline-block;
        }
        
        .icons .tooltiptext {
          width: 120px;
          margin-top: 25px;
          margin-left:  -75px; 
          background-color: transparent;
          color: #777;
          text-align: center;
          padding: 5px 0;      
          position: absolute;
          z-index: 1;
        }


        .icons .one{
            margin-right: 25px;
            background-color: transparent;
            border: none;
            outline: none;
            color: #777;
            cursor:pointer;
        }

      
        .one i{
            font-size: 30px;
            color: white;
        }

        .breaks{
            padding-top: 20px;
            padding-right: 20px;
        }

        .breaks .two{
            font-size: 15px;
            border-radius: 20px;
            outline: none;
            margin-right: 25px;
            margin-top: 15px;
        }

        .two:hover{
            background-color: #777;
        }

        .logo{
            margin-right: 680px;
            padding-top: 20px;
            padding-left: 23px;
            width: 100px;
            background-color: #1b141a;
        }
        
        .logoname{
        	display:flex;
        	vertical-align:middle;
    		
        }
        .text1{
            text-decoration: none;
            font-size:15px;
            color:white;
            margin: 15px 0 0 5px;
        }

        .logo i{
        	color:white;
            font-size: 30px;
        }
        
		.re{
		 	text-decoration:none;
		 }
		 
        .re:hover{
            color: red;
            transition: .5s;
            transform: scale3d(1.1,1.1,1.1);
        }

        .tablinks{
            margin-right: 20px;
        }

        .sidenav{
            position: relative;
            margin-top:20px;
        }

        #mySidenav a {
          position: absolute;
          left: -80px;
          transition: 0.5s;
          padding: 15px;
          width: 100px;
          text-decoration: none;
          font-size: 20px;
          color: white;
          border-radius: 0 5px 5px 0;
          
        }
		
		#mySidenav i{
			float:right;
		}
		
		
        #mySidenav a:hover {
          left: 0;
        }
        

        #chat {
          top: 20px;
          background-color: #4CAF50;
          /*background-color: #99ddff ;*/
        }
        
        #attendance{
        	top:80px;
        	background-color: #99ddff;
        }

        #request {
          color: white;
          text-decoration: none;
        }

        #files {
          top: 200px;
          background-color: #f44336;
          /*background-color:  #33bbff;*/
        }

        #task {
          top: 260px;
          background-color: #555;
          /*background-color: #00aaff;*/
        }

        #todo{
           top: 320px;
           background-color: #ff8000;
        }

        #contact{
          top: 380px;
          background-color:  #800080;
          /*background-color: #005580;*/
        }
  
        .content{
          width: 1000px;
          height: 500px;
          background-color: transparent;
          margin-left: 170px;
          display: flex;
          flex-wrap: wrap;
          position: absolute;
          max-width: 1000px;
          border-radius: 30px;
          font-family: 'Raleway', sans-serif;
          margin-top:10px;
           border: 2px solid #dedede;
        }

		#select{
          position: absolute;
          padding: 15px;
          width: 100px;
          text-decoration: none;
          font-size: 20px;
          color: white;
          border-radius: 0 5px 5px 0;
          margin-top: 140px;
          background-color: #2196F3;
          color: white;
        }
        
        
        .dia{
        	left: -270%;
			top: 270%;
        	margin:auto;
        	width:150%;
        	height:130%;
        	position:absolute;
        	z-index:100;
        	background-color:#F4FFEF;
        	border:1px dotted black;"
       }
       
       
       .blur{
          -webkit-filter: blur(2px);
          -moz-filter: blur(2px);
          -o-filter: blur(2px);
          -ms-filter: blur(2px);
          filter: blur(2px);    
        }
        
		#overlay    {
		    position: fixed;
		    display: none;
		    left: 0px;
		    top: 0px;
		    right: 0px;
		    bottom: 0px;
		    background: rgba(255,255,255,.8);
		    z-index: 999;
		}
		
		
		#overlay1    {
		    position: fixed;
		    display: none;
		    left: 0px;
		    top: 0px;
		    right: 0px;
		    bottom: 0px;
		    background: rgba(255,255,255,.8);
		    z-index: 999;
		}
		
		#popup {
		    position: absolute;
		    width: 400px;
		    height: 200px;
		    background: rgb(255,255,255);
		    border: 5px solid rgb(90,90,90);
		    left: 0px;
		    right: 0px;
		    top: 0px;
		    bottom: 0px;
		    margin: auto;
		    text-align:center;
		 }
		
		.breakQuotes{
			font-family: 'Raleway', sans-serif;
			text-align:center;
			font-size:20px;
		
		}
		
		 label {
          display: inline-flex;
          flex-direction: row;
          justify-content: flex-start;
          margin-left: 270px;
          width: 400px;
          line-height: 26px;
          margin-bottom: 10px;
          font-weight: bold;
          padding-bottom: 20px;
          /*color: white;*/
        }

        input {
          height: 20px;
          flex: 0 0 200px;
          margin-left: -190px;
          background-color: #777;
          border: none;
        }

        .requestform{ 
          margin-top: -30px;
          margin-left: 00px;
          width: 1000px;
          background-color: white;
          border-bottom-right-radius: 30px;
          border-bottom-left-radius: 30px;
        }

        #requestButton{
          margin-left: 30px;
          padding: 10px;
          border-radius: 30px;
          outline: none;
          cursor: pointer;
        }
        
        table {
          color:white;
          font-family: arial, sans-serif;
          border-collapse: collapse;
          width: 100%;
          outline: none;
          border: none;
        }

		th{
			background-color: #dddddd;
			color:black;
		}
		
        td, th {
          text-align: left;
          padding: 8px;
        }

       .modal {
		  display: none; 
		  position: fixed; 
		  z-index: 1; 
		  padding-top: 100px; 
		  left: 0;
		  top: 0;
		  width: 100%; 
		  height: 100%; 
		  overflow: auto; 
		  background-color: rgb(0,0,0); 
		  background-color: rgba(0,0,0,0.4); 
		}
		
		.modal-content {
		  background-color: #fefefe;
		  margin: auto;
		  padding: 20px;
		  border: 1px solid #888;
		  width: 20%;
		  align-items: center;
		  font-family: Arial, Helvetica, sans-serif;
		}
		
		.close {
		  color: #aaaaaa;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		  color: #000;
		  text-decoration: none;
		  cursor: pointer;
		}

		
		
    </style>
</head>


<body >
      
    <div id="result"></div> 
    <div class="header">
        <div class="logo">
        <div class="logoname">
        	<a class="re" href="admin_home.jsp"><i class="fa fa-podcast" aria-hidden="true"></i></a>
            <h4 class="text1">Remote</h4>
         </div>  
        </div>
        <div class="topbar">
            <div class="icons">
                <a href="https://meet.google.com/lookup/fpn42pl5n7?authuser=0&hs=179" target="blank" class="one"><i style="color: #4CAF50" class="fa fa-users" aria-hidden="true"></i><span class="tooltiptext"><b>meet</b></span></a>
                
                <a href="Break?action=breaktea" class="one"><i style="color: #ff8000" class="fa fa-coffee" aria-hidden="true"></i><span class="tooltiptext"><b>break</b></span></a>
                <div id="overlay"><div id="popup"><br><span class="breakQuotes">"If you are tired learn to rest, not to quit"<br><br>"Chill out time"</span><br><br><div id="td" style="color: red"></div><br><br><a href="Break?action=endtea">END</a></div></div>
				                
                <a href="Break?action=breaklunch"  class="one"><i style="color: #f44336" class="fa fa-cutlery" aria-hidden="true"></i><span class="tooltiptext"><b>lunch</b></span></a>
   				<div id="overlay1"><div id="popup"><br><span class="breakQuotes">"If you are tired learn to rest, not to quit"<br><br>"Have a good lunch"</span><br><br><div id="ld" style="color: red"></div><br><br><a href="Break?action=endlunch">END</a></div></div>
            </div>
            <div class="icons">
                <a href="admin_profile" class="one" style="padding-left: 10px;padding-right: 15px"><i style="color: #2196F3" class="fa fa-user-circle" aria-hidden="true"></i><span class="tooltiptext"><b>profile</b></span></a>
                <a href="logout.jsp" class="one"><i style="color: #800080" class="fa fa-sign-out" aria-hidden="true"></i><span class="tooltiptext"><b>logout</b></span></a>
            </div>    
        </div>
    </div>

   <div id="mySidenav" class="sidenav">
      <a href="admin_chat.jsp" id="chat">Chat  <i class="fa fa-commenting-o" aria-hidden="true"></i></a>
      <a href="admin_whitelist.jsp" id="attendance">whitelist<i class="fa fa-check-circle" aria-hidden="true"></i></a>
      <a href="" id="files">Files <i class="fa fa-file-text" aria-hidden="true"></i></a>
      <a href="admin_task.jsp" id="task">Task <i class="fa fa-tasks" aria-hidden="true"></i></a>
      <a href="admin_schedule.jsp" id="todo">Scheme  <i  Style="margin-left:5px;" class="fa fa-pencil-square" aria-hidden="true"></i></a> 
      <a href="admin_contact.jsp" id="contact">Contact <i class="fa fa-address-book-o" aria-hidden="true"></i></a>
    </div>
    
    <div id="select">
    	<a href="admin_request.jsp" id="request">Request <i class="fa fa-calendar-plus-o" aria-hidden="true"></i></a>
    </div>
   
    <div class="content">
        <%
		List<RequestModel> user = (List<RequestModel>)RequestDAO.getAllRequest();
	%>
    	
    	<%if(user.size()!=0){ %>
		<table>
        <tr>
          <th style="border-top-left-radius:30px;">NAME</th>
          <th>REGNO</th>
          <th>DEPARTMENT</th>
          <th>PURPOSE</th>
          <th>FROM-DATE</th>
          <th>TO_DATE</th>
          <th>REASON</th>
          <th style="border-top-right-radius:30px;">STATUS</th>
        </tr>
        
        <% for(RequestModel i : user){ %>
        <tr>
          <td><%= i.getName() %></td>
          <td><%= i.getRegno() %></td>
          <td><%= i.getDepartment() %></td>
          <td><%= i.getPurpose() %></td>
          <td><%= i.getFromdate() %></td>
          <td><%= i.getTodate() %></td>
          <td><%= i.getReason() %></td>
          <td><button id="myBtn">RESPOND</button></td>
        </tr>
        <div id="myModal" class="modal">
          <div class="modal-content">
            <span class="close">&times;</span>
            <h3 >CHOOSE RESPONSE:</h3>
            <form method="post" action="Respond">
            	<input style="margin-left: 100px; visibility:hidden;" name="regno" value="<%=i.getRegno()%>"></input>
            	<input type="submit" name="btn_accept" value="accept" style="background-color: green;height:30px; padding: 10px; font-size: 15px;margin-left:40px;margin-bottom:10px"></input>
            	<input type="submit" name="btn_deny" value="deny"style="background-color: red;green;height:30px; padding: 10px;margin-left: 30px; font-size: 15px;"></input>
          	</form>
          </div>
        </div>
		<%} %>
	</table>
		<%}else{ %>
			<h1 style="margin-left:300px;color:white">NO REQUEST FOUND</h1>
		<%} %>
        
    </div>

    <script type="text/javascript">
    
    // Get the modal UPDATE `requesttable` SET `status`= 1 WHERE regno = "18tuec204";
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal 
    btn.onclick = function() {
      modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }

    	
    
			
    		window.onload = function(){
    			var teabreak = <%= session.getAttribute("studentOfflineStatus")%>
    			if(teabreak===true)
    			{
    				myBlurFunction(1);
    			}
    			else if(teabreak===false){
    				myBlurFunction(0);
    			}
    		}
 
    		window.onload = function(){
    			var lunchbreak = <%= session.getAttribute("lunchbreak")%>
    			if(lunchbreak===true)
    			{
    				myBlurFunction1(1);
    			}
    			else if(lunchbreak===false){
    				myBlurFunction1(0);
    			}
    		}
    
    
    
		    myBlurFunction = function(state) {
		        var containerElement = document.getElementById('main_container');
		        var overlayEle = document.getElementById('overlay');
				if (state) {
		            overlayEle.style.display = 'block';
		            containerElement.setAttribute('class', 'blur');
		        } else {
		            overlayEle.style.display = 'none';
		            containerElement.setAttribute('class', null);
		        }
		    };
		    
	   	  myBlurFunction1 = function(state) {  
			    var overlayEle = document.getElementById('overlay1');
				 if (state) {
			        overlayEle.style.display = 'block';
			        containerElement.setAttribute('class', 'blur');
			    } else {
			        overlayEle.style.display = 'none';
			        containerElement.setAttribute('class', null);
			    }
			};
			    

    		
			
			var countDownDate = new Date();
			countDownDate.setMinutes(countDownDate.getMinutes() + 60 );
			
			 var x = setInterval(function() {
			 var now = new Date().getTime();
			 var distance = countDownDate - now;
			 var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
			 var seconds = Math.floor((distance % (1000 * 60)) / 1000);
			 document.getElementById("ld").innerHTML = minutes + "m " + seconds + "s ";
			 if (distance < 0) {
			    clearInterval(x);
			    document.getElementById("ld").innerHTML = "EXPIRED";
			  }
			}, 1000);

			
			
			var breaktime = new Date();
			breaktime.setMinutes( breaktime.getMinutes() + 15 );
			
			var y = setInterval(function(){
				var cur = new Date().getTime();
				var dif = breaktime - cur;
				var min = Math.floor((dif % (1000 * 60 * 60)) / (1000 * 60));
				var sec = Math.floor((dif % (1000 * 60)) / 1000);
				document.getElementById("td").innerHTML = min + "m " + sec + "s ";
				if (dif < 0) {
				    clearInterval(y);
				    document.getElementById("td").innerHTML = "EXPIRED";
				}
			},1000);
			
			
    
    	var auto_refresh = setInterval(
    		function () {
    		    $().load();
    	}, 1000);
   		 
       function setAttendence(){
    	     var rand = Math.round(Math.random() * 10);
   			 setTimeout(function() {
	             alert("hiiii");
	             console.log("Delayed " + rand + " secs.");
	             setAttendence();  
           }, rand*1000);
   	   }
       
 		
    </script>
</body>
</html>