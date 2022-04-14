<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String status="processing";
try
{
	Connection con=ConnectionProvider.getCon();
	
	PreparedStatement ps1=con.prepareStatement("update cart set status=? where email=? and status='bill'");
	ps1.setString(1,status);
	ps1.setString(2,email);
	ps1.executeUpdate();
	response.sendRedirect("home.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}

%>