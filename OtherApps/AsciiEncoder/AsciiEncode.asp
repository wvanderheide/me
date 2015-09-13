<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Ascii Encode</title>
</head>

<body background="snow.gif">
<a name=Top></a>
<font color=white>
Enter text below that you want converted to HTML ASCII code:</font>
<br>
<form method=post>
<input type="text" name="txt"> <input type="submit" name="z" value="Go!">
</form>
<%
if  Request.ServerVariables("CONTENT_LENGTH") > 0 then
	x = AsciiCode(Request("txt"))
	response.write "<li><font color=white>ASCII Encoded : " & Server.HTMLEncode(x)
	response.write " (" & x & ")</font>"
end if
%>
<hr>

<SCRIPT LANGUAGE="JavaScript">
<!-- Begin

document.write("<h2><font color=silver>HTML ASCII Codes</font></h2><table border=0  bgcolor=white><tr><td valign=top>")
document.write("<table border=1>")
tcount = 0
for(var count=33; count<255; count++) {

	if(tcount % 25 ==0 && tcount > 0)
	{
	    document.write('</td></tr></table></td><td  valign=top><table  border=1>')
	}
	tcount = tcount + 1;
	
	document.write('<tr><td align=center><font face=arial color=red><b>')
	document.write( '&#');
	document.write(count);
	document.write("</b></font></td><td align=center>")
	document.write('&amp;&#35;' + count  + ";</td></tr>");
}

document.write("</table>")

document.write("</td></tr>")
document.write("</table>")
document.write("<a href=#Top>Top</a>");
// End -->
</script>
</body>
</html>

<% 
    function ASCIICode(strInput)
      strOutput = ""
      For i = 1 To Len(strInput)
        strOutput = strOutput & "&#" & ASC(Mid(strInput, i, 1)) & ";"
      Next
      ASCIICode = strOutPut
    End function 
%>
