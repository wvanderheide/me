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
	<title>Add to "to do" list</title>
	
<link REL="StyleSheet" TYPE="text/css" HREF="StyleSheets/style.css"> 
</head>
<body bgcolor=black>
<% 
'Create the connection to the DB
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("test.mdb") 

    strMonth = Request.Form("txtMonth")    
    strDay = Request.Form("txtDay")    
    strYear = Request.Form("txtYear")
	
	strDate = strMonth & "/"  & strDay & "/" & strYear
	
	strTopic1 = Request.Form("txtTopic1")	
	strTopic1 = Replace(Replace (strTopic1, """", "&quot;"), "'", "&#39;")

	qry="SELECT ID FROM Planner WHERE Month = " & strMonth & " AND DAY = " & strDay & " AND YEAR = " & strYear & " AND TOPIC1 = '" & strTopic1 & "';"

	'response.write "qry = " & qry & "<hr>"
	
	Set RS = Server.CreateObject("ADODB.Recordset")
	Set RS.ActiveConnection = conn
 	 
	 Note2="*blank*"	 
	 
	RS.Open qry
	
	if Not RS.bof then 
	 Note2="Well now, NOTE2 then is Not *blank*! "
	end if
        
	
	
if Note2="*blank*" then
sql = "INSERT INTO Planner "
sql = sql & "(Date1, Month, Day, Year, Topic1,TransDate) "
sql = sql &  "values ("
sql = sql & "'" & strDate & "', "
sql = sql &  strMonth &", "
sql = sql & "" & strDay &", "
sql = sql & "" & strYear &", "
sql = sql & "'" & strTopic1 &"', "
sql = sql & "'" & Now &"' "
sql = sql &");"

'response.write "<font color=red>sql = " & sql & "<hr>"


conn.Execute(sql)

conn.Close
Set conn = Nothing
%>

Thank you!
<script language=javascript>
top.topframe.location.reload();
top.mainframe.location.reload();
top.bottomframe.history.back();
</script>


<%
end if

if Note2 <> "*blank*" then%>
<small class=inputclass>"<%= strTopic1 %>" is already scheduled for <%= strDate %>.</small>&nbsp; &nbsp; <font color=#999966>Press here to <a target=_top href=index.html>REFRESH</a> the application.</font>
<% end if %>
</body>
</html>
