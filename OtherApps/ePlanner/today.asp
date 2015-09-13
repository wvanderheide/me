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
 <title>the eDAY Planner -- Today's Schedule</title>
 <link REL="StyleSheet" TYPE="text/css" HREF="StyleSheets/style.css"> 
</head>

<%

strMonth=Month(Now)
strDay=WeekDay(Now)

	'response.write "<font color=red>day = " & strDay & "</font><hr>"	
	
Select Case strMonth
           Case "1"    strMonth="January" 
           Case "2"   strMonth="February" 
           Case "3"    strMonth="March"  
           Case "4"    strMonth="April" 
           Case "5"   strMonth="May" 
           Case "6"    strMonth="June" 
           Case "7"    strMonth="July" 
           Case "8"   strMonth="August" 
           Case "9"    strMonth="September" 
           Case "10"    strMonth="October" 
           Case "11"   strMonth="November" 
           Case "12"    strMonth="December" 
           Case Else     strMonth = "Error" 
      End Select
	  
	  	
Select Case strDay
           Case "1"    strDay="Sunday" 
           Case "2"   strDay="Monday" 
           Case "3"    strDay="Tuesday"  
           Case "4"    strDay="Wednesday" 
           Case "5"   strDay="Thursday" 
           Case "6"    strDay="Friday" 
           Case "7"    strDay="Saturday" 
           Case Else     strDay = "Error" 
      End Select





'Create the connection to the DB
Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("test.mdb")

Set DB = Server.CreateObject("ADODB.Recordset")



		SQL = "SELECT * FROM Planner " 
		SQL = SQL & "Where (Month = " & month(now) & " AND year = " & year(now) & " AND DAY = " & day(now)  & ")"	
		SQL = SQL & " ORDER BY TransDate;"
		
		response.write SQL
		
 Set DB.ActiveConnection = conn
 	 
	DB.Open SQL
	
	
	

%>


<body bgcolor=#000000>
<form action="today_update.asp" method="post" >
<table valign=top bgcolor="#999966" cellspacing="1" cellpadding="5" border="1" width=800>
<tr>
    <td colspan=2>
<%
response.write "<font color = #670003><b>" & strDay & " - " & strMonth & " " & day(now) & ", " &  year(now) & "</b></font><!--hr align=left width=80% color= black-->"
%>
</td></tr>
	<tr>
	 <td bgcolor=white>
<%

if not DB.BOF and Not DB.EOF then
DB.MoveFirst
%>
<UL>
<%
rowcount=0
Do while not DB.EOF
     notFuture = DateDiff("d", DB("Date1"), Now) ' if notFuture < 0 then DB("Date1") is in the future and we don't want to display it.
	if notFuture <= 7 then 
	 rowcount=rowcount+1
%>
	 <input type="hidden" name="txtId<%= rowcount %>" value="<%= DB("id") %>">
	 <input type="checkbox" name="txtDone<%= rowcount %>" <% if DB("Done") then response.write "CHECKED"%> > 
<% 
	if DB("Done") then 	response.write "<small class=crossedoff>&nbsp;" & DB("topic1") & "</small><br>"
	if not DB("Done") then response.write "&nbsp;" & DB("topic1") & "<br>"
	end if

DB.MoveNext 
loop
%>
</ul>
<input type="hidden" name="txtRowCount" value="<%= rowcount %>">
<%

conn.Close
set conn=Nothing
set DB=Nothing
%>
</td>
	</tr>
	<tr><td><input class=inputclass type="submit" name="txtSubmit" value="Remember Checks">&nbsp;</td>
</tr>
</table>
<%
else 'we have no records in DB</td>
%><font color=#990000><b>You have nothing scheduled for today!</b></font>
<ul><u><i>Here is how it Works</i></u>
<Li>To <small class=attention>add an item</small> to your schedule use the form at the bottom of this page.  First pick the date, next write a short (less than 250 characters) description of the task or event, and finally press the "add" button.
<li>To see the schedule for an <small class=attention>entire month</small>, select the month and year from the form at the top of this page and press the "go" button.
<li>To <small class=attention>delete an item</small> from your schedule, go to the entire month view (see the previous bullet item), navigate to the item you want to delete, check it, and  then press the "Delete Checked Items" button.  Note, more than one item may be checked and delete simultaneously.
<li>To <small class=attention>edit an item</small> already scheduled simply delete it then resubmit it.  For minor changes select the text, copy it to the clipboard, delete the item, paste the clipboard contents into the form at the bottom of this page, make the edits, and finally submit the edited item.
<li>To <small class=attention>look up a date</small>, click on the calendar link at the top of this page, and select the month and year of interest.
<li>To <small class=attention>mark an item completed</small>, check it on today's list, and press the "Remember Checks" button.  It is assumed all items will be completed on the day on which they are scheduled, hence this functionality is not available elsewhere.
<li>It is a good idea to <small class=attention>print</small> a copy of these instruction for future reference.
</td>
	</tr>
</table>
<% end if %>
</form>
</body>
</html>