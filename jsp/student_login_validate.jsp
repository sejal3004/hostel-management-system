<%@ page import ="java.sql.*" %>

<%
    try{
        String username = request.getParameter("username");

        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
        PreparedStatement pst = conn.prepareStatement("Select stud_username,stud_password from student_register_details where stud_username=? and stud_password=?");


        pst.setString(1, username);

	      pst.setString(2, password);

        ResultSet rs = pst.executeQuery();
        if(rs.next())
        {
        	if(rs.getString(2).equals(password))
        	{

            session.setAttribute("username",username);
            session.setAttribute("password",password);

            String redirectURL = "../jsp/After_login_studentPortal.jsp";
            response.sendRedirect(redirectURL);
        	}

        }

         else
        	{
           		out.println("Invalid login credentials");
          }



   }
   catch(Exception e)
    {
       out.println("Something went wrong !! Please try again");
    }
%>
