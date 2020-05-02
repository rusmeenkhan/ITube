<%@page import="java.sql.*" %>
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

     <% 
      try{
       String email=null;
       String item=request.getParameter("id");
        Cookie c[]=request.getCookies();
        for(int i=0;i<c.length;i++){
            if(c[i].getName().equals("user")){
                email=c[i].getValue();
                break;
            }
        }
                try{

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                        Statement st=cn.createStatement();
                        String a[]=item.split(" ");
                        //String tittle=null;
                       
                       
                        String sql="select * from song where tittle='"+item+"'";
                        for(int i=0;i<a.length;i++)
                        {
                            sql+="OR tittle like '"+a[i]+"%' OR tittle like '%"+a[i]+"' OR tittle like '%"+a[i]+"%' OR channelname like '"+a[i]+"%' OR channelname like '%"+a[i]+"'  OR channelname like '%"+a[i]+"%' OR shortDes like '"+a[i]+"%' OR shortDes like '%"+a[i]+"'  OR shortDes like '%"+a[i]+"%'";
                        }
                        ResultSet rs=st.executeQuery(sql);
                         %>
                        <div class="main-grids">
				<div class="top-grids">
					<div class="recommended-info">
						<h3>All Videos</h3>
					</div>
                        <%
                        while(rs.next())
                           { 
                               String songid=rs.getString("songId");
                               String tittle =rs.getString("tittle");
                               String channelname=rs.getString("channelname");
                               String channelid=rs.getString("channelid");
                              %> 
                           <div class="col-md-4 resent-grid recommended-grid slider-top-grids">
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
								<li><p class="author author-info"><a href="Channel_vid.jsp?channelid=<%=channelid%>" class="author"><%=channelname%></a></p></li>
                                                                <li class="right-list"><p class="views views-info"><i class="glyphicon glyphicon-eye-open">220</i></p></li>
							</ul>
						</div>
		           </div>
                                  <%
                           }  
%>
					<div class="clearfix"> </div>
				</div>

			</div>


<%
                        cn.close();
                   }
                     catch(Exception e)
                     {
                         out.println(e.getMessage());
                     }
        
      }
           catch(Exception e)
                     {
                         out.println(e.getMessage());
                     }

               %>