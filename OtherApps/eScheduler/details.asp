
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
'## Get event info from the DB for selected year and month
'#################################################################

sSQL = "SELECT * FROM IRS_Calendar "
sSQL = sSQL  & "Where id = " & request("id")
Set rs = Server.CreateObject("ADODB.RecordSet")	
rs.ActiveConnection = conn
rs.open sSQL


if not rs.eof then


	hr =rs("hr")
	if len(hr) = 1 then hr = "0" & hr
	
	min = rs("min")
	if min = "0" then min = "00"


 strUA = Request.ServerVariables("HTTP_USER_AGENT")
If InStr(strUA, "MSIE") Then  'it's a Microsoft Browser 
 response.write"<table align=center width='98%' align=center bgcolor=black cellpadding=5 cellspacing=1 >"
else
 response.write"<table align=center width='98%' align=center bgcolor=black cellpadding=5 cellspacing=1 border=1>"
end if
%>
<tr>
 <th colspan=2><i><%= rs("event_title") %></i></th>
</tr>
<% 
if hr <> 99 and min <> 99 then	response.write "<tr> <td align=right bgcolor=#eeeeee width='1%'><font color = #670003>Time: </font></td><td width=* bgcolor=white>" & hr & ":" & min & "</td></tr>"
%>
<tr> 
   <td align=right bgcolor=#eeeeee width='1%'><font color = #670003>From: </font></td>
   <td width=* bgcolor=white>	<%= rs("mm") %>/<%= rs("dd") %>/<%= rs("yyyy") %></td>
</tr>

<tr> 
   <td align=right bgcolor=#eeeeee width='1%'><font color = #670003>To: </font></td>
   <td width=* bgcolor=white><%= rs("mme") %>/<%= rs("dde") %>/<%= rs("yyyye") %></td>
 </tr>
 
<tr> 
   <td align=right bgcolor=#eeeeee width='1%'><font color = #670003>Details:</font></td>
   <td width=* bgcolor=white><%= rs("details") %></td>
</tr>
   		<% if  rs("url") <> "NA" then %>
			<tr>
				<td align=right bgcolor=#eeeeee width='1%'><font color = #670003>URL:</font></td>
				<td width=* bgcolor=white><a href="<%= rs("url") %>" target="new"><%= rs("url") %></a></td>
			</tr>
<% end if %>
</table>

<%
end if
rs.Close
set rs = nothing


conn.Close
set conn = nothing
%>
<center>

<SCRIPT LANGUAGE="JavaScript">					
if (navigator.appName != 'Netscape'){ 					
					document.write('&nbsp;&nbsp;' + '<a href = javascript:window.print()>Print</a>');						
					document.write('&nbsp;|&nbsp;' + '<a href = javascript:window.close();>Close</a><br><br>');
					}
else {
			document.write('&nbsp;&nbsp;<span id = id3>Press [Cntrl-P] to PRINT  this page.</span>');
			document.write("<form><input type=button value='Close' onClick='javascript:parent.close();'></form>")
		}
</script>
<table><tr><td valign=top>Tip:  </td><td valign=top>On the main calendar click the day of the week to see the details for everything scheduled on that day.</td></tr></table>
</center>
</body>
</html>
