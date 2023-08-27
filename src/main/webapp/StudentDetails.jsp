<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Registration Form</title>
<style>
.centered {
	text-align: center;
}
</style>
</head>
<body>
	<%
	String name, email, address, query;
	int id;
	long contact;
	Connection connection = null;
	PreparedStatement preparedStatement = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/weja2?user=root&password=root");
		query = "insert into student_details values(?,?,?,?,?)";
		preparedStatement = connection.prepareStatement(query);
		preparedStatement.setInt(1, Integer.parseInt(request.getParameter("id")));
		preparedStatement.setString(2, request.getParameter("name"));
		preparedStatement.setString(3, request.getParameter("email"));
		preparedStatement.setLong(4, Long.parseLong(request.getParameter("contact")));
		preparedStatement.setString(5, request.getParameter("address"));
		preparedStatement.executeUpdate();
	%>
	<jsp:include page="Student.html"></jsp:include>
	<div class="centered">
		<p style="color: green;">Record inserted successfully !!</p>
	</div>
	<%
	} catch (Exception e) {
	%>
	<jsp:include page="Student.html"></jsp:include>
	<div class="centered">
		<p style="color: red;">Record Not Inserted Please Try Again !!</p>
	</div>
	<%
	} finally {
	if (preparedStatement != null) {
		preparedStatement.close();
	}
	if (connection != null) {
		connection.close();
	}
	}
	%>
</body>
</html>
