
<%@ LANGUAGE="VBScript" %>
<% Response.Expires = 0 %>
<!--#include file="credit.inc"-->

<%
	

'#################################################################
'## This Function sets the Previous Sunday and the Current Month 
'#################################################################
   Function DtPrevSunday(ByVal dt)
      Do While WeekDay(dt) > vbSunday
         dt = DateAdd("d", -1, dt)
      Loop
   DtPrevSunday = dt
   End Function
   
   
	


	  

'#################################################################
'## Declare and initialize key variables
'#################################################################
Dim event_title(31)
Dim record_id(31)
Dim timearry(31)
Dim dtCurViewMonth ' First day of the currently viewed month
Dim dtCurViewDay ' Current day of the currently viewed month
Dim frmDate ' Date submitted by form

dtToday = Date()
mnth = month(now())
tmpyear = year(now())
dtCurViewMonth = DateSerial(Year(dtToday), Month(dtToday), 1)

rowcount=0 

'#################################################################
'## if the GO button was used, reset the DATE accordingly
'#################################################################

If Request.querystring <> ""  then
		mnth = Request("CURDATE_month")
		tmpyear = Request("CURDATE_year")
		frmDate = DateSerial(tmpyear, mnth, 1) 
		dtCurViewMonth = frmDate
end if


'#################################################################
'## Create the connection to the DB
'#################################################################
  Set conn = Server.CreateObject("ADODB.Connection")
      conn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("db2.mdb") 

	
	

'#################################################################
'## Get event info from the DB for selected year and month
'#################################################################

sSQL = "SELECT * FROM IRS_Calendar "
sSQL = sSQL  & "Where mm = " & mnth & " AND yyyy = " & tmpyear
sSQL = sSQL  & " ORDER BY hr, min,id"

Set Rs2 = Server.CreateObject("ADODB.RecordSet")	
Rs2.ActiveConnection = conn
Rs2.open sSQL


if not Rs2.eof then
Rs2.movefirst
	Do While not Rs2.eof
	
	
	hr = Rs2("hr") & ":"
	
	if len(hr) = 2 then
		hr = "0" & hr 
	elseif hr = "99:" then
		hr = "&nbsp;"
	end if
	
	min = Rs2("min")
	if min = "0" then 
		min = "00"
	elseif min = "99" then
		min = "&#0149;"
	end if
	
	 Select Case Cint(Rs2("dd"))
            Case 1	event_title(1) = event_title(1) & "|" & Rs2("event_title") 
					record_id(1) =  record_id(1) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr &  min
			Case 2  event_title(2) = event_title(2) & "|" & Rs2("event_title") 
					record_id(2) =  record_id(2) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
            Case 3  event_title(3) = event_title(3) & "|" & Rs2("event_title")
					record_id(3) =  record_id(3) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 4  event_title(4) = event_title(4) & "|" & Rs2("event_title")
					record_id(4) =  record_id(4) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 5  event_title(5) = event_title(5) & "|" & Rs2("event_title")
					record_id(5) =  record_id(5) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 6  event_title(6) = event_title(6) & "|" & Rs2("event_title")
					record_id(6) =  record_id(6) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 7  event_title(7) = event_title(7) & "|" & Rs2("event_title")
					record_id(7) =  record_id(7) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 8  event_title(8) = event_title(8) & "|" & Rs2("event_title")
					record_id(8) =  record_id(8) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 9  event_title(9) = event_title(9) & "|" & Rs2("event_title")
					record_id(9) =  record_id(9) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 10  event_title(10) = event_title(10) & "|" & Rs2("event_title")
					record_id(10) =  record_id(10) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 11 event_title(11) = event_title(11) & "|" & Rs2("event_title")
					record_id(11) =  record_id(11) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 12  event_title(12) = event_title(12) & "|" & Rs2("event_title")
					record_id(12) =  record_id(12) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 13  event_title(13) = event_title(13) & "|" & Rs2("event_title")
					record_id(13) =  record_id(13) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 14  event_title(14) = event_title(14) & "|" & Rs2("event_title")
					record_id(14) =  record_id(14) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 15  event_title(15) = event_title(15) & "|" & Rs2("event_title")
					record_id(15) =  record_id(15) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 16  event_title(16) = event_title(16) & "|" & Rs2("event_title")
					record_id(16) =  record_id(16) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 17  event_title(17) = event_title(17) & "|" & Rs2("event_title")
					record_id(17) =  record_id(17) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 18  event_title(18) = event_title(18) & "|" & Rs2("event_title")
					record_id(18) =  record_id(18) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 19  event_title(19) = event_title(19) & "|" & Rs2("event_title")
					record_id(19) =  record_id(19) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 20  event_title(20) = event_title(20) & "|" & Rs2("event_title")
					record_id(20) =  record_id(20) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 21  event_title(21) = event_title(21) & "|" & Rs2("event_title")
					record_id(21) =  record_id(21) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 22  event_title(22) = event_title(22) & "|" & Rs2("event_title")
					record_id(22) =  record_id(22) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 23  event_title(23) = event_title(23) & "|" & Rs2("event_title")
					record_id(23) =  record_id(23) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 24  event_title(24) = event_title(24) & "|" & Rs2("event_title")
					record_id(24) =  record_id(24) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 25  event_title(25) = event_title(25) & "|" & Rs2("event_title")
					record_id(25) =  record_id(25) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 26  event_title(26) = event_title(26) & "|" & Rs2("event_title")
					record_id(26) =  record_id(26) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 27  event_title(27) = event_title(27) & "|" & Rs2("event_title")
					record_id(27) =  record_id(27) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 28  event_title(28) = event_title(28) & "|" & Rs2("event_title")
					record_id(28) =  record_id(28) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 29  event_title(29) = event_title(29) & "|" & Rs2("event_title")
					record_id(29) =  record_id(29) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 30  event_title(30) = event_title(30) & "|" & Rs2("event_title")
					record_id(30) =  record_id(30) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
			Case 31  event_title(31) = event_title(31) & "|" & Rs2("event_title")
					record_id(31) =  record_id(31) & "|" & Rs2("id")
					timearry(CInt(Rs2("dd"))) = timearry(CInt(Rs2("dd"))) & "|" & hr & min
      End Select
	  
	Rs2.movenext
  	Loop

end if
Rs2.Close
set Rs2 = nothing


conn.Close
set conn = nothing






'###########################################################################
'##  --------BEGINNING OF DRAW CALENDAR SECTION--------
'###########################################################################   
%>

<html>
<head>
 <title>The eScheduler - View</title>
<link rel="stylesheet" href="stylesheets/calendar.css">
<script language="JavaScript1.3" src="javaScripts/scripts.js" ></script>
</head>

<% 
strMonthWord = mnth
Select Case strMonthWord
           Case "1"    strMonthWord="January" 
           Case "2"   strMonthWord="February" 
           Case "3"    strMonthWord="March"  
           Case "4"    strMonthWord="April" 
           Case "5"   strMonthWord="May" 
           Case "6"    strMonthWord="June" 
           Case "7"    strMonthWord="July" 
           Case "8"   strMonthWord="August" 
           Case "9"    strMonthWord="September" 
           Case "10"    strMonthWord="October" 
           Case "11"   strMonthWord="November" 
           Case "12"    strMonthWord="December" 
           Case Else     strMonthWord = "Error" 
      End Select
 %>
<body>
<form NAME="form1" ACTION="<%= request.servervariables("SCRIPT_NAME") %>" METHOD="get">
<div align=center>
<font id=title><%= strMonthWord %>&nbsp;&nbsp;<%= tmpyear %></font>
</div>

<table align=center cellpadding=2 border=1 bordercolor="#670003"><tr><td>View:&nbsp;</td><td id=id2>
<select name="CURDATE_month" onChange="submit();">
  <option value="<%= mnth %>" selected><%=monthName(month(dtCurViewMonth))%>
  <option value="<%= mnth %>">&nbsp;
  <option value="1">January
  <option value="2">February
  <option value="3">March
  <option value="4">April
  <option value="5">May
  <option value="6">June
  <option value="7">July
  <option value="8">August
  <option value="9">September
  <option value="10">October
  <option value="11">November
  <option value="12">December
</select>

<input TYPE="text" NAME="CURDATE_YEAR" VALUE="<%=year(dtCurViewMonth)%>" size="4" maxlength="4" onFocus=this.value="" onKeyUp="fkeyStroke(this)">&nbsp;</td>
</tr>
</table>
</form>
<% strUA = Request.ServerVariables("HTTP_USER_AGENT")
	   if InStr(strUA, "MSIE") Then  'it's a Microsoft Browser
 %>
			<table CELLPADDING="3" CELLSPACING="1" WIDTH="98%" BORDER="0" BGCOLOR="gray" align=center>
<% else %>	
			<table CELLPADDING="3" CELLSPACING="1" WIDTH="98" BORDER="1" BGCOLOR="white" align="center">
<% end if %>
<tr><td align=center colspan=7 bgcolor=white width="100%">To view details of any scheduled event click the title associated with the first day of the event.<br><span id =time>Note: Times are displayed as 24 hr times.</span></td></tr>
  <tr VALIGN="TOP" ALIGN="CENTER" BGCOLOR="black">

 <% For iDay = vbSunday To vbSaturday %>
     <th WIDTH="14%"><%=WeekDayName(iDay)%></th>
 <%Next %>

         </tr>

<%
   dtCurViewDay = DtPrevSunday(dtCurViewMonth)

iWeek = 0
NextMonth = month(dtCurViewMonth)

do until iWeek > 5 
 if NextMonth <> month(dtCurViewMonth) then exit do
  
 Response.Write "<TR VALIGN=TOP>" & vbCrLf

 count = 0
 For iDay = 0 To 6
	count = count + 1
	sBGCOLOR = "#FFFFFF"
	sFontColor = "#00000"

	Response.Write "<TD HEIGHT=50 bgcolor='" & sBGCOLOR & "' >"

'---- Write day of month
	Response.Write "<FONT COLOR= & sFontColor & ><B>"
	if (iWeek = 0 and Day(dtCurViewDay) > 7) or (iWeek >3 and Day(dtCurViewDay)<23 )then
	   Response.Write " " 
	else 	
	
	%><font color=black><a href = "dayview.asp?dd=<%= Day(dtCurViewDay) %>&mm=<%= Month(dtCurViewDay) %>&yyyy=<%= Year(dtCurViewDay) %>"><font color=black><%= Day(dtCurViewDay) %></font></a></font>
<font id=id>

	<%
	
	  all_events = Split(event_title(Day(dtCurViewDay)), "|")
	  all_ids = Split(record_id(Day(dtCurViewDay)), "|")
	  all_times = Split(timearry(Day(dtCurViewDay)), "|")
	 
	if ubound(all_events) = ubound(all_ids)then
	  For K = lbound(all_events)+1 To ubound(all_events)	
	  	 rowcount=rowcount+1
		 if Instr(all_events(K), "--continued") = 0  then
			response.write "<table  cellpadding=1 cellspacing=0><tr><td valign=top align=right><span id = time>" & all_times(K) & "</span></td><td valign=top><a href =" & """" & "javascript:Pop('details.asp?id=" & all_ids(K) & "', 300, 280)" & """>" &  all_events(K) & "</a></td></tr></table>"

		else 
			response.write "<table  cellpadding=1 cellspacing=0><tr><td valign=top align=right><span id = time>" & all_times(K) & "</span></td><td valign=top><span id = id3>"  & all_events(K) & "</span></td></tr></table>"
 %>
</font>
<%
		end if
	  Next
	end if
   end if
	
	Response.Write "</B>" & "</FONT><BR>"         
	Response.Write "</TD>" & vbCrLf
	dtCurViewDay = DateAdd("d", 1, dtCurViewDay)
	NextMonth = month(dtCurViewDay)
  Next
  
  Response.Write "</TR>" & vbCrLf
  iWeek = iWeek + 1
loop

'###########################################################################
'## --------END OF DRAW CALENDAR SECTION-------- 
'###########################################################################

%>
</table>

<SCRIPT LANGUAGE="JavaScript">					
if (navigator.appName != 'Netscape'){ 					
					document.write('&nbsp;&nbsp;&nbsp;' + '<a href = javascript:window.print()>Print</a>');	
					}
else {
			document.write('&nbsp;&nbsp;<span id = id3>Press [Cntrl-P] to PRINT  this page.</span>');
		}
</script>
</body>
</html>
