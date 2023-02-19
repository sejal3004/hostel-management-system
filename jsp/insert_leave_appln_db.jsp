<%@ page import = "java.sql.*" %>

<%



String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String currentyear = request.getParameter("currentyear");
String branchname = request.getParameter("branchname");
String roomno = request.getParameter("roomno");
String selfcontact = request.getParameter("selfcontact");
String leavereason = request.getParameter("leavereason");
String address = request.getParameter("address");
String fromdate = request.getParameter("fromdate");
String todate = request.getParameter("todate");
String permissionhostelid = request.getParameter("permissionhostelid");
String stud_id = request.getParameter("stud_id");



try {

     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
     PreparedStatement pst = conn.prepareStatement("insert into stud_leave_applications(stud_first_name,stud_last_name,academic_year,dept_name,room_no,stud_contact_no,leave_reason,stud_address,from_date,to_date,hostelid,stud_id) values(?,?,?,?,?,?,?,?,?,?,?,?)");



     pst.setString(1,firstname);
     pst.setString(2,lastname);
     pst.setString(3,currentyear);
     pst.setString(4,branchname);
     pst.setString(5,roomno);
     pst.setString(6,selfcontact);
     pst.setString(7,leavereason);
     pst.setString(8,address);
     pst.setString(9,fromdate);
     pst.setString(10,todate);
     pst.setString(11,permissionhostelid);
     pst.setString(12,stud_id);

     int x = pst.executeUpdate();
     if (x>0) {
       out.println("Submitted.");
    // String redirectURL = "../html/studentlogin.html";
     //  response.sendRedirect(redirectURL);
     }else{
       out.println("Please enter all the details.");
     }

}catch (Exception e) {
  out.println(e);
}

%>
