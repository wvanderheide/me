<% response.buffer=true %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<form method='post'>
<% 
dbSpec = Replace(LCase(Request.ServerVariables("PATH_TRANSLATED")),"openschema.asp","directory.mdb")

set conn = fnOpenDataBase(dbSpec)

if Request.ServerVariables("CONTENT_LENGTH") > 0 then
	out "<h2>adSchemaTables</h2>"
	clicked = true
	Set rs = conn.OpenSchema(20) 'adSchemaTables =20 and has 9 records. adSchemaColumns = 4, and has 35 records
else
	clicked = false
	out "<h2>adSchemaColumns</h2>"
	Set rs = conn.OpenSchema(4) 'adSchemaTables =20 and has 9 records. adSchemaColumns = 4, and has 35 records
end if
%>
<hr>
Menu: <input type="radio" name="abc" value="True" onClick="submit();" <% if clicked then out " checked " %>>adSchemaTables
<input type="radio" name="abc2" value="True" onClick="location.replace('OpenSchema.asp?')" <% if not clicked then out " checked " %>>adSchemaColumns
<hr>
<%
dim count
call LoopIt(-1)
fieldCount = rs.fields.count-1
out "<br>Record Count = " & count
out "<br>Field count = " & rs.fields.count & " (0 - " &fieldCount  & ") "

out "<table border=1>"
out "<tr>"
for each item in rs.fields
	out "<th bgcolor=eeeeee>" & item.name & "</th>"
Next
out "</tr><tr>"

while not rs.eof
	out "<tr>" 
	for i = 0 to fieldCount 
		out "<td>" 
		out rs(i) & "&nbsp;"
		out "</td>" 
		response.flush
	Next
	out "</tr>"
	rs.movenext
wend

out "</table>"
%>
</form>
</body>
</html>

<% 
'################################################
sub out(strIN)
	response.write strIN & vbCrLf
end sub

function fnOpenDataBase(strDBFileSpec)
	if inStr(LCase(strDBFileSpec),".mdb") then
		set SysConn = CreateObject("ADODB.Connection")
		
		'Access DB
			strConn = "Driver={Microsoft Access Driver (*.mdb)}; DBQ="			
			strConn = strConn  & strDBFileSpec
			
		SysConn.Open strConn
		set fnOpenDataBase = SysConn
	else
		set fnOpenDataBase = Nothing
	end if
end function


sub LoopIt(ColName)
	count = 0
	while not rs.eof
		count = count + 1
		if ColName <> -1 then out "<li>rs(" & ColName & ") = " & rs(ColName)
		rs.movenext
	wend
	rs.movefirst
end sub

 %>