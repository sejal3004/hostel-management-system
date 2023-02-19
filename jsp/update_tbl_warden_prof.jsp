<%@ page import = "java.sql.*" %>

<%

 String username = (String)session.getAttribute("username");

String wardenfirstname = request.getParameter("wardenfirstname");
String wardenmiddlename = request.getParameter("wardenmiddlename");
String wardenlastname = request.getParameter("wardenlastname");
String wardenemail = request.getParameter("wardenemail");
String wardencontact = request.getParameter("wardencontact");
String wardencollege = request.getParameter("wardencollege");
String wardenhostelid = request.getParameter("wardenhostelid");

try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
     PreparedStatement pst = conn.prepareStatement("update warden_register_details set warden_first_name=?,warden_middle_name=?,warden_last_name=?,warden_contact_no=?,warden_email=?,college_name=?,hostelid=? where warden_username =?");

     pst.setString(1,wardenfirstname);
     pst.setString(2,wardenmiddlename);
     pst.setString(3,wardenlastname);
     pst.setString(4,wardencontact);
     pst.setString(5,wardenemail);
     pst.setString(6,wardencollege);
     pst.setString(7,wardenhostelid);
     pst.setString(8,username);

     session.setAttribute("wardenhostelid",wardenhostelid);

    int x =  pst.executeUpdate();
    if (x>0) {

       response.sendRedirect("After_login_wardenPortal.jsp");
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
