<%@ page import = "java.sql.*" %>

<%

 String username = (String)session.getAttribute("username");

String firstname = request.getParameter("firstname");
String middlename = request.getParameter("middlename");
String lastname = request.getParameter("lastname");
String dob = request.getParameter("dob");
String contact = request.getParameter("contact");
String branchname = request.getParameter("branchname");
String currentyear = request.getParameter("currentyear");
String address = request.getParameter("address");
String hostelid = request.getParameter("hostelid");
String roomno = request.getParameter("roomno");

try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
     PreparedStatement pst = conn.prepareStatement("update student_register_details set stud_first_name=?, stud_middle_name=?, stud_last_name=?, stud_dob=?, stud_contact_no=?, dept_name=?, academic_year=?, stud_address=?, room_no=?, hostelid=? where stud_username =?");

     pst.setString(1,firstname);
     pst.setString(2,middlename);
     pst.setString(3,lastname);
     pst.setString(4,dob);
     pst.setString(5,contact);
     pst.setString(6,branchname);
     pst.setString(7,currentyear);
     pst.setString(8,address);
     pst.setString(9,roomno);
     pst.setString(10,hostelid);

    pst.setString(11,username);


    

    int x =  pst.executeUpdate();
    if (x>0) {

       response.sendRedirect("After_login_studentPortal.jsp");
    // String redirectURL = "../html/studentlogin.html";
     //  response.sendRedirect(redirectURL);
     }else{
       out.println("sorry!");
       //response.sendRedirect("studentupdateprofile.jsp");
     }
}catch (Exception e) {
  out.println(e);
}

%>
