<%@page import="p5.Out"%>
<%@page import="p3.Id"%>
<%@page import="java.sql.*"%>
<%@page errorPage="catch.jsp"%>
<%
int id=Integer.parseInt(session.getAttribute("id").toString());
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String dbun="ram",dbps="123";
Connection c=DriverManager.getConnection(url,dbun,dbps);
String o="select inn from dur where id="+id+" and inn is not null";
ResultSet rp=c.createStatement().executeQuery(o);
if(rp.next()){
out.print("u r already in");
}
else{
Id sk=new Id();
String dat=sk.show();
String k="select max(out) from dur where id="+id+" and inn is null";
ResultSet rs=c.createStatement().executeQuery(k);
String q="update dur set inn=? where inn is null";
PreparedStatement p=c.prepareStatement(q);
Out ss=new Out();
String report=ss.show();
p.setString(1,report);
p.executeUpdate();
String i="select out,inn from dur where id="+id+" and durr is null";
ResultSet z=c.createStatement().executeQuery(i);
int out1=0;
int inn1=0;
if(z.next()){
out1=z.getInt(1);
inn1=z.getInt(2);
int so=(z.getInt(2)-z.getInt(1));
String w="update dur set durr=? where durr is null";
PreparedStatement e=c.prepareStatement(w);
e.setInt(1,so);
e.executeUpdate();
out.print("time entered");
}
else{
out.print("sorry:)");
}
}
%>
<br><a href='time.html'>back</a>