<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>HTML Encoder</title>
	<basefont size="3" face="Verdana">
</head>

<body bgcolor=white>
HTML Encoder
<form method="post">
<table <% if trim(request.form("txt")) <> "" then %>border=1 width=680 <% end if %>>
	<tr>
	<td valign=top  width=50%>
		<textarea cols="40" rows="20" name="txt"><%= request.form("txt") %></textarea>
		<br>
		<table cellspacing="2" cellpadding="2" border="0">
		<tr>
			<td><input type="checkbox" name="BrTag" value="True"></td>
		    <td>Show <%= Server.HtmlEncode("<br>") %> tags</td>
		</tr>
		<tr>
		    <td><input type="checkbox" name="TableTags" value="True"></td>
		    <td>Show table tags</td>
		</tr>
		</table>
		
		<br>
		<input type="submit" value="Convert to HTML">
		</form>
		<% 
		if trim(request.form("txt")) <> "" then
		%>
			</td><td valign=top bgcolor=eeeeee width=50%>
		<%
			call PrintHTML()
		end if
%>
</td>
	</tr>
</table>
<%
sub PrintHTML()
		x = Server.HtmlEncode(trim(request.form("txt")))
		replacement ="<br>"
		
		if  request.form("TableTags") = "True" and request.form("BrTag") = "" then
			x = Server.HtmlEncode("<table cellpadding=0 cellspacing=0 border=0 bordercolor=silver>") & chr(10) & "&nbsp;&nbsp;" & Server.HtmlEncode("<tr>") &chr(10) & "&nbsp;&nbsp;&nbsp;&nbsp;" &  Server.HtmlEncode("<td>") & chr(10) & x & chr(10) & "&nbsp;&nbsp;&nbsp;&nbsp;" & Server.HtmlEncode("</td>") & chr(10)  & "&nbsp;&nbsp;" & Server.HtmlEncode("</tr>") & chr(10) & Server.HtmlEncode("</table>")
			replacement = "<br>"
			response.write(replace(x,chr(10),replaceMent))	
		elseif request.form("BrTag") = "True" and request.form("TableTags") = "" then
			replacement = Server.HtmlEncode("<br>") & "<br>"
			response.write(replace(x,chr(10),replaceMent))	
		elseif request.form("BrTag") = "True" AND request.form("TableTags") = "True"  then
			replacement = Server.HtmlEncode("<br>") & "<br>"
			x = replace(x,chr(10),replacement)
			x = Server.HtmlEncode("<table cellpadding=0 cellspacing=0 border=0 bordercolor=silver>") &  "&nbsp;&nbsp;" &"<br>" & Server.HtmlEncode("<tr>") &"<br><br>" & chr(10) & "&nbsp;&nbsp;&nbsp;&nbsp;" &  Server.HtmlEncode("<td>") &"<br>" & chr(10) & x & "<br>" & chr(10) & "&nbsp;&nbsp;&nbsp;&nbsp;" & Server.HtmlEncode("</td>") &"<br>" & chr(10)  & "&nbsp;&nbsp;" & Server.HtmlEncode("</tr>") &"<br>" & chr(10) & Server.HtmlEncode("</table>")
			response.write(x)
		else
			response.write(replace(x,chr(10),replaceMent))	
		end if
end sub
 %>
</body>
</html>
