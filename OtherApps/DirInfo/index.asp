<%@ LANGUAGE="VBSCRIPT" %>
<% 
	Response.Expires = 0  
	Server.ScriptTimeOut = 90
	'Response.Buffer = True 
	
'########################################################################
'##  	-Set value of keyfolder. i.e. keyfolder = "C:\InetPub\wwwroot"
'##		-Keyfolder should be set to the most common folder of interest, such as the path of
'##		the root of the website using this file
'########################################################################
			
keyfolder = "C:\Inetpub\wwwroot"
if Request.ServerVariables("Server_Name") = "www13.brinkster.com" then
  keyfolder = "\\genfs1\www13\vanman798"
end if
'"
driveError = false

Set ScriptObject = CreateObject("Scripting.FileSystemObject")   
%>

<html>
<head>
<title>Server/Drive Data</title>
</head>
<body>
<center>
<a name="top"></a> 
<form name=form1 action=<%= Request.ServerVariables("SCRIPT_NAME") %>>
<!--
'########################################################################
'## 	Set up the main navigation
'########################################################################-->
<table width='100%'>
	<tr>
		<td width='50%'  valign=top>&nbsp;View: 		
		<a href="<%= Request.ServerVariables("SCRIPT_NAME") %>?ServerData=yep">Server Data</a> | 
		<a href="<%= Request.ServerVariables("SCRIPT_NAME") %>?driveData=yep">Drive Data</a> | 
		<a href="<%= Request.ServerVariables("SCRIPT_NAME") %>?totals=<%= keyfolder %>"><%= keyfolder %></a></td>
		<td width='50%' align=right valign=top>
			Enter any valid folder path: <input type="text" name="totals"><input type="submit" name="Go" value="Go!">&nbsp;<input type="Reset"></td>
	</tr>
</table>
<%

'########################################################################
'## 	Main Display according to querystring values
'########################################################################

if request.querystring("drivedata") <> "" then	
'########################################################################
'## 	Display Drive Data
'########################################################################
	sTitle("Drive Data")	
	DriveData() 	
elseif request.querystring("ServerData") <>"" then
driveError = true
'########################################################################
'## 	Server Data
'########################################################################
sTitle("Server Data")
%>
<table cellpadding=5 cellspacing=1 border=1>
	<tr><th>SERVER_NAME</th><td><%= Request.ServerVariables("SERVER_NAME") %></td></tr>
	<tr><th>SERVER_SOFTWARE</th><td><%= Request.ServerVariables("SERVER_SOFTWARE") %></td></tr>
	<tr><th>SERVER_PORT</th><td><%= Request.ServerVariables("SERVER_PORT") %></td></tr>
	<tr><th>SERVER_PROTOCOL</th><td><%= Request.ServerVariables("SERVER_PROTOCOL") %></td></tr>
	<tr><th>GATEWAY_INTERFACE</th><td><%= Request.ServerVariables("GATEWAY_INTERFACE") %></td></tr>
	<tr><th>HTTP_CONNECTION</th><td><%= Request.ServerVariables("HTTP_CONNECTION") %></td></tr>
	<tr><th>HTTPS</th><td><%= Request.ServerVariables("HTTPS") %></td></tr>
	<tr><th>INSTANCE_ID</th><td><%= Request.ServerVariables("INSTANCE_ID") %></td></tr>
	<tr><th>LOCAL_ADDR</th><td><%= Request.ServerVariables("LOCAL_ADDR") %></td></tr>
	<tr><th>LOGON_USER</th><td><%= Request.ServerVariables("LOGON_USER") %></td></tr>
<tr><th>REMOTE_ADDR</th><td><%= Request.ServerVariables("REMOTE_ADDR") %></td></tr>
	<tr><th>REMOTE_HOST</th><td><%= Request.ServerVariables("REMOTE_HOST") %></td></tr>
	<tr><th>REMOTE_IDENT</th><td><%= Request.ServerVariables("REMOTE_IDENT") %></td></tr>
	<tr><th>REMOTE_USER</th><td><%= Request.ServerVariables("REMOTE_USER") %></td></tr>
</table>
<%
	
elseif request.querystring("folderpath") <> "" then
'########################################################################
'## 	Display Break down of Sub-Folder
'########################################################################
	theTitle = "Break Down of <b><i>" & trim(request("folderpath")) & "</i></b>"
	sTitle(theTitle)	
	
	temp = fReplace(request.querystring("folderpath"))	
	
	Set objFolder1 =ScriptObject.GetFolder(temp) 'Returns a Folder obj
	Set objSubFolder1 = objFolder1.SubFolders
	
	'draw nav to sub-folders of request.querystring("folderpath")
	
	if CInt(objSubFolder1.count) > 1 then
		out "Sub-Folders: "
		For Each item in objSubFolder1
		   out "<a href=#" & item.name & ">" & item.name & "</a>" & " | "
		Next
		out "<br><br>"
	end if
	
	
	'draw table for each subfolder of request.querystring("folderpath")
	out "<ol>"
	For Each item in objSubFolder1	
		out "<li>"
	   SomeFolderData item.Path, item.Name
	Next
	out "</ol>"
	
	Set objFolder1 = Nothing
	Set objSubFolder1 = Nothing

elseif request.querystring("path_of_files") <>"" then
'########################################################################
'## 	Display List of files for request.querystring("path_of_files")
'########################################################################
	temp = fReplace(request.querystring("path_of_files"))
	Set obj =ScriptObject.GetFolder(temp) 'Returns a Folder obj
	Set obj2 = obj.Files 'returns a files collection
	
	theTitle = "Files of <b><i>" & trim(request("path_of_files")) & "</i></b>"
	sTitle(theTitle)	
	'out "<br>Note: Only asp, gif, jpg, png, htm, html, txt, doc, and pdf file types are linked"
	out "<table align=center><tr><td align=left><ol>"
	
	For Each item in obj2
	if instr(Ucase(item.Path), UCase(keyfolder)) then
		if (instr(item.Name,".asp") or instr(item.Name,".htm") or instr(item.Name, ".txt")  or instr(item.Name, ".pdf")   or instr(item.Name, ".doc") or instr(item.Name, ".png")  or instr(item.Name, ".gif") or instr(item.Name, ".jpg")) then
		    if LCase(Request.ServerVariables("Server_Name")) = "localhost" then
				out "<li><a target=_new href='http://" & Request.ServerVariables("LOCAL_ADDR")	&   replace(Ucase(item.Path), UCase(keyfolder), "") & "'>" & item.Name & "</a>"
			else
			    out "<li><a target=_new href='http://" & Request.ServerVariables("Server_Name") & "/vanman798"	&   replace(Ucase(item.Path), UCase(keyfolder), "") & "'>" & item.Name & "</a>"
			end if
		else
			out "<li>" & item.name
		end if
	end if
	Next	
		out "</ol></td></tr></table>"
	set obj=Nothing
	set obj2=Nothing
else
'########################################################################
'## 	Default -- no QueryString or unrecognized QS variable or submited via input box
'##     Display Totals for user submitted path.  (Default to keyfolder value)
'########################################################################
	if request.querystring("totals") = "" then
		temp = keyfolder
	else
		temp = trim(request.querystring("totals"))
	end if
	
	'The function SomeFolderData doesn't work for a root folder value of "C:\" or a value of "C", and it displays the hidden files for a root folder value of C:
	'Since drive data shows the totals for a root folder we'll use instead when len of value < 4 call drive data.
	if len(temp) = 1 then temp = temp & ":"
	if len(temp) = 3 And Instr(temp, "\") <> 0 then
			'"
			temp = left(temp,2)
	end if
	if len(temp) =2  then 	
	
			sTitle("Drive Data")	
			if request.querystring("totals") <>"" then	out "<div align=center>Please find totals for the " & temp & " drive below </div>"

			'check if temp is a valid drive letter
		Set drivecheck = ScriptObject.Drives
		checker = false
		for each item in drivecheck
		 	if item.Path = UCase(temp) then checker = true
		next
		Set drivecheck = nothing
			if checker then
				DriveData()
			else
				driveError = true
				out "<br><br><li><font size='+2' color='Red'>Error:</font> The <b><i>" & trim(request.querystring("totals"))  & "</i></b> drive doesn't exist."
			end if
	else
		theTitle = "Totals of <b><i>" & temp & "</i></b>"
		sTitle(theTitle)	
	   	SomeFolderData temp,  "&nbsp;"
	   	out "<br>"
	end if
	
	
end if
   
Set ScriptObject = Nothing
%>
</form>
<% if request.querystring("path_of_files") ="" and Not driveError then %>
Hint:  Click the folder count number under the <i>Folder Count</i> column to see data for that folder, likewise click the file count number under the <i>File Count</i> column to see the file names.
<% end if %>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>	
<%
'<!--#include file="../includes/Procedures.inc"--> 
'#############################################################################
'###											Sub Routines & Functions
'#############################################################################

Function fReplace(r)	
'Note: If the value of request.querystring("folderpath") is 1 Character (i.e. ""C""), application will crash, if path is 2 characters (i.e. ""C:"") hidden files will be shown, if path is 3 or more (i.e. ""C:/""), everything is cool to call SomeFolderData but not Totals..  This is corrected for below.
	r=trim(r)
	if len(r) =2  then r = r & "\"
	'"
	if len(r) =1  then r = r & ":\"
	'"
   fReplace = r
End Function

	
	
Function FFCount(Path, what)	
	Path = fReplace(Path)	
	set objFolder =	 ScriptObject.GetFolder(Path) 'Returns a Folder Object
   
   counter =0
  if what = "folder" then
    set objSubFolder = objFolder.SubFolders
	counter = objSubFolder.count
	set objSubFolder =nothing
	
 elseif what = "file" then
    set objFiles = objFolder.Files
    counter = objFiles.count
	set objFiles =nothing
	
else
		counter = "Error"
end if
		
   FFCount = counter

	set objFolder = nothing
End Function


Sub SomeFolderData(ThePath, title)
Set Folder =ScriptObject.GetFolder(ThePath) 'Returns a Folder obj
	%>
			<a name =<%= Folder.Name %> >
			<span class=heading><b>&nbsp;<%= title %></b>&nbsp;&nbsp;&nbsp;<i><% if request.querystring("totals") = "" then out Folder.Path %></i></span></a>
			<table border=1 cellpadding=3 cellspacing=1>
				<tr style="background-color:000000; color=white">
					<th>Created</th>
					<th>Last<br>Accessed</th>
					<th>Last<br>Modified</th>
					<th>Folder<br>Count</th>
					<th>File<br>Count</th>
					<th>Size</th>
				</tr>
		<%
			out "<tr><td>" & FormatDateTime(Folder.DateCreated,2) & "</td>"
			out "<td>" &Folder.DateLastAccessed & "</td>"
			out "<td>" &Folder.DateLastModified & "</td>"
			if FFCount(Folder.Path, "folder") <> 0 then
				out "<td><a href='" & Request.ServerVariables("SCRIPT_NAME") & "?folderpath=" & Server.UrlEncode(Folder.Path)& "'>" & FFCount(Folder.Path, "folder")	 & "</a></td>"
			else
				out "<td>" & FFCount(Folder.Path, "folder")	 & "</td>"
			end if
			if FFCount(Folder.Path, "file") <> 0 then
			out "<td  align=center><a href='" & Request.ServerVariables("SCRIPT_NAME") & "?path_of_files=" & Server.UrlEncode(Folder.Path)& "'>"  & FFCount(Folder.Path, "file") & "</a></td>"
			
			else			
				out "<td>" & FFCount(Folder.Path, "file")	 & "</td>"
			end if
			
			out "<td>" & FormatNumber(Folder.Size, 0) & "</td>"
			out "</table>"
			out "<center><a href=#top>Top</a></center>"
		Set Folder = Nothing
		
End Sub	


Sub DriveData()
   Set drive =	 ScriptObject.Drives
	%>
	<table border=1 cellpadding=3 cellspacing=1>
		<tr style="background-color:000000; color=white">
			<th>Drive</th>
			<th>Ready</th>
			<th>Total<br>Size</th>
			<th>Free<br>Space</th>
			<th>Percent<br>Used</th>
			<th>Volume<br>Name</th>
			<th>Folder<br>Count</th>
			<th>File<br>Count</th>
		</tr>
		<%	for each item in drive %>
				<tr>
					<td align=center><%= item.Path %></td>
					<td align=center><%= item.IsReady %></td>
		<%
				if item.IsReady then
				    used = FormatPercent((item.TotalSize - item.FreeSpace)/item.TotalSize)
					out "<td align=center>"  & FormatNumber(item.TotalSize, 0) & "</td><td align=center> " & FormatNumber(item.FreeSpace,0) & "</td><td align=center> " & used & "</td> " 
									
									if item.VolumeName <>"" then					
										out "<td align=center>" & item.VolumeName &"</td>"
									else
										out "<td bgcolor=#eeeeee>&nbsp;</td>"
									end if
									
					out "<td  align=center><a href='" & Request.ServerVariables("SCRIPT_NAME") & "?folderpath=" & Server.UrlEncode(item.DriveLetter) & "'>" & FFCount( item.Path, "folder") & "</a></td>"
					out  "<td  align=center><a href='" & Request.ServerVariables("SCRIPT_NAME") & "?path_of_files=" & Server.UrlEncode(item.Path) & "'>" & FFCount( item.Path, "file") & "</a></td></tr>"
					
				else 
					out "<td bgcolor=#eeeeee>&nbsp;</td><td bgcolor=#eeeeee>&nbsp;</td><td bgcolor=#eeeeee>&nbsp;</td><td bgcolor=#eeeeee>&nbsp;</td><td bgcolor=#eeeeee>&nbsp;</td><td bgcolor=#eeeeee>&nbsp;</td></tr>"
			    end if
			Next
			out "</table>"
		Set drive = Nothing
		
End Sub	

Sub out(x)
	response.write x  & vbCrLf
End Sub

Sub sTitle(atitle)	
	out "<div style=""background-color : eeeeee"" align=center><span class=title><b>" & atitle & "</b></span></div>"
End Sub

 %>
