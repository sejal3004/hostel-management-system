<%@ page import = "java.sql.*" %>

<%
String username = request.getParameter("username");
String email = request.getParameter("email");
String password = request.getParameter("password");

try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
     PreparedStatement pst = conn.prepareStatement("insert into student_register_details(stud_username, stud_email, stud_password) values(?,?,?)");
     pst.setString(1,username);
	 pst.setString(2,email);
     pst.setString(3,password);
     int x = pst.executeUpdate();
     if (x>0) {
       String redirectURL = "../html/studentlogin.html";
       response.sendRedirect(redirectURL);
      //out.println("Registered Successfully...");
     }else{
       out.println("Registration failed!");
     }

}catch (Exception e) {
  out.println(e);
}

%>
