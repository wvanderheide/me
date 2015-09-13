<%
strUA = Request.ServerVariables("HTTP_USER_AGENT") 
If InStr(strUA, "MSIE") Then 
	call Main()	
else
	response.write "<li>Internet Explorer 4.0 or greater must be used to view this demo!"
end if


sub Main()
	Session.Abandon 
	If Session("title") = "" and Session("UserAddedContent") = ""  then Session("title") = "Walter's Dynamic Site Demo"
	
	if Session("Body") = "" then Session("Body") = "I will build you a dynamic website complete with simple tools that allow you to easily update your site whenever you want to. <p>Try it out!"
	
	if Session("Links1URL") = "" and Session("UserAddedContent") = "" then
		Session("Links1URL")   = "<a href='http://Yahoo.com' target='_New'>Yahoo</a>"
		Session("Links1aURL")  = "<a href='http://my.yahoo.com/' target='_New'>My Yahoo</a>"
		Session("Links1bURL")  = "<a href='http://mail.yahoo.com/' target='_New'>Mail</a>"
		Session("Links1cURL")  = "<a href='http://http://messenger.yahoo.com/' target='_New'>Messenger</a>"
		
	end if
	
	
	
	if Session("Links2URL") = "" and Session("UserAddedContent") = "" then Session("Links2URL")   = "<a href='http://Google.com' target='_New'>Google</a>"
	if Session("Links3URL") = "" and Session("UserAddedContent") = "" then Session("Links3URL")  = "<a href='http://abc.com' target='_New'>ABC</a>"
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
	<body leftmargin=4 topmargin=0 bgcolor=white>
	<table cellpadding=0 cellspacing=0 border=0>
	<tr>
		<td valign=top  background = "images/linkBACK.gif" height=600>
		<!--Left Nav-->
			<table  cellpadding=0 cellspacing=0 border=0>
				<tr>
					<td><IMG SRC="images/LinkPic.gif" WIDTH=175 HEIGHT=214></td>
				</tr>
				<tr>
					<td>
					<table cellpadding=0 cellspacing=0 border=0 width=160>
					<tr>
						<td>
						<% if  Trim(Session("Links1URL"))  <> "" then
								response.write "<nobr>&nbsp;&nbsp;&#149;&nbsp;</nobr>"
							  end if %>
						<%=  Session("Links1URL") %>
						</td>
					</tr>			
					<% if  Trim(Session("Links1URL"))  <> "" then call ABC("1") %>
						
								
					<tr>
						<td>						
						<% if  Trim(Session("Links2URL"))  <> "" then
								response.write "<nobr>&nbsp;&nbsp;&#149;&nbsp;</nobr>"
							  end if %>
						<%= Session("Links2URL") %>						
						</td>
					</tr>		
					<% if Trim(Session("Links2URL"))  <> "" then call ABC("2") %>
								
					<tr>
						<td>
						<% if  Trim(Session("Links3URL"))  <> "" then
								response.write "<nobr>&nbsp;&nbsp;&#149;&nbsp;</nobr>"
							  end if %>
						<%= Session("Links3URL") %>
						</td>
						</tr>
					<% if Trim(Session("Links3URL"))  <> "" then call ABC("3") %>
					</table>
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
					<td background="images/title-area.gif" HEIGHT=68 align=center valign=middle><font class=title1><b><%= Session("title")  %></b></font></td>
				</tr>
				<tr>
					<td><IMG SRC="images/box-top.gif" WIDTH=436 HEIGHT=12></td>
				</tr>
				<tr>
					<td background="images/box-back.gif" WIDTH=436 HEIGHT=12>
							<table cellpadding=10>
							<tr><td><font class=body1><%= Session("Body") %><%= "<br><br><a href=""demoAdd.asp"">Click here to update this demo site with your own content.</a>" %></font></td></tr><%
					 if Session("UserAddedContent") <> "" then %>
								<tr><td>
							<font size="-4" color=white>(In a "real" content management system the links would be active)</font>
						<% end if %>
							</table>
					</td>
				</tr>
				<tr>
					<td><IMG SRC="images/box-bottom.gif" WIDTH=436 HEIGHT=12></td>
				</tr>
			</table>
			
						
			<!--end main are-->
		</td>
	</tr>
	</table>
			
	</body>
<%
end sub

Function ReplaceH(x)
	x =	Replace(LCase(x),"http://www","")
	x =	Replace(LCase(x),"http","")
	
	x =	Replace(LCase(x),".com","")
	x =	Replace(LCase(x),".gov","")
	x =	Replace(LCase(x),".net","")
	x =	Replace(LCase(x),".org","")
ReplaceH = Ucase(x)
end function


sub ABC(x) 
	for i = 1 to 3
		abc1 = "a"
		if i = 2 then abc1 = "b"
		if i = 3 then abc1 = "c"
		SName = "Links" & x & abc1 & "URL"
		if Trim(Session(SName)) <> "" then
			response.write "<tr><td><nobr><img src=""images/spacer.gif"" width=30 height=1 border=0><img src=""images/false.gif"">"
			if Session("UserAddedContent") = "" then
				response.write Session(SName)			
			else
				response.write "<font color=White><u>" & Session(SName) & "</u></font>"
			end if
			Response.write "</nobr></td></tr>" & vbcrLf
		end if
	Next
end sub
 %>