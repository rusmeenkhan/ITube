
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<%@page import="java.sql.*"%>
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sufee Admin - HTML5 Admin Template</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="vendors/jqvmap/dist/jqvmap.min.css">


    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

</head>

<body>
    <%
        String email=null;
        Cookie c[]=request.getCookies();
        for(int i=0;i<c.length;i++){
            if(c[i].getName().equals("admin")){
                email=c[i].getValue();
                //out.println(email);
                break;
            }
        }
        
        if(email==null && session.getAttribute(email)==null){           
            %>
        <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                    <a href="index.html">
                        <img class="align-content" src="images/logo.png" alt="">
                    </a>
                </div>
                <div class="login-form">
                    <form method="post" action="check1.jsp">
                        <div class="form-group">
                            <label>Email address</label>
                            <input type="email" name="email" class="form-control" placeholder="Email">
                        </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" name="pass" class="form-control" placeholder="Password">
                        </div>
                                <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Sign in</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
            <%
            }
        else{
            %>


    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="admin_index.jsp"><img src="images/logo.png" alt="Logo"></a>
                <a class="navbar-brand hidden" href="admin_index.jsp"><img src="images/logo2.png" alt="Logo"></a>
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav"> 
                    <li>
                        <a href="user.jsp"> <i class="menu-icon fa fa-users"></i>Manage Users</a>   
                    </li>
                    <li>
                        <a href="Videos.jsp"> <i class="menu-icon fa fa-video-camera"></i> Manage Videos </a>   
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                    
                </div>

                <div class="col-sm-5">
                    <div class="user-area dropdown float-right">
                        <a href="admin_index.jsp" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="images/admin.jpg" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="changepass.jsp"><i class="fa fa-edit"></i>Change Password</a>         
                            <a class="nav-link" href="logout.jsp"><i class="fa fa-power-off"></i> Logout</a>
                        </div>
                    </div>

                </div>
            </div>

        </header><!-- /header -->
        <!-- Header-->
        <div class="col-md-12-offset-md-4" style="margin-left: 100px;margin-top: 20px">                               
            <table class="table">
                   <thead>
                          <tr>
                               <th>Channel Name</th>
                               <th>No. of Uploads</th>
                               <th>Block Channel</th>
                               <th>More</th>
                               <th></th>
                         </tr>
                  </thead>
                               <%  
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                                        Statement st=cn.createStatement();
                                        ResultSet rs=st.executeQuery("select distinct channelid from song where Block=0");
                                        while(rs.next())
                                           { 
                                             String  channelid=rs.getString("channelid");
                                                   Class.forName("com.mysql.jdbc.Driver");
                                                   Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                                                   Statement st1=cn1.createStatement();
                                                   ResultSet rs2=st1.executeQuery("select channelname from song where channelid='"+channelid+"'");
                                                   if(rs2.next()){
                                                      String channelname=rs2.getString(1);
                                                   Class.forName("com.mysql.jdbc.Driver");
                                                   Connection cn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                                                   Statement st2=cn2.createStatement();
                                                    ResultSet rs1=st2.executeQuery("select count(*) from song where channelid='"+channelid+"'");
                                                    while(rs1.next())
                                                      {
                                                         int songs=rs1.getInt(1);   
                                           %>

                                                    <tbody>
                                                      <tr> 
                                                        <td><%=channelname%></td>
                                                        <td><%=songs%></td>
                                                        <%
                                                           } 
                                                           
                                                        %>
                                                        <td><a href="Block_channel.jsp?channelid=<%=channelid%>"><button class="btn btn-danger">Block Channel </button></a></td>
                                                        <td><a href="open_album.jsp?channelid=<%=channelid%>"><button class="btn btn-info">Open Channel </button></a></td>
                                                      </tr>
                                                    </tbody>
                                                    <%
                                                      }
                                                        }
                                                     %>
                                                  </table>                                                                        
                                         </div> 										
      
    </div><!-- /#right-panel -->

    <!-- Right Panel -->

    <script src="vendors/jquery/dist/jquery.min.js"></script>
    <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>


    <script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
    <script src="assets/js/dashboard.js"></script>
    <script src="assets/js/widgets.js"></script>
    <script src="vendors/jqvmap/dist/jquery.vmap.min.js"></script>
    <script src="vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script>
        (function($) {
            "use strict";

            jQuery('#vmap').vectorMap({
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: ['#1de9b6', '#03a9f5'],
                normalizeFunction: 'polynomial'
            });
        })(jQuery);
    </script>
<%
}
%>
</body>

</html>
