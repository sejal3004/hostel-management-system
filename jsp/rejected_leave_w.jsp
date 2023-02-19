<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
	PreparedStatement pst = conn.prepareStatement("update stud_leave_applications set approval_status= 'Rejected' where approval_status='Pending' and appln_id ="+id);
	//PreparedStatement pst = conn.prepareStatement("delete from permission where id="+id);
	int i=pst.executeUpdate();
	out.println("Leave rejected");
}

catch(Exception e)
{
	System.out.println(e);

}

%>
