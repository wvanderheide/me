
<%@ LANGUAGE="VBSCRIPT" %>
<% Response.Expires = 0 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!--#include file="credit.inc"-->

<html>
<head>
	<title>The eScheduler - Event Details</title>
    <link rel="stylesheet" href="stylesheets/calendar.css">
	<script language="JavaScript1.3" src="javaScripts/scripts.js" ></script>	
</head>

<body bgcolor=black>
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
		mm = trim(rs("mm"))
		 if len(mm) = 1 then  	mm = "0" & mm
		 dd = trim(rs("dd"))
		 if len(dd) = 1 then  	dd = "0" & dd
		 
		mme = trim(rs("mme"))
		 if len(mme) = 1 then  	mme = "0" & mme
		 dde = trim(rs("dde"))
		 if len(dde) = 1 then  	dde = "0" & dde
		 
		 url = rs("url")		 
		 if url = "NA" then url = "http://"
		 
		hr = rs("hr")
	    if len(hr) = 1 then 
			hr = "0" & hr
		elseif hr = "99" then
			hr = "hr"
		end if
		
		min = rs("min")
		if min = "0" then 
			min = "00"
		elseif min = "99" then 
			min = "min"
		end if
%>
<!--############### insert ###################-->
<form action="toDBUpdate.asp" name="form1" action="post" onSubmit="return fSubmit();">
<br>
<div align=center><font color=white>Edit the data below<br>and click <i>Update</i></font></div>
<table align=center width="100%" align=center bgcolor=#eeeeee cellpadding=2 cellspacing=0 border=1 bordercolor="#cccc99">
<tr>
 <th>Update Data</th>
</tr>
<tr>
 <td align=center>
 <br>

<% strUA = Request.ServerVariables("HTTP_USER_AGENT")
If InStr(strUA, "MSIE") Then  'it's a Microsoft Browser %>

 	<font color="#670003">Start Date:</font>
	<br>
    <nobr><input type="text" name="mm" size="2" maxlength="2" value="<%= mm %>" onFocus=this.value="">-
<input type="text" name="dd" size="2" maxlength="2" value="<%= dd %>"  onFocus=this.value="">-
<input type="text" name="yyyy" size="4" maxlength="4" value="<%=rs("yyyy") %>"  onFocus=this.value="">
	<br>
 	<font color="#670003">End Date:</font>
	<br>
    <input type="text" name="mme" size="2" maxlength="2" value="<%= mme %>" onFocus=this.value="">-
<input type="text" name="dde" size="2" maxlength="2" value="<%= dde %>"  onFocus=this.value="">-
<input type="text" name="yyyye" size="4" maxlength="4" value="<%= rs("yyyye") %>"  onFocus=this.value=""></nobr>
<br>
	<span id=label>Time: (24 hr)</span>
	<br>
	<select name="hr"  size="1">					
	<option selected value="<%= rs("hr") %>"><%= hr %>	
	<option value="99">&nbsp;
	<option value="0">00
	<option value="1">01
	<option value="2">02
	<option value="3">03
	<option value="4">04
	<option value="5">05
	<option value="6">06
	<option value="7">07
	<option value="8">08
	<option value="9">09
	<option value="10">10
	<option value="11">11	
	<option value="12">12
	<option value="12">13
	<option value="14">14
	<option value="15">15	
	<option value="16">16
	<option value="17">17
	<option value="18">18
	<option value="19">19
	<option value="20">20
	<option value="21">21
	<option value="22">22
	<option value="23">23
<option value="24">24
	</select>:	
	
	<select name="min"  size="1">			
	<option selected value="<%= rs("min") %>"><%= min %>
	<option value="99">&nbsp;
	<option value="00">00
	<option value="15">15
	<option value="30">30
	<option value="45">45</select>&nbsp;
	<br>
	<font color="#670003">Event Title:</font>
	<br>
	<input type="text" name="event_title" size="20" maxlength="50" value="<%= rs("event_title") %>">
	<font color="#670003">Details:</font><br><textarea name="details" rows="4"><%= rs("details") %></textarea>
	<font color="#670003">URL:</font>
	<br>
	<input type="text" name="url" size="20" maxlength="254" value="<%= url %>">
<% 'If InStr(strUA, "Mozilla") Then  'it's a Netscape-compatible browser
else

'########
'## NOTE: the onFocus event handler was removed for Netscape because it cause the field to clear upon submission after an error was caugth in the date
'########
%>
 	<font color="#670003">Start Date:</font>
	<br>
    <nobr><input type="text" name="mm" size="1" maxlength="2" value="<%= mm %>">-
<input type="text" name="dd" size="1" maxlength="2" value="
<%= dd %>"  >-
<input type="text" name="yyyy" size="2" maxlength="4" value="
<%= rs("yyyy") %>"  >
	<br>
 	<font color="#670003">End Date:</font>
	<br>
    <input type="text" name="mme" size="1" maxlength="2" value="<%= mme %>" >-
<input type="text" name="dde" size="1" maxlength="2" value="<%= dde %>"  >-
<input type="text" name="yyyye" size="2" maxlength="4" value="<%= rs("yyyye") %>"  ></nobr>
<br>
	<span id=label>Time: (24 hr)</span>
	<br>
	
	<select name="hr"  size="1">					
	<option selected value="<%= rs("hr") %>"><%= hr %>	
	<option value="99">&nbsp;
	<option value="0">00
	<option value="1">01
	<option value="2">02
	<option value="3">03
	<option value="4">04
	<option value="5">05
	<option value="6">06
	<option value="7">07
	<option value="8">08
	<option value="9">09
	<option value="10">10
	<option value="11">11	
	<option value="12">12
	<option value="12">13
	<option value="14">14
	<option value="15">15	
	<option value="16">16
	<option value="17">17
	<option value="18">18
	<option value="19">19
	<option value="20">20
	<option value="21">21
	<option value="22">22
	<option value="23">23
<option value="24">24
	</select>:
	
	<select name="min" size="1">			
	<option selected value="<%= rs("min") %>"><%= min %>
	<option value="99">&nbsp;
	<option value="00">00
	<option value="15">15
	<option value="30">30
	<option value="45">45</select>&nbsp;
	<br>
	<font color="#670003">Event Title:</font>
	<br>
	<input type="text" name="event_title" size="10" maxlength="50" value="<%= rs("event_title") %>"><br>
	<font color="#670003">Details:</font><br><textarea name="details" cols="9" rows="3"><%= rs("details") %></textarea>
<br>
	<font color="#670003">URL:</font>
	<br>
	<input type="text" name="url" size="10" maxlength="254" value="<%= url %>">
<%  end if %>
<br>
<input type="submit" name="Submit" value="Update"></td>
</tr>
</table>
<input type="hidden" name="hevent_title" value="<%= rs("event_title") %>">
</form>
<!--############### end insert ###################-->
<% end if
rs.Close
set rs = nothing


conn.Close
set conn = nothing
%>
<center>
<form name="form2"><input type=button value='Close' onClick='javascript:self.close();'></form></center>
</body>
</html>
