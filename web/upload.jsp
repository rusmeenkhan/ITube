
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="java.sql.*"  %>%>
<%
    String songId=request.getParameter("songid");
%>
<!DOCTYPE HTML>
<html>
<head>
<title>My Play a Entertainment Category Flat Bootstrap Responsive Website Template | single :: w3layouts</title>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- //fonts -->
</head>
  <body>

      <%
        try
         { 
                String ucode=request.getParameter("id"); 
                String tittle=null;
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                Statement st=cn.createStatement();

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
          <a class="navbar-brand" href="index.jsp"><h1><img src="images/logo.png" alt="" /></h1></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
			<div class="top-search">
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" id="search" placeholder="Search...">
					<input type="submit" value=" ">
				</form>
			</div>  
			<div class="header-top-right">
				<div class="signin">
                                        <script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
                                        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
                                        <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
                                        <!--//pop-up-box -->
                                        <div id="small-dialog2" class="mfp-hide">
                                                <div class="clearfix"> </div>
                                        </div>	
                                        <div id="small-dialog3" class="mfp-hide">		
                                                <div class="clearfix"> </div>
                                        </div>	
                                        <div id="small-dialog7" class="mfp-hide">
                                                <div class="clearfix"> </div>
                                        </div>	
                                        <div id="small-dialog4" class="mfp-hide">
                                                <h3>Feedback</h3> 
                                                <div class="feedback-grids">
                                                        <div class="feedback-grid">
                                                                <p>Suspendisse tristique magna ut urna pellentesque, ut egestas velit faucibus. Nullam mattis lectus ullamcorper dui dignissim, sit amet egestas orci ullamcorper.</p>
                                                        </div>
                                                        <div class="button-bottom">
                                                                <p><a href="#small-dialog" class="play-icon popup-with-zoom-anim">Sign in</a> to get started.</p>
                                                        </div>
                                                </div>
                                        </div>
                                        <div id="small-dialog5" class="mfp-hide">
                                                <h3>Help</h3> 
                                                        <div class="help-grid">
                                                                <p>Suspendisse tristique magna ut urna pellentesque, ut egestas velit faucibus. Nullam mattis lectus ullamcorper dui dignissim, sit amet egestas orci ullamcorper.</p>
                                                        </div>
                                                        <div class="help-grids">
                                                                <div class="help-button-bottom">
                                                                        <p><a href="#small-dialog4" class="play-icon popup-with-zoom-anim">Feedback</a></p>
                                                                </div>
                                                                <div class="help-button-bottom">
                                                                        <p><a href="#small-dialog6" class="play-icon popup-with-zoom-anim">Lorem ipsum dolor sit amet</a></p>
                                                                </div>
                                                                <div class="help-button-bottom">
                                                                        <p><a href="#small-dialog6" class="play-icon popup-with-zoom-anim">Nunc vitae rutrum enim</a></p>
                                                                </div>
                                                                <div class="help-button-bottom">
                                                                        <p><a href="#small-dialog6" class="play-icon popup-with-zoom-anim">Mauris at volutpat leo</a></p>
                                                                </div>
                                                                <div class="help-button-bottom">
                                                                        <p><a href="#small-dialog6" class="play-icon popup-with-zoom-anim">Mauris vehicula rutrum velit</a></p>
                                                                </div>
                                                                <div class="help-button-bottom">
                                                                        <p><a href="#small-dialog6" class="play-icon popup-with-zoom-anim">Aliquam eget ante non orci fac</a></p>
                                                                </div>
                                                        </div>
                                        </div>
                                        <div id="small-dialog6" class="mfp-hide">
                                                <div class="video-information-text">
                                                        <h4>Video information & settings</h4>
                                                        <p>Suspendisse tristique magna ut urna pellentesque, ut egestas velit faucibus. Nullam mattis lectus ullamcorper dui dignissim, sit amet egestas orci ullamcorper.</p>
                                                        <ol>
                                                                <li>Nunc vitae rutrum enim. Mauris at volutpat leo. Vivamus dapibus mi ut elit fermentum tincidunt.</li>
                                                                <li>Nunc vitae rutrum enim. Mauris at volutpat leo. Vivamus dapibus mi ut elit fermentum tincidunt.</li>
                                                                <li>Nunc vitae rutrum enim. Mauris at volutpat leo. Vivamus dapibus mi ut elit fermentum tincidunt.</li>
                                                                <li>Nunc vitae rutrum enim. Mauris at volutpat leo. Vivamus dapibus mi ut elit fermentum tincidunt.</li>
                                                                <li>Nunc vitae rutrum enim. Mauris at volutpat leo. Vivamus dapibus mi ut elit fermentum tincidunt.</li>
                                                        </ol>
                                                </div>
                                        </div>
                                        <script>
                                                        $(document).ready(function() {
                                                        $('.popup-with-zoom-anim').magnificPopup({
                                                                type: 'inline',
                                                                fixedContentPos: false,
                                                                fixedBgPos: true,
                                                                overflowY: 'auto',
                                                                closeBtnInside: true,
                                                                preloader: false,
                                                                midClick: true,
                                                                removalDelay: 300,
                                                                mainClass: 'my-mfp-zoom-in'
                                                        });

                                                        });
                                        </script>	
				</div>
			</div>
        </div>
      </div>
    </nav>
        <div class="col-sm-3 col-md-2 sidebar">
			<div class="top-navigation">
				<div class="t-menu">MENU</div>
				<div class="t-img">
					<img src="images/lines.png" alt="" />
				</div>
				
			</div>
				<div class="drop-navigation drop-navigation">
				  <ul class="nav nav-sidebar">
					<li><a href="index.jsp" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
					<li><a href="shows.html" class="user-icon"><span class="glyphicon glyphicon-home glyphicon-blackboard" aria-hidden="true"></span>TV Shows</a></li>
					<li><a href="history.html" class="sub-icon"><span class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span>History</a></li>
					<li><a href="#" class="menu1"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>Movies<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a></li>
						<ul class="cl-effect-2">
							<li><a href="movies.html">English</a></li>                                             
							<li><a href="movies.html">Chinese</a></li>
							<li><a href="movies.html">Hindi</a></li> 
						</ul>
						<!-- script-for-menu -->
						<script>
							$( "li a.menu1" ).click(function() {
							$( "ul.cl-effect-2" ).slideToggle( 300, function() {
							// Animation complete.
							});
							});
						</script>
					<li><a href="#" class="menu"><span class="glyphicon glyphicon-film glyphicon-king" aria-hidden="true"></span>Sports<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a></li>
						<ul class="cl-effect-1">
							<li><a href="sports.html">Football</a></li>                                             
							<li><a href="sports.html">Cricket</a></li>
							<li><a href="sports.html">Tennis</a></li> 
							<li><a href="sports.html">Shattil</a></li>  
						</ul>
						<!-- script-for-menu -->
						<script>
							$( "li a.menu" ).click(function() {
							$( "ul.cl-effect-1" ).slideToggle( 300, function() {
							// Animation complete.
							});
							});
						</script>
					<li><a href="movies.html" class="song-icon"><span class="glyphicon glyphicon-music" aria-hidden="true"></span>Songs</a></li>
					<li><a href="news.html" class="news-icon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>News</a></li>
				  </ul>
				  <!-- script-for-menu -->
						<script>
							$( ".top-navigation" ).click(function() {
							$( ".drop-navigation" ).slideToggle( 300, function() {
							// Animation complete.
							});
							});
						</script>

				</div>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="show-top-grids" id="rusmeen">
                <div class="col-sm-6 single-left">
                        <%
                        String Channel_id=null;
                        String channel_name=null;
                        ResultSet rs=st.executeQuery("select * from channel where ucode='"+ucode+"' AND Block=0");
                        if(rs.next()){
                        %>
                        
                                <center> <h1>Upload New video</h1></center>
                                <form method="post" action="insertvideo.jsp" class="panel-body wrapper-lg">
                                <div class="form-group">
                                  <label class="control-label"> Tittle</label>
                                  <input type="text" name="tittle" class="form-control input-lg">
                                </div>
                                    <div class="form-group">
                                  <label class="control-label">Short Description</label>
                                  <textarea  name="shortdes" cols="50" rows="3"  class="form-control input-lg"></textarea>
                                </div>
                                    <div class="form-group">
                                  <label class="control-label">Full Description</label>
                                  <textarea name="fulldes" cols="50" rows="5" class="form-control input-lg"></textarea>
                                </div>
                                <div class="form-group">
                                      <select name="channel" class="control-label form-control"><option selected="" disabled>choose channel name</option>
                        <%   

                             ResultSet rs1=st.executeQuery("select * from channel where ucode='"+ucode+"' and Block=0");
                               while(rs1.next())
                               { 
                                channel_name=rs1.getString("cname");
                                Channel_id=rs1.getString("channel_id");
                        %>
                                         <option value="<%=Channel_id%>"><%=channel_name%></option>
                        <%
                                }
                        %>
                              </select>
                        </div>
                        <div class="form-group">
                            <center> <input type="submit" value="upload" class="btn btn-primary"></center>
                        </div>
                        </form>
                </div>
                              
                <%
                    }
                else{
                    %>
                     <div class="col-sm-6 single-left">  
                            <center> <h1>Create New Channel</h1></center>
                                        <form method="post" action="Create_Channel.jsp?ucode=<%=ucode%>" class="panel-body wrapper-lg">
                                            
                                           <div class="form-group">
                                               <input type="text" name="cname" placeholder="Enter Channel Name" required="required" class="form-control input-lg">
                                           </div>
                                             <center><button type="submit" class="btn btn-primary large">Submit</button></center>
                                         </form>
                    </div>   
                    <%
                       }
                    %>                
                <div class="col-md-6 single-right">
                <h3>Up Next</h3>
                        <div class="single-grid-right">
						
               <%
                    ResultSet rs1=st.executeQuery("select * from song where songId!='"+songId+"' order by RAND() ");
                    while(rs1.next()){
                       tittle=rs1.getString("tittle");
                       String songid=rs1.getString("songId");
               %> 
                        <div class="single-right-grids">
                            <div class="col-md-4 single-right-grid-left">
                                <a href="single.jsp?songid=<%=songid%>"><img src="user/video/<%=songid%>.jpg" alt="" /></a>
                            </div>
                            <div class="col-md-8 single-right-grid-right">
                                    <a href="single.jsp?songid=<%=songid%>" class="title"><%=tittle%></a>
                                    <p class="author"><a href="#" class="author">John Maniya</a></p>
                                    <p class="views">2,114,200 views</p>
                            </div>
                                    <div class="clearfix"> </div>
                        </div>              
							
            <%
            }
            %>
                                                              
							
                        </div>
                 </div>
            </div>
                        <div class="clearfix"> </div>		
            
			<!-- footer -->
			
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
             cn.close();
            }      
           catch(Exception e)
           {
               out.println(e.getMessage());
           }
 
    %>
  </body>
</html>