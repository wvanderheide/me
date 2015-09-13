<%@ LANGUAGE="VBSCRIPT" %>

<!--#include file="globals.asp"--> 
<%  
Response.Buffer = True 
'Response.Expires = 0

Server.ScriptTimeOut = 300

%>

<script language="JavaScript">
	function checkPassWd(obj){
		if (obj.LoginName.value == ""){
			alert("Login name cannot be blank")
			obj.LoginName.focus()
			return false
			}
	
		if (obj.passwd.value == ""){
			alert("Password cannot be blank")
			obj.passwd.focus()
			return false
			}
			
	return true
	}//end funciton
</script>


<!--#include file="nav.html"--> 
<%

if Request.ServerVariables("CONTENT_LENGTH") = 0 then	
		%>
		<h3>Add Login</h3>
		<% 
		if Request.QueryString("Error") <> "" then out "<font color=""Red""><li>" & Request.QueryString("Error") & "</font>"
		
		if Request.QueryString("msg") <> "" then 
			if UCase(Request.QueryString("ok")) = "TRUE" then 
				fontcolor="blue"
				out "<font color =" & fontcolor & ">Login <b><i>" & Request.QueryString("msg") 
				out "</i></b> was sucessfully created!"
				out  "</font>"	
			else
				fontcolor = "red"
				out "<font color =" & fontcolor & ">Login <b><i>" & Request.QueryString("msg") 
				out "</i></b> was NOT CREATED<br>A login of that name already exists."		
			end if
			out "<P>"
		end if
	 	%>
			<table cellpadding=1 cellspacing=1 border=0>
				<tr>
		<form action="addLogin.asp"  method="post" onSubmit = "return checkPassWd(this)">
					<td align=right><nobr>Server Name:&nbsp;</nobr></td>
					<td><input type="text" name="ServerName" value="<%= Session("serverName") %>"><input type="submit" name="submitname" value="Change"></td>
				</tr>
				<tr>
					<td align=right><nobr><i>New</i> Login Name:&nbsp;</nobr></td>
					<td><input type="text" name="LoginName" maxlength = 128></td>
				</tr>
				<tr>
					<td align=right><nobr>Password:&nbsp;</nobr></td>
					<td><input type="text" name="passwd" maxlength=128></td>
				</tr>
				<tr>
					<td align=right><nobr>Default Database:&nbsp;</nobr></td>
					<td><% call INCSelectDB("","SelectDB") %></td>
				</tr>
				<tr>
					<td align=right valign=top><nobr>Server Role:&nbsp;</nobr><nobr><font size="-6">(Optional*)</font>&nbsp;&nbsp;&nbsp;</nobr></td>
					<td><input type="radio" name="sRole" value="sysadmin">System Administrators<br>
							<input type="radio" name="sRole" value="dbcreator">Data Base Creators
					</td>
				</tr>
				
				<tr>
					<td align=right valign=top>Databases Accessable&nbsp;<br>by this New Login&nbsp;<br><font size="-6">(Use the Cntrl Key to select multiple**)</font>&nbsp;&nbsp;&nbsp;</td>
					<td><% call INCSelectDB("multiple", "DBAccess") %></td>
				</tr>
				<tr>
					<td colspan=2 align=center><input type="submit" name="Submit" value="Submit"></td>
				</tr>
		</form>
			</table>
			<br>
			<br>
			<font size="-6">* If a server role is not selected the login will not have access to anything, until a "Grant Statement" is executed.  If you want to use to be able to do everything including setting up security, then select <i>System Administrators</i>.  If you want them to be able to everything to any database including creating new databases, selecting, updating etc, select <i>Data Base Creators</i>.
		<br><br>
		** At least one database should be selected in the "Databases Accessable by this New Login" section.  If no database is selected an error will be returned when the login is used.</font>
	<% 

'### Page was submitted to ###
else	
		if LCase(request("submitname")) = "change" then 	
			Session("ServerName") = request("ServerName")
			Response.redirect "addlogin.asp?"
			response.end
		'form validation
		elseif trim(request("LoginName")) = "" or trim(request("passwd")) = "" then
			Session("ServerName") = request("ServerName")
			Response.redirect "addlogin.asp?Error=" & Server.UrlEncode("Neither Login name nor password can be blank")
			response.end
		 end if
		 
		 
		'Get a connection to the sql server, via master DB
		set conn = fnOpenDatabase(request("ServerName"), "master")
		
		'Check if NewDB name already exists
		qry = "Select name from master.dbo.syslogins where name = '" & trim(replace(request("LoginName"),"\","")) & "'"
		'response.write "<li>" &qry& "<hr>"
		set RSCheck = conn.execute(qry)
		
		ok = true
		if not RSCheck.eof then 'name is taken
			ok = false
		end if
		
		RSCheck.Close
		Set RSCheck = Nothing
		
		
		if ok then 'Login name doesn't exist so we can create it
				'for each item in Request.form
					'out "<li>" & item & " = " & request(item)
				'Next
				'response.end
		
			'Add Login
			call sp_addlogin()			

			'Set Server Role
			if request("srole") <> "" then 	call sp_addsrvrolemember
			
			'Set DBAccess
			if Instr(Request("DBAccess"),",") > 0 then 'multiple DB were selected 
				DBAccessArry = split(Request("DBAccess"), ",")
				call sp_grantdbaccess(True)

			elseif Len(Request("DBAccess")) > 0 then 'one DB was selected
				call sp_grantdbaccess(false)
			'else no DB was selected				
			end if
					
			
			'Set Session vars need for other pages
			Session("ServerName") = request("ServerName")
			'Session("LoginName") = Replace(replace(request("LoginName"),"\",""), " ", "_")
		end if
		
		conn.close
		set conn = nothing	
		
		response.redirect "addLogin.asp?msg=" & Server.UrlEncode(replace(request("LoginName"),"\","")) & "&ok=" & ok
		'"
end if



'##############################################################

		sub sp_addlogin()
			'Execute sp_addlogin @loginame = 'zzzz',@passwd = '1234',@defdb ='pubs’
			set objCmd = CreateObject("ADODB.Command")
			objCmd.CommandText = "sp_addlogin"
			set objCmd.ActiveConnection = conn
			
			set objParam = objCmd.CreateParameter("@loginame", adVarChar, adParamInput,128,replace(request("LoginName"),"\","")) '"
			objCmd.Parameters.Append objParam
			
			set objParam = objCmd.CreateParameter("@passwd", adVarChar, adParamInput,128,request("passwd"))
			objCmd.Parameters.Append objParam
					
			set objParam = objCmd.CreateParameter("@defdb", adVarChar, adParamInput,128,request("SelectDB"))
			objCmd.Parameters.Append objParam
			
			objCmd.Execute()
			
			set objParam = Nothing
			set objCmd = Nothing
		end sub

		sub sp_addsrvrolemember()
				'sp_addsrvrolemember @loginame = 'Test', @rolename  = 'sysadmin'	
				set objCmd = CreateObject("ADODB.Command")
				objCmd.CommandText = "sp_addsrvrolemember"
				set objCmd.ActiveConnection = conn
				set objParam = objCmd.CreateParameter("@loginame", adVarChar, adParamInput,128,replace(request("LoginName"),"\","")) '"
				objCmd.Parameters.Append objParam
				set objParam = objCmd.CreateParameter("@rolename", adVarChar, adParamInput,128,request("srole"))
				objCmd.Parameters.Append objParam
				objCmd.Execute()
				
				set objParam = Nothing
				set objCmd = Nothing
		end sub
		
		sub sp_grantdbaccess(ArryYes)			
		'sp_grantdbaccess [@loginame =login]
					
			if ArryYes then
				for i = Lbound(DBAccessArry) to Ubound(DBAccessArry)
					qry = "Use " & DBAccessArry(i)
					conn.execute qry			
					set objCmd = CreateObject("ADODB.Command")
					objCmd.CommandText = "sp_grantdbaccess"
					set objCmd.ActiveConnection = conn
					
					set objParam = objCmd.CreateParameter("@loginame", adVarChar, adParamInput,128,replace(request("LoginName"),"\","")) '"
					objCmd.Parameters.Append objParam
					objCmd.Execute()
					
					set objParam = Nothing
					set objCmd = Nothing
				Next 
			else 'just one DB to have Access
					qry = "Use " & request("DBAccess")
					conn.execute qry													
					set objCmd = CreateObject("ADODB.Command")
					objCmd.CommandText = "sp_grantdbaccess"
					set objCmd.ActiveConnection = conn
					
					set objParam = objCmd.CreateParameter("@loginame", adVarChar, adParamInput,128,replace(request("LoginName"),"\","")) '"
					objCmd.Parameters.Append objParam
					objCmd.Execute()
					
					set objParam = Nothing
					set objCmd = Nothing
					'response.end
			end if
		end sub


 %>

<!--#include file="footer.html"--> 
</body>
</html>
