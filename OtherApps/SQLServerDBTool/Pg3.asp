<%@ LANGUAGE="VBSCRIPT" %>

<!--#include file="globals.asp"--> 

<%  
Response.Buffer = True 
'Response.Expires = 0

Server.ScriptTimeOut = 300
 
 'for each item in Request.Form
	'response.write "<li>" & item & " = " & Request.Form(item) & vbcrLf
' next
 'response.end
 
 'Global to Page Vars
 typeError=false
TypesSizesError = ""
FieldCount=""

if Request.ServerVariables("CONTENT_LENGTH") > 0 then
	'Check Types and Sizes
	if CheckTypesSizes(request("hFieldNum")) <> "" then 'Error with type size
		out "<li>Error! Size of <i><b>" & TypesSizesError &"</b></i> type is incorrect, use the back button to return to the form to correct it."
		response.end
	end if
	
	
	'Create Table
	Call CreateTable(Session("ServerName"),Session("DBName"),request("hTableName"), request("hFieldNum"))
	
	if 	typeError then
		done = "There was an error with one of the data types, table was not added!"
	else
		done = "A " & FieldCount & " field table named " & request("hTableName") & " was successfully added to  " & Session("DBName") & "!"
	end if

	response.redirect "pg2.asp?done=" & Server.UrlEncode(done)

end if
'#######################################
'###   Procedures
'#######################################

Sub CreateTable(in_Server, in_DB, in_NewTable, in_numFields)
	'Connect to the selected DB
	set conn = fnOpenDatabase(in_Server, in_DB)
	sql ="use " & in_DB & " "
	sql = sql & "CREATE TABLE [dbo].[" & Replace(in_NewTable, " ", "_") & "] ("
	
	if request.form("id1") <> "" then
	   
	   'Add Prefix to id
	   if request.form("Prefix") <> "" then tempid = Replace(in_NewTable, " ", "_") & "_"
	   
	   tempid = tempid & Trim(request.form("idname"))		
		
	   'Check id field names 
	   	if request.form("id1") <> "" and  tempid  = "" then tempid = " "
		
		sql = sql & "[" & tempid &"] [int] IDENTITY (1, 1) NOT NULL ,"
		FieldCount=request("hFieldNum") + 1
	else 
		FieldCount=request("hFieldNum")
	end if
	
	for i = 1 to in_numFields
		TheType = LCase(request("Type" & i))
		
		if	Trim(request("Field" & i)) = "" then
			FieldName = "Field" & i
		else
			FieldName = trim(request("Field" & i))
		end if
				
				
		if request.form("Prefix") <> "" then tempFieldName = Replace(request("hTableName"), " ", "_") & "_"	   
		tempFieldName = tempFieldName & FieldName		
		
		FieldName = tempFieldName
		
				
		Select Case TheType
            Case "binary" 	sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] (" & request("Size" & i) & ") NULL"
			Case "bigint" 	  sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] NULL"			
			Case "bit"     		sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] NULL"
			Case "char" 	 sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] (" & request("Size" & i) & ") NULL"
			Case "datetime" sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] NULL"
			Case "image" 	sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] (" & request("Size" & i) & ") NULL"
			Case "int" 			sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] NULL"
			Case "money"   sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] NULL"			
			Case "nchar" 	sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] (" & request("Size" & i) & ") NULL"
			Case "ntext" 	sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] (" & request("Size" & i) & ") NULL"
			Case "nvarchar" 	sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] (" & request("Size" & i) & ") NULL"
			Case "smalldatetime" sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] NULL"
			Case "smallint" 	  sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] NULL" 
			Case "smallmoney"    sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] NULL"
			Case "sysname" 
			Case "text" 	sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] (" & request("Size" & i) & ") NULL"

			Case "tinyint"  sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] NULL"
			Case "varbinary" 	sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] (" & request("Size" & i) & ") NULL"
			Case "varchar" 	sql = sql & "[" & FieldName & "] [" & request("Type" & i )& "] (" & request("Size" & i) & ") NULL"

			'Case "uniqueidentifier" 
			'Case "decimal" 
			'Case "float" 
			'Case "numeric" 
			'Case "real" 
			'Case "time" 
			'Case "timestamp" 
			Case Else typeError=true
      End Select

	  	if typeError then Exit for
		if i = CLng(in_numFields) then
			sql = sql & " )"
		else			
			sql = sql & ","
		end if
	next
		response.write "<li>" &sql& "<hr>"
	
	if not typeError then	conn.execute(sql)
	
	conn.close
	set conn=nothing
end sub

Function CheckTypesSizes(in_numFields)
	'Make Sure Size was entered for types that need it
	for i = 1 to in_numFields
		TheType = LCase(request("Type" & i))
		TheSize = Trim(request("Size" & i))
		if TheSize = "" then  TheSize = 0
		if  IsNumeric(TheSize) then				
				Select Case TheType
		            Case "binary" 	if CLng(TheSize) <1 or CLng(TheSize) > 8000 then TypesSizesError = "Binary"
					Case "char" 	 if CLng(TheSize) <1 or CLng(TheSize) > 8000 then TypesSizesError = "Char"
					'Case "image" 	'Solved by limiting the field size of <input field size> to 9
					Case "nchar" 	if CLng(TheSize) <1 or CLng(TheSize) > 4000 then TypesSizesError = "NChar"
					'Case "ntext" 	'Solved by limiting the field size of <input field size> to 9
					Case "nvarchar" 	if CLng(TheSize) <1 or CLng(TheSize) > 4000 then TypesSizesError = "NChar"
					Case "text" 	'Solved by limiting the field size of <input field size> to 9
					Case "varbinary" 	 if CLng(TheSize) <1 or CLng(TheSize) > 8000 then TypesSizesError = "VarBinary"
					Case "varchar" 	  if CLng(TheSize) <1 or CLng(TheSize) > 8000 then TypesSizesError = "Char"
		      End Select
		else 'Size is not a number
			out "<li>Error! Size fields values must be numeric or blank."
			out " Use the browser back button to return to the form."
			response.end
		end if
	
		if TypesSizesError <> "" then Exit For
	Next
	CheckTypesSizes = TypesSizesError
end Function
%>