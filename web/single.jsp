<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="java.sql.*"  %>
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
<script>
  $(document).ready(function(){
      $(".glyphicon.glyphicon-thumbs-up").click(function(){
          var v2= $(this).attr("id");
          var v1=v2.substring(0,v2.indexOf("_"))+"_g";
          //alert(x);
          $.post("likes.jsp",{id:v2},function(data){
                       var p=data.trim();
                       if(p=="login"){
                           $("#login").modal();
                       }
                       else
                       {
                            var f= data.substring(0,data.indexOf("_")).trim();
                             var s = data.substring(data.indexOf("_")+1,data.indexOf("-")).trim();
                             var g= data.substring(data.indexOf("-")+1).trim();
                             //alert(g);
                            if(g=="0"){
                                $("#"+v2).css("color","black");
                                $("#"+v1).css("color","black");
                            }
                            else{
                                $("#"+v2).css("color","blue");
                                $("#"+v1).css("color","black");
                            }

                            $(".glyphicon.glyphicon-thumbs-up").html(f);
                            $(".glyphicon.glyphicon-thumbs-down").html(s);  
                        }
    });
      });
      $(".glyphicon.glyphicon-thumbs-down").click(function(){
          var v1= $(this).attr("id");
          var v2=v1.substring(0,v1.indexOf("_"))+"_f";
          $.post("dislikes.jsp",{id:v1},function(data){
                        var p=data.trim();
                       if(p=="login"){
                           $("#login").modal();
                       }
                       else
                       {
                            var f= data.substring(0,data.indexOf("_")).trim();
                            var s = data.substring(data.indexOf("_")+1,data.indexOf("-")).trim();
                            var g= data.substring(data.indexOf("-")+1).trim();
                            //alert(g);
                           if(g=="0"){
                               $("#"+v2).css("color","black");
                               $("#"+v1).css("color","black");
                           }
                           else{
                               $("#"+v1).css("color","blue");
                               $("#"+v2).css("color","black");
                           }

                           $(".glyphicon.glyphicon-thumbs-up").html(f);
                           $(".glyphicon.glyphicon-thumbs-down").html(s);  
                       }
    });
      });
  });
  </script>
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
      $(".glyphicon.glyphicon-heart").click(function(){
          var v = $(this).attr("id"); 
          $.post("favourite.jsp",{id:v},function(data){ 
                     var p=data.trim();
                     if(p=="login")
                     {
                       $("#login").modal();  
                     }
                    else{
                        var f=data.trim();                    
                        //$(".glyphicon.glyphicon-heart").html(f);
                        if(f=="1"){
                             $("#"+v).css("color","white");
                         }
                         else{
                             $("#"+v).css("color","white");
                         }
                     }
    });
      });
  });
</script>
<script>
  $(document).ready(function(){
      $(".btn.btn-danger").click(function(){
          var v = $(this).attr("id"); 
          $.post("subscribe.jsp",{id:v},function(data){
                     var g=data.trim();
                     if(g=="login")
                     {
                        $("#login").modal();  
                     }
                     else
                     {
                        var f= data.trim();  
                        if(f==="Unsubscribe"){
                            $("#"+v).css("color","Blue");
                            $(".btn.btn-danger").html(f);
                        }
                        else{
                            $("#"+v).css("color","White");
                            $(".btn.btn-danger").html(f);
                        }
                            
                     }
                     
    });
      });
  });
</script>

<!--start-smoth-scrolling-->
<!-- fonts -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- //fonts -->
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
                String ucode=null;
                String shortDes=null;
                String fullDes=null;
                int view=0;
                String channelid=null;
                String tittle=null;
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                Statement st=cn.createStatement();
                ResultSet rs7=st.executeQuery("select * from user where email='"+email+"'");
                if(rs7.next()){
                    ucode=rs7.getString("ucode");
                }
                ResultSet rs=st.executeQuery("select * from song where songid='"+songId+"'");
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
				
			</div>
        </div>			

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="show-top-grids" id="rusmeen">
				<div class="col-sm-8 single-left">
					<div class="song">
						<div class="song-info">
         <% if(rs.next())
                    { 
                     tittle =rs.getString("tittle");
                     channelid=rs.getString("channelid");
                     shortDes =rs.getString("shortDes");
                     fullDes =rs.getString("fullDes");
                     songId =rs.getString("songId");
                     view =Integer.parseInt(rs.getString("view"));
         %>
			<h3><%=tittle%></h3>
                                                        						
					</div>
                        
						<div class="video-grid">
                                                    <video style="width:100%; height: auto" controls autoplay>
                                                        <img src="user/video/<%=songId%>.jpg">
                                                        <source src="user/video/<%=songId%>.mp4">
                                                        <source src="user/video/<%=songId%>.ogg">
                                                        
                                                    </video>
                                                        
						</div>
					</div>
					<div class="song-grid-right">
						
					</div>
					
					<div class="published">
                                            <div class="share">
              <%
                        view=view+1;
                        Statement st1=cn.createStatement();
                        st1.execute("update song set view='"+view+"' where songId='"+songId+"'");
        %>
              	<div class="modal fade" id="login" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
                        <div class="modal-header"><center><h2>Login Here </h2></center></div>
                        <div class="modal-body" >
                            		<div>
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
                                                                 <%
                                                                 if(email!=null){
                                                                     out.println(email+"<br>");
                                                                 }
                                                                  else
                                                                  {
                                                                      %>
                                                                <input type="text" name="email" class="email" placeholder="Enter email" required="required">
                                                              
                                                                      <%
                                                                          }
                                                                      %>
								
								<input type="password" name="pass" placeholder="Password" required="required">
								<input type="submit"  value="LOGIN"/>
							</form>
							<div class="forgot">
								<a href="#">Forgot password ?</a>
							</div>
						</div>
                                        <div class="clearfix"> </div>
					</div>
						</div>
                    </div>
					</div>
	</div>  
        <%
          int liked=0;
          int dislike=0;
          ResultSet rs1=st.executeQuery("select count(*) from likes where songid='"+songId+"'  AND likes=1");
          if(rs1.next()){
              liked=rs1.getInt(1);
          }
          ResultSet rs2=st.executeQuery("select count(*) from dislike where songid='"+songId+"' AND dislikes=1");
          if(rs2.next()){
              dislike=rs2.getInt(1);
          }           
   if(email==null&&session.getAttribute(email)==null){
       %>
       <div class="col-sm-4">
	    <span><i class="glyphicon glyphicon-eye-open"> <%=view%></i></span> 
        </div>
        <div class="col-sm-2">
          <span  style="cursor:pointer"><i id="<%=songId%>"  class="glyphicon glyphicon-heart"> <%=liked%></i></span>
       </div>
       <div class="col-sm-2">
          <span  style="cursor:pointer" ><i id="<%=songId%>_f" class="glyphicon glyphicon-thumbs-up"> <%=liked%></i></span>
       </div>
       <div class="col-sm-2">
          <span style="cursor:pointer" ><i id="<%=songId%>_g" class="glyphicon glyphicon-thumbs-down"> <%=dislike%></i></span>
       </div>
       <div class="col-sm-2">
           <a id="s_<%=songId%>" class="btn btn-danger">Subscribe</a>
       </div>
       <div class="clearfix">
       </div>
       <%   
           
      }
   else
   {
     %>
        <div class="col-sm-4">
	    <span><i class="glyphicon glyphicon-eye-open"> <%=view%></i></span> 
        </div>
        <%
                    ResultSet rs3=st.executeQuery("select * from favourite where songid='"+songId+"' AND ucode='"+ucode+"' AND favourite=1");
                    if(rs3.next()){
        %>
       <div class="col-sm-2">
          <span  style="cursor:pointer"><i id=<%=songId%>  style="color:red" class="glyphicon glyphicon-heart">Favourite</i></span>
       </div>
       <%
       }
    else{
       %>
        <div class="col-sm-2">
          <span  style="cursor:pointer"><i id=<%=songId%>  style="color:black" class="glyphicon glyphicon-heart">Favourite</i></span>
       </div>
       <%
       }
       ResultSet rs4=st.executeQuery("select * from likes where songid='"+songId+"' AND ucode='"+ucode+"' AND likes=1");
       if(rs4.next()){
       %>
       <div  class="col-sm-2">
           <i id="<%=songId%>_f"  rel="l" class="glyphicon glyphicon-thumbs-up" style="color:blue;cursor:pointer"> <%=liked%></i>
       </div>
       <%
       }
  else{
       %>
        <div class="col-sm-2">
           <i id="<%=songId%>_f" rel="l" class="glyphicon glyphicon-thumbs-up" style="color:black;cursor:pointer"> <%=liked%></i>
       </div>
       <%
       }
       ResultSet rs5=st.executeQuery("select * from dislike where songid='"+songId+"' AND ucode='"+ucode+"' AND dislikes=1");
       if(rs5.next()){
       %>
       <div class="col-sm-2">
           <i id="<%=songId%>_g" rel="d" class="glyphicon glyphicon-thumbs-down" style="cursor:pointer;color:blue"> <%=dislike%></i>
       </div>
       <%
       }
else{
       %>
              <div class="col-sm-2">
           <i id="<%=songId%>_g" rel="d" class="glyphicon glyphicon-thumbs-down" style="cursor:pointer;color:black"> <%=dislike%></i>
       </div>
       <%
       }
       ResultSet rs6=st.executeQuery("select * from subscribe where channelid='"+channelid+"' AND ucode='"+ucode+"' AND subscribe=1");
       if(rs6.next()){
       %>
       <div  class="col-sm-2">
           <a id="s_<%=songId%>" class="btn btn-danger" style="color:white">Unsubscribe</a>
       </div>
       <%
       }
else{
       %>
       <div  class="col-sm-2">
           <a id="s_<%=songId%>" class="btn btn-danger" style="color:white">Subscribe</a>
       </div>
       <%
       }
       %>
       <div class="clearfix">
       </div>
   <%
     }
        }
       
   %>
   
                                            </div>
						<script src="jquery.min.js"></script>
							<script>
								$(document).ready(function () {
									size_li = $("#myList li").size();
									x=1;
									$('#myList li:lt('+x+')').show();
									$('#loadMore').click(function () {
										x= (x+1 <= size_li) ? x+1 : size_li;
										$('#myList li:lt('+x+')').show();
									});
									$('#showLess').click(function () {
										x=(x-1<0) ? 1 : x-1;
										$('#myList li').not(':lt('+x+')').hide();
									});
								});
							</script>
                                                        </div>
							<div class="load_more">	
								<ul id="myList">
									<li> 
										<h4 margin-top:50px>Short Description</h4>
										<p><%=shortDes%></p>
                                                                                <h4>Full Description</h4>
										<p><%=fullDes%></p>
									</li>
									<li>
										<p>Nullam fringilla sagittis tortor ut rhoncus. Nam vel ultricies erat, vel sodales leo. Maecenas pellentesque, est suscipit laoreet tincidunt, ipsum tortor vestibulum leo, ac dignissim diam velit id tellus. Morbi luctus velit quis semper egestas. Nam condimentum sem eget ex iaculis bibendum. Nam tortor felis, commodo faucibus sollicitudin ac, luctus a turpis. Donec congue pretium nisl, sed fringilla tellus tempus in.</p>
										<p>Nullam fringilla sagittis tortor ut rhoncus. Nam vel ultricies erat, vel sodales leo. Maecenas pellentesque, est suscipit laoreet tincidunt, ipsum tortor vestibulum leo, ac dignissim diam velit id tellus. Morbi luctus velit quis semper egestas. Nam condimentum sem eget ex iaculis bibendum. Nam tortor felis, commodo faucibus sollicitudin ac, luctus a turpis. Donec congue pretium nisl, sed fringilla tellus tempus in.</p>
										<div class="load-grids">
											<div class="load-grid">
												<p>Category</p>
											</div>
											<div class="load-grid">
												<a href="movies.html">Entertainment</a>
											</div>
										</div>
									</li>
								</ul>
							</div>
					<div class="all-comments">
						<div class="all-comments-info">
							<a href="#">All Comments (8,657)</a>
							<div class="box">
								<form>
									<input type="text" placeholder="Name" required=" ">			           					   
									<input type="text" placeholder="Email" required=" ">
									<input type="text" placeholder="Phone" required=" ">
									<textarea placeholder="Message" required=" "></textarea>
									<input type="submit" value="SEND">
									
								</form>
							</div>
							<div class="all-comments-buttons">
								<ul>
									<li><a href="#" class="top">Top Comments</a></li>
									<li><a href="#" class="top newest">Newest First</a></li>
									<li><a href="#" class="top my-comment">My Comments</a></li>
								</ul>
							</div>
						</div>
						<div class="media-grids">
							<div class="media">
								<h5>Tom Brown</h5>
								<div class="media-left">
									<a href="#">
										
									</a>
								</div>
								<div class="media-body">
									<p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
									<span>View all posts by :<a href="#"> Admin </a></span>
								</div>
							</div>
							<div class="media">
								<h5>Mark Johnson</h5>
								<div class="media-left">
									<a href="#">
										
									</a>
								</div>
								<div class="media-body">
									<p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
									<span>View all posts by :<a href="#"> Admin </a></span>
								</div>
							</div>
							<div class="media">
								<h5>Steven Smith</h5>
								<div class="media-left">
									<a href="#">
										
									</a>
								</div>
								<div class="media-body">
									<p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
									<span>View all posts by :<a href="#"> Admin </a></span>
								</div>
							</div>
							<div class="media">
								<h5>Marry Johne</h5>
								<div class="media-left">
									<a href="#">
										
									</a>
								</div>
								<div class="media-body">
									<p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
									<span>View all posts by :<a href="#"> Admin </a></span>
								</div>
							</div>
							<div class="media">
								<h5>Mark Johnson</h5>
								<div class="media-left">
									<a href="#">
										
									</a>
								</div>
								<div class="media-body">
									<p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
									<span>View all posts by :<a href="#"> Admin </a></span>
								</div>
							</div>
							<div class="media">
								<h5>Mark Johnson</h5>
								<div class="media-left">
									<a href="#">
										
									</a>
								</div>
								<div class="media-body">
									<p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
									<span>View all posts by :<a href="#"> Admin </a></span>
								</div>
							</div>
							<div class="media">
								<h5>Peter Johnson</h5>
								<div class="media-left">
									<a href="#">
										
									</a>
								</div>
								<div class="media-body">
									<p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
									<span>View all posts by :<a href="#"> Admin </a></span>
								</div>
							</div>
						</div>
					</div>
                                </div>
				        <div class="col-md-4 single-right">
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
                        <div class="clearfix"> </div>		
                        </div>
			<!-- footer -->
			<div class="footer">
				<div class="footer-grids">
					<div class="footer-top">
						<div class="footer-top-nav">
							<ul>
								<li><a href="about.html">About</a></li>
								<li><a href="press.html">Press</a></li>
								<li><a href="copyright.html">Copyright</a></li>
								<li><a href="creators.html">Creators</a></li>
								<li><a href="#">Advertise</a></li>
								<li><a href="developers.html">Developers</a></li>
							</ul>
						</div>
						<div class="footer-bottom-nav">
							<ul>
								<li><a href="terms.html">Terms</a></li>
								<li><a href="privacy.html">Privacy</a></li>
								<li><a href="#small-dialog4" class="play-icon popup-with-zoom-anim">Send feedback</a></li>
								<li><a href="privacy.html">Policy & Safety </a></li>
								<li><a href="try.html">Try something new!</a></li>
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
							<li><a href="history.html" class="f-history">History</a></li>
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
        cn.close(); }
                 
           catch(Exception e)
           {
               out.println(e.getMessage());
           }
 
    %>
  </body>
</html>