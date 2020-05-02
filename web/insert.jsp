
<%@page import="java.sql.*,java.util.*"%>
<%
    try{  
            String fname=request.getParameter("fname");
            String lname=request.getParameter("lname");
            String email=request.getParameter("email");
            String mob=request.getParameter("mob");
            String pass=request.getParameter("pass");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
            Statement st=cn.createStatement();
            ResultSet rs=st.executeQuery("select * from user where email='"+email+"'");
            if(rs.next()){
                response.sendRedirect("index.jsp?Email_already_registered");
            }
            else{
                if(request.getParameter("fname")==null||request.getParameter("lname")==null||request.getParameter("mob")==null||request.getParameter("email")==null||request.getParameter("pass")==null||request.getParameter("repass")==null){
                            response.sendRedirect("login.jsp?all field required");
                }
                else{ 
                    if(request.getParameter("pass").equals(request.getParameter("repass"))){
                            String s="";
                            LinkedList l=new LinkedList();
                            for(char c='a';c<='z';c++){
                                l.add(c+"");
                            }
                             for(char c='A';c<='Z';c++){
                                l.add(c+"");
                            }
                            for(char c='0';c<='9';c++){
                                l.add(c+"");
                            }
                            Collections.shuffle(l);
                             for(int i=1;i<=5;i++){
                               s+=l.get(i);

                            }
                            PreparedStatement ps=cn.prepareStatement("insert into user (fname,lname,mob,email,pass,ucode) values(?,?,?,?,?,?)");
                            ps.setString(1,fname);
                            ps.setString(2,lname);
                            ps.setString(3,mob);
                            ps.setString(4,email);
                            ps.setString(5,pass);
                            ps.setString(6,s);
                            ps.execute();
                            cn.close();
                            Cookie co=new Cookie("user",email);
                            co.setMaxAge(6000);
                            response.addCookie(co);
                            session.setAttribute(email,pass);
                            session.setMaxInactiveInterval(6000);
                            response.sendRedirect("index.jsp?login_successfull");
                    }
                    else{
                        response.sendRedirect("index.jsp");
                    }
               }
           }
     }
    catch(Exception e){
        out.println(e.getMessage());
    }

    %>