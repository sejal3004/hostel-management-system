<%@ page import = "java.sql.*" %>

<%

String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String complainroomno = request.getParameter("complainroomno");
String issue = request.getParameter("issue");
String complainhostelid = request.getParameter("complainhostelid");

try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
     PreparedStatement pst = conn.prepareStatement("insert into student_complain_details(stud_first_name, stud_last_name, room_no, complain, hostelid, complain_date) values(?,?,?,?,?,now())");


     pst.setString(1,firstname);
     pst.setString(2,lastname);
     pst.setString(3,complainroomno);
     pst.setString(4,issue);
     pst.setString(5,complainhostelid);


     int x = pst.executeUpdate();
     if (x>0) {
       out.println("Complain issued!!");
    // String redirectURL = "../html/studentlogin.html";
     //  response.sendRedirect(redirectURL);
     }else{
       out.println("Please enter all the details.");
     }

}catch (Exception e) {
  out.println(e);
}

%>
