
<%@page import="java.sql.*,java.util.*"%>

<%
    String channelid=request.getParameter("channel");
    String email=null;
    String ucode=null;
    String channel_name=null;
     try
     {       
            Cookie ch[]=request.getCookies();
            for(int i=0;i<ch.length;i++){
                if(ch[i].getName().equals("user")){
                    email=ch[i].getValue();
                    break;
                }

            }
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");       
            Statement st=cn.createStatement();
            ResultSet rs=st.executeQuery("select * from user where email='"+email+"'");
            if(rs.next()){
                ucode=rs.getString("ucode");
            }
            ResultSet rs1=st.executeQuery("select * from channel where channel_id='"+channelid+"'");
            if(rs1.next()){
                channel_name=rs1.getString("cname");
            }
                if(request.getParameter("tittle")==null||request.getParameter("shortdes")==null||request.getParameter("fulldes")==null)
                {
                      response.sendRedirect("upload.jsp?all field required");
                }
                else{                  
                        String songid="";
                        LinkedList l=new LinkedList();
                        for(char c='a';c<='z';c++)
                        {
                            l.add(c+"");
                        }
                         for(char c='A';c<='Z';c++)
                        {
                            l.add(c+"");
                        }
                          for(char c='0';c<='9';c++)
                        {
                            l.add(c+"");
                        }
                        Collections.shuffle(l);
                         for(int i=1;i<=5;i++)
                        {
                           songid+=l.get(i);

                        }
                        java.util.Date d= new java.util.Date();
                        String Date=d.toString();
                        String tittle=request.getParameter("tittle");
                        String shortdes=request.getParameter("shortdes");
                        String fulldes=request.getParameter("fulldes");                       
                        PreparedStatement ps=cn.prepareStatement("insert into song (tittle,channelid,shortDes,fullDes,date,songId,email,ucode,channelname) values(?,?,?,?,?,?,?,?,?)");
                        ps.setString(1,tittle);
                        ps.setString(2,channelid);
                        ps.setString(3,shortdes);
                        ps.setString(4,fulldes);
                        ps.setString(5,Date);
                        ps.setString(6,songid);
                        ps.setString(7,email);
                        ps.setString(8,ucode);
                        ps.setString(9,channel_name);
                        ps.execute();
                        cn.close();
                        response.sendRedirect("upload_video.jsp?songid="+songid);
                    }
        }
        catch(Exception e)
           {
               out.println(e.getMessage());
           }           
        %>
    