<%-- 
    Document   : logout
    Created on : Sep 20, 2018, 10:51:08 AM
    Author     : rusmeen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
            <% 
                Cookie ct=new Cookie("admin","");
                ct.setMaxAge(0);
                response.addCookie(ct);
                session.removeAttribute("email");
                response.sendRedirect("admin_index.jsp");
             %>
    </body>
</html>
