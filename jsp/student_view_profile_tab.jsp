<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>The Virtual Manager</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">

    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<head>
  <title>The Virtual Manager</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<%
    try{

        String username = (String) session.getAttribute("username");

        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
        PreparedStatement pst = conn.prepareStatement("Select * from student_register_details where stud_username=?");


        pst.setString(1,username);

       
        ResultSet rs = pst.executeQuery();
        if(rs.next())
        {

%>  

<hr>
<div class="container bootstrap snippet">
    <div class="row">
  		<div class="col-sm-10"><h1>${username}</h1></div>

    </div>
    <div class="row">
  		<div class="col-sm-3"><!--left col-->


      <div class="text-center">
        <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Upload a different photo</h6>
        <input type="file" class="text-center center-block file-upload">
      </div></hr><br>

     </div><!--/col-3-->
    	<div class="col-sm-9">



          <div class="tab-content">
            <div class="tab-pane active" id="home">

                  <form class="form" action="##" method="post" id="registrationForm">
                      <div class="form-group">

                          <div class="col-xs-6">
                              <label><h4><b>Your Name :</b><i><%=rs.getString("stud_first_name")%></i> <i><%=rs.getString("stud_middle_name")%></i> <i><%=rs.getString("stud_last_name")%></i> </h4></label>

                          </div>
                      </div>
                      <div class="form-group">

                          <div class="col-xs-6">
                            <label><h4><b>Date Of Birth :</b><i><%=rs.getString("stud_dob")%></i></h4></label>

                          </div>
                      </div>

                      <div class="form-group">

                          <div class="col-xs-6">
                              <label><b><h4>Your Contact Number : </b><i><%=rs.getString("stud_contact_no")%></i></h4></label>

                          </div>
                      </div>

                      <div class="form-group">
                          <div class="col-xs-6">
                             <label><b><h4>Your Department :</b><i><%=rs.getString("dept_name")%></i></h4></label>

                          </div>
                      </div>
                      <div class="form-group">

                          <div class="col-xs-6">
                              <label><b><h4>Your Academic Year :</b><i><%=rs.getString("academic_year")%></i></h4></label>

                          </div>
                      </div>
                      <div class="form-group">


                      </div>
                      <div class="form-group">

                          <div class="col-xs-6">
                              <label><b><h4>Room Number : </b><i><%=rs.getString("room_no")%></i> </h4></label>

                          </div>
                      </div>


              	</form>



             </div><!--/tab-pane-->

        </div><!--/col-9-->
    </div><!--/row-->

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

<script type="text/javascript">
$(document).ready(function() {


    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }


    $(".file-upload").on('change', function(){
        readURL(this);
    });
});
</script>
</body>
</html>
