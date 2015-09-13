<%@ LANGUAGE="VBSCRIPT" %>

<!--#include file="globals.asp"--> 

<%  
Response.Buffer = True 
'Response.Expires = 0

Server.ScriptTimeOut = 300

%>
<!--#include file="nav.html"--> 
<%

if Request.ServerVariables("CONTENT_LENGTH") = 0 then
%>
<h3>Create a SQL Server Database</h3>
<% 
	if Request.QueryString("msg") <> "" then 
		if UCase(Request.QueryString("ok")) = "TRUE" then 
			fontcolor="blue"
			out "<font color =" & fontcolor & ">Database <b><i>" & Request.QueryString("msg") 
			out "</i></b> was sucessfully created!"
			out  "</font>"	
		else
			fontcolor = "red"
			out "<font color =" & fontcolor & ">Database <b><i>" & Request.QueryString("msg") 
			out "</i></b> was NOT CREATED<br>A Database of that name already exists."		
		end if
		out "<P>"
	end if
 %>
		<table cellpadding=1 cellspacing=1 border=0>
			<tr>
	<form action="Pg1.asp"  method="post">
				<td align=right><nobr>Enter Server Name:&nbsp;</nobr></td>
				<td><input type="text" name="ServerName" value="<%= Session("ServerName") %>"></td>
			</tr>
			<tr>
				<td><nobr>Enter <i>New</i> Database Name:&nbsp;</nobr></td>
				<td><input type="text" name="DBName"></td>
			</tr>
			<tr>
				<td colspan=2 align=center><input type="submit" name="Submit" value="Submit"></td>
			</tr>
	</form>
		</table>
<% 
		if UCase(Request.QueryString("ok")) = "TRUE" then
			out "<br><br><li>To add a table to  <b><i>" & request.querystring("msg") & "</i></b> <a href=""pg2.asp"">click here</a>"
		end if


else	
	'Get a connection to the sql server, via master DB
	set conn = fnOpenDatabase(request("ServerName"), "master")
	
	'Check if NewDB name already exists
	set RSCheck = conn.execute("Select name from sysdatabases")
	
	ok = true
	while ok and not RSCheck.eof 
		if UCASE(trim(RSCheck(0))) =  UCase(trim(request("DBName"))) then ok = false
	RSCheck.movenext
	wend
	
	RSCheck.Close
	Set RSCheck = Nothing
	
	if ok then 'DB name doesn't exist so we can create a DB of that name
		'With the connection open to the SQL Server, we can now create a DB
		sql = "CREATE DATABASE " & Replace(request("DBName"), " ", "_")
		conn.execute(sql)
		
		'Set Session vars need for other pages
		Session("ServerName") = request("ServerName")
		Session("DBName") = Replace(request("DBName"), " ", "_")
	end if
	
	conn.close
	set conn = nothing	
	
	response.redirect "Pg1.asp?msg=" & Server.UrlEncode(Replace(request("DBName"), " ", "_")) & "&ok=" & ok
	
end if
 %>

<!--#include file="footer.html"--> 
</body>
</html>
