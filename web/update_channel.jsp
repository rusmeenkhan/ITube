
<%@page import="java.sql.*"%>
         <%
            String channel_id=request.getParameter("id");
            String email=null;
            Cookie c[]=request.getCookies();
            for(int i=0;i<c.length;i++)
            {
                if(c[i].getName().equals("user"))
                {
                    email=c[i].getValue();
                    break;
                }
            }
            if(email==null)
            {
                response.sendRedirect("index.jsp");
            }
            else
            {
                 try
                    {
                        String cname=request.getParameter("cname");
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root",""); 
                        Statement st = cn.createStatement();
                        st.execute("update channel set cname='"+cname+"' where channel_id='"+channel_id+"'");
                        st.execute("update song set channelname='"+cname+"' where channelid='"+channel_id+"'");
                        response.sendRedirect("index.jsp?updatesuccessfull");
                        cn.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e.getMessage());
                    }
            }
      %>
   
