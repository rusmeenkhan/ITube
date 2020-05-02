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
<style>
    table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
</style>
<script>
   $(document).ready(function(){
       $("#search").keyup(function(){
           var v=$(this).val();
           $.post("search.jsp",{id:v},function(data){
                    //var abc=data;
                  $("#rusmeen").html(data);
                 // alert(data);
           });   
       });
   }); 
    
</script>
<script>
   $(document).ready(function(){
       $(".btn.btn-danger").click(function(){
           var v=$(this).attr("id");
           var u="d_"+v;
           $.post("delete_channel.jsp",{id:v},function(data){
               alert(u);
               $("#"+u).fadeOut(100);   
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
                            <li><a class="menu1"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>My Profile<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a></li>
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


                                    <!-- script-for-menu -->


                            <li><a href="logout.jsp" class="news-icon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>Logout?</a></li>
                      </ul>
                      <!-- script-for-menu -->

                            </div>
                  </div>    
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>My </span>Channels
			</h3>
			   <div class="form-control">
                               <table>
						<thead>
							<tr >
								<th>Channel Name</th>
								<th>Edit Channel</th>
								<th>Delete Channel</th> 
							</tr>
						</thead>				
                                                    <%
                                                       Class.forName("com.mysql.jdbc.Driver");
                                                       Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                                                       Statement st=cn1.createStatement();  
                                                       ResultSet rs1=st.executeQuery("select * from channel where ucode='"+ucode+"' AND Block='Block'");
                                                       while(rs1.next())
                                                         { 
                                                             String cname=rs1.getString("cname");
                                                             String channel_id=rs1.getString("channel_id");
                                                    %>
                                                    <tbody>
                                                        <tr id="d_<%=channel_id%>">
                                                            <td ><%=cname%></td>
                                                            <td> <a href="edit_channel.jsp?id=<%=channel_id%>" class="btn btn-danger" style="background-color:Blue;color:white;border:none">Edit channel</a></td>
                                                            <td> <button id="<%=channel_id%>" class="btn btn-danger" style="background-color:Red;color:white;border:none">Delete channel</button></td>
                                                        </tr>
                                                    </tbody>
                                                            <%
                                                            }
                                                            %>                                                                
                               </table>
                           </div>
        
	<div class="clearfix"> </div>
        </div>
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
</html>
  