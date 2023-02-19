<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<%

if (session.getAttribute("username")==null) {
  response.sendRedirect("../html/studentlogin.html");
}


String email = (String) session.getAttribute("email");
String fullname = (String) session.getAttribute("fullname");

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>The Virtual Manager</title>


        <!-- Bootstrap Core CSS -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../css/metisMenu.min.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="../css/timeline.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/startmin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="../css/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">

    </head>
    <body>
 <%
        try {
        
        String username = (String) session.getAttribute("username");


    
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
        PreparedStatement pst = conn.prepareStatement("Select stud_id from student_register_details where stud_username=?"); 

     
    pst.setString(1,username);     

ResultSet rs = pst.executeQuery();
if(rs.next()){
%>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="After_login_studentPortal.jsp"><span class="fa fa-bank"></span> Hostel Management</a>
                </div>

       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <ul class="nav navbar-right navbar-top-links">
                    
                      
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> Hey ${username} <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                          <li><a href="../jsp/student_view_profile_tab.jsp"><i class="fa fa-eye fa-fw"></i> View Profile</a>
                          </li>
                            <li><a href="../html/Home_page_site.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- /.navbar-top-links -->



                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">

                            <li>
                                <a href="After_login_studentPortal.jsp" class="active"><i class="fa fa-dashboard fa-fw"></i> Student Portal</a>
                            </li>
                   
                        </ul>
                    </div>
                </div>
            </nav>

            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header"><b>Student Portal</b></h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-user fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div><strong>Update User Profile</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="stud_update_prof_form.jsp">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-green">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-paper-plane fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div>Leave Application</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="stud_leave_appln_form.jsp">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-yellow">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-pencil-square-o fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div>Write Complains</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="../jsp/stud_complain_form.jsp">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-user fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div><strong>My Application Status</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="view_leave_appln_status_s.jsp?stud_id=<%=rs.getString("stud_id") %>">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-arrow-circle-right"></i> NOTE!
                                    <div class="pull-right">
                                        
                                    </div>
                                </div>
                                <pre>
        Note:
        1. Make sure your entire Hostel has a common unique
           hostel_id as it is the field which will keep you binded.
        2. Make sure to exit the browser after Logging out.
        3. Every time you Update your Profie, please enter every field
           to avoid storing null values.
        4. Once a complain or an Application has been sent, it cannot be unsent.
                                </pre>
                               <!-- likhoooooooo -->
                            </div>
            
                         
                    </div>

                </div>

            </div>

        </div>-->
        <!-- /#wrapper -->

          <% 
                }

                else{
                        out.println("record does not exist");
                    }
                }catch(Exception ex){

                        out.println("Unable to connect to database");
                }
             %>

        <!-- jQuery -->
        <script src="../js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../js/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="../js/raphael.min.js"></script>
        <script src="../js/morris.min.js"></script>
        <script src="../js/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../js/startmin.js"></script>

    </body>
</html>
