<%@ LANGUAGE="VBSCRIPT" %>
<% 
Response.Expires = 0


'************************************************************************
'Application Name:  the ePlanner
'Version:		   	1.0
'Release Date:		November 28, 2000
'Created by:		Walter VanderHeide
'Programmed by:		Walter VanderHeide
'Last Updated:		N/A
'************************************************************************
%>

<html>
<head>
	<title>Today Update</title>
	
<link REL="StyleSheet" TYPE="text/css" HREF="StyleSheets/style.css"> 

</head>

<body bgcolor=white>


  <% 
  strRowCount = Request.Form("txtRowCount") 
  	
    'Create the connection to the DB
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("test.mdb")


	
response.write "<h1>Processing Please Wait</h1>"


For i = 1 to strRowCount
'response.write "i = " & i & "<br>"
	tempId = "txtId" & i
	tempId = Request.Form(tempId)
	tempDone = "txtDone" & i
	tempDone =Request.Form(tempDone)
	
	if tempDone = "on" then 
		tempDone="True"
		'response.write "Done = " & tempDone & "<hr>"
	else 
		tempDone = "False"
		'response.write "Done = " & tempDone & "<hr>"
	end if
	
	
sql = "Update Planner "
sql = sql & "SET DONE= " & tempDone
sql = sql & " WHERE id = " & tempId

'response.write "<font color=red>sql = " & sql & "<hr></font>"
conn.Execute(sql)

Next
	
conn.Close
Set conn = Nothing
%>

<script language=javascript>

top.location.href = "index.html";
//history.back()
//top.mainframe.location.reload();
//parent.location.reload();
//top.location.href = "index.html";
</script>

</body>
</html>
