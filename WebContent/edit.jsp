<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="dao.*"%>
    <%@page import="java.util.HashMap"%>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="db.jsp"method="post">
<%
String id=request.getParameter("id");
if(id!=null){
ArrayList<HashMap<String,Object>> row=SqlHelper.executeQuery("select * from school where id=?",Integer.valueOf(id));

%>
<input type="hidden" name="cmd" value="update">
<input type="hidden" name="id" value="<%=id %>">
<input name="name" value="<%=row.get(0).get("name")%>">
<%}else{ %>
<input type="hidden" name="cmd" value="insert">
<input name="name">

<%}%>


<input type="submit"value="保存">
</form>
</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="dao.SqlHelper2"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="db.jsp"method="post">

<%
String id=request.getParameter("id");
ArrayList<HashMap<String,Object>> typerow=SqlHelper2.executeQuery(" select * from usertype ");
if(id!=null){
	
ArrayList<HashMap<String,Object>>row=SqlHelper2.executeQuery("select * from user where id=?",Integer.valueOf(id));
%>
<input type="hidden" name="cmd"value="update">
<input type="hidden" name="id"value="<%=id %>">
<input name="name" value="<%=row.get(0).get("name")%>"> 


 <select name="status">
 <%
 String[] userstatus=(String[])session.getAttribute("userstatus");
 for(int i=0;i<userstatus.length;i++)
	 if(row.get(0).get("status").equals(i)){
		 out.write("<option selected='selected' value='"+i+"'>"+userstatus[i]+"</option>"); 
	 }
	 else	 
 out.write("<option value='"+i+"'>"+userstatus[i]+"</option>");
 %>
 <option>
 
 </select>
 
 <select name="usertypeid">
 <%
 for(int i=0;i<typerow.size();i++)
	 if(row.get(0).get("usertypeid").equals(typerow.get(i).get("id")))
		 out.write("<option selected='selected' value='"+typerow.get(i).get("id")+"'>"+typerow.get(i).get("name")+"</option>"); 
	 else	
 out.write("<option value='"+typerow.get(i).get("id")+"'>"+typerow.get(i).get("name")+"</option>");
 %>
 <option>
 
 </select>


<%}else{ %>
<input type="hidden" name="cmd"value="insert">
 <input name="name"> 
 
 <select name="status">
 <%
 String[] userstatus=(String[])session.getAttribute("userstatus");
 for(int i=0;i<userstatus.length;i++)
	 out.write("<option value='"+i+"'>"+userstatus[i]+"</option>");
 %>
 <option>
 
 </select>
 
 <select name="usertypeid">
 <%
 for(int i=0;i<typerow.size();i++)
	 out.write("<option value='"+typerow.get(i).get("id")+"'>"+typerow.get(i).get("name")+"</option>");
 %>
 <option>
 
 </select>
<%}%>

<input type="submit"value="确认">
<br>

</form>
</body>
</html>
 --%>