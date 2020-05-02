<%-- 
    Document   : check
    Created on : 18 Dec, 2018, 3:34:16 PM
    Author     : Rusmeen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<%
    String email=null;
    String pass=null;
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("admin")){
            email=c[i].getValue();
            break;
        }
    }
    if(email==null){
        if(request.getParameter("email")==null){
            response.sendRedirect("admin_index.jsp?err=1");
        }
        else{
            email=request.getParameter("email");
        }
    }
    if(request.getParameter("pass")==null){
        response.sendRedirect("admin_index.jsp?pass required");
    }
    else {
           pass=request.getParameter("pass");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                        Statement st=cn.createStatement();
                        ResultSet rs=st.executeQuery("select * from admin where email='"+email+"'");
                        if(rs.next()){
                            if(rs.getString("pass").equals(pass)){
                                Cookie co=new Cookie("admin",email);
                                co.setMaxAge(6000);
                                response.addCookie(co);
                                session.setAttribute(email,pass);
                                session.setMaxInactiveInterval(1000);
                                response.sendRedirect("admin_index.jsp");
                            }
                            else{
                                response.sendRedirect("admin_index.jsp?passnotmatch");
                            }
                        }
                }
                catch(Exception e){
                    out.println(e.getMessage());
                }
            }
%>
