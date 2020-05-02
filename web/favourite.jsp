<%@page import="java.sql.*,java.util.*"%>
 <%
        try
        { 
            String songid=request.getParameter("id");
            String email=null;
            Cookie c[]=request.getCookies();
            for(int i=0;i<c.length;i++){
                if(c[i].getName().equals("user")){
                    email=c[i].getValue();      
                    break;
                }
            }  
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
            Statement st = cn.createStatement();
            if(email!=null)
            {
                    ResultSet rs=st.executeQuery("select * from favourite where email='"+email+"' AND songId='"+songid+"'"); 
                    if(!rs.next())
                     {
                          PreparedStatement ps=cn.prepareStatement("insert into favourite values (?,?,?)");
                          ps.setString(2,songid);
                          ps.setString(1,email);
                          ps.setInt(3,1);
                          ps.execute();
                          ResultSet rs3=st.executeQuery("select * from favourite where email='"+email+"' AND songId='"+songid+"'");
                          if(rs3.next())
                          {
                          out.println(rs3.getString("favourite"));
                          }
                     }  
                    else
                    {
                            ResultSet rs1=st.executeQuery("select * from favourite where email='"+email+"' AND songId='"+songid+"' AND favourite=1");
                            if(rs1.next())
                              {
                                    st.execute("update favourite set favourite=0 where songId='"+songid+"' AND email='"+email+"'");
                                    ResultSet rs4=st.executeQuery("select * from favourite where email='"+email+"' AND songId='"+songid+"'");
                                    if(rs4.next())
                                    {
                                    out.println(rs4.getString("favourite"));
                                    }        
                              }
                            else{
                                   st.execute("update favourite set favourite=1 where songId='"+songid+"' AND email='"+email+"'");
                                   ResultSet rs5=st.executeQuery("select * from favourite where email='"+email+"' AND songId='"+songid+"'");
                                    if(rs5.next())
                                    {
                                    out.println(rs5.getString("favourite"));
                                    } 
                            }
                    }    
            }
            else
            {
                out.println("login");
            }
         cn.close();
        }
        catch(Exception e)
                         {
                          out.println(e.getMessage());        
                         } 
 %>                    