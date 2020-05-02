<%@page import="java.sql.*" %>
      <%
          try{
                String email=null;
                Cookie c[]=request.getCookies();
                for(int i=0;i<c.length;i++){
                    if(c[i].getName().equals("user")){
                        email=c[i].getValue();
                        break;
                    }
                }
                if(email==null){
                    response.sendRedirect("index.jsp");
                }
                else{
                        String pass=request.getParameter("pass");
                        String np=request.getParameter("np");
                        String rp=request.getParameter("rp");
                        if(np.equals(rp))
                        {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                                Statement st = cn.createStatement();
                                ResultSet rs=st.executeQuery("select * from user where email='"+email+"'");
                                if(rs.next())
                                 {
                                        if(rs.getString("pass").equals(pass))
                                        {
                                          st.execute("update user set pass='"+np+"' where email='"+email+"'");
                                          response.sendRedirect("index.jsp?passwordchanged");
                                        }

                                        else
                                           {
                                             response.sendRedirect("ChangePassword.jsp?current_password_not_match");
                                            }
                                 }
                                else
                                {
                                  response.sendRedirect("index.jsp?email_invaid");  
                                }
                        }
                        else
                        {
                           response.sendRedirect("ChangePassword.java?password_mismatch"); 
                        }
                } 
           }
            catch(Exception e)
            {
              out.println(e.getMessage());  
            }
                                    
    %>
    </body>
</html>
