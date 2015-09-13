<%

strUA = Request.ServerVariables("HTTP_USER_AGENT") 
If InStr(strUA, "MSIE") Then 
	call Main()	
else
	response.write "<li>Internet Explorer 4.0 or greater must be used to view this demo!"
end if



sub Main()

	if Request.ServerVariables("CONTENT_LENGTH") <> 0 then
		Session("title") = request.form("title")
		Session("Body") = replace(request.form("body"),chr(10),"<br>")
		
		'Make sure the text has blank space at least every 40 characters
		for i = 35 to len(Session("Body"))+35 step 35	
			StringRemain = mid(Session("Body"),i,Len(Session("Body")))
			checkstr = trim(mid(Session("Body"),i-34,i))
			
			if instr(checkstr,chr(32)) = 0 then Session("Body") = Left(Session("Body"),i-1) & "<br>" & StringRemain
		next
		
		
		if instr(UCase(Session("Body")),"SCRIPT") <> 0 then
			Session("Body") = replace(Session("Body"),"<SCRIPT","",1, -1, 1) 
			Session("Body") = replace(Session("Body"),"SCRIPT>","",1, -1, 1) 
		end if

		for each item in request.form
			if instr(LCase(item),"links") then
				'response.write "<li>" & item & " = " & request(item)
				Session(item) = request(item)
			end if
		Next		
		
		Session("UserAddedContent") = "Yep"
		response.redirect "demo.asp"
	else
	 %>	
	 <html>
	 <head>
	 	<title>Walter's Dynamic Site Demo</title>
		
	 <STYLE type="text/css">
		<!--
		/* classes */
			.body1  {font-size : 15px; font-family : verdana; color : black; font-weight : bold}
			.title1 {font-size : 17px; font-family : verdana; color : white;}
		/* tags */
		
	textarea {
			font-size : 8pt;
			font-family : Verdana,Arial, Helvetica, sans-serif;
			color : black;
		    BORDER-RIGHT: #000000 2px solid;
		    BORDER-TOP: #000000 2px solid;
		    BORDER-LEFT: #000000 2px solid;
		    BORDER-BOTTOM: #000000 2px solid;
			background-color : white;
			OVERFLOW: hidden;
							}
		input {
			font-size : 8pt; 
			font-family : Verdana,Arial, Helvetica, sans-serif;
		    BORDER-RIGHT: #000000 1px solid;
		    BORDER-TOP: #000000 1px solid;
		    BORDER-LEFT: #000000 1px solid;
		    BORDER-BOTTOM: #000000 1px solid;
			background-color : white;
			color : Black;
			}
			small  {font-size : 10px; font-family : verdana; color : black;}
			BODY {font-size : 14px; font-family : verdana; color : black;}
			h3  {font-family : verdana; color : white;}
			a { text-decoration : none;
			color: white; 
			font-family: Verdana, verdana, Helvetica, sans-serif;
			font-size: 10pt;
			font-style: normal;
			font-weight: normal; 
			}
			
			a:hover {
			color: black; 
			text-decoration:underline; 
			}
			
			a:active { 
			color: gray;
			}
			
			a:link { 
			color:white; 
			}
			
			a:visited { 
			color: white; 
			}
	
	          -->
	</STYLE>
	 
	  
	 </head>
	<body leftmargin=4 topmargin=0 bgcolor=white onload=document.forms[0].title.focus()>
	<form method = "post">
	<table cellpadding=0 cellspacing=0 border=0>
	<tr>
		<td valign=top  background = "images/linkBACK.gif" height=600>
		<!--Left Nav-->
			<table  cellpadding=0 cellspacing=0 border=0>
				<tr>
					<td><IMG SRC="images/LinkPic.gif" WIDTH=175 HEIGHT=214></td>
				</tr>
				<tr>
					<td align=center><% 
						for i = 1 to 3
							call LeftNav(i) 
						Next
						%>						
					</td>
				</tr>
			</table>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
		<!--End Left nav-->
		</td>
		<td   valign=top>
		<!--Main area-->
			<table cellpadding=0 cellspacing=0>
				<tr>
					<td background="images/title-area.gif" HEIGHT=68 align=center valign=middle><font class=title1><b>Add Title:</b> <input type="text" name="title" size="30" maxlength="30" tabindex="1"></font></td>
				</tr>
				<tr>
					<td><IMG SRC="images/box-top.gif" WIDTH=436 HEIGHT=12></td>
				</tr>
				<tr>
					<td background="images/box-back.gif" WIDTH=436 HEIGHT=12 align=center>
							<table cellpadding=12><tr><td align=center><font class=title1><b>Add Body</b></font><br>
							<textarea cols="50" rows="15" name="Body"></textarea><br><small>(HTML Tags can be used above)</small>
							</td></tr></table>
					</td>
				</tr>
				<tr>
					<td><IMG SRC="images/box-bottom.gif" WIDTH=436 HEIGHT=12></td>
				</tr>
			</table>
			<div align=center><input type="submit" name="SubmitName" value="Submit!">
			<br><small>(Click the <i><b>Submit</b></i> button above to display your content)</small>
			</div>
			
			<!--end main are-->
		</td>
	</form>
	</tr>
	</table>
			
	</body>
	<% 
	end if
end sub

sub leftNav(LinkNum)
%>
	<table cellpaddding=0 cellspacing=0>
		<tr>
			<td align=right>
				<small><%= LinkNum %>.</small>
				<input type="text" name="Links<%= LinkNum %>URL" size="14" maxlength="11" tabindex="2">
			</td>
		</tr>
		<tr>
			<td align=right>
				<nobr><small>a.</small>
				<input type="text" name="Links<%= LinkNum %>aURL" size="11" maxlength="11" tabindex="2"></nobr>
			</td>
		</tr>
		<tr>
			<td align=right>
				<nobr><small>b.</small>
				<input type="text" name="Links<%= LinkNum %>bURL" size="11" maxlength="11" tabindex="2"></nobr>
			</td>
		</tr>
		<tr>
			<td align=right>
				<nobr><small>c.</small>
				<input type="text" name="Links<%= LinkNum %>cURL" size="11" maxlength="11" tabindex="2"></nobr>
			</td>
		</tr>
	</table>
	<hr size=1 color=white align=center width=80%>
<%
end sub
%>
	 
