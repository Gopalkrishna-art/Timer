<%
int id=Integer.parseInt(request.getParameter("id"));
session.setAttribute("id",id+"");
String opt=request.getParameter("opt");
if(opt.equals("o"))
response.sendRedirect("out.jsp");
else
response.sendRedirect("in.jsp");
%>