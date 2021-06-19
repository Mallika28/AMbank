<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"%>
<%@page import="java.sql.*"%>
<html>
<head>
<title>AM Bank</title>
<script>
function demo(){
	if (document.f.id.value == "",document.f.amount.value == ""){
		alert ( "Please enter the remaining details." );

		return false;
		}
	if (document.f.id.value == "",document.f.amount.value == ""){
		alert ( "Please enter the remaining details." );

		return false;
		}
	if (document.f.id.value == "",document.f.id.value == ""){
		alert ( "Please enter the remaining details." );

		return false;
		}
	if (document.f.id.value == "",document.f.id.value == "",document.f.amount.value == ""){
		alert ( "Please enter all  details." );

		return false;
		}
	
if (document.f.id.value == ""){
alert ( "Please enter your ID." );

return false;
}
if (document.f.amount.value == ""){
alert ( "Please enter the amount." );

return false;
}
if (document.f.to.value == ""){
	alert ( "Please enter id no to be transfered" );
	
	return false;
	}

return true;
}
</script>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 40%;
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
</head>
<body>

<center>
<h1 style="color:red">"Please enter the id between 1 to 10"</h1>
<h3>Transfer Amount Here</h3></center>
<form name="f" action="transfer2.jsp" onsubmit="return demo();">
<table id="customers" style="margin-left: auto;
  margin-right: auto;">

<tr>
<th><b>your idno:-</b></th>
<td><input type="message" placeholder="enter your idno " name="id"  style="width:60%;"></td>
</tr>
<tr>
<th><b>Amount:-</b></th>
<td><input type="message" placeholder="enter amount" name="amount"  style="width:60%;"></td>
</tr>
<tr>
<th><b>To ID:-</b></th>
<td><input type="text" placeholder="enter idno to transfer" name="to" style="width:60%;"></td>
</tr>

<tr><td  colspan=3 align="center"  ><input type="submit" value="Transer" style="background:gray;color:white;padding:10px;"  ></td></tr>

</table>
</form>

<br>
<div class="btn-group" style="padding-left:570px;" >
  <a href="index.html" ><button >Home</button></a>
 <a href="contact.html"  > <button >Contact us</button></a>
  <a href="customers.jsp" ><button >View All Customers</button></a>
  <a href="history.jsp" ><button >View History</button></a>
   
</div>
</body>
</html>