<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%


if (session.getAttribute("username")==null) {
  response.sendRedirect("../html/wardenlogin.html");
}

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

        <!-- Custom CSS -->
        <link href="../css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">

        
    </head>
    <body>


<%
    try{

        String username = (String) session.getAttribute("username");

        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
        PreparedStatement pst = conn.prepareStatement("Select * from warden_register_details where warden_username=?");


        pst.setString(1, username);

       
        ResultSet rs = pst.executeQuery();
        if(rs.next())
        {

 %>  

    <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="After_login_wardenPortal.jsp"><span class="fa fa-bank"></span> Hostel Management</a>
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
                          <li><a href="warden_view_profile_tab.jsp"><i class="fa fa-eye fa-fw"></i> View Profile</a>
                          </li>
                            <li><a href="../jsp/Home_page_site.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">

                            <li>
                                <a href="Warden.html"><i class="fa fa-dashboard fa-fw"></i><b>Warden Portal</b></a>
                            </li>
                            
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
                            <h1 class="page-header"><b>Update Your Profile</b></h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <div class="panel panel-default">
                                <div class="panel-heading">
                                   <strong>NOTE - </STRONG>Enter The Correct Details
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <form role="form" action="update_tbl_warden_prof.jsp" method="post">
                                                <div class="form-group">
                                                    <label>Your First Name</label>
                                                    <input class="form-control" placeholder="Enter text" name="wardenfirstname" value="<%=rs.getString("warden_first_name")%>">
                                                </div>
                                                <div class="form-group">
                                                    <label>Your Middle Name</label>
                                                    <input class="form-control" placeholder="Enter text" name="wardenmiddlename" value="<%=rs.getString("warden_middle_name")%>">
                                                </div>
                                                <div class="form-group">
                                                    <label>Your Last Name</label>
                                                    <input class="form-control" placeholder="Enter text" name="wardenlastname" value="<%=rs.getString("warden_last_name")%>">
                                                </div>
                                                <div class="form-group">
                                                    <label>Your Email </label>
                                                    <input class="form-control" placeholder="Enter text" name="wardenemail" value="<%=rs.getString("warden_email")%>">
                                                </div>
                                                <div class="form-group">
                                                    <label>Your Contact Number </label>
                                                    <input class="form-control" placeholder="Enter text" name="wardencontact" value="<%=rs.getString("warden_contact_no")%>">
                                                </div>
                                                <div class="form-group">
                                                    <label>Your Mobile Number </label>
                                                    <input class="form-control" placeholder="Enter text" name="wardenmobile" value="<%=rs.getString("warden_mobile_no")%>">
                                                </div>

                                                <div class="form-group">
                                                    <label>Your College Name </label>
                                                    <input class="form-control" placeholder="Enter text" name="wardencollege" value="<%=rs.getString("college_name")%>">
                                                </div>
                                                <div class="form-group">
                                                    <label>Your Hostel Id </label>
                                                    <input class="form-control" placeholder="Enter text" name="wardenhostelid" value="<%=rs.getString("hostelid")%>">
                                                </div>

                                                <button type="submit" name="button" class="btn btn-success">SAVE</button>
                                                <button type="reset" class="btn btn-default"><strong>RESET</strong></button>
                                                <a href="After_login_wardenPortal.jsp" class="btn btn-warning">CANCEL</a>
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

           <% 
                }
                  else{
                        out.println("record does not exist");
                      }
                }
                    catch(Exception ex){
                        out.println("Unable to connect to database");
                }
            %>

        <!-- /#wrapper -->

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
