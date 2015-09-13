<%@ LANGUAGE="VBSCRIPT" %>
<% 
Response.Expires = 0


'************************************************************************
'Application Name:  the ePlanner
'Version:		   	1.0
'Release Date:		November 28, 2000
'Created by:		Walter VanderHeide
'Programmed by:		Walter VanderHeide
'Last Updated:		March 8, 2001 (added Check for leap year)
'************************************************************************
%>

<html>
<head>
<title>Calendar</title>

<link REL="StyleSheet" TYPE="text/css" HREF="StyleSheets/style.css"> 

</head>

<%

strMonth=request.QueryString("txtMonth")
strYear=request.QueryString("txtYear")

		
Select Case strMonth
           Case "1"    strMonthword="January" 
		   			   count = 31
           Case "2"   strMonthword="February" 
		   				count = 28 'see leap year adjustment below
           Case "3"    strMonthword="March"  
		   				count = 31
           Case "4"    strMonthword="April" 
		   				count = 30
           Case "5"   strMonthword="May" 
		   				count = 31
           Case "6"    strMonthword="June" 
		   				count = 30
           Case "7"    strMonthword="July" 
		   				count = 31
           Case "8"   strMonthword="August" 
		   				count = 31
           Case "9"    strMonthword="September" 
		   				count = 30
           Case "10"    strMonthword="October" 
		   				count = 31
           Case "11"   strMonthword="November" 
		   				count = 30
           Case "12"    strMonthword="December" 
		   				count = 31
           Case Else     strMonthword = "Error" 
		   				count = 30
      End Select
	  
'Adjust count for February of a leap year
if strMonth=2 then
	if( (strYear mod 4 = 0 AND strYear mod 100 <> 0) OR (strYear mod 400=0)  ) then count = 29
end if
	
	  
'Create the connection to the DB
Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("test.mdb")


	
Set DB = Server.CreateObject("ADODB.Recordset")


%>
<body bgcolor=#000000>
<form action="RemoveData.asp" method="post">

<table width=800 align=left border=1 cellpadding=4 bgcolor=#999966 border=1>
<tr>
<td align=center bgcolor=#660003 colspan=2 valign=center>
<a name = top></a>
<br><h3><font color=#999966><%= strMonthword %>&nbsp;<%= strYear %></font></h3>
|
<% for i= 1 to count %>
	<a href="#day<%= i %>"><small class=inputclass2><%= i %></small></a> | 
<%next%>
 </td>

<tr>
<td colspan=2>

<%	
rowcount=0
for i = 1 to count

		SQL = "SELECT * FROM Planner " 
		SQL = SQL & "Where Month = " & strMonth & " AND Year = " & strYear & " AND DAY = " & i
		SQL = SQL & " ORDER BY Day, TransDate;"
		
'response.write SQL	
 Set DB.ActiveConnection = conn 	 
	 DB.Open SQL
	 
	 
   if  i mod 2 = 0 then color= "#ffffff"
   if i mod 2 <> 0 then color = "#ffffff"
   
   TheDate = strMonthword & " " & i & ", " & strYear
   strDay = Weekday(TheDate)
   'response.write "<li>TheDate = " & TheDate & "<li>strDay = " & strDay
   
     	
Select Case strDay
           Case "1"    strDay="&nbsp;Sunday" 
           Case "2"   strDay="&nbsp;Monday" 
           Case "3"    strDay="&nbsp;Tuesday"  
           Case "4"    strDay="&nbsp;Wednesday" 
           Case "5"   strDay="&nbsp;Thursday" 
           Case "6"    strDay="&nbsp;Friday" 
           Case "7"    strDay="&nbsp;Saturday" 
           Case Else     strDay = "&nbsp;Error" 
      End Select
   
   %>
   <table width=100% align=center bgcolor=black cellpadding=5 cellspacing = 1 border=1>
	<tr>
	<td bgcolor=<%= color %>>
	<a name = "day<%= i %>"></a>
	   <font color=#990000><b><%= i %></b></font> 
	   <small class=inputclass> <%= strDay %> </small>
	   <br>
	   <ul>
<%
If not DB.BOF and Not DB.eof then
   DB.MoveFirst
Do while not DB.Eof
rowcount = rowcount + 1
%>
 <input type="checkbox" name="txtDel<%= rowcount %>">&nbsp; 
 <% 
 	if DB("Done") then 	response.write "<small class=crossedoff>&nbsp;" & DB("topic1") & "</small>"
	if not DB("Done") then response.write "&nbsp;" & DB("topic1")
 %>
 
 <br>
<input type="hidden" name="txtID<%= rowcount %>" value="<%= DB("ID") %>">
 <% DB.Movenext 
   loop
    %>
<p align=right><input type="submit" name="txtX" value="Delete Checked Items" class=inputclass>&nbsp; &nbsp;</p>
<%
else
%>
<li><font color=#aaaaaa>Nothing Scheduled</font>
<%
end if
%> 
	</ul>
	
	</td></tr></table>&nbsp;&nbsp;<a href=#top class=inputclass2><font color=#670003>top</font></a>
<%
DB.close
next

conn.Close
set conn=Nothing
set DB=Nothing
%>

	
</td></tr></table>
<input type="hidden" name="txtMonth" value="<%= strMonth %>">
<input type="hidden" name="txtYear" value="<%= strYear %>">
<input type="hidden" name="txtRowCount" value="<%= rowcount %>">
</form>
</body>
</html>