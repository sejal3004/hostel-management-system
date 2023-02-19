<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title>Displaying Hostelites</title>
<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>-->

         <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">


</head>
<body>
	<!---->
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

        <br><br><br>
<div class="container mt-4">

<%
try {

   String permissionhostelid = (String)session.getAttribute("wardenhostelid");

		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
        PreparedStatement pst = conn.prepareStatement("Select * from student_register_details where hostelid=? order by stud_first_name");

        pst.setString(1,permissionhostelid);


ResultSet rs = pst.executeQuery();
%>
<table  class="table table-bordered">
	<h1>Hostelite List</h1>
<!--	<caption>
	<font size="5" color="blue" >
	Displaying Hostelites of your particular Hostel ID </font>
	</caption>-->

	<tr>
	<th>Student name</th>
	<th>Academic Year</th>
	<th>Department</th>
	<th>Room no.</th>
	<th>Contact no.</th>
</tr>
<%
while (rs.next()) {
%>

<tr>
<td><%=rs.getString("stud_first_name")%> <%=rs.getString("stud_last_name")%></td>
<td><%=rs.getString("academic_year")%></td>
<td><%=rs.getString("dept_name")%></td>
<td><%=rs.getString("room_no")%></td>
<td><%=rs.getString("stud_contact_no")%></td>

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
<td><form action="../jsp/mainpage.jsp" method="get" >
<a href="After_login_wardenPortal.jsp" class="btn btn-success">Back</a>
</tr>
</table>-->
</font>

	</div>
</body>
</html>
