
<% @LANGUAGE = VBScript %>
<!--#include file="credit.inc"-->

<html>
<head>
	<title> The eScheduler - to DB</title>
	<link REL="StyleSheet" TYPE="text/css" HREF="StyleSheets/calendar.css"> 
</head>

<body bgcolor=black>
<font color=white>Processing<br>
...Please Wait
<%


'#################################################################
'## Create the connection to the DB
'#################################################################
	  
'Create the connection to the DB
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("db2.mdb") 

	

'#################################################################
'## Define and initial variables
'#################################################################
dd = CInt(Request("dd"))
mm = CInt(Request("mm"))
yyyy = CInt(Request("yyyy"))

hr = Request("hr")
min = Request("min")
'ampm = Request("ampm")

dde = CInt(Request("dde"))
mme = CInt(Request("mme"))
yyyye = CInt(Request("yyyye"))

event_title = Replace(Replace(Request("event_title"), """", "&quot;"), "'", "&#39;")

details = Replace(Replace(Request("details"), """", "&quot;"), "'", "&#39;")
if details = "" then details = "NA"
url = Request("url")
if url = "http://" then url = "NA"

dtStart = DateSerial(yyyy,mm,dd)
dtEnd = DateSerial(yyyye,mme,dde)

tmDiff = DateDiff("d",dtStart,dtEnd)


'#################################################################
'## Make sure the event title is unique
'#################################################################
Set rs = Server.CreateObject("ADODB.Recordset")
	sql="SELECT * FROM IRS_Calendar WHERE event_title='" & event_title & "'" 

   rs.Open sql, conn
    
	If  Not rs.EOF  then
		conn.close
		set conn = Nothing
		response.write "<br><br><font color=red><b>Error</font></b><br>Please see the alert box"
		%>
		<script language=javascript>
			alert("The event title  \"<%= event_title %>\" is not unique.\nPlease choose a unique event title.");
			history.back();
			
		</script>
		<%
	end if
	


'######################################
'## Do an Insert into
'######################################
qry = "INSERT INTO IRS_Calendar (event_title, dd, mm, yyyy, dde, mme, yyyye, hr, min, details, url, UploadDate) "

qry = qry & "VALUES("  
qry = qry & "'" & event_title & "', "
qry = qry & dd & ", "
qry = qry & mm & ", "
qry = qry & yyyy &", "
qry = qry & dde & ", "
qry = qry & mme & ", "
qry = qry & yyyye &", "
qry = qry & hr &", "
qry = qry & min &", "
'qry = qry & "'" & ampm &"', "
qry = qry & "'" & details & "', "
qry = qry & "'" & url & "', "
qry = qry & "'" & Now & "'"
qry = qry & ");"

conn.execute qry

'######################################
'## Do an Insert into FOR a DATE RANGE
'######################################

if tmDiff <> 0 then
event_title = event_title & "--continued"

    For J = 1 To tmDiff
	
		NewStartDate = DateAdd("d", J, dtStart)

		qry = "INSERT INTO IRS_Calendar (event_title, dd, mm, yyyy, dde, mme, yyyye,  hr, min, details, url,UploadDate) "
		qry = qry & "VALUES("  
		qry = qry & "'" & event_title & "', "
		qry = qry & Day(NewStartDate) & ", "
		qry = qry & Month(NewStartDate) & ", "
		qry = qry & Year(NewStartDate) &", "
		qry = qry & dde & ", "
		qry = qry & mme & ", "
		qry = qry & yyyye &", "
		qry = qry & hr &", "
		qry = qry & min &", "
		'qry = qry & "'" & ampm &"', "
		qry = qry & "'" & details & "', "
		qry = qry & "'" & url & "', "
		qry = qry & "'" & Now & "'"
		qry = qry & ");"
		
		conn.execute qry
	Next
    
end if


	conn.close
	set conn = Nothing
%>
<script language=javascript>
	top.frames[1].location='adminview.asp?CURDATE_month=<%= CInt(Request("mm")) %>&CURDATE_YEAR=<%= CInt(Request("yyyy")) %>'
	//'
	top.frames[0].location='admin.asp?day=dd&month=mm&year=yyyy'
</script>

</body>
<html>

