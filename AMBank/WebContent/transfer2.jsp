<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AM Bank</title>
</head>
<body>
<%
	String amount=request.getParameter("amount");
int bal=Integer.parseInt(amount);


String to=request.getParameter("to");
int acc2=Integer.parseInt(to);
String id=request.getParameter("id");
int id1=Integer.parseInt(id);
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
		Statement st = con.createStatement();
      if(acc2>0 && acc2<11 && id1>0 && id1<11)
      {
		ResultSet rs = st.executeQuery("select balance,name from bank where id='" + id1 + "'");
		String a1=null,a2=null;int balance1 = 0,bal1=0;
		while (rs.next())
		{
			balance1 = rs.getInt("balance");
			a1 = rs.getString("name");
		}
		ResultSet rs1 = st.executeQuery("select balance,name from bank where id='" + acc2 + "'");
		int balance2 = 0,bal2=0;
		while (rs1.next()) 
		{
			balance2 = rs1.getInt("balance");
			a2 = rs1.getString("name");
		}
		bal1 = balance1 - bal;
		 bal2 = balance2 + bal;
		if(bal1<0)
		{	
			RequestDispatcher rd = request.getRequestDispatcher("transerror.jsp");
		    rd.forward(request, response);		 
		}
		else{
		st.addBatch("update bank set balance=" + bal1 + " where id='" + id1 + "'");
		st.addBatch("update bank set balance=" + bal2 + " where id='" + acc2 + "'");
		java.util.Date date=new java.util.Date();
		java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
		PreparedStatement ps=con.prepareStatement("insert into bank1 (no1,ac1,no2,ac2,amount,time) values(?,?,?,?,?,?)");
		ps.setInt(1, id1);
		ps.setString(2,a1);
		ps.setInt(3,acc2);
		ps.setString(4,a2);
		ps.setInt(5,bal);		
		ps.setTimestamp(6,sqlTime);
		ps.executeUpdate();
		st.executeBatch();
		RequestDispatcher rd = request.getRequestDispatcher("trans.jsp");
	    rd.forward(request, response);
		}
	}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("transerror1.jsp");
		    rd.forward(request, response);
		}
      
      
      } catch (Exception e) {
		System.out.println(e);
	}
%>
</body>
</html>