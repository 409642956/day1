<%@page import="dao.SqlHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
   String cmd=request.getParameter("cmd");
   if(cmd.equals("insert")){
	   String name=request.getParameter("name");
	   SqlHelper.executeUpdate("insert into school(name)value(?)",name);
   }
   else if(cmd.equals("delete")){
	   SqlHelper.executeUpdate("delete from school where id=?",Integer.valueOf(request.getParameter("id")));
   }
   else if(cmd.equals("update")){
	   String name=request.getParameter("name");
	   SqlHelper.executeUpdate("update school set name=? where id=?",name,Integer.valueOf(request.getParameter("id")) );
   }
	
	response.sendRedirect("index.jsp");
%>
</body>
</html>
<%-- <%@page import="dao.SqlHelper2"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
    String cmd=request.getParameter("cmd");
    if (cmd.equals("insert")){
    	String name = request.getParameter("name");
    	String status = request.getParameter("status");
    	String usertypeid = request.getParameter("usertypeid");
    	SqlHelper2.executeUpdate("insert into user (name,status,usertypeid) values(?,?,?)", name,Integer.valueOf(status),Integer.valueOf(usertypeid));
    }else if(cmd.equals("delete")){
    	SqlHelper2.executeUpdate("delete from user where id=?",Integer.valueOf(request.getParameter("id")));
    }else if(cmd.equals("update")){
    	String name = request.getParameter("name");
    	String status = request.getParameter("status");
    	String usertypeid = request.getParameter("usertypeid");
    	SqlHelper2.executeUpdate("update user set name=?,status=?,usertypeid=?where id=?",name,Integer.valueOf(status),Integer.valueOf(usertypeid),Integer.valueOf(request.getParameter("id")));
    }
	response.sendRedirect("index.jsp");
%>
</body>
</html>
 --%>
