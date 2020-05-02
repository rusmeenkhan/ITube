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
                        ResultSet rs=st.executeQuery("select * from Song where Block=0");
                        %>
                        
              <div class="albums" id="rusmeen">

                                                    <%
                                                                 String tittle=null;
                                                                 String songId=null;
                                                                 while(rs.next())
                                                                    {   
                                                                       tittle=rs.getString("tittle");
                                                                       songId=rs.getString("songId");
                                                                        //String songid=rs.getString("songId");                  
                                                        %>
								<div class="col-md-3 content-grid">
                                                                    <a href="single.jsp?songid=<%=songId%>"> <img src="user/video/<%=songId%>.jpg" width="180px" height="180px"><%=tittle%> </a>
								
							        </div>
										
                                                                    <%
                                                                       }
                                                                    %>
                                                                                                                     <div class="col-md-6">
						  <ul class="pager">
                                                    <li id="Previous" class="btn btn-primary" style="cursor:pointer">Previous</li> 
                                                  </ul>
                                                </div>
                                                <div class="col-md-6">
						    <ul class="pager">  
                                                      <li id="Next" class="btn btn-danger"><a href="#">Next</a></li>
                                                    </ul>
                                                </div>
                                                                    	<div class="clearfix"> </div>
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