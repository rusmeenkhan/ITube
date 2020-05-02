<%@page import="java.sql.*,java.util.*"%>
 <%
        try
        { 
            String channel_id=request.getParameter("id");
            String rel=request.getParameter("rel");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
            Statement st = cn.createStatement();
            if(rel.equals("Block"))
            {
              st.execute("update channel set Block='Unblock' where channel_id='"+channel_id+"'");
            }
            else{
                st.execute("update channel set Block='Block' where channel_id='"+channel_id+"'");
            }
            
        } 
        catch(Exception e)
                         {
                          out.println(e.getMessage());        
                         } 
 %>                    