<%@page import="java.sql.*,java.util.*"%>
 <%
        try{ 
            int likes=0;
            int dislikes=0;
            String ucode=null;
            String id=request.getParameter("id");
            String songid=id.substring(0,id.indexOf("_"));
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
            ResultSet rs3=st.executeQuery("select * from user where email='"+email+"'"); 
            if(rs3.next()){
                ucode=rs3.getString("ucode");
            }
            if(email!=null)
            {
                ResultSet rs=st.executeQuery("select * from dislike where ucode='"+ucode+"' AND songId='"+songid+"'"); 
                if(!rs.next()){
                        PreparedStatement ps=cn.prepareStatement("insert into dislike values (?,?,?)");
                        ps.setString(1,songid);
                        ps.setString(2,ucode);
                        ps.setInt(3,1);
                        ps.execute();
                        st.execute("delete from likes where ucode='"+ucode+"' AND songId='"+songid+"'");
                        ResultSet rs1=st.executeQuery("select count(*) from likes where likes=1 AND songId='"+songid+"'"); 
                        if(rs1.next()){
                            likes=rs1.getInt(1);
                        }
                        ResultSet rs2=st.executeQuery("select count(*) from dislike where dislikes=1 AND songId='"+songid+"'"); 
                        if(rs2.next()){
                            dislikes=rs2.getInt(1);
                        }
                        out.println(likes+"_"+dislikes+"-"+1);             
                    }
                else{
                        st.execute("delete from dislike where ucode='"+ucode+"' AND songId='"+songid+"'");
                        ResultSet rs1=st.executeQuery("select count(*) from likes where likes=1 AND songId='"+songid+"'"); 
                        if(rs1.next()){
                            likes=rs1.getInt(1);
                        }
                        ResultSet rs2=st.executeQuery("select count(*) from dislike where dislikes=1 AND songId='"+songid+"'"); 
                        if(rs2.next()){
                            dislikes=rs2.getInt(1);
                        }
                        out.println(likes+"_"+dislikes+"-"+0);
                    }
            }
            else
            {
                out.println("login");
            }
            cn.close();
        }
        catch(Exception e){
                          out.println(e.getMessage());        
        } 
 %>                       
     
     
                       