<%@ LANGUAGE="VBSCRIPT" %>

<!--#include file="globals.asp"--> 

<%  
Response.Buffer = True 
'Response.Expires = 0

Server.ScriptTimeOut = 300

if Trim(Session("ServerName")) = "" then response.redirect "Pg2.asp"


if Request.ServerVariables("CONTENT_LENGTH") > 0 then
	'Get the Data submitted from pg2
	Session("DBName") = request("SelectDB")
	 TableName =  request("TableName")
	 
	 'check if TableName is already in DB
	 if  Not CheckTableName() then	'Table name is taken
	 	response.redirect "Pg2.asp?done=" & Server.UrlEncode("<i><b>" & TableName & "</b></i> is already taken, please enter a different table name.")
	 end if
	 
	 'Draw the Field Table
	 out "<h3>" & UCase(TableName) & " Field Names</h3>"
	 out "<form action=""Pg3.asp"" method=""post"">"
	 
	 'Store data from page2 into hidden fields
	 out "<input type=hidden name=hFieldNum value='" & request("NumFields")& "'>"
	 out "<input type=hidden name=hTableName value='" & TableName & "'>"
	
	noGood = false
	
	 if IsNumeric(request("NumFields")) then
		 	if request("NumFields") < 100 then
				call MakeForm(request("NumFields"))
				out "<input type='submit' name='SubmitName' value='Submit'>"
			else
				noGood=true
			end if	
	else
		noGood = true
	end if
	
	if noGood then out "<li>Error! The number of fields entered must be a number (less than 100)<br>Press browser back button to correct"
	
	out "</form>"
end if


'#######################################
'###   Procedures
'#######################################
sub MakeForm(in_NumFields)
	out "<table cellpadding=1 cellspacing=1 border=0>"
	out "<tr><th>Field Name</th><th>Data Type</th><th>Size</th>"
	
	for i = 1 to in_NumFields
		out "<tr><td><input type=""text"" name='Field" & i & "'></td><td align=center>"
		call DataType(i)
		out "</td><td><input type=""text"" name='Size" & i & "' size=""5"" maxlength=9></td></tr>"
	next
	out "<tr><td colspan=3><input type=""checkbox"" name='id1' value='Yes'> Add an identity field named: <input type='text' name='idName' size='8' maxlength='15'></td></tr>"

	out "<tr><td colspan=3><input type=""checkbox"" name='Prefix' value='Yes'> Prefix all field names with <i><b>" & TableName & "_</b></i></td></tr>"

	out "</table>"
end sub

sub DataType(in_i)
	set conn = fnOpenDatabase(Session("ServerName"), "master")
		
	'Get list of Data Types
	qry = "Select name from systypes "
	qry = qry & "Where name <> 'float'"
	qry = qry & " AND name <> 'decimal'"
	qry = qry & " AND name <> 'numeric'"
	qry = qry & " AND name <> 'real'"
	qry = qry & " AND name <> 'time'"	
	qry = qry & " AND name <> 'timestamp'"
	qry = qry & " AND name <> 'uniqueidentifier'"
	qry = qry & " AND name <> 'sysname'"
	qry = qry & " Order by name"

	set rs = conn.execute(qry)
	
	if not rs.eof then
		out "<select name=Type" & in_i & ">"
		while not rs.eof 
			response.write "<option" 
			if LCase(rs(0)) = "int" then response.write " selected "			
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


Function CheckTableName()
	set conn = fnOpenDatabase(Session("ServerName"), Session("DBName"))
		
	'Get list of Data Types
	set rs = conn.execute("Select name from sysObjects where xtype='U' or xtype='S'")
	
	if not rs.eof then
		OkDoeKay = true
		while not rs.eof and OkDoeKay
			if UCase(trim(rs(0))) = UCase(trim(TableName)) then OkDoeKay = false
			rs.movenext
		wend
	end if
	
	rs.Close
	Set rs = Nothing
	 
	conn.close
	set conn= Nothing
CheckTableName = OkDoeKay
end function
 %>

</body>
</html>
