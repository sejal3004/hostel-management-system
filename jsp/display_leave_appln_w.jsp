<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>   <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">



    <title>Displaying pending leave application requests</title>
<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>-->

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
                 <li>  <a href="view_all_leave_applns_w.jsp">View all leave applications</a> </li>
                 <li><a href="After_login_wardenPortal.jsp">Back</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> Hey ${username} <b class="caret"></b>

                        </a>

                        <ul class="dropdown-menu dropdown-user">
                          <li><a href="warden_view_profile_tab.jsp"><i class="fa fa-eye fa-fw"></i> View Profile</a>
                          </li>
                            <li><a href="../html/Home_page_site.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                    
                </ul>
                <!-- /.navbar-top-links -->

                <!-- /.navbar-static-side -->
            </nav>
</div>
  
    <div class="container-fluid mt-4">
		<table  align="center">
		<tr>
		<td><form action="../jsp/view_all_leave_applns_w.jsp" method="post" align="center" >
		<a href="view_all_leave_applns_w.jsp" class="btn btn-success">View</a>
		<h4><font color="blue"></font></h4><br><br>


		</tr>
		</table>

<%
try {
		
  		String permissionhostelid = (String)session.getAttribute("wardenhostelid");


	
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
        PreparedStatement pst = conn.prepareStatement("Select * from stud_leave_applications where hostelid=? and approval_status='Pending'"); 

     
    pst.setString(1,permissionhostelid);     

ResultSet rs = pst.executeQuery();
%>
<table class="table" >
	<!--<caption>
	<font size="5" color="blue" >
	Data from the table 'permission' of database 'test' </font>
	</caption>-->
	<h1>Pending Leave applications </h1>

	<tr>
	<th>Application ID</th>
	<th>Student name</th>
	<th>Academic Year</th>
	<th>Department</th>
	<th>Room no.</th>
	<th>Contact no.</th>
	<th>Leave Reason</th>
	<th>Address</th>
	<th>From date</th>
	<th>To date</th>
	<th>Hostel ID</th>
	
	<th>Approval Status</th>
	<th>Action</th>
</tr>
<%
while (rs.next()) {
%>

<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%>&nbsp;<%=rs.getString(3)%></td>

<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<td><%=rs.getString(9)%></td>
<td><%=rs.getString(10)%></td>
<td><%=rs.getString(11)%></td>
<td><%=rs.getString(12)%></td>
<td><%=rs.getString(13)%></td>


<!--<td>Pending</td>-->

	<td><a href="../jsp/approved_leave_w.jsp?id=<%=rs.getString("appln_id") %>">
		<button type="button" class="btn btn-success">Approve</button></a><br>
		<a href="rejected_leave_w.jsp?id=<%=rs.getString("appln_id") %>">
		<button type="button" class="btn btn-danger">Reject</button></a>
	</td>

</tr>
		<% } %>
<%
} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
out.println("Unable to connect to database.");
}
%>
</table>
<!--<table  align="center">
<tr>
<td><form action="After_login_wardenPortal.jsp" method="get" >
<a href="After_login_wardenPortal.jsp" class="btn btn-success">Back</a>
</form>
</tr>
</table>-->
</font>

	</div>
	
	

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






 


  
