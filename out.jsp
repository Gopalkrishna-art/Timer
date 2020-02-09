<%@page import="p3.Id"%>
<%@page import="p5.Out"%>
<%@page import="java.sql.*"%>
<%@page errorPage="catch.jsp"%>
<%
int id=Integer.parseInt(session.getAttribute("id").toString());
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String dbun="ram",dbps="123";
Connection c=DriverManager.getConnection(url,dbun,dbps);
Id sk=new Id();
String dat=sk.show();
String o="select out from dur where id="+id+" and inn is null";
ResultSet rp=c.createStatement().executeQuery(o);
if(rp.next()){
out.print("u r already out");
}
else{
String k="select max(inn) from dur where id="+id+" and dat='"+dat+"'";
ResultSet rs=c.createStatement().executeQuery(k);
if(rs.next()){
Out ss=new Out();
String report=ss.show();
String q="insert into dur values(?,null,?,null,?)";
PreparedStatement p=c.prepareStatement(q);
p.setString(1,report);
p.setInt(2,id);
p.setString(3,dat);
p.execute();
out.print("time entered");
}
else{
Out ss=new Out();
String report=ss.show();
String q="insert into dur values(?,null,?,null,?)";
PreparedStatement p=c.prepareStatement(q);
p.setString(1,report);
p.setInt(2,id);
p.setString(3,dat);
p.execute();
out.print("time entered");
}
}
%>
<br><a href='time.html'>back</a>