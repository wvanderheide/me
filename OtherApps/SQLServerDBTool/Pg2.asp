<%@ LANGUAGE="VBSCRIPT" %>

<!--#include file="globals.asp"--> 

<%  
Response.Buffer = True 
'Response.Expires = 0

Server.ScriptTimeOut = 300

%>
<!--#include file="nav.html"--> 
<%

if Request.Querystring("done") <> "" then
	out "<font color = Green>" &Request.Querystring("done") & "</font><br><br>"
end if

if Request.Querystring("ServerName") <> "" then 'A new ServerName has been added to the form
	Session("ServerName") =  Request.Querystring("ServerName")
end if

'Default Vars
if Session("ServerName") = "" then 'We have not linked here from Page 1, so we need to provide a Value for Session("ServerName") for calls to fnOpenDatabase()
	out "<font color=red>Please provide a Server Name and press the Change button</font>"
end if



if Request.ServerVariables("CONTENT_LENGTH") = 0 then
	'Display the Page Title
	if Session("DBName") <> "" then
		out "<h3>Add a Table to " & UCase(Session("DBName")) &"</h3>"
	else
		out "<h3>Add a Table</h3>"
	end if
	
	'Draw the form
	%>
	<form action="Pg2.asp">
	<table cellpadding=1 cellspacing=1 border=0>
		<tr>
			<td>Server Name:</td>
			<td><input type="text" name="ServerName" value="<%= Session("ServerName") %>"><input type="submit" name="ChangeServer" value="Change"></td>
		</tr>
	</form>
	<form action="Pg2a.asp" method="post">
		<tr>
			<td>Create a Table in:</td>
			<td><% Call SelectDB() %></td>
		</tr>
		<tr>
			<td>New Table Name:</td>
			<td><input type="text" name="TableName"></td>
		</tr>
		<tr>
			<td><nobr>Number of Fields:</nobr></td>
			<td><input type="text" name="NumFields" size="5"></td>
		</tr>
		<tr>
			<td colspan=2 align=center><input type="submit" name="SubmitName" value="Submit"></td>
		</tr>
	</table>
	</form>
<%
else	
end if


'#######################################
'###   Procedures
'#######################################
sub SelectDB()
	set conn = fnOpenDatabase(Session("ServerName"), "master")
		
	'Get list of DB names
	set rs = conn.execute("Select name from sysdatabases Order by name")
	
	if not rs.eof then
		out "<select name=SelectDB>"
		while not rs.eof 
			response.write "<option"
			if Ucase(rs(0)) = UCase(Session("DBName")) then response.write " selected"
			out ">" & rs(0)
			rs.movenext
		wend
		out "</select>"
	end if
	rs.Close
	Set rs = Nothing
	 
	conn.close
	set conn= Nothing
end sub
 %>

<!--#include file="footer.html"--> 
</body>
</html>
