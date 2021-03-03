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
         	top:20px;
         	background-color: #4CAF50;
        }

        #request {
          top: 80px;
          background-color: #2196F3;
          /*background-color: #66ccff;*/
        }

        #files {
          top: 140px;
          background-color: #f44336;
          /*background-color:  #33bbff;*/
        }

        #task {
          top: 200px;
          background-color: #555;
          /*background-color: #00aaff;*/
        }

        #todo{
          top: 260px;
          background-color:  #ff8000;
          /*background-color:  #0088cc;*/
        }

        #contact{
          top: 320px;
          background-color:  #800080;
          /*background-color: #005580;*/
        }
        .username{
        	font-size:25px;
        	color:white;
        	margin-left:200px;
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
          margin-top:0px;
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
		
		.page
          {
            width: 1000px;
            height: 500px;
            background-color:#1b141a;
            border-radius: 30px;
            display: inline-flex;
          }
          .details
          {
            width: 600px;
            height: 500px;
            background-color: #1b141a;
            border-radius: 30px;
            margin-left: 130px;
          }
          .pic
          {
            width: 350px;
            height: 500px;
            border-radius: 30px;
            background-color: #1b141a;
            margin-left: 20px; 
             border: 1px solid #777;
          } 
          .profiledetail
          {
            color: white;
            background-color: #1b141a;
            position: relative;
            
          }
          .profiledetails
          {
            color: white;
            background-color: white;
            position: relative;
            
          }
          .profile-label{
          	display:grid;
          	grid-template-columns:1fr 3fr;
          }
          label
          {
            display: inline-flex;
            flex-direction: row;
            width:400px;
            line-height:26px;
            margin-bottom :10px;
            font-weight: bold;
            padding-bottom: 20px; 
            margin-left: 130px;
          }
          input
          {
            height: 20px;
            flex: 0 0 200px;
            margin-left: -210px;
            background-color: #777;
          }
          #mybtn
          {
            width:80px;
            height: 30px;
            margin-left:325px;
            cursor: pointer;
            background-color: #777;
            color: white;
          }
          .modal {
		  display: none; /* Hidden by default */
		  position: fixed; /* Stay in place */
		  z-index: 1; /* Sit on top */
		  padding-top: 100px; /* Location of the box */
		  left: 0;
		  top: 0;
		  width: 100%; /* Full width */
		  height: 100%; /* Full height */
		  overflow: auto; /* Enable scroll if needed */
		  background-color: rgb(0,0,0); /* Fallback color */
		  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}
		
		/* Modal Content */
		.modal-content {
		  position: relative;
		  background-color: #fefefe;
		  margin: auto;
		  padding: 0;
		  border: 1px solid #888;
		  width: 80%;
		  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
		  -webkit-animation-name: animatetop;
		  -webkit-animation-duration: 0.4s;
		  animation-name: animatetop;
		  animation-duration: 0.4s
		}
		
		/* Add Animation */
		@-webkit-keyframes animatetop {
		  from {top:-300px; opacity:0} 
		  to {top:0; opacity:1}
		}
		
		@keyframes animatetop {
		  from {top:-300px; opacity:0}
		  to {top:0; opacity:1}
		}
		
		/* The Close Button */
		.close {
		  color: black;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		  color: red;
		  text-decoration: none;
		  cursor: pointer;
		}
		
		.modal-header {
		  padding: 10px 16px;
		  color: white;
		}
		
		.modal-body {padding: 2px 16px;}
		
		.modal-footer {
		  padding: 2px 16px;
		  color: white;
		}
		
		.container {
    max-width: 960px;
    margin: 30px auto;
    padding: 20px;
}

 .container {
	 max-width: 960px;
	 margin: 30px auto;
	 padding: 20px;
}
 .avatar-upload {
	 position: relative;
	 max-width: 205px;
	 margin: 50px auto;
}
 .avatar-upload .avatar-edit {
	 position: absolute;
	 right: 45px;
	 z-index: 1;
	 top: 10px;
}
 .avatar-upload .avatar-edit input {
	 display: none;
}
 .avatar-upload .avatar-edit input + label {
	 display: inline-block;
	 width: 34px;
	 height: 15px;
	 margin-bottom: 0;
	 border-radius: 100%;
	 background: #fff;
	 border: 1px solid transparent;
	 box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
	 cursor: pointer;
	 font-weight: normal;
	 transition: all 0.2s ease-in-out;
}
 .avatar-upload .avatar-edit input + label:hover {
	 background: #f1f1f1;
	 border-color: #d6d6d6;
}
 .avatar-upload .avatar-edit input + label:after {
	 content: "\f040";
	 font-family: 'FontAwesome';
	  position: absolute;
	 color: #757575;
	 top: 4px;
	 left: 0;
	 right: 10px;
	 text-align: right;
	 margin:suto;
	 
}
 .avatar-upload .avatar-preview {
	 width: 152px;
	 height: 152px;
	 position: relative;
	 border-radius: 100%;
	 border: 6px solid #f8f8f8;
	 box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
}
 .avatar-upload .avatar-preview > div {
	 width: 100%;
	 height: 100%;
	 border-radius: 100%;
	 background-size: cover;
	 background-repeat: no-repeat;
	 background-position: center;
}
 
 
 
 
        .attendence-modal {
		  display: none; /* Hidden by default */
		  position: fixed; /* Stay in place */
		  z-index: 1; /* Sit on top */
		  padding-top: 100px; /* Location of the box */
		  left: 0;
		  top: 0;
		  width: 100%; /* Full width */
		  height: 100%; /* Full height */
		  overflow: auto; /* Enable scroll if needed */
		  background-color: rgb(0,0,0); /* Fallback color */
		  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}
		
		/* Modal Content */
		.attendence-modal-content {
		  position: relative;
		  background-color: #fefefe;
		  margin: auto;
		  padding: 0;
		  border: 1px solid #888;
		  width: 80%;
		  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
		  -webkit-animation-name: animatetop;
		  -webkit-animation-duration: 0.4s;
		  animation-name: animatetop;
		  animation-duration: 0.4s
		}
		
		/* Add Animation */
		@-webkit-keyframes animatetop {
		  from {top:-300px; opacity:0} 
		  to {top:0; opacity:1}
		}
		
		@keyframes animatetop {
		  from {top:-300px; opacity:0}
		  to {top:0; opacity:1}
		}
		
		/* The Close Button */
		.attendence-close {
		  color: black;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.attendence-close:hover,
		.attendence-close:focus {
		  color: red;
		  text-decoration: none;
		  cursor: pointer;
		}
		
		.attendence-modal-header {
		  padding: 10px 16px;
		  color: white;
		}
		
		.attendence-modal-body {padding: 2px 16px;}
		
		.attendence-modal-footer {
		  padding: 2px 16px;
		  color: white;
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
                <a href="https://meet.google.com/lookup/fpn42pl5n7?authuser=0&hs=179" class="one"><i style="color: #4CAF50" class="fa fa-users" aria-hidden="true"></i><span class="tooltiptext"><b>meet</b></span></a>
                
                <a href="Break?action=breaktea" class="one"><i style="color: #ff8000" class="fa fa-coffee" aria-hidden="true"></i><span class="tooltiptext"><b>break</b></span></a>
                <div id="overlay"><div id="popup"><br><span class="breakQuotes">"If you are tired learn to rest, not to quit"<br><br>"Chill out time"</span><br><br><div id="td" style="color: red"></div><br><br><a href="Break?action=endtea">END</a></div></div>
				                
                <a href="Break?action=breaklunch"  class="one"><i style="color: #f44336" class="fa fa-cutlery" aria-hidden="true"></i><span class="tooltiptext"><b>lunch</b></span></a>
   				<div id="overlay1"><div id="popup"><br><span class="breakQuotes">"If you are tired learn to rest, not to quit"<br><br>"Have a good lunch"</span><br><br><div id="ld" style="color: red"></div><br><br><a href="Break?action=endlunch">END</a></div></div>
            </div>
            <div class="icons">
                <a href="remote_profile.jsp" class="one" style="padding-left: 10px;padding-right: 15px"><i style="color: #2196F3" class="fa fa-user-circle" aria-hidden="true"></i><span class="tooltiptext"><b>profile</b></span></a>
                <a href="logout.jsp" class="one"><i style="color: #800080" class="fa fa-sign-out" aria-hidden="true"></i><span class="tooltiptext"><b>logout</b></span></a>
            </div>    
        </div>
    </div>

   <div id="mySidenav" class="sidenav">
      <a href="remote_chat.jsp" id="chat">Chat  <i style="float:right" class="fa fa-commenting-o" aria-hidden="true"></i></a>
      <a href="remote_request.jsp" id="request">Request <i class="fa fa-calendar-plus-o" aria-hidden="true"></i></a>
      <a href="remote_files.jsp" id="files">Files <i class="fa fa-file-text" aria-hidden="true"></i></a>
      <a href="remote_task.jsp" id="task">Task <i class="fa fa-tasks" aria-hidden="true"></i></a>
      <a href="remote_schedule.jsp" id="todo">To-do <i class="fa fa-list-ul" aria-hidden="true"></i></a>
      <a href="remote_contact.jsp" id="contact">Contact <i class="fa fa-address-book-o" aria-hidden="true"></i></a>
    </div>
   
    
    <div class="content">
   		<%
     UserModel i = (UserModel)session.getAttribute("user");
      %>
        <div class="page">
      <div class="details">
        <h2 style ="color :white; text-align:center" >PROFILE</h2>
    	  <div class="profiledetail">
    	  <form method="post" action="profile">
	    	 <div class="profile-label">
		    	 <label for ="name">Name : </label>
		         <input style="margin-left:-150px;" name="uname" for ="name" value="<%= i.getName() %>"></input>
	          </div>
	    	 <div class="profile-label">
		    	 <label for ="regno">Register No. : </label>
		          <input style="margin-left:-150px;" name="regno" for ="name"value="<%=i.getRegNo()%>"></input>
	          </div>
	    	 <div class="profile-label">
		    	 <label for ="mailid">Email : </label>
		          <input readonly style="margin-left:-150px;" name="email" for ="name" value="<%= i.getEmail() %>"></input>
	          </div>
	    	 <div class="profile-label">
		    	 <label for ="gender">Gender : </label>
		          <input style="margin-left:-150px;" name="gender" for ="name" value="<%= i.getGender() %>"></input>
	          </div>
	    	 <div class="profile-label">
		    	 <label for ="dept">Department : </label>
		          <input style="margin-left:-150px;" name="dept" for ="name" value="<%= i.getDept() %>"></input>
	          </div>
	    	 <div class="profile-label">
		    	 <label for ="contact">Contact No. : </label>
		          <input style="margin-left:-150px;" name="contact" for ="name" value="<%= i.getPhoneNumber() %>"></input>
	          </div>
			      <button style="margin-left:250px;" type="submit" id="myBtn">Update Profile</button>
			</form>
          </div> 

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2></h2>
    </div>
    
    <div class="modal-body">
    	  <form class="profiledetail" action="Profile" method="post">
          <label for ="name">Name : </label>
          <input  type="text" name="name" value="<%= i.getName() %>" ><br>
          <label for ="gender">Gender : </label>
          <input type="text" name="gender" value="<%= i.getGender() %>" ><br>
          <label for ="dept">Department : </label>
          <input type="text" name="dept" value="<%= i.getDept() %>" ><br>
          <label for ="contact">Contact No. : </label>
          <input type="number" name="ph_no" value="<%= i.getPhoneNumber() %>" ><br>
          <button type="submit" id= "btn">UPDATE</button>
        </form> 
    </div>
    <div class="modal-footer">
      <h3></h3>
    </div>
  </div>

</div>
    </div>
</div>
</div>
    <script type="text/javascript">
			
 // Get the attendence modal
    var attendenceModal = document.getElementById("attendence-modal");

    // Get the button that opens the modal
    var attendenceBtn = document.getElementById("attendence-btn");

    // Get the <span> element that closes the modal
    var attendenceSpan = document.getElementsByClassName("attendence-close")[0];

    // When the user clicks the button, open the modal 
    //attendenceBtn.onclick = function() {
   // 	attendenceModal.style.display = "block";
   // }

    // When the user clicks on <span> (x), close the modal
    attendenceSpan.onclick = function() {
    	attendenceModal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == attendenceModal) {
    	  attendenceModal.style.display = "none";
      }
    }
    
    
 // Get the modal
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
    
    		function updateScroll(){
	      			var element = document.getElementById("bm");
	      			element.scrollTop = element.scrollHeight;
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