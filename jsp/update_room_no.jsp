<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String stud_id = request.getParameter("stud_id");
String new_room_no = request.getParameter("new_room_no");

try{
 Class.forName("com.mysql.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root","root");
 PreparedStatement pst = conn.prepareStatement("update student_register_details set room_no=? where room_no='000' and stud_id=?");

 pst.setString(1,new_room_no);
 pst.setString(2,stud_id);
 int i = pst.executeUpdate();
 out.println("Room updated!!");
}
catch (Exception e){
  out.println(e);
}

%>