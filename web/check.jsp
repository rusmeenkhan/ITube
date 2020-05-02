<%-- 
    Document   : check
    Created on : 18 Dec, 2018, 3:34:16 PM
    Author     : Rusmeen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<%
    try{
            String email=null;
            String pass=null;
            Cookie c[]=request.getCookies();
            for(int i=0;i<c.length;i++){
                if(c[i].getName().equals("user")){
                    email=c[i].getValue();
                    break;
                }
            }
            if(email==null){
                if(request.getParameter("email")==null){
                    response.sendRedirect("index.jsp?email/pass_not_match");
                }
                else{
                    email=request.getParameter("email");
                }
            }
            if(request.getParameter("pass")==null){
                response.sendRedirect("index.jsp?password_required");
            }
            else{
                    pass=request.getParameter("pass");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                    Statement st=cn.createStatement();
                    ResultSet rs=st.executeQuery("select * from user where email='"+email+"' AND Block=0");
                    if(rs.next()){
                        if(rs.getString("pass").equals(pass)){
                            Cookie co=new Cookie("user",email);
                            co.setMaxAge(6000);
                            response.addCookie(co);
                            session.setAttribute(email,pass);
                            session.setMaxInactiveInterval(6000);
                            response.sendRedirect("index.jsp?login_successfull");
                        }
                        else{
                            response.sendRedirect("index.jsp?email/pass_not_match");
                        }
                    }
                    else{
                        response.sendRedirect("index.jsp?UserBlocked");
                    }
            }
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
            
%>
