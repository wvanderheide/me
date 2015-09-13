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
		<h3>Drop Login</h3>
		<% 
		if Request.QueryString("Error") <> "" then out "<font color=""Red""><li>" & Request.QueryString("Error") & "</font>"
	 	%>
			<table cellpadding=1 cellspacing=1 border=0>
				<tr>
		<form action="<%= Request.ServerVariables("SCRIPT_NAME") %>"  method="post">
					<td align=right><nobr>Server Name:&nbsp;</nobr></td>
					<td><input type="text" name="ServerName" value="<%= Session("serverName") %>"><input type="submit" name="submitname" value="Change"></td>
				</tr>
				<tr>
					<td align=right><nobr>Login Name:&nbsp;</nobr></td>
					<td><% call SelectLogin("","SelectLogin") %></td>
				</tr>
				
				<tr>
					<td colspan=2 align=center><input type="submit" name="SubmitName" value="Submit"></td>
				</tr>
		</form>
			</table>
	<% 

'### Page was submitted to ###
else	
		if LCase(request("submitname")) = "change" then 	
			Session("ServerName") = request("ServerName")
			Response.redirect "droplogin.asp?"
			response.end
		elseif LCase(request("submitname")) = "submit" then
			'Get a connection to the sql server, via master DB
			set conn = fnOpenDatabase(request("ServerName"), "master")	

			'Set Session vars need for other pages
			Session("ServerName") = request("ServerName")
			
			'for each item in Request.form
					'out "<li>" & item & " = " & request(item)
			'Next
			call sp_droplogin
			conn.close
			set conn = nothing	
		 end if
		 
If Err.Description <> "" then
	response.write "<li>The drop login, does not work for the logon you requested.  Sorry."
	response.end
end if
		
		response.redirect "dropLogin.asp?Error=" & Server.UrlEncode(trim(request("SelectLogin")) & " was removed")
		'"
end if



'##############################################################

sub sp_droplogin()
on error resume next

Err.Clear 

'sp_droplogin @loginame ='walter'
	set objCmd = CreateObject("ADODB.Command")
	objCmd.CommandText = "sp_droplogin"
	set objCmd.ActiveConnection = conn
	
	set objParam = objCmd.CreateParameter("@loginame", adVarChar, adParamInput,128,trim(request("SelectLogin"))) 
	objCmd.Parameters.Append objParam
				
	
	objCmd.Execute()
	
	set objParam = Nothing
	set objCmd = Nothing
end sub



''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
' SelectLogin()
'
' This procedure is used  to get a list box of Logins on the SERVER
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
sub SelectLogin(strmultiple,strSelectName)
	set conn = fnOpenDatabase(Session("ServerName"), "master")
		
	'Get list of DB names
	set rs = conn.execute("Select name from syslogins where name is not null Order by name")
	
	if not rs.eof then
		response.write "<select name='" & strSelectName & "'" 
		if LCase(strmultiple) = "multiple" then response.write "multiple"
		out ">"
		while not rs.eof 
			out "<option>" & rs(0)
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
