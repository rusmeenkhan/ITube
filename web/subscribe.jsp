<%@page import="java.sql.*,java.util.*"%>
 <%
        try
        { 
            String id=request.getParameter("id");
            String ucode=null;
            String songid=id.substring(id.indexOf("_")+1);
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
            ResultSet rs2=st.executeQuery("select * from user where  email='"+email+"'");
            if(rs2.next()){               
                     ucode=rs2.getString("ucode");
            }
          if(email!=null)
          {
            ResultSet rs=st.executeQuery("select * from song where  songId='"+songid+"'"); 
            if(rs.next()){               
                    String channelid=rs.getString("channelid");
                    ResultSet rs1=st.executeQuery("select * from subscribe where  channelid='"+channelid+"' AND ucode='"+ucode+"'"); 
                    if(!rs1.next())
                     {
                          PreparedStatement ps=cn.prepareStatement("insert into subscribe values (?,?,?)");
                          ps.setString(1,ucode);
                          ps.setString(2,channelid);
                          ps.setInt(3,1);
                          ps.execute();
                          out.println("Unsubscribe");
                     }  
                    else
                    {
                         st.execute("delete from subscribe where ucode='"+ucode+"' AND channelid='"+channelid+"'");  
                         out.println("Subscribe");
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