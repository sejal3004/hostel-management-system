<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%

if (session.getAttribute("username")==null) {
  response.sendRedirect("../html/studentlogin.html");
}



String email = (String) session.getAttribute("email");

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Hostel Management</title>

        <!-- Bootstrap Core CSS -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">


    </head>
    <body>

        <%
        try{

          String username = (String) session.getAttribute("username");

          Class.forName("com.mysql.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
          PreparedStatement pst = conn.prepareStatement("Select * from student_register_details where stud_username=?");

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
                          <li><a href="student_view_profile_tab.jsp"><i class="fa fa-eye fa-fw"></i> View Profile</a>
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
                                <a href="After_login_studentPortal.jsp"><i class="fa fa-dashboard fa-fw"></i><b>Student's Corner</b></a>
                            </li>
                          
                                <!-- /.nav-second-level -->
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header"><b>Write Your Complain Below</b></h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <div class="panel panel-default">
                                <div class="panel-heading">
                                   <strong>NOTE - </STRONG>Please Fill The Correct Details
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <form role="form" method="post" action="insert_complain_db.jsp">
                                                
                                                 <div class="form-group">
                                                    <label>Enter Your First Name</label>
                                                    <input class="form-control" name="firstname" placeholder="Enter text" required>
                                                </div>
                                                 <div class="form-group">
                                                    <label>Enter Your Last Name</label>
                                                    <input class="form-control" name="lastname" placeholder="Enter text" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Enter Your Room Number</label>
                                                    <input class="form-control" name="complainroomno" placeholder="Enter text" readonly value="<%=rs.getString("room_no")%>">
                                                </div>
                                                <div class="form-group">
                                                    <label>Write Your Complain</label>
                                                    <textarea class="form-control" rows="3" name="issue" placeholder="Enter Your Complain Short and Specific." required></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label>Enter Your Unique Hostel ID *</label>
                                                    <input class="form-control" name="complainhostelid" placeholder="Hostel ID" required>
                                                </div>
                                                <button type="submit" class="btn btn-default"><strong>SEND COMPLAINT</strong></button>
                                                <button type="reset" class="btn btn-default"><strong>RESET</strong></button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <%
              }
              else{out.println("record not exist");}
            } catch (Exception ex){
              out.println("unable to connect to database.");
            }
        %>
         <!-- jQuery -->
        <script src="../js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../js/startmin.js"></script>

    </body>
</html>
