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

<script language=javascript>

function validForm(form) 
{
		if ( form.txtTopic1.value.length == 0) {
				alert("Please enter an event!")
				form.txtTopic1.focus()
				return false
			}
			
		// February check
		if (form.txtMonth.selectedIndex == 2 & form.txtDay.selectedIndex > 29) {
				alert("Invalid date!  February does not contain " + form.txtDay.selectedIndex + " days.")
				form.txtDay.focus()
				return false
			}
					
		// 30 day month check	
	   if (form.txtDay.selectedIndex==31 & (form.txtMonth.selectedIndex==4 | form.txtMonth.selectedIndex==6 | form.txtMonth.selectedIndex==9 | form.txtMonth.selectedIndex==11)  ){
			alert("Invalid date!  The month you selected does not contain 31 days.")
				form.txtMonth.focus()
				return false
			}

		
		return true
}
</script>
</head>

<body bgcolor=black>


<%
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

<form method="post" name="Calendar" action="bottomprocess.asp" Onsubmit= "return validForm(this)">
<table valign=top bgcolor="#999966" width=800 cellspacing="1" cellpadding="5" border="1">
<tr>
    <td>	
   <b>On</b> <select class=inputclass  name="txtMonth" size='1'> 
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
	</select>

<select class=inputclass  name="txtDay">
	<option selected value="<%= day(now) %>"><%= day(now) %>
	<option value="<%= day(now) %>">---
	<option value="1">&nbsp; 1
	<option value="2">&nbsp; 2
	<option value="3">&nbsp; 3
	<option value="4">&nbsp; 4
	<option value="5">&nbsp; 5
	<option value="6">&nbsp; 6
	<option value="7">&nbsp; 7
	<option value="8">&nbsp; 8
	<option value="9">&nbsp; 9
	<option value="10">10
	<option value="11">11
	<option value="12">12
	<option value="13">13
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
	<option value="25">25
	<option value="26">26
	<option value="27">27
	<option value="28">28
	<option value="29">29
	<option value="30">30
	<option value="31">31
</select>

<select class=inputclass  name="txtYear">
	<option selected value="<%=year(now) %>"><%= year(now) %>
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
</select> <b>I need to</b> 
<input type="text" name="txtTopic1" size="40" maxlength="250">&nbsp;<input type="submit" name="txtSubmit" value="Add" class=inputclass>&nbsp;<input type="Reset" name="txtSubmit" value="Clear" class=inputclass></td></tr>
</table>
</form>

</body>
</html>