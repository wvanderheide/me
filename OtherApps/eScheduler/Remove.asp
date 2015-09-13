
<%@ LANGUAGE="VBSCRIPT" %>
<% Response.Expires = 0 %>
<!--#include file="credit.inc"-->

<html>
<head>
	<title>The eScheduler -Delete Items</title>
	<link REL="StyleSheet" TYPE="text/css" HREF="StyleSheets/calendar.css"> 
</head>

<body>

<%

'#################################################################
'## Create the connection to the DB
'#################################################################
  Set conn = Server.CreateObject("ADODB.Connection")
      conn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("db2.mdb") 

    
   For k = 0 to Request.form("txtRowCount")
    
   		title = Request.form("txtDel" & k)
		title =	Replace(Replace(title, """", "&quot;"), "'", "&#39;")
		'response.write "<li>" & title
		
		if len(title) > 0 then
			'###  DELETE the main entery
	   		qry = "DELETE FROM IRS_Calendar "	
 			qry = qry & " WHERE event_title  ='" &  title & "'"			
			conn.Execute qry			
			
			'###  DELETE the "continued" enteries
	   		qry = "DELETE FROM IRS_Calendar "	
 			qry = qry & " WHERE event_title  ='" &  title & "--continued'"
			conn.Execute qry
		end if
   Next




conn.close
Set conn = Nothing
%>

<h1>Processing Please Wait</h1>

<script language=javascript>
    top.frames[1].location='adminview.asp?CURDATE_month=<%= CInt(Request("mm")) %>&CURDATE_YEAR=<%= CInt(Request("yyyy")) %>'
</script>

</body>
</html>