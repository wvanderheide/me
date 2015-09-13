
<%@ LANGUAGE="VBSCRIPT" %>
<% Response.Expires = 0 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!--#include file="credit.inc"-->

<html>
<head>
	<title>The eScheduler - Event Details</title>
    <link rel="stylesheet" href="stylesheets/calendar.css">
</head>

<body bgcolor="white">

<% 

'#################################################################
'## Create the connection to the DB
'#################################################################
  Set conn = Server.CreateObject("ADODB.Connection")
      conn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("db2.mdb") 

	
	
	
	
	


'#################################################################
'## Set the day of the month to display
'#################################################################

If Request.querystring <> ""  then
	dd = request("dd")
	mm = request("mm")
	yyyy= request("yyyy")
else
	dd = day(Now())
	mm = month(Now())
	yyyy = year(Now())
end if

	
	

dtCurView = DateSerial(yyyy, mm, dd)
'response.write dtCurView
	
	
	

'#################################################################
'## Get event info from the DB for selected year and month
'#################################################################
sSQL = "SELECT * FROM IRS_Calendar "
sSQL = sSQL  & "Where dd = " & dd & " AND mm = " & mm
sSQL = sSQL  & " ORDER BY hr, min"
Set rs = Server.CreateObject("ADODB.RecordSet")	

rs.ActiveConnection = conn
rs.open sSQL



Select Case mm
           Case "1"    mm="January" 
           Case "2"   mm="February" 
           Case "3"    mm="March"  
           Case "4"    mm="April" 
           Case "5"   mm="May" 
           Case "6"    mm="June" 
           Case "7"    mm="July" 
           Case "8"   mm="August" 
           Case "9"    mm="September" 
           Case "10"    mm="October" 
           Case "11"   mm="November" 
           Case "12"    mm="December" 
           Case Else     mm = "Error" 
      End Select

response.write "<div align=center id=title>" & mm & "&nbsp;" & dd & ",&nbsp;" & yyyy & "</div>"

response.write "<div align=right><a href ='javascript:history.back();'>Month View</a>&nbsp;&nbsp;&nbsp;</div>"
if not rs.eof then 
do while not rs.eof


dtStart = DateSerial(rs("yyyy"), rs("mm"), rs("dd"))
dtEnd = DateSerial(rs("yyyye"), rs("mme"), rs("dde"))
tmDiff = DateDiff("d",dtStart,dtEnd)

	hr =rs("hr")
	if len(hr) = 1 then hr = "0" & hr
	
	min = rs("min")
	if min = "0" then min = "00"

 strUA = Request.ServerVariables("HTTP_USER_AGENT")
If InStr(strUA, "MSIE") Then  'it's a Microsoft Browser 
 response.write"<table align=center width='98%' align=center bgcolor=gray cellpadding=5 cellspacing=1 >"
else
 response.write"<table align=center width='98%' align=center bgcolor=black cellpadding=5 cellspacing=1 border=1>"
end if

%>


<tr>
 <th colspan=2><i><%= rs("event_title") %></i></th>
</tr>
<% 
if hr <> 99 and min <> 99 then	
	response.write "<tr> <td align=right bgcolor=#eeeeee width='1%'><font color = #670003>Time: </font></td><td width=* bgcolor=white>" & hr & ":" & min  & "<span id = id3>"
	if tmDiff <> 0 then 
		response.write "&nbsp;&nbsp;(Today  through " & dtEnd & ")"
	else 	
		response.write "&nbsp;(Today Only)"
	end if

response.write "</span></td></tr>"
end if
%>
 
<tr> 
   <td align=right bgcolor=#eeeeee width='1%'><font color = #670003>Details:</font></td>
   <td width=* bgcolor=white><%= rs("details") %></td>
</tr>
   		<% if  rs("url") <> "NA" then %>
			<tr>
				<td align=right bgcolor=#eeeeee width='1%'><font color = #670003>URL:</font></td>
				<td width=* bgcolor=white><a href="<%= rs("url") %>"><%= rs("url") %></a></td>
			</tr>
<% end if %>
</table>
<br>
<%
rs.movenext
loop

else 

conn.Close
set conn = nothing
%><script language=javascript>history.back();</script><%

end if

rs.Close
set rs = nothing


conn.Close
set conn = nothing
%>

<SCRIPT LANGUAGE="JavaScript">					
if (navigator.appName != 'Netscape'){ 					
					document.write('&nbsp;&nbsp;' + '<a href = javascript:window.print()>Print</a>');						
					document.write('&nbsp;|&nbsp;' + '<a href = javascript:window.history.back();>Month View</a>');
					}
else {
			document.write('&nbsp;&nbsp;<span id = id3>Press [Cntrl-P] to PRINT  this page.</span>');
		}
</script>
</body>
</html>
