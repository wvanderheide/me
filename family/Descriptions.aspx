<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<script language="C#" runat="server">
void Page_Load(Object sender, EventArgs e)
{
	int x = GetQueryStringIntValue("ID");
	string strT = "";
	System.Text.StringBuilder bldr = new System.Text.StringBuilder();

	switch(x)
	{
		case 1:
			strT = "Family Reunion :: Cardston :: July 8, 2006";		
			bldr.Append("<SMALL>July 8, 2006</SMALL>");
			bldr.Append("<br /><BIG>Cardston, Alberta</BIG>");
			bldr.Append("<br /><SMALL>Family Reunion</SMALL>");
			bldr.Append("<P><I>Standing:</I> Jutta, Horst, Margitta, Walter, Peter, Kathryn, Helen, Ken, Lisa, Mike, Levon");
			bldr.Append("<br /><I>Sitting:</I> Ryan, Corbin, Katelyn, Hannah, Brooke, Owen, Kelten, Olivia</P>");


			break;
		case 2:
			strT = "Waterton :: July 4, 2006";
			bldr.Append("<small>July 4,  2006</small> ");
			bldr.Append("<br /><b><big>Wateron, Alberta</big></b> ");
			bldr.Append("<br /><small>Front to back:</small> ");
			bldr.Append("<br />Brooke, Katelyn, ");
			bldr.Append("<br /> ");
			bldr.Append("Jutta, Peter, ");
			bldr.Append("<br /> ");
			bldr.Append("Ryan, Kathryn, Hannah ");
						
			break;
		case 3:
			strT = "Crystal Peak :: August 1999";
			bldr.Append("<small>August, 1999</small>");
			bldr.Append("<br /><b><big>Crystal Peak, California</font></big></b>");
			bldr.Append("<br /><small>From left to right:</font></small>");
			bldr.Append("<p>Kenny (my youngest brother), Levon (my sister's ");
			bldr.Append("oldest kid), Lisa (my sister), Katelyn (in front of Lisa, she is my older ");
			bldr.Append("brother's first kid), Kelten (Lisa's youngest kid), Mike (Lisa's husband), ");
			bldr.Append("Corbin (Levon's younger brother), Peter (my older brother) with his youngest ");
			bldr.Append("daughter Brook on his shoulders, Kathryn (Peter's wife). Missing is Peter's ");
			bldr.Append("second daughter Hannah who was at the car with her Grandma.</p>");
			
			break;
		case 4:
			strT = "Bountiful :: February 1998";
			bldr.Append("<small>February, 1998</small>");
			bldr.Append("<br /><b><big>Bountiful, Utah</big></b>");
			bldr.Append("<br /><small>From left to right:</small>");
			bldr.Append("<p><i>Back row:</i>  Kenny (my youngest brother), Jutta (my mom), ");
			bldr.Append("me (Walter), Levon (my sister's ");
			bldr.Append("oldest boy).");
			bldr.Append("<br /><i>Front row:</i>  Katelyn (Peter's oldest child), Peter (my older brother) ");
			bldr.Append("with his second oldest ");
			bldr.Append("daughter Hannah on his lap, Kathryn (Peter's wife) with her youngest ");
			bldr.Append("daughter Brook on her lap, Lisa (my sister), ");
			bldr.Append("Mike (Lisa's husband) with his youngest son Kelten on his lap, ");
			bldr.Append("Corbin (Lisa's second boy).</p>");
			break;
		case 5:
			strT = "Cardston :: December 1989"; 
			bldr.Append("<small>December, 1989</small> ");
			bldr.Append("<br /><b><big>Cardston, Alberta</big></b> ");
			bldr.Append("<br /><small>From left to right:</small> ");
			bldr.Append("<p>Lisa (my sister) with Levon (her first child) on  ");
			bldr.Append("her lap, Mike (Lisa's husband), Jutta (my mom), me (Walter--standing),  ");
			bldr.Append("Kenny (my youngest brother) sitting on my older brother Peter's knee.</p> ");
			
			break;
		case 6:
			strT = "Honolulu :: August 1989";
			bldr.Append("<small>August, 1989</small>  ");
			bldr.Append("<br /><b><big>Honolulu, Hawaii</big></b>  ");
			bldr.Append("<br /><small>From left to right:</small>  ");
			bldr.Append("<p>Some chick, me (Walter), Peter, mom, Kenny, and some dude.</P>  ");
			bldr.Append("<p>Mom took the boys to Hawaii!</p>  ");
			
			break;
			
		case 7:
			strT = "Utah :: 1970";
			bldr.Append("<small>1970</small>  ");
			bldr.Append("<br /><b><big>Passport Picture</big></b>  ");
			bldr.Append("<br /><small>Front to back:</small>  ");
			bldr.Append("<p>Walter, Peter,<br>Jutta, Lisa</P>  ");
			break;
				
		case 8:
			strT = "Lethbridge :: 2007";
			bldr.Append("<small>November, 2007</small>  ");
			bldr.Append("<br /><b><big>Peter, Jutta (mom), Lisa, and Walter</big></b>  ");
			bldr.Append("<br /><small>Left to Right:</small>  ");
			bldr.Append("<p>Peter, Jutta (mom), Lisa, and Walter</P>  ");
						
			break;
					
		case 9:
			strT = "Cardston :: 2007";
			bldr.Append("<small>November, 2007</small>  ");
			bldr.Append("<br /><b><big>The Boys</big></b>  ");
			bldr.Append("<br /><small>Left to Right:</small>  ");
			bldr.Append("<p>Walter, Kenny, and Peter</P>  ");
						
			break;			
		case 10:
			strT = "Lethbridge :: 2008";
			bldr.Append("<small>July 3, 2008</small>  ");
			bldr.Append("<br /><b><big>The Grandchildren</big></b>  ");
			bldr.Append("<br /><small>Front to back:</small>  ");
			bldr.Append("<p>Brooke, Katelyn, Ryan</P>  ");
			bldr.Append("<p>Kelten, Hannah, Levon, Corbin</P>  ");
						
			break;
	}
	Literal0.Text = strT;
	Literal1.Text = bldr.ToString();
}

private int GetQueryStringIntValue(string QSItemName)
{
	int retVal = -1;
	string queryStringValue = Request.QueryString[QSItemName];
	if (!object.Equals(queryStringValue, null) && queryStringValue.Length > 0)
	{			
		try
		{
			retVal = int.Parse(queryStringValue);
		}
		catch
		{	
			retVal = -1	;
		}
	}
	return retVal;
}
</script>
<title><asp:literal id="Literal0" Runat="server" visible="true"></asp:literal></title>
<STYLE type="text/css">
	<!--
		p {font-size : 12px; font-family : verdana; color : silver;}
		small {font-size : 10px; font-family : verdana; color : white;}
		big {font-size : 16px; font-family : verdana; font-weight: 900; color : white};
     -->
</STYLE>
</head>
<body text="silver" bgcolor="#232323">
	<table cellpadding="10">
				<tr>
					<td>
						<asp:literal id="Literal1" Runat="server"></asp:literal>
						
						<asp:literal id="Literal2" Runat="server" visible="false"></asp:literal>
						<asp:literal id="Literal3" Runat="server" visible="false"></asp:literal>
						<asp:literal id="Literal4" Runat="server" visible="false"></asp:literal>
						<asp:literal id="Literal5" Runat="server" visible="false"></asp:literal>
						<asp:literal id="Literal6" Runat="server" visible="false"></asp:literal>
					</td>
				</tr>
			</table>
<!-- end spacer-->
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>


</body>
</html>
