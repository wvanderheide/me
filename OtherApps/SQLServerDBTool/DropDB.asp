<%@ LANGUAGE="VBSCRIPT" %>

<!--#include file="globals.asp"--> 

<%  
Response.Buffer = True 
'Response.Expires = 0

Server.ScriptTimeOut = 300

%>
<!--#include file="nav.html"--> 
<%

'Display the Page Title
if Session("ServerName") <> "" then
	out "<h3>Drop Database from " & UCase(Session("ServerName")) &"</h3>"
else
	out "<h3>Drop a Database</h3>"
end if
	
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
		
	'Draw the form
	%>
	<form>
	<table cellpadding=1 cellspacing=1 border=0>
		<tr>
			<td>Server Name:</td>
			<td><input type="text" name="ServerName" value="<%= Session("ServerName") %>"><input type="submit" name="ChangeServer" value="Change"></td>
		</tr>
	</form>
	<form method="post"  action="<%= Request.ServerVariables("SCRIPT_NAME") %>">
		<tr>
			<td>Drop Database:</td>
			<td><% Call INCSelectDB("","SelectDB") %></td>
		</tr>
		<tr>
			<td colspan=2 align=center><input type="submit" name="SubmitName" value="Submit"></td>
		</tr>
	</table>
	</form>
<%
else	
		if request.form("SubmitName") = "Cancel" then
			response.redirect "DropDb.asp?done=" & Server.UrlEncode("Database drop CANCELLED")
		elseif request.form("SubmitName") = "Drop it!" 	then
			sql = "DROP DATABASE " & request.form("SelectDB") 
			set	conn = fnOpenDatabase(Session("ServerName"), "master")
			conn.execute(sql)
			conn.close
			set conn = nothing
			x = "Database " & request.form("SelectDB") & " was dropped!"
			response.redirect "DropDb.asp?done=" & Server.UrlEncode(x)
		else
			out "<form method=post>"
			out "Are you sure you want to drop <b><i>" & request.form("SelectDB")  & "</i></b>? "
			out "<br><input type='hidden' name='SelectDB' value='" & request.form("SelectDB")  & "'>"
			out "<br><br>"
			out "<input type='submit' name='SubmitName' value='Drop it!'>"
			out "<input type='submit' name='SubmitName' value='Cancel'>"
			out "</form>"
		end if
end if


'#######################################
'###   Procedures
'#######################################

 %>

<!--#include file="footer.html"--> 
</body>
</html>
