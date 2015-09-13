<% 
'############################################
'############################################
'
'		Ensure Active Scripting (JavaScript) is enabled
'
'############################################
'############################################

%>
<!--
	<noscript><META HTTP-EQUIV=REFRESH CONTENT="0; URL= Warning.htm"></noscript> 
	This is taken care of in the sharedprocedures file that is used on all pages of the "me" site
-->
<%


'############################################
'############################################
'
'		Make sure the browser is IE
'
'############################################
'############################################

'This code was removed and Placed in SharedProcedures instead


'##########################################
'##  Calendar Class
'##########################################
Class Calendar
	Private p_ListMonths
	'p_ListMonths is true or false, 
	' if true then displayed is a drop down of the months in the Calender Sub,
	' if false then displayed is the Month and year as a link to the big calendar in the Calender Sub
	
	Private p_intCalendarWidth
	
	Private p_PicFolder
	
	Public Property Let PicFolder(FolderName)
		Select Case FolderName
           Case "Calendar_Seattle","Calendar_MountainBike" 
		   			p_PicFolder = FolderName 
		  end select
	End Property
	
	Public Property Get PicFolder
		PicFolder = p_PicFolder
	End Property
	
	Public Property Let intCalendarWidth(intX)
		if IsNumeric(intX) then
			p_intCalendarWidth = intX
		end if
	End Property
	
	Public Property Get intCalendarWidth
		intCalendarWidth = p_intCalendarWidth
	End Property
	
	Public Property Let ListMonths(in_boolean)
		if in_boolean = 0 or in_boolean = -1 then 'it is either True or False
			p_ListMonths = in_boolean
		else
			p_ListMonths = false
		end if
	End Property
	
	Public Property Get ListMonths()
		ListMonths = p_ListMonths
	End Property
	
	Private Function DtPrevSunday(ByVal dt)
	      Do While WeekDay(dt) > vbSunday
	         dt = DateAdd("d", -1, dt)
	      Loop
	   DtPrevSunday = dt
	End Function
	
	public sub out(str)   
		response.write str & vbcrlf
	end sub
	
	Public Sub StyleSheet(intFontSize,strFontFamily,strDayNumberColor,strDayWordBackGroundColor,strDayWordForeColor,strMonthWordColor)
		%>
		<style type="text/css">
		<!--
		
		select {
			font-size : <%= intFontSize %>px;
			font-family : <%= strFontFamily %>; 
			color : <%= strMonthWordColor %>;
			font-weight : 700;
		}		
		
		option {
			font-size : <%= intFontSize %>px;
			font-family : <%= strFontFamily %>; 
			color : <%= strMonthWordColor %>;
			font-weight : 700;
		}		
		
		a { text-decoration : none;
		color: black; 
		font-family: <%= strFontFamily %>;
		font-size: <%= intFontSize %>px;
		font-style: normal;
		font-weight: normal; 
		}
		
		a:active { 
		color: white;
		}
		
		
		a:visited { 
		color: black; 
		}
		
		a:hover {
		color: silver; 
		text-decoration:underline; 
		}
		
		.DayWordBackGround{
		font-size : <%= intFontSize %>px;
		font-family : <%= strFontFamily %>;
		color : <%= strDayWordForeColor %>;
		background-color : <%= strDayWordBackGroundColor %>;
		}
		
		.DayNumber { 
		text-decoration : none;
		font-size : <%= intFontSize %>px;
		font-family : <%= strFontFamily %>;
		color : <%= strMonthWordColor %>;
		}
		
		.MonthWord {
		font-size : <%= intFontSize %>px;
		font-family : <%= strFontFamily %>;
		color : <%= strMonthWordColor %>;
		}
		 -->
		</style>
		<%
	end sub
	
	
	Public sub Pictures(strIframeSource)
		dim  intHeight
		intHeight = intCalendarWidth*238/300
		 %>
		<table height="<%=  intCalendarWidth*2 %>" width="<%=  intCalendarWidth %>" cellpadding=0 cellspacing=0 border=1 bordercolor=silver>
			<tr height="<%=  intCalendarWidth %>">
				<td align=center>
					<img src="<%= p_PicFolder %>/<%= month(date) %>.jpg" width="<%= intCalendarWidth %>" border="0" alt="" id="pic"></td>
			</tr>
			<% if Instr(strIframeSource,".") > 1 then  %>
			<tr height="<%= intCalendarWidth %>">
				<td  align=center valign=middle><iframe src="<%= strIframeSource %>" name="Calendar" width="<%= intCalendarWidth %>" height="100%" marginwidth="0" marginheight="0" align="middle" frameborder="0" scrolling="no"></iframe></td>		
			</tr>
			<% end if %>
		</table>
		<%
	end sub
	
	Private Sub JS()
	%>	
		<script>
			function fSubmit(obj){
				if(parent.pic != null){parent.pic.src = "<%= picFolder %>/" + obj.value + ".jpg"}
				document.form1.submit();
			}//end fSubmit
			function ParseQuery(str){
				var mnth
				mnth = <%= Month(Now+1) %>*1 + 1
				if (mnth == 13) {mnth=1}
				if (str.length > 0){
						x = str.indexOf("CURDATE_YEAR");
						if (x == 17) {mnth = str.slice( x-2,x-1)*1 + 1;}
						else if (x == 18){mnth = str.slice( x-3,x-1)*1 + 1;}
						
						if (mnth == 13){mnth=1}
						return mnth + ".jpg"
					}
				else{ return mnth + ".jpg"}
			}//end ParseQuery
			
			
			function ParseQueryBak(str){
				var mnth
				mnth = <%= Month(Now+1) %>*1 - 1
				if (mnth == 0) {mnth=12}
				if (str.length > 0){
						x = str.indexOf("CURDATE_YEAR");
						if (x == 17) {mnth = str.slice( x-2,x-1)*1 - 1;}
						else if (x == 18){mnth = str.slice( x-3,x-1)*1 - 1;}
						
						if (mnth == 0){mnth=12}
						return mnth + ".jpg"
					}
				else{ return mnth + ".jpg"}
			}//end ParseQuery
		</script>
	<%
	end sub
	
	Public Sub MakeCalendar(strBorderColor,strBackGroundColor)	  
		Dim dtCurViewMonth ' First day of the currently viewed month
		Dim dtCurViewDay ' Current day of the currently viewed month
		dim intHeight, intCellHeight
		
		intHeight = intCalendarWidth -2
		intCellHeight = (intHeight/8 ) - 8
			
		'MakeCalendar uses the ListMonths property, so check that it is set
		if p_ListMonths = "" then p_ListMonths = false
		
		' include the JS
		call JS()
	
		dtToday = Date()
		mnth = month(now())
		tmpyear = year(now())
		dtCurViewMonth = DateSerial(Year(dtToday), Month(dtToday), 1)
	
		rowcount=0 
	 
		If Request.querystring <> ""  then
				mnth = CLng(Request("CURDATE_month"))
				'response.write "<li>" &mnth& "<hr>"
				tmpyear = Request("CURDATE_year")
				if tmpyear = "" then tmpyear = year(now())
				dtCurViewMonth = DateSerial(tmpyear, mnth, 1) 
		end if 
		
		out "<table border=""0"" bgcolor=""" & strBorderColor & """ cellpadding=1 cellspacing=1 width=" & intCalendarWidth  & " height="&  intHeight &">"
		out "<tr height=" & intCellHeight  &">"
		out "<form NAME=""form1"" ACTION=""" &  request.servervariables("SCRIPT_NAME") & """ METHOD=""get"">"
		 out "<td align=center  colspan=7 bgcolor=""" & strBackGroundColor & """>"
		
		LastMonth = mnth - 1
		 LastYear = tmpYear
		 If LastMonth = 0 then 
		 	LastMonth =12
			LastYear = tmpyear - 1
		end if
		 out "<nobr>&nbsp;<a href='" & Request.ServerVariables("SCRIPT_NAME") & "?CURDATE_month=" & LastMonth & "&CURDATE_YEAR=" & LastYear & "' title='Previous Month' onClick=""if(parent.pic != null){var x; x =ParseQueryBak(location.search);x='" & picFolder & "/' + x; parent.pic.src = x}""><</a>&nbsp;"
	
		if p_ListMonths then	 'Set p_ListMonths property to true if want a drop down of months
			 out "<select name=""CURDATE_month"" onChange=""fSubmit(this);"">"
			 i = 0
			 for i = 1 to 12 
			 	response.write "<option value='" & i & "' "
				if mnth = i then response.write " Selected "
				out ">" & monthName(i) & " " & tmpYear
			Next
			
			out " </select>"
		else
			out "<span class = MonthWord>" & monthname(mnth) & " " & tmpyear & "</span>"
		end if
		
		 
		 NextMonth = mnth + 1
		 NextYear = tmpYear
		
		 If NextMonth = 13 then 
		 	NextMonth =1
			NextYear = tmpyear + 1
		end if
		 out "&nbsp;<a href='" & Request.ServerVariables("SCRIPT_NAME") & "?CURDATE_month=" & NextMonth & "&CURDATE_YEAR=" & NextYear & "'  title='Next Month' onClick=""if(parent.pic != null){var x; x =ParseQuery(location.search);x='" & picFolder & "/' + x; parent.pic.src = x}"">></a>&nbsp;</nobr>"	 
		 out "<input TYPE='hidden' NAME='CURDATE_YEAR' VALUE='" & year(dtCurViewMonth) & "' size='4' maxlength='4' onFocus=this.value=''></td>"
	 	 out "</form>"
		 out " </tr>"
		 
		 out "<tr height=" & intCellHeight  &" VALIGN=""TOP"" class=""DayWordBackGround""> "
		  For iDay = vbSunday To vbSaturday 
				out "<th WIDTH='14%'>" & Left(WeekDayName(iDay),2) & "</th>"
		 Next 		 
		 out "</tr>"
		 
		dtCurViewDay = DtPrevSunday(dtCurViewMonth)
	
		iWeek = 0
		do until iWeek > 5   
				 out "<TR VALIGN=TOP height =" & intCellHeight  &" bgcolor=""" & strBackGroundColor & """ >" 		
				 count = 0
				 
				 For iDay = 0 To 6					
					out  "<TD valign=top align=right class=DayNumber>"
			
					'---- Write day of month
					if (iWeek = 0 and Day(dtCurViewDay) > 7) or (iWeek >3 and Day(dtCurViewDay)<23 )then
					   Response.Write "&nbsp;" 
					else 					
						response.write "<span class=DayNumber>"
						
						if  dtCurViewDay = date() then
							response.write "<font color=red>" & Day(dtCurViewDay) & "</font>"
						else
							response.write Day(dtCurViewDay)
						end if							
						out  "</span>"						
			   		end if
					out "</TD>"
					
					dtCurViewDay = DateAdd("d", 1, dtCurViewDay)
			  	Next
			  
			  	out "</TR>"
			  	iWeek = iWeek + 1
		loop
		out "</table>"		
	end sub
	
	sub CalendarClassPublicInterFace()
		%>
		<table cellspacing="1" cellpadding="4" border="0" bordercolor=eeeeee bgcolor=white>
			<tr><th colspan=2>Calendar Class Public Interface</th></tr>
			<tr bgcolor=teal>
			    <td>Property</td>
			    <td>Description</td>
			</tr>
			<tr>
			    <td>ListMonths</td>
			    <td>Sets or Gets a boolean value indicating wheter or not a drop down navigation of months is displayed. ListMonths is true when the drop down is display, otherwise if is false. If false (or not set)  then the name of the current month is displayed.</td>
			</tr>
			<tr bgcolor=eeeeee>
			    <td>intCalendarWidth</td>
			    <td>Sets or Gets the width of the calendar in pixels.</td>
			</tr>
			
			<tr>
			    <td>PicFolder</td>
			    <td>Gets or Sets the folder name from which the calendar images will be from.  
						<br><br>Valid values are : 				
						<ul>
							<li>Calendar_Seattle
							<li>Calendar_MountainBike
						</ul>
				</td>
			</tr>
			<tr>
			    <td></td>
			    <td></td>
			</tr>
		
			<!-- Methods -->
			<tr>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			</tr>
			<tr bgcolor=teal>
			    <td>Method</td>
			    <td>Description</td>
			</tr>
			<tr>
			    <td>StyleSheet(intFontSize, strFontFamily, strDayNumberColor, strDayWordBackGroundColor, strDayWordForeColor, strMonthWordColor)</td>
			    <td>This subroutine sets the look (font, and colors) of the calendar.</td>
			</tr>
			
			<tr bgcolor=eeeeee>
			    <td>MakeCalendar(strBorderColor,strBackGroundColor)	</td>
			    <td>This subroutine draws the calender with the supplied border and background colors. <br><br><b><i>Properties need to be set before calling MakeCalendar, in order for them to have the desired effect on the Calendar. </i></b>  </td>
			</tr>
			
			<tr>
			    <td>Pictures(strIframeSource)</td>
			    <td>Draws a table with a picture, and if supplied a valid strIframeSource then if adds an Iframe below the picture.</td>
			</tr>
			<tr>
			    <td></td>
			    <td></td>
			</tr>
		</table>

		<%
	end sub
End Class
 %>