<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
<head>
<title>My Play a Entertainment Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="My Play Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
<!-- //bootstrap -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
<script src="js/jquery-1.11.1.min.js"></script>
<!--start-smoth-scrolling-->
<!-- fonts -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<!-- //fonts -->
</head>
  <body>
     <% 
      try{
            String ucode=request.getParameter("id");
            %>
 
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
            
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp"><h1>ITube</h1></a>
         </div>
		<div class="clearfix"> </div>
      </div>          
    </nav>
	
        <div class="col-sm-3 col-md-2 sidebar">
                                 <div class="top-navigation">
                                         <div class="t-menu">MENU</div>
                                         <div class="t-img">
                                                 <img src="images/lines.png" alt="" />
                                         </div>
                                         <div class="clearfix"> </div>
                                 </div>
                                         <div class="drop-navigation drop-navigation">
                                           <ul class="nav nav-sidebar">
                                                 <li class="active"><a href="index.jsp" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                                <li><a class="menu1"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>My Profile<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a></li>
                                                         <ul class="cl-effect-2">
                                                                 <li><a href="Profile.jsp">View Profile</a></li>                                             
                                                                 <li><a href="edit.jsp">Edit Profile</a></li>
                                                                 <li><a href="changepass.jsp">Change Password</a></li> 
                                                         </ul>
                                                 <li><a href="channel.jsp" class="user-icon"><span class="glyphicon glyphicon-home glyphicon-blackboard" aria-hidden="true"></span> new channel</a></li>
                                                 <li><a href="Favourites.jsp" class="sub-icon"><span class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span>Favourites</a></li>
                                                 <li><a href="liked.jsp" class="menu1"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>Liked<span class="glyphicon glyphicon" aria-hidden="true"></span></a></li>
                                                 <li><a href="Playlist.jsp" class="menu1"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>My Uploads<span class="glyphicon glyphicon" aria-hidden="true"></span></a></li>
                                                 <li><a href="Subscribes.jsp" class="menu1"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>Subscribes<span class="glyphicon glyphicon" aria-hidden="true"></span></a></li>
                                                 <li><a href="My_channels.jsp" class="news-icon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>My Channels</a></li>
                                                         <!-- script-for-menu -->
                                                         

                                                         <!-- script-for-menu -->
                                                         

                                                 <li><a href="logout.jsp" class="news-icon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>Logout?</a></li>
                                           </ul>
                                           <!-- script-for-menu -->
                                                         <script>
                                                                 $( ".top-navigation" ).click(function() {
                                                                 $( ".drop-navigation" ).slideToggle( 300, function() {
                                                                 // Animation complete.
                                                                 });
                                                                 });
                                                         </script>
                                                 <div class="side-bottom">
                                                         <div class="side-bottom-icons">
                                                                 <ul class="nav2">
                                                                         <li><a href="#" class="facebook"> </a></li>
                                                                         <li><a href="#" class="facebook twitter"> </a></li>
                                                                         <li><a href="#" class="facebook chrome"> </a></li>
                                                                         <li><a href="#" class="facebook dribbble"> </a></li>
                                                                 </ul>
                                                         </div>
                                                         <div class="copyright">
                                                                 <p>Copyright © 2015 My Play. All Rights Reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
                                                         </div>
                                                 </div>
                                         </div>             
                 </div>
        
                <%
                String Channel_id=null;
                String channel_name=null;
                %>
 <div class="col-md-8 col-md-offset-2" align="center">
                          <h3 style="margin-top:60px">Playlist of channel</h3>
                          <form method="post" action="Playlist1.jsp?id=<%=ucode%>" class="panel-body wrapper-lg">
                          <div class="form-group">
                              <select name="channel" class="control-label form-control"><option selected="" disabled>choose channel name</option>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                                Statement st1=cn1.createStatement();
                                ResultSet rs1=st1.executeQuery("select * from channel where ucode='"+ucode+"'");
                               while(rs1.next())
                               { 
                                channel_name=rs1.getString("cname");
                                Channel_id=rs1.getString("Channel_id");
                            %> 
                                         <option value="<%=Channel_id%>"><%=channel_name%></option>
                            <%
                                }
                            %>     
                                         
                            </select> 
                          </div>
                              <br>    
                        <button type="submit" class="btn btn-primary">submit</button>
                   </form>
                  </div>

               
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <% 
   }
catch(Exception e)
{
out.println(e.getMessage());
}

  %>

  </body>
</html>