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
	out "<h3>Drop a Table</h3>"
	
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


if  Request.ServerVariables("CONTENT_LENGTH") = 0 then	
	call DrawForm()
elseif Request.form("SelectDb") <> "" and Request.form("SelectTable") = "" then
	Session("DBName") = request.form("SelectDB")
	call DrawForm()
else
		if request.form("SubmitName") = "Drop it!" then
			'out "drop it"
			call dropTable()
		elseif request.form("SubmitName") = "Cancel" then
			'out "Cancel"
			response.redirect "DropTable.asp?done=" & Server.UrlEncode("Table Drop CANCELLED")
		else
			call AreYouSure()
		end if
end if
	


'#######################################
'###   Procedures
'#######################################
sub DrawForm()
	'Draw the form
	%>
	<form action="<%= Request.ServerVariables("SCRIPT_NAME") %>">
	<table cellpadding=1 cellspacing=1 border=0>
		<tr>
			<td>Server Name:</td>
			<td><input type="text" name="ServerName" value="<%= Session("ServerName") %>"><input type="submit" name="ChangeServer" value="Change"></td>
		</tr>
	</form>
	<form method="post" action="<%= Request.ServerVariables("SCRIPT_NAME") %>">
		<tr>
			<td valign=top>Drop a Table from:</td>
		<%  if request.form("SelectDB") = "" then  %>
			<td><% Call SelectDB() %></td>
		<%  
				else
					out "<td>" 
					out "<input type='text' READONLY name='SelectDB' value='" &request.form("SelectDB")& "'>"
					out "</td>"
				end if %>
		</tr>
		<%  if request.form("SelectDB") <> "" then  %>
		<tr>
			<td>Drop Table Name:</td>
			<td><% call SelectTable(request.form("SelectDB")) %></td>
		</tr>
		<tr>
			<td colspan=2 align=center><input type="submit" name="SubmitName" value="Submit"></td>
		</tr>
		<%  end if %>
	</table>
	</form>
<%
end sub


sub SelectDB()
	set conn = fnOpenDatabase(Session("ServerName"), "master")
		
	'Get list of DB names
	set rs = conn.execute("Select name from sysdatabases Order by name")
	
	if not rs.eof then
		out "<select name=SelectDB onChange='submit();'>"
		while not rs.eof 
			response.write "<option"
			if Ucase(rs(0)) = UCase(Session("DBName")) then response.write " selected"
			out ">" & rs(0)
			rs.movenext
		wend
		out "</select>"
		out "<input type=""submit"" name=""ChangeDB"" value=""View Table Names"">"
		'out "<script language='JavaScript'>document.write('<br>(Select Database to see a list of its table names)')</script>"
	end if
	rs.Close
	Set rs = Nothing
	 
	conn.close
	set conn= Nothing
end sub



sub SelectTable(in_DB)
	set conn = fnOpenDatabase(Session("ServerName"), in_DB)
		
	'Get list of DB names
	set rs = conn.execute("Select name from sysobjects where xtype='U' AND name <> 'dtproperties' Order by name")
	
	if not rs.eof then
		out "<select name=SelectTable>"
		'	out "<option>"
		while not rs.eof 
			response.write "<option"
			'if Ucase(rs(0)) = UCase(Session("DBName")) then response.write " selected"
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

sub dropTable()
	'for each item in request.form
		'out "<li>" & item & " = " & request.form(item)
	'next
	
	set conn = fnOpenDatabase(Session("ServerName"),request.form("SelectDB"))
	
	sql = "DROP TABLE [" & request.form("selectTable")  & "]"
	
	conn.execute(sql)
	
	conn.close
	set conn= Nothing
	
	zz = "Table <b><i>" & request.form("selectTable") & "</i></b> was dropped from " & request.form("selectDB") & "!"
	
	response.redirect "DropTable.asp?done=" & Server.UrlEncode(zz)
end sub

sub AreYouSure()
	out "<form method=post>"
			out "Are you sure you want to drop <b><i>" & request.form("SelectTable")  & "</i></b> from " &  request.form("SelectDB")& "? "
			out "<br><input type='hidden' name='SelectDB' value='" & request.form("SelectDB")  & "'>"
			out "<br><input type='hidden' name='SelectTable' value='" & request.form("SelectTable")  & "'>"
			out "<br><br>"
			out "<input type='submit' name='SubmitName' value='Drop it!'>"
			out "<input type='submit' name='SubmitName' value='Cancel'>"
			out "</form>"
end sub
 %>

<br>
<!--#include file="footer.html"--> 
</body>
</html>
