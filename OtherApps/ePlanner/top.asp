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
 <title>the eDAY Planner</title>
 <link REL="StyleSheet" TYPE="text/css" HREF="StyleSheets/style.css"> 
 
<script language=javascript>
function pop() 
{
window.open('datechecker.asp','LIST','left=20, top=5, toolbar=no,width=280,height=300,resizable=yes')
}
</script>
</head>

<%
'Create the connection to the DB
Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("test.mdb")

Set DB = Server.CreateObject("ADODB.Recordset")




		SQL = "SELECT * FROM Planner " 
		SQL = SQL & "Where (Month = " & month(now) & " or month = " & month(now)+1 &") AND year = " & year(now)	
		SQL = SQL & " ORDER BY DATE1, TransDate;"
				
		if month(now) =12 and day(now) >24 then
		 SQL = "SELECT * FROM Planner " 
		 SQL = SQL & "Where (Month = " & month(now) & " AND YEAR = " & year(now) & ") or (Month = 1 AND YEAR = " & year(now)+1 & ")"
		end if
			
		
		'response.write "<font color=orange> " & SQL & "</font><p>"
		
 Set DB.ActiveConnection = conn
     DB.Open SQL
	 
	 strMonthWord=Month(now)
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


<body bgcolor=#000000>


<form action="calendar.asp" method="get" target="mainframe">
<table valign=top bgcolor="#000000" cellspacing="1" cellpadding="5" border="0" width=800>
<tr><th colspan=3><img src="images/eDayPlanner.gif" width="137" height="29" border="0" alt=""></th></tr>
<tr>
    <td width=150 align=right><font color=#999966><b>7 Day Forecast:<b></font></td>
    <td width=650 colspan=2>
	  <marquee scrolldelay="100" width="590" height="15" class=test bgcolor=#999966>

<%
if not DB.BOF AND not DB.EOF then 'there are  records in the data set
inloop = false
Do while Not DB.EOF
  notFuture = DateDiff("d", DB("Date1"), Now) ' if notFuture < 0 then DB(Date1) is in the future and we don't want to display it.
	If (notFuture >=-7 AND notFuture <0) then 
		inloop=true %>			
		&#129; <font color=#990000><%= DB("Date1") %>:</font> 
		&nbsp;<%= DB("topic1") %>.... &nbsp; &nbsp; 
<%  end if

DB.MoveNext 
loop
If not inloop then %>
Nothing scheduled for the next 7 days...  
<%
end if	
else 
%>
Nothing scheduled for the next 7 days.  
<%
end if
conn.Close
set conn=Nothing
set DB=Nothing
%>
</marquee></td>

</tr>
<tr>
 <td><a href=javascript:pop();><b>Calendar</b></a></td>
 
 <td align=center><font color=#999966><b>View plans for </b></font>
<select name="txtMonth" size='1' class=inputclass> 
  		<option selected value="<%= Month(now) %>"><%= strMonthWord %>
		<option value="<%= Month(now) %>">--------
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
	</select>&nbsp;
	
<select name="txtYear" class=inputclass>
	<option selected value"<%= year(now) %>"><%= year(now) %>
	<option value="<%=year(now) %>">----
<% 
i=0
year1=year(now)-6

For i = 1 to 11
year2 = year1 + i
%> 
<option value="<%= year2 %>"><%= year2 %></option>
<%
Next
%>
</select>&nbsp;
<input class=inputclass type="submit" value=" Go! ">&nbsp;</td>
<td align=right><a href=today.asp target=mainframe><b>To Do Today</b></a></td>
</tr>
</table>
</form>
</body>
</html>