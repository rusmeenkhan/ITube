
<%@page import="java.sql.*,java.util.*"%>
<%
    try{
            String cname=request.getParameter("cname");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
            Statement st=cn.createStatement();
            
            if(request.getParameter("cname")==null)
            {
                        response.sendRedirect("index.jsp?channelnameRequired");
            }
             else{
                    ResultSet rs2=st.executeQuery("select * from channel where cname='"+cname+"'");
                    if(rs2.next()){
                        response.sendRedirect("index.jsp?channel_already_exists");
                    }
                    else{
                            java.util.Date d= new java.util.Date();
                            String Date=d.toString();
                            String ucode=request.getParameter("ucode");
                             ResultSet rs=st.executeQuery("select * from user where ucode='"+ucode+"'");
                             if(rs.next()){
                                    String cid="";
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
                                       cid+=l.get(i);
                                    }
                                     int channel=0;
                                    String email=rs.getString("email");
                                    PreparedStatement ps=cn.prepareStatement("insert into channel (email,cname,cdate,channel_id,ucode) values(?,?,?,?,?)");
                                    ps.setString(1,email);
                                    ps.setString(2,cname);
                                    ps.setString(3,Date);
                                    ps.setString(4,cid);
                                    ps.setString(5,ucode);
                                    ps.execute();
                                    ResultSet rs1=st.executeQuery("select count(*) from channel where ucode='"+ucode+"'");
                                    if(rs1.next()){
                                         channel=rs1.getInt(1); 
                                    }
                                    st.execute("update user set channels="+channel+" where ucode='"+ucode+"'");
                                    cn.close();
                                    response.sendRedirect("index.jsp?success=1");
                     }
                }
            }
    }
    catch(Exception e)
    {
      out.println(e.getMessage());
    }     
    %>