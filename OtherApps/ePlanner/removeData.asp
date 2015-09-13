
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
 <title>Delete Items</title>

<link REL="StyleSheet" TYPE="text/css" HREF="StyleSheets/style.css"> 

</head>

<body>

<%
     
'Create the connection to the DB
Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("test.mdb")


	
Set DB = Server.CreateObject("ADODB.Recordset")

    
   qry = "DELETE * "
   qry = qry & "FROM Planner "
   qry = qry & "WHERE ID In ("
   
   k=1
   For k = 1 to Request.Form("txtRowCount")
    
'   response.write "k = " & k & "<br>"
   
      tDel = Request.Form("txtDel" & k) 'tDel will = "on"  or it will be nothing (if nothing it's length is not > then zero)
	  %>
	  <%
	   if len(tDel) > 0 then
        tID = CInt(Request.Form("txtID" & k))
		qry = qry & tID & ", "
		
'   response.write qry & "<hr>"
   
       end if
   Next


qry = left(qry, len(qry) - 2) & ")"  'the len(qry) - 2 get rid of the ", "

'Response.write "<hr> qry = " & qry & "<hr><br><br><br>"


conn.Execute qry


conn.close
Set conn = Nothing
%>

<h1>Processing Please Wait</h1>

<script language=javascript>
top.topframe.location.reload();
parent.mainframe.location.href="calendar.asp?txtYear=<%= Request.form("txtYear") %> &txtMonth=<%= Request.form("txtMonth") %>"
</script>

</body>
</html>