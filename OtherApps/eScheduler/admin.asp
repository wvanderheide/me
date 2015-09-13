
<%@ LANGUAGE="VBSCRIPT" %>
<% Response.Expires = 0 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!--#include file="credit.inc"-->

<% 
mm=request("month")
if len(mm) > 2 then mm = CInt(mm)

dd=request("day") 
if len(dd) > 2 then dd = CInt(dd)


%>
<html>
<head>

    <title>The eScheduler</title>
    <link rel="stylesheet" href="stylesheets/calendar.css">
	<script language="JavaScript1.3" src="javaScripts/scripts.js" ></script>
</head>

<body bgcolor=black onLoad="ffocus();">
<form action="toDB.asp" name="form1" action="post"  onSubmit="return fSubmit();">
<table align=center width="100%" align=center bgcolor=#eeeeee cellpadding=2 cellspacing=0 border=1 bordercolor="#cccc99">
<tr>
 <th><span style="color:#cccc99; font-size : 10; font-family : Arial">e</span>Scheduler</th>
</tr>
<tr>
 <td align=center>
<% strUA = Request.ServerVariables("HTTP_USER_AGENT")
If InStr(strUA, "MSIE") Then  'it's a Microsoft Browser %>

 	<span id=label>Start Date:</span>
	<br>
    <nobr><input type="text" name="mm" size="2" maxlength="2" value="<%= mm %>" onFocus=this.value="">-
<input type="text" name="dd" size="2" maxlength="2" value="
<%= dd %>"  onFocus=this.value="">-
<input type="text" name="yyyy" size="4" maxlength="4" value="
<%= request("year") %>"  onFocus=this.value="">
	<br>
 	<span id=label>End Date:</span>
	<br>
    <input type="text" name="mme" size="2" maxlength="2" value="<%= mm %>" onFocus=this.value="">-
<input type="text" name="dde" size="2" maxlength="2" value="
<%= dd %>"  onFocus=this.value="">-
<input type="text" name="yyyye" size="4" maxlength="4" value="
<%= request("year") %>"  onFocus=this.value=""></nobr>
<br>
	<span id=label>Time: (24 hr)</span>
	<br>
	<select name="hr"
	        size="1">			
	<option value="99">hr
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
	
	<select name="min"
	        size="1">	
	<option value="99">min
	<option value="00">00
	<option value="15">15
	<option value="30">30
	<option value="45">45</select>&nbsp;
	<!--
	<select name="ampm">
	<option value="99">&nbsp;
	<option value="AM">AM</option>
	<option value="PM">PM</option></select>-->
	<br>
	<span id=label>Event Title:</span>
	<br>
	<input type="text" name="event_title" size="20" maxlength="50">
	<span id=label>Details:</span><br><textarea name="details" rows="4"></textarea>
	<span id=label>URL:</span>
	<br>
	<input type="text" name="url" size="20" maxlength="254" value="http://">
	<span id=label>File:</span>
	<!--<br>
<INPUT TYPE=file NAME="up" size="8">-->
<% 'If InStr(strUA, "Mozilla") Then  'it's a Netscape-compatible browser
else

'########
'## NOTE: the onFocus event handler was removed for Netscape because it cause the field to clear upon submission after an error was caugth in the date
'########
%>
 	<span id=label>Start Date:</span>
	<br>
    <nobr><input type="text" name="mm" size="1" maxlength="2" value="<%= mm %>">-
<input type="text" name="dd" size="1" maxlength="2" value="
<%= dd %>"  >-
<input type="text" name="yyyy" size="2" maxlength="4" value="
<%= request("year") %>"  >
	<br>
 	<span id=label>End Date:</span>
	<br>
    <input type="text" name="mme" size="1" maxlength="2" value="<%= mm %>" >-
<input type="text" name="dde" size="1" maxlength="2" value="
<%= dd %>"  >-
<input type="text" name="yyyye" size="2" maxlength="4" value="
<%= request("year") %>"  ></nobr>
<br>
	<span id=label>Time: (24 hr)</span>
	<br>
	
	<select name="hr"
	        size="1">			
	<option value="99">hr
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
	<select name="min"
	        size="1">	
	<option value="99">min
	<option value="00">00
	<option value="15">15
	<option value="30">30
	<option value="45">45</select>&nbsp;
	<br>
	<span id=label>Event Title:</span>
	<br>
	<input type="text" name="event_title" size="10" maxlength="50">
	<span id=label>Details:</span><br><textarea name="details" cols="9" rows="3"></textarea>
	<br>
	<span id=label>URL:</span>
	<br>
	<input type="text" name="url" size="10" maxlength="254" value="http://">
<%  end if %>
<br>
<input type="submit" name="Submit" value="Add">&nbsp;
<input type="button" name="Reset" value="Reset" onClick=location='admin.asp?day=dd&month=mm&year=yyyy'></td>
</tr>
</table>
</form>


</body>
</html>
