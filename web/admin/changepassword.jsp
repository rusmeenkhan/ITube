<%-- 
    Document   : changepassword
    Created on : 22 Dec, 2018, 4:58:18 PM
    Author     : rusmeen khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
                                String email=null;
                                Cookie c[]=request.getCookies();
                                for(int i=0;i<c.length;i++)
                                {
                                    if(c[i].getName().equals("admin"))
                                    {
                                        email=c[i].getValue();
                                        break;
                                    }
                                }
                                if(email==null)
                                {
                                    response.sendRedirect("admin_index.jsp");
                                }
                              else
                                    {
                                        try
                                        {
                                            String pass=request.getParameter("pass");
                                            String np=request.getParameter("np");
                                            String rp=request.getParameter("rp");
                                            if(np.equals(rp))
                                            {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Mp3","root","");
                                                    Statement st = cn.createStatement();
                                                    ResultSet rs=st.executeQuery("select * from admin where email='"+email+"'");
                                                    if(rs.next())
                                                     {
                                                            if(rs.getString("pass").equals(pass))
                                                            {
                                                              st.execute("update admin set pass='"+np+"' where email='"+email+"'");
                                                              response.sendRedirect("admin_main.jsp?passwordchanged");
                                                              out.println("Password changed Successfully");
                                                            }

                                                            else
                                                               {
                                                                 response.sendRedirect("Changepassword.jsp?currentpasswordnotmatch");
                                                                }
                                                     }
                                                    else
                                                    {
                                                      response.sendRedirect("admin_index.jsp?emailinvaid");  
                                                    }
                                            }
                                            else
                                            {
                                               response.sendRedirect("ChangePassword.jsp? password  mismatch"); 
                                            }
                                        }   
                                        catch(Exception e)
                                        {
                                          out.println(e.getMessage());  
                                        }
                                    }
                                %>
    </body>
</html>
