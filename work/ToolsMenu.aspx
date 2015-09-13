<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

<script language="C#" runat="server">
void Page_Load(Object sender, EventArgs e)
{
	if(Request.ServerVariables["Server_Name"].IndexOf("brinkster") > 0) 
	{
	    Literal0.Text = Literal0.Text.Replace("../OtherApps/linkmanager/lm_index.asp","http://www13.brinkster.com/vanman798/linkmanager/Lm_index.asp");
        Literal0.Text = Literal0.Text.Replace("../OtherApps/tiles/index.asp", "http://www13.brinkster.com/vanman798/Tiles/Main/Index.asp");
	}

}
</script>

	<title>Tools Menu</title>
    <link rel="stylesheet" href="../StyleSheet1.css" type="text/css">
</head>

<body>
<span class="caption">Tools Menu</span>
<asp:literal id="Literal0" Runat="server" visible="true">
<br /><i>A collection of simple but useful tools</i>
<oL>
<li><a target="_blank" href="../OtherApps/RegExp/RegExp.asp">Regular Expression Inspector</a> &nbsp;<small>An example of how to use the VBScript RegExp Object <i>(2003)</i></small>
<li><a target="_blank" href="../OtherApps/AsciiEncoder/AsciiEncode.asp">HTML Ascii Codes</a> &nbsp;<small>A very basic tool to convert text to HTML Ascii Code <i>(2003)</i></small>
<li><a target="_blank" href="../OtherApps/HTMLEncoder/HTMLEncoder.asp">HTML Encoder</a> &nbsp;<small>A very basic tool to "mark-up" text into simple HTML <i>(2003)</i></small>
<li><a target="_blank" href="../OtherApps/DirInfo/index.asp">Folder and File Information</a> <small>A simple tool that gets back folder and file data. <i>(2001)</i></small>	
<li><a target="_blank" href="../OtherApps/linkmanager/lm_index.asp">Manage Favorite Links</a> <small>A tool to manage and categorize links (built into larger applications like The Salmon Portal). <i>(2001)</i></small>	
<li><a target="_blank" href="../OtherApps/tiles/index.asp">Home Page Tiles</a> <small>A tool to arrange page layout (built into larger applications like The Salmon Portal). <i>(2001)</i></small>	
<li><a target="_blank" href="../OtherApps/ServerVars/index.asp">Server Variables</a> <small>View all the Server Variables. <i>&nbsp;</i></small>								
</ol>
</asp:literal>
</body>
</html>