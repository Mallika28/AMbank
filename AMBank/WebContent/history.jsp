<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<html>
<head>
<meta charset="utf-8"/>
<!-- Set the viewport width to device width for mobile -->
<meta name="viewport" content="width=device-width"/>
<title>AM Bank</title>
<!-- CSS Files-->
<link rel="stylesheet" href="stylesheets/style.css">

<link rel="stylesheet" href="stylesheets/skins/blue.css">
<!-- skin color -->
<link rel="stylesheet" href="stylesheets/responsive.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>History details</title>

<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
  font-size:16px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: LightCoral;
  color: white;
  
}
.but{
float:left;

}
.but hover{
background:white;
color:LightCoral;
}
</style>
<style>
.btn-group button {
  background-color: black; /* Green background */
  border: 1px solid white; /* Green border */
  color: white; /* White text */
   padding:13px;/* Some padding */
  cursor: pointer; /* Pointer/hand icon */
  float: left; /* Float the buttons side by side */
}

/* Clear floats (clearfix hack) */
.btn-group:after {
  content: "";
  clear: both;
  
}

.btn-group button:not(:last-child) {
  border-right: none; /* Prevent double borders */
}

/* Add a background color on hover */
.btn-group button:hover {
  background-color: LightCoral;
  color:white;
   border: 1px solid LightCoral;
}
</style>

</head>
<body>

<%

String driverName = "oracle.jdbc.driver.OracleDriver";
String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
String userId = "system";
String password = "admin";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h4 align="center"><font>History Details</font></h4><br>
<div class="btn-group" style="padding-left:1150px;" >
  <a href="index.html" ><button >Home</button></a>
 <a href="contact.html"  > <button >Contact us</button></a>
 <a href="customers.jsp"  > <button >view all customers</button></a>
 <a href="trans.jsp"  > <button >Transfer</button></a>
</div>
<form method="post" name="form">
<table id="customers" >
<tr  align="center">
<th colspan="2" style="padding:10px;"><b>Transfered from </b></th>
<th colspan="2" style="padding:10px;"><b>Transfered to </b></th>
<th style="padding:10px;width: 20%;" rowspan="2""><b>Amount</b></th>

<th style="padding:10px;width: 30%;" rowspan="2"><b>Time</b></th>

</tr>
<tr  align="center">
<td style="background:LightCoral;color:white;">ID</td>
<td style="background:LightCoral;color:white;">Name</td>
<td style="background:LightCoral;color:white;">ID</td>
<td style="background:LightCoral;color:white;">Name</td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);

 statement = connection.createStatement() ;
 resultSet = statement.executeQuery("select * from bank1") ;

while(resultSet.next()){

%>
<tr  align="center">
<td><%=resultSet.getString("no1") %></td>
<td><%=resultSet.getString("ac1") %></td>
<td><%=resultSet.getString("no2") %></td>
<td><%=resultSet.getString("ac2") %></td>
<td><%=resultSet.getString("amount") %></td>
<td><%=resultSet.getString("time") %></td>

</tr>

<% 
}

} catch (Exception e) {
System.out.println(e);
}
%>
</table>
</form>
</body>
</html>






