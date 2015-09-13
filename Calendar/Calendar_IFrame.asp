<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Calendar Sample</title>
</head>

<body>
<!--#include file="CalendarClass.asp"-->  
<% 
Set ObjCal = New Calendar
ObjCal.intCalendarWidth = 220

objCal.PicFolder = "Calendar_MountainBike"
'ObjCal.Pictures ""
ObjCal.ListMonths = true 'uncomment if you'd like the months to be navigatable by a dropdown.
ObjCal.MakeCalendar "000000","eeeeee"
ObjCal.StyleSheet 12,"Verdana", "maroon", "232323", "white", "black"


'ObjCal.out "<hr><li>width = " & ObjCal.intCalendarWidth & "<li>ListMonths = " & ObjCal. ListMonths & "<hr>"

'ObjCal.CalendarClassPublicInterFace
%>

</body>
</html>