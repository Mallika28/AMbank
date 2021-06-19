<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Customers List</title>

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
<script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='edit.jsp?id='+id;
    f.submit();
}
</script>
<script language="javascript">
function editrecord(id){
    var f=document.form;
    f.method="post";
    f.action='transfer.jsp?id='+id;
    f.submit();
}
</script>
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
<h4 align="center"><font>Customers Details</font></h4><br>
<div class="btn-group" style="padding-left:1250px;" >
  <a href="index.html" ><button >Home</button></a>
 <a href="contact.html"  > <button >Contact us</button></a>
 <a href="history.jsp"  > <button >View history</button></a>
</div>
<form method="post" name="form" action="trans.jsp">
<table id="customers" >
<tr>

</tr>
<tr>
<th><b>ID</b></th>
<th><b>Name</b></th>

<th><b>Email</b></th>

<th><b>Balance</b></th>
<th><b>View Detatils</b></th>
<th><b>Transfer</b></th>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);

 statement = connection.createStatement() ;
 resultSet = statement.executeQuery("select * from bank") ;

while(resultSet.next()){
%>
<tr >

<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name") %></td>

<td><%=resultSet.getString("email") %></td>

<td><%=resultSet.getString("balance") %></td>

<td><input type="submit" value="View" onclick="editRecord(<%=resultSet.getString("id")%>);" ></td>

<td><input type="submit" value="Transer" ></td>
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






