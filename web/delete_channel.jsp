<%@page import="java.sql.*,java.util.*"%>
 <%
        try{ 
            String channel_id=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
            Statement st = cn.createStatement();
              st.execute("update channel set Block='unblock' where channel_id='"+channel_id+"'");
              st.execute("update song set Block='unblock' where channel_id='"+channel_id+"'");            
        } 
        catch(Exception e){
         out.println(e.getMessage());        
        } 
 %>                    