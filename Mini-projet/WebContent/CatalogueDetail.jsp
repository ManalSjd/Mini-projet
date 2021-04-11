<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "catalogue";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from cat where Reference="+request.getParameter("Ref");
resultSet = statement.executeQuery(sql);
if(resultSet.next()){
%>
	<label for="Reference">Reference:</label>
	<input type="text" id="Reference" name="Reference" value="<%=resultSet.getString("Reference")%>"><br><br>
	<label for="Titre">Titre:</label>
	<input type="text" id="Titre" name="Titre" value="<%=resultSet.getString("Titre")%>"><br><br>
	<label for="Auteur">Auteur:</label>
	<input type="text" id="Auteur" name="Auteur" value="<%=resultSet.getString("Auteur")%>"><br><br>
	<label for="Prix">Prix:</label>
	<input type="text" id="Prix" name="Prix" value="<%=resultSet.getString("Prix")%>">
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


		
</body>
</html>