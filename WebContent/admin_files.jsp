<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.List,java.util.ArrayList,com.remote.dao.*,com.remote.model.*"%>
 <%@ page import="java.util.List,java.util.ArrayList,com.remote.model.*,com.remote.dao.*,com.remote.util.*,java.sql.*"%>
    
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
      		top:20px;
          background-color: #4CAF50; ;
        }
        
        #attendance{
        	top:80px;
        	background-color: #99ddff;
        }

        #request {
          top:140px;
          background-color:#99ddff;;
        }

        #files {
          color:white;
          text-decoration:none;
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
          margin-top: 200px;
          background-color: #f44336;
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
		
		/* Style the close button */
          .close {
            position: absolute;
            right: 0;
            top: 0;
            padding: 12px 16px 12px 16px;
          }

          .close:hover {
            background-color: #f44336;
            color: white;
          }

          /* Style the header */
          .header1 {
            background-color: transparent;
            padding: 30px 40px;
            color: white;
            text-align: center;
            border-radius: 30px;
            height:90px;
            margin-top:-20px;
            
          }

          /* Clear floats after the header */
          .header1:after {
            content: "";
            display: table;
            clear: both;
          }

          /* Style the input */
          input {
            margin-right: 40px;
            margin-left: 40px;
            border: none;
            border-radius: 0;
            width: 40%;
            padding: 10px;
            float: left;
            font-size: 16px;
            border-radius:25px;
            outline:none;
          }

          /* Style the "Add" button */
          .addBtn {
            padding: 10px 40px;
            width: 20%;
            background: #d9d9d9;
            color: black;
            float: left;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            outline:none;
            margin-top:20px;
            margin-left:20px;
            border-radius:10px;
          }

          .addBtn:hover {
            background-color: #bbb;
          }
		  .alltasks{
		    margin-top:20px;
		    height:auto;
		  	max-height:300px;
		  	overflow-y:scroll;
		  	overflow-x:hidden;
		  	
		  }
		  .task{
		    color:black;
		    font-size:1.4rem;
		  	display:flex;
		  	justify-content:space-between;
		  	height:30px;
		  	padding:5px 20px;
		  	margin-top:5px;
		  	background-color:grey;
		  }
		  .task div{
		  	margin-top:7px;
		  }
		  #cross{
		  color:black;
		  margin-top:7px;
		  }
			.tab{
			margin-top:-150px;
			margin-left:300px;
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
          font-size:20px;
        }
		
		::-webkit-scrollbar {
            width: 0px;  /* Remove scrollbar space */
            background: transparent;  /* Optional: just make scrollbar invisible */
        }
        /* Optional: show position indicator in red */
        ::-webkit-scrollbar-thumb {
            background: #FF0000;
        }
    </style>
</head>


<body >
      
    <div id="result"></div> 
    <div class="header">
        <div class="logo">
        <div class="logoname">
        	<a class="re" href="E:/remote/remote_homepage.html"><i class="fa fa-podcast" aria-hidden="true"></i></a>
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
                <a href="admin_profile.jsp" class="one" style="padding-left: 10px;padding-right: 15px"><i style="color: #2196F3" class="fa fa-user-circle" aria-hidden="true"></i><span class="tooltiptext"><b>profile</b></span></a>
                <a href="logout.jsp" class="one"><i style="color: #800080" class="fa fa-sign-out" aria-hidden="true"></i><span class="tooltiptext"><b>logout</b></span></a>
            </div>    
        </div>
    </div>

   <div id="mySidenav" class="sidenav">
   	  <a href="admin_chat.jsp" id="chat">Chat  <i class="fa fa-commenting-o" aria-hidden="true"></i></a>
      <a href="admin_request.jsp" id="request">Request <i class="fa fa-calendar-plus-o" aria-hidden="true"></i></a>
      <a href="admin_whitelist.jsp" id="attendance">Attend<i class="fa fa-check-circle" aria-hidden="true"></i></a>
      <a href="admin_task.jsp" id="task">Task <i class="fa fa-tasks" aria-hidden="true"></i></a>
      <a href="admin_schedule.jsp" id="todo">Scheme  <i  Style="margin-left:5px;" class="fa fa-pencil-square" aria-hidden="true"></i></a> 
      <a href="admin_contact.jsp" id="contact">Contact <i class="fa fa-address-book-o" aria-hidden="true"></i></a>
    </div>
    
    <div id="select">
    	<a href="admin_files.jsp" id="files">Files <i class="fa fa-file-text" aria-hidden="true"></i></a>
    </div>
   
    <div class="content">
   		
      
      <div id="myDIV" class="header1">
        <h2 style="margin:5px; float: left; margin-top: 40px;">FILES</h2><br><br>
        <form id="myDIV" class="header1" method="post" action="ProfilePictureUpload?action=file" enctype="multipart/form-data">
        <input style="margin-top:-30px;" type="text" id="myInput" name="filename" placeholder="Title..." required>
        <input style="margin-top:20px; " type="file" id="myInput" name="fileupload" required>
        <button type="submit" class="addBtn" >Upload</button>
      </form>
      </div>
      <table class="tab">
      
      <%
		try{
			Connection con= DBConnection.getConnection();
			String query = "select * from files";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){ %>
           
           <tr>
				<td><%=  rs.getString("name") %></td>
                <td ><a href="getfile.jsp?id=<%=rs.getInt("id")%>" style="color:red" target="_blank">show file</a></td>
            </tr>
            <% }}catch(Exception e){
			System.out.println(e);
		}
      	%>
      </table>
   
    </div>

    <script type="text/javascript">
    
  
    
			
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