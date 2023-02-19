<%@ page import ="java.sql.*" %>

<%

String fullname = request.getParameter("fullname");
String currentyear = request.getParameter("currentyear");
String branchname = request.getParameter("branchname");
String roomno = request.getParameter("roomno");
String parentname = request.getParameter("parentname");
String visitname = request.getParameter("visitname");
String selfcontact = request.getParameter("selfcontact");
String parentcontact = request.getParameter("parentcontact");
String leavereason = request.getParameter("leavereason");
String address = request.getParameter("address");
String fromdate = request.getParameter("fromdate");
String todate = request.getParameter("todate");
String complainroomno = request.getParameter("complainroomno");


session.setAttribute("fullname",fullname);
session.setAttribute("currentyear",currentyear);
session.setAttribute("branchname",branchname);
session.setAttribute("roomno",roomno);
session.setAttribute("parentname",parentname);
session.setAttribute("visitname",visitname);
session.setAttribute("selfcontact",selfcontact);
session.setAttribute("parentcontact",parentcontact);
session.setAttribute("leavereason",leavereason);
session.setAttribute("address",address);
session.setAttribute("fromdate",fromdate);
session.setAttribute("todate",todate);
session.setAttribute("complainroomno",complainroomno);

response.sendRedirect("leave_applnformat.jsp");


%>
