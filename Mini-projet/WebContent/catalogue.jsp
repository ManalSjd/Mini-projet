<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    
    %>
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
<title>Catalogue</title>
</head>
<body>
<table border="1">
<tr>
<td>Reference</td>
<td>Titre</td>
<td>Auteur</td>
<td>Prix</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from cat";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><a href="CatalogueDetail.jsp?Ref=<%=resultSet.getString("Reference") %>"><%=resultSet.getString("Reference") %></a></td>
<td><%=resultSet.getString("Titre") %></td>
<td><%=resultSet.getString("Auteur") %></td>
<td><%=resultSet.getString("Prix") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</body>
</html>