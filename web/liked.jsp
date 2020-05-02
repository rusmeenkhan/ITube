<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="java.sql.*" %>
<!DOCTYPE HTML>
<jsp>
<head>
<title>My Play a Entertainment Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/jsp; charset=utf-8" />
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

<script>
   $(document).ready(function(){
       $("#search").keyup(function(){
           var v=$(this).val();
           $.post("search.jsp",{id:v},function(data){
                  $("#rusmeen").html(data);
           });   
       });
   }); 
    
</script>
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
        <div id="navbar" class="navbar-collapse collapse">
			<div class="top-search">
				<form method="post" action="search.jsp" class="navbar-form navbar-right">
                                    <input type="text" name="item" id="search" class="form-control" placeholder="Search...">
					<input type="submit" value=" ">
				</form>
			</div>
			<div class="header-top-right">
				<div class="file">
					<a href="upload.jsp">Upload</a>
				</div>	

				<div class="clearfix"> </div>
			</div>
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
                       <li><a href="#" class="menu1"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>My Profile<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a></li>
						<ul class="cl-effect-2">
                                                    <li><a href="Profile.jsp?id=<%=ucode%>">View Profile</a></li>                                             
                                                        <li><a href="edit.jsp?id=<%=ucode%>">Edit Profile</a></li>
                                                        <li><a href="changepass.jsp?id=<%=ucode%>">Change Password</a></li> 
                                                </ul>
                                                 <li><a href="channel.jsp?id=<%=ucode%>" class="user-icon"><span class="glyphicon glyphicon-home glyphicon-blackboard" aria-hidden="true"></span> new channel</a></li>
                                                 <li><a href="Favourites.jsp?id=<%=ucode%>" class="sub-icon"><span class="glyphicon glyphicon-home glyphicon-heart" aria-hidden="true"></span>Favourites</a></li>
                                                 <li><a href="liked.jsp?id=<%=ucode%>" class="user-icon"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>Liked<span class="glyphicon glyphicon" aria-hidden="true"></span></a></li>
                                                 <li><a href="Playlist.jsp?id=<%=ucode%>" class="user-icon"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>My Uploads<span class="glyphicon glyphicon" aria-hidden="true"></span></a></li>
                                                 <li><a href="Subscribes.jsp?id=<%=ucode%>" class="user-icon"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>My Subscription<span class="glyphicon glyphicon" aria-hidden="true"></span></a></li>
                                                 <li><a href="My_channels.jsp?id=<%=ucode%>" class="news-icon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>My Channels</a></li>
                                                <!-- script-for-menu -->
						<script>
							$( "li a.menu1" ).click(function() {
							$( "ul.cl-effect-2" ).slideToggle( 300, function() {
							// Animation complete.
							});
							});
						</script>

						<!-- script-for-menu -->
						<script>
							$( "li a.menu" ).click(function() {
							$( "ul.cl-effect-1" ).slideToggle( 300, function() {
							// Animation complete.
							});
							});
						</script>
					
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
       <%
           String tittle=null;
           String shortDes=null;
           String fullDes=null;
           String songid=null;
%>
              
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main-grids" id="rusmeen">
				<div class="top-grids">
					<div class="recommended-info">
						<h3>All Videos</h3>
					</div>
       <%                                        
           
           try{

                      Class.forName("com.mysql.jdbc.Driver");
                      Connection cn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                      Statement st3=cn2.createStatement();
                      ResultSet rs1=st3.executeQuery("select * from song where songId IN (select songId from likes where ucode='"+ucode+"' AND likes=1)");
                      while(rs1.next())
                                          { 
                                           tittle =rs1.getString("tittle");
                                           shortDes =rs1.getString("shortDes");
                                           fullDes =rs1.getString("fullDes");
                                           songid =rs1.getString("songid");
                                           String email =rs1.getString("email");
                                           String view =rs1.getString("view");
                                           String channelname=rs1.getString("channelname");
                                          
                               %>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids" >
						<div class="resent-grid-img recommended-grid-img">
                                                    <a href="single.jsp?songid=<%=songid%>"><img src="user/video/<%=songid%>.jpg" alt="" width="200px" height="200px" /></a>
							<div class="time">
								<p>3:04</p>
							</div>
							<div class="clck">
								<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
							</div>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.jsp?songid=<%=songid%>" class="title title-info"><%=tittle%></a></h3>
							<ul>
								<li><p class="author author-info"><a href="#" class="author"><%=channelname%></a></p></li>
                                                                <li class="right-list"><p class="views views-info"><i class="glyphicon glyphicon-eye-open"><%=view%></i></p></li>
							</ul>
						</div>
					</div>
					
                 <%       
              } 

                    
           }
           catch(Exception e)
           {
               out.println(e.getMessage());
           }
         %>
					<div class="clearfix"> </div>
				</div>

			</div>
			<!-- footer -->
			<div class="footer">
				<div class="footer-grids">
					<div class="footer-top">
						<div class="footer-top-nav">
							<ul>
								<li><a href="about.jsp">About</a></li>
								<li><a href="press.jsp">Press</a></li>
								<li><a href="copyright.jsp">Copyright</a></li>
								<li><a href="creators.jsp">Creators</a></li>
								<li><a href="#">Advertise</a></li>
								<li><a href="developers.jsp">Developers</a></li>
							</ul>
						</div>
						<div class="footer-bottom-nav">
							<ul>
								<li><a href="terms.jsp">Terms</a></li>
								<li><a href="privacy.jsp">Privacy</a></li>
								<li><a href="#small-dialog4" class="play-icon popup-with-zoom-anim">Send feedback</a></li>
								<li><a href="privacy.jsp">Policy & Safety </a></li>
								<li><a href="try.jsp">Try something new!</a></li>
							</ul>
						</div>
					</div>
					<div class="footer-bottom">
						<ul>

							<li class="languages">
								<select class="form-control bfh-countries" data-country="US">
									<option value="">Safety Off</option>
									<option value="">Safety On</option>
								</select>
							</li>
							<li><a href="history.jsp" class="f-history">History</a></li>
							<li><a href="#small-dialog5" class="play-icon popup-with-zoom-anim f-history f-help">Help</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //footer -->
		</div>
		<div class="clearfix"> </div>
	<div class="drop-menu">
		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu4">
		  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Regular link</a></li>
		  <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">Disabled link</a></li>
		  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another link</a></li>
		</ul>
	</div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <%
      }
catch(Exception e){
out.println(e.getMessage());
}
    %>
  </body>
</jsp>