<%@page import="java.sql.*,java.util.*"%>
 <%
        try
        { 
            String ucode=request.getParameter("id");
            String rel=request.getParameter("rel");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
            Statement st = cn.createStatement();
            if(rel.equals("Block"))
            {
              st.execute("update user set Block='Unblock' where ucode='"+ucode+"'");
            }
            else{
                st.execute("update user set Block='Block' where ucode='"+ucode+"'");
            }
            
        } 
        catch(Exception e)
                         {
                          out.println(e.getMessage());        
                         } 
 %>                    