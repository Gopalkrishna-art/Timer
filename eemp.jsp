<%@page import="java.sql.*"%>
<%@page errorPage="catch.jsp"%>
<%
String name=request.getParameter("name");
int id=Integer.parseInt(request.getParameter("id"));
session.setAttribute("id",id+"");          
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String dbun="ram",dbps="123";
Connection c=DriverManager.getConnection(url,dbun,dbps);
String k="select name from emp where name='"+name+"'";
ResultSet rs=c.createStatement().executeQuery(k);
if(rs.next())
out.print("Account name already exist");
else{
String q="insert into emp values(?,?)";
PreparedStatement p=c.prepareStatement(q);
p.setInt(1,id);
p.setString(2,name);
p.execute();
out.print("data saved");
}
%>
<br>
<a href="time.html">login</a>
