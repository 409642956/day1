<%@page import="dao.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
function del(id){
	if(confirm("确认删除")){
		location.href="db.jsp?cmd=delete&id="+id;
}
}
</script>
</head>
<body>
<form action="index.jsp"method="post">
<input name="name">
<input type="submit"value="查询">
<table>
<tr><td>行号</td><td>学校名</td></tr>
<%-- <%
String name=request.getParameter("name");
ArrayList<HashMap<String,Object>> rs=SqlHelper.executeQuery("select * from school where name=?",name);
for(int i=0;i<rs.size();i++){
%>
<tr><td><%=rs.get(i).get("id") %></td><td><%=rs.get(i).get("name") %></td></tr>
<%} %>
 --%>
 
<%
 request.setCharacterEncoding("utf-8");
 String where="";
if(request.getParameter("name")!=null&&request.getParameter("name").length()>0){
	where =" where name like '%"+request.getParameter("name")+"%'";
}

int max=5;
String limit="limit 0,"+max;
int prev=1;
int next=2;
if(request.getParameter("pageno")!=null&&request.getParameter("pageno").length()>0){
int pageno=Integer.valueOf(request.getParameter("pageno"));
prev=pageno>1?pageno-1:1;
next=pageno+1;
limit="limit"+(pageno-1)*max+","+max;
}
ArrayList<HashMap<String,Object>> rs=SqlHelper.executeQuery("select * from school"+ where+" "+limit);
for(int i=0;i<rs.size();i++){
%>	
<tr><td><%=rs.get(i).get("name") %></td>><td><a href="javascript:del(<%=rs.get(i).get("id")%>);">删除</a>
<a href="edit.jsp?id=<%=rs.get(i).get("id")%>">修改</a></td></tr>

<%}%>
</table>

<br>
<a href="edit.jsp">新增</a>
<a href="index.jsp?pageno=<%=prev%>">上一页</a>
<a href="index.jsp?pageno=<%=next%>">下一页</a>





</body>
</html>
<%-- <%@page import="dao.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
  function del(id) {
	if(confirm("确认删除？")){
		location.href="db.jsp?cmd=delete&id="+id;
	}
}

</script>
</head>
<body>
<form action="index.jsp"method="post">
<input name="name"><input type="submit" value="查询">
</form>

<table>
<tr><td>姓名</td><td>状态</td><td>类型</td><td>功能</td></tr>
<%
request.setCharacterEncoding("utf-8");
String [] userstatus={"状态1","状态2","状态3","状态4","状态5","状态6"};
session.setAttribute("userstatus", userstatus);
String where="";
if(request.getParameter("name")!=null&&request.getParameter("name").length()>0){
	where=" where user.name like '%"+request.getParameter("name")+"%'";
}
int max=5;
String limit=" limit 0,"+max;
int prev=1;
int next=2;
if(request.getParameter("pageno")!=null&&request.getParameter("pageno").length()>0){
	int pageno=Integer.valueOf(request.getParameter("pageno"));
	prev=pageno>1?pageno-1:1;
	next=pageno+1;
	limit=" limit "+(pageno-1)*max+","+max;
}



ArrayList<HashMap<String,Object>> rs=SqlHelper2.executeQuery(" select user.*,t.name tname from user inner join usertype t on user.usertypeid=t.id"+ where +" "+ limit );
for(int i=0;i<rs.size();i++){
%>
<tr><td><%=rs.get(i).get("name") %></td>
<td><%=userstatus[(Integer)rs.get(i).get("status")] %></td>
<td><%=rs.get(i).get("tname") %></td>
<td><a href="javascript:del(<%=rs.get(i).get("id") %>);">删除</a>|
<a href="edit.jsp?id=<%=rs.get(i).get("id") %>">修改</a></td></tr>
<%} %>
</table>

<br>
<a href="edit.jsp">新增</a>
<a href="index.jsp?pageno=<%=prev%>">上一页</a>
<a href="index.jsp?pageno=<%=next%>">下一页</a>


</body>
 --%>