<!--#include file="adovbs.inc"--> 
<% 
'Set Default Server name to local server
if LCase(Request.ServerVariables("SERVER_NAME")) = "localhost" AND Session("ServerName") = "" then Session("ServerName") = "Walter-v"
if Session("ServerName") = "" then Session("ServerName") =  Request.ServerVariables("SERVER_NAME") 


Function fnOpenDatabase(in_Server,in_DB)
	if in_Server = "" then 	in_Server = Session("ServerName")
	Set dcnSystem = Server.CreateObject("ADODB.Connection")
	
	strConn = "Driver={SQL Server}; Server=" & in_Server & "; Database=" & in_DB & "; UID=sa; PWD=sa"
	dcnSystem.open strConn
	
	Set fnOpenDatabase = dcnSystem	
	
End Function 



''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
' Out
'
' This procedure is used throughout the application as short hand for response.write x & vbCrLf
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub out (strOut)
	response.write strOut  & vbCrLf
End Sub  


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
' INCSelectDB()
'
' This procedure is used throughout the to get a list box of DBs on the SERVER
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
sub INCSelectDB(strmultiple,strSelectName)
	set conn = fnOpenDatabase(Session("ServerName"), "master")
		
	'Get list of DB names
	set rs = conn.execute("Select name from sysdatabases Order by name")
	
	if not rs.eof then
		response.write "<select name='" & strSelectName & "'" 
		if LCase(strmultiple) = "multiple" then response.write "multiple"
		out ">"
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