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
      		color: white;
            text-decoration: none;
          /*background-color: #99ddff ;*/
        }
        
        #attendance{
        	top:80px;
        	background-color: #99ddff;
        }

        #request {
          top:140px;
          background-color:#2196F3;;
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
          margin-top: 20px;
          background-color: #4CAF50;
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
        
        
        .content{
          width: 1000px;
          height: 500px;
          background-color: #transparent;
          margin-left: 170px;
          display: flex;
          flex-wrap: wrap;
          position: absolute;
          max-width: 1000px;
          border-radius: 30px;
        }

		      .container {
        border: 2px solid #dedede;
        /*background-color: #f1f1f1;*/
        background-color: #1b141a;
        border-radius: 5px;
        padding: 10px;
        margin: 10px 0;
        color: white;
        margin-left: 10px;
        margin-right: 10px;
        width: 70%;
      }

      .darker {
        margin-left: 25%;
        border-color: #ccc;
        background-color: black;
      }

      .container::after {
        content: "";
        clear: both;
        display: table;
      }

      .container img {
        float: left;
        max-width: 40px;
        margin-top: 20px;
        margin-right: 20px;
        border-radius: 50%;
      }

      .container img.right {
        float: right;
        margin-left: 20px;
        margin-right:0;
      }

      .time-right {
        float: right;
        color: #aaa;
      }

      .time-left {
        float: left;
        color: #999;
      }
		


        .panel{
          border: 2px solid #dedede;
          width: 330px;
          height: 460px;
          background-color: #1b141a;
          margin-left: 630px;
          margin-top: -410px;
        }

        .chat{
           /*margin-left: 361px;*/
           margin-top: 20px;
           overflow: scroll;
           width: 61%;
           height: 400px;
           background-color: transparent;
         
        } 

         ::-webkit-scrollbar {
            width: 0px;  /* Remove scrollbar space */
            background: transparent;  /* Optional: just make scrollbar invisible */
        }
        /* Optional: show position indicator in red */
        ::-webkit-scrollbar-thumb {
            background: #FF0000;
        }

        .typeSection{
          display: flex;
          margin-top: 430px;
        
        }

        .text{
          width: 70%;
          height: 60px;
          margin-top:-100px;
          margin-left:250px;
        }

        textarea{
          width: 300px;
          height: 40px;
          border-radius: 10px;
          margin-left: -50px;
          resize: none;
          font-size: 15px;
          display: inline-block;
          position: fixed;
          outline: none;
          margin-top: 100px;
          
        }

        .send{
          padding: 14px;
          border-radius: 10px;
          margin-left: 260px;
          margin-top: 100px;
          position: fixed;
          outline: none;
        }

        .groupdp{
          width: 50%;
          width: 50%;
          border-radius: 100px;
          margin-left: 25%;
        }
     
		
    </style>
</head>


<body onload="updateScroll()">
      
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
                <a href="https://meet.google.com/lookup/fpn42pl5n7?authuser=0&hs=179" target="blank"class="one"><i style="color: #4CAF50" class="fa fa-users" aria-hidden="true"></i><span class="tooltiptext"><b>meet</b></span></a>
                
                <a href="Break?action=breaktea" class="one"><i style="color: #ff8000" class="fa fa-coffee" aria-hidden="true"></i><span class="tooltiptext"><b>break</b></span></a>
                <div id="overlay"><div id="popup"><br><span class="breakQuotes">"If you are tired learn to rest, not to quit"<br><br>"Chill out time"</span><br><br><div id="td" style="color: red"></div><br><br><a href="Break?action=endtea">END</a></div></div>
				                
                <a href="Break?action=breaklunch"  class="one"><i style="color: #f44336" class="fa fa-cutlery" aria-hidden="true"></i><span class="tooltiptext"><b>lunch</b></span></a>
   				<div id="overlay1"><div id="popup"><br><span class="breakQuotes">"If you are tired learn to rest, not to quit"<br><br>"Have a good lunch"</span><br><br><div id="ld" style="color: red"></div><br><br><a href="Break?action=endlunch">END</a></div></div>
            </div>
            <div class="icons">
                <a href="admin_profile.jsp" class="one" style="padding-left: 10px;padding-right: 15px"><i style="color: #2196F3" class="fa fa-user-circle" aria-hidden="true"></i><span class="tooltiptext"><b>profile</b></span></a>
                <a href="logout.jsp" class="one"><i style="color: #800080" class="fa fa-sign-out" aria-hidden="true"></i><span class="tooltiptext"><b>logout</b></span></a>
            </div>    
        </div>
    </div>

   <div id="mySidenav" class="sidenav">
      <a href="admin_request.jsp" id="request">Request <i class="fa fa-calendar-plus-o" aria-hidden="true"></i></a>
      <a href="admin_whitelist.jsp" id="attendance">whitelist<i class="fa fa-check-circle" aria-hidden="true"></i></a>
      <a href="" id="files">Files <i class="fa fa-file-text" aria-hidden="true"></i></a>
      <a href="admin_task.jsp" id="task">Task <i class="fa fa-tasks" aria-hidden="true"></i></a>
      <a href="admin_todo.jsp" id="todo">Scheme  <i  Style="margin-left:5px;" class="fa fa-pencil-square" aria-hidden="true"></i></a> 
      <a href="" id="contact">Contact <i class="fa fa-address-book-o" aria-hidden="true"></i></a>
    </div>
    
    <div id="select">
    	<a href="admin_chat.jsp" id="chat">Chat  <i class="fa fa-commenting-o" aria-hidden="true"></i></a>
    </div>
   
    <div class="content">
        <div class="chat" id="bm">
			<%
			UserModel user = (UserModel)session.getAttribute("user");
	  		String	mailid = user.getEmail();
	  		
			List<ChatModel> list = ChatDAO.getAllMessages(); 
			for(ChatModel i:list)
			{
				if(mailid.equals(i.getEmail()))
				{%>
				
				<div class="container darker">
              		<img src="images/avatar.png" alt="Avatar" class="right" style="width:100%;">
              		<p><%=i.getMessage() %></p>
              		<span class="time-left"><%=i.getUsername() %>-<%=i.getTime() %></span>
            	</div>
            	<%}else{ %>
				<div class="container">
		            <img src="images/avatar.png" alt="Avatar" style="width:100%;">
		            <p><%=i.getMessage() %></p>
		            <span class="time-right"><%=i.getUsername() %>-<%=i.getTime() %></span>
            	</div>
			<%}} %>            
          </div>
          <form class="text" method="post" action="ChatSeverlet">
            <textarea name="textbox"></textarea><span><button class="send">SEND</button></span>
        </form>
          <div class="panel"><br>
            <img src="images/avatar.png" alt="bootcamp" class="groupdp"><br>
            <h3 style="color: white;margin-left: 20%">SKI BOOTCAMP 2022</h3>
        </div>
      </div>


    <script type="text/javascript">
    	
		  
		    
		
			function updateScroll(){
		      var element = document.getElementById("bm");
		      element.scrollTop = element.scrollHeight;
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
 		
    </script>
</body>
</html>