
<%@page import="java.sql.*,java.util.*"%>

<%          
         try{
            String id=request.getParameter("id");                     
            int start=Integer.parseInt(id)*3+1;          
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
            Statement st1=cn1.createStatement();  
            ResultSet rs1=st1.executeQuery("select * from song where Block=0 limit "+start+",3");
            while(rs1.next())
                {
                    String view=rs1.getString("view");
                    String tittle=rs1.getString("tittle");
                    String songid=rs1.getString("songid"); 
                    String channelid=rs1.getString("channelid");
                    String channelname=rs1.getString("channelname");
                    
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
}
catch(Exception e)
    {
    out.println(e.getMessage());
    }
                %>
                
   
    