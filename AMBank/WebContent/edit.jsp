<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"%>
<%@page import="java.sql.*"%>
<title>AM Bank</title>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 30%;
  align:center;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
  font-size:16px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding:12px;
  text-align: center;
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

<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
String query = "select * from bank where id='"+no+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<center><h2>Details of <%=rs.getString("name")%></h2></center>
<table id="customers" style="margin-left: auto;
  margin-right: auto;">
<tr>
<th><b>ID:-</b></th>
<td><%=rs.getString("id")%></td>
</tr>
<tr>
<th><b>Name:-</b></th>
<td><%=rs.getString("name")%></td>
</tr>
<tr>
<th><b>Place:-</b></th>
<td><%=rs.getString("place")%></td>
</tr>
<tr>
<th><b>Email:-</b></th>
<td><%=rs.getString("email")%></td>
</tr>
<tr>
<th><b>Accountno:-</b></th>
<td><%=rs.getLong("aadharno")%></td>
</tr>
<tr>
<th><b>Balance:-</b></th>
<td><%=rs.getLong("balance")%></td>
</tr>


<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</table>
<br>
<div class="btn-group" style="padding-left:560px;" >
  <a href="index.html" ><button >Home</button></a>
 <a href="contact.html"  > <button >Contact us</button></a>
  <a href="customers.jsp" ><button >View All Customers</button></a>
  <a href="trans.jsp" ><button >Transfer</button></a>
   
</div>