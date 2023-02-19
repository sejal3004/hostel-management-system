<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Displaying leave application status</title>
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
<body><div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="After_login_studentPortal.jsp"><span class="fa fa-bank"></span> Hostel Management</a>
                </div>

               
                <!-- /.navbar-static-side -->
            </nav>
</div>
  

	<br><br><br>
	<div class="container mt-4">
		
<%
try {
		
  		String stud_id = request.getParameter("stud_id");


	
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
        PreparedStatement pst = conn.prepareStatement("Select * from stud_leave_applications where stud_id=?"); 

     
    pst.setString(1,stud_id);     

ResultSet rs = pst.executeQuery();
%>
<table class="table table-bordered">
	<!--<caption>
	<font size="5" color="blue" >
	Data from the table 'permission' of database 'test' </font>
	</caption>-->
	<h1>Application Status </h1>

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


<!--<td>Pending</td>

	<td><a href="../jsp/approved_leave_w.jsp?id=<%=rs.getString("appln_id") %>">
		<button type="button" class="btn btn-success">Approve Leave</button></a><br>
		<a href="rejected_leave_w.jsp?id=<%=rs.getString("appln_id") %>">
		<button type="button" class="btn btn-danger">Reject Leave</button></a>
	</td>-->

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

</font>

	</div>
</body>
</html>

