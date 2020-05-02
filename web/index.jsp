
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="java.sql.*" %>
<!DOCTYPE HTML>
<Html>
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
<script>
   $(document).ready(function(){
       $(".load_more").click(function(){
           var v=$(this).attr("id");  
           var p =parseInt(v)+1;
           $(".load_more").attr("id",p);
           
           var x=$(this).attr("rel");
           //alert(x);
           $.post("load_more.jsp",{id:v,subccode:x},function(data){
               if(data.length==29){
                 $(".load_more").fadeOut(10);
             }
             $("#rusmeen").append(data);
              
           });         
       });
   }); 
    
</script>
</head>
 <body>
     <%
           try{
                 String email=null;
                 Cookie c[]=request.getCookies();
                 for(int i=0;i<c.length;i++){
                    if(c[i].getName().equals("user")){
                     email=c[i].getValue();
                     break;
                     }
                 }   
                 String ucode =null;
               Class.forName("com.mysql.jdbc.Driver");
               Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
               Statement st=cn.createStatement(); 
                ResultSet rs1=st.executeQuery("select * from user where email='"+email+"'");
                if(rs1.next()){
                    ucode =rs1.getString("ucode");
                }
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
				<form  class="navbar-form navbar-right">
                                    <input type="text" id="search" class="form-control" placeholder="Search...">
					<input type="submit" value=" ">
				</form>
			</div>
            <%
            if(email!=null&&session.getAttribute(email)!=null){
            %>
                
                 <div id="navbar" class="navbar-collapse collapse">
                                 
                                 <div class="header-top-right">
                                         <div class="file">
                                             <a href="upload.jsp?id=<%=ucode%>">Upload</a>
                                         </div>	

                                         <div class="clearfix"> </div>
                                 </div>
                 </div>
                         <div class="clearfix"> </div>
               

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
                                                 <li><a href="logout.jsp" class="news-icon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>Logout?</a></li>
                                           </ul>
                                           <!-- script-for-menu -->
                                                         
                                                 </div>
                  </div>             
                 </div>
            
            <%
            }
            else
            {
            %>
                <div class="header-top-right">
                    <div class="signin">
                        <a href="#small-dialog2" class="play-icon popup-with-zoom-anim">Sign Up</a>
					<!-- pop-up-box -->
			<script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
                        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
			<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
									<!--//pop-up-box -->
			<div id="small-dialog2" class="mfp-hide">
                            <h3>Create Account</h3> 
                            <div class="social-sits">
				<div class="facebook-button">
                                    <a href="#">Connect with Facebook</a>
				</div>
				<div class="chrome-button">
                                    <a href="#">Connect with Google</a>
				</div>
				<div class="button-bottom">
                                    <p>Already have an account? <a href="#small-dialog" class="play-icon popup-with-zoom-anim">Login</a></p>
				</div>
                            </div>
                            <div class="signup">
                                <form method="post" action="insert.jsp">
                                    <input type="text" class="email" name="fname" placeholder="First  Name" />
                                    <input type="text" class="email" name="lname" placeholder="Last Name" />
                                    <input type="text" class="email" name="mob" placeholder="Mobile Number" />
                                    <input type="text" class="email" name="email" placeholder="Email" />
                                    <input type="Password" class="email" name="pass" placeholder="Enter Password" />
                                    <input type="Password" class="email" name="repass" placeholder="Retype Password" />
                                    <input type="submit" name="Register" value="Submit">
                                </form>
											
                            </div>
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
                            <div class="signin">
                                    <a href="#small-dialog" class="play-icon popup-with-zoom-anim">Sign In</a>
                                    <div id="small-dialog" class="mfp-hide">
                                            <h3>Login</h3>
                                            <div class="social-sits">
                                                    <div class="facebook-button">
                                                            <a href="#">Connect with Facebook</a>
                                                    </div>
                                                    <div class="chrome-button">
                                                            <a href="#">Connect with Google</a>
                                                    </div>
                                                    <div class="button-bottom">
                                                            <p>New account? <a href="#small-dialog2" class="play-icon popup-with-zoom-anim">Signup</a></p>
                                                    </div>
                                            </div>
                                            <div class="signup">
                                                <form method="post" action="check.jsp">
                                                            <input type="text" name="email" class="email" placeholder="Enter email " />
                                                            <input type="password" name="pass" placeholder="Password" required="required" />
                                                            <input type="submit"  value="LOGIN"/>
                                                    </form>
                                                    <div class="forgot">
                                                            <a href="#">Forgot password ?</a>
                                                    </div>
                                            </div>
                                            <div class="clearfix"> </div>
                                    </div>
                            </div>
                            <div class="clearfix"> </div>
                    </div>
            <%
             }   
            %>
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
                                                 <li><a href="logout.jsp" class="news-icon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>Logout?</a></li>
                                           </ul>
                                           <!-- script-for-menu -->
                                                         
                                                 </div>
                  </div>
					</div>
				</div>
       <%
                int ic=0;
                if(request.getParameter("id")!=null)
                {
                    ic=Integer.parseInt(request.getParameter("id"));
                    if(ic==-1){
                        ic=0;
                    }
                }
                String tittle=null;
                String shortDes=null;
                String fullDes=null;
                String songid=null;
                int start=ic*6;
                int sn=0;     
                ResultSet rs=st.executeQuery("select MAX(sn) from song where Block=0");
                if(rs.next())
                          { 
                              sn=rs.getInt(1);
                          }
                           sn=sn/6;  

                           if(sn%6==ic){
                           }
                           if(ic>sn){
                                 response.sendRedirect("index.jsp?exceed ok");
                           }     
                           String User_Name=null;
                            ResultSet rs2=st.executeQuery("select * from user where ucode='"+ucode+"'");
                            if(rs2.next()){
                             User_Name=rs2.getString("fname")+" "+rs2.getString("lname");
                            }
                        %>

        <div id="abc" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
			<div class="main-grids" >
				<div class="top-grids" id="rusmeen">
					<div class="recommended-info">
						<h3>All Videos</h3>
					</div>
                                    <% 
                                        ResultSet rs3=st.executeQuery("select * from song where Block=0 limit "+start+",6");
                                        while(rs3.next())
                                                  { 
                                                   tittle =rs3.getString("tittle");
                                                   shortDes =rs3.getString("shortDes");
                                                   fullDes =rs3.getString("fullDes");
                                                   songid =rs3.getString("songid");
                                                   email =rs3.getString("email");
                                                   String view =rs3.getString("view");
                                                   String channelname=rs3.getString("channelname");
                                                   String channelid=rs3.getString("channelid");
                                       %>
                                                                      <div class="col-md-4 resent-grid recommended-grid slider-top-grids" >
                                                                              <div class="resent-grid-img recommended-grid-img">
                                                                                  <a href="single.jsp?songid=<%=songid%>"><img src="user/video/<%=songid%>.jpg" class="img-responsive" alt="" style="width:100%;height:200px" /></a>
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
                                                                                              <li><p class="author author-info"><a href="Channel_vid.jsp?channelid=<%=channelid%>" class="author"><%=channelname%></a></p></li>
                                                                                              <li class="right-list"><p class="views views-info"><i class="glyphicon glyphicon-eye-open"><%=view%></i></p></li>
                                                                                      </ul>
                                                                              </div>
                                                                      </div>

                                               <%  
                                                   }               
                                                  %>
                                        <div class="clearfix"> </div>       
				</div>
                    <div >                      
							<div class="col-md-12 product-men mt-5">
                                                                    <button class="load_more" id="<%=ic+1%>" style="margin-top:150px;color:blue">Load More</button>
                                                        </div>                                                        
                    </div>
                        </div>             
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
    catch(Exception e){
        out.println(e.getMessage());
    }
   %>
  </body>
</Html>