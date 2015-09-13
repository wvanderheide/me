<!DOCTYPE html>
<%@ Register TagPrefix="uc1" TagName="UC_LeftNav" Src="../UC_LeftNav.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_Header" Src="../UC_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_Footer" Src="../UC_Footer.ascx" %>

<%@ Page Language="c#" %>

<html>
<head>
    <script language="C#" runat="server">
        
        private void Page_Load(object sender, System.EventArgs e)
        {
            //don't forget to set the <title> tag in the HTML
            UC_LeftNav1.P_GraphicName = "applet";
            UC_LeftNav1.P_ImageName = "image1";

            UC_Header1.P_HeaderTitle = "Java Applets";
            UC_Footer1.P_LastModified = "November 20, 2012";
            int x = GetQueryStringIntValue("ID");
            if (x == -1)
                x = 0;

            System.Text.StringBuilder bldr = new System.Text.StringBuilder();

            bldr.Append("<select size='ReplaceThisSizeWithAnInteger' onChange='MenuSubmit(this);'>");
            //bldr.Append("<option value='NA'>----------------------------------</option>");
            //bldr.Append("<option value='NA' selected>Work Samples Menu</option>");
            //bldr.Append("<option value='NA'>----------------------------------</option>");
            bldr.Append("<option value='index.aspx?ID=0'");
            if (x == 0) { bldr.Append(" selected "); }
            bldr.Append(">Overview</option>");
            bldr.Append("<option value='index.aspx?ID=1'");
            if (x == 1) { bldr.Append(" selected "); }
            bldr.Append(">Ch. 1-5 - Page 1</option>");
            bldr.Append("<option value='index.aspx?ID=2'");
            if (x == 2) { bldr.Append(" selected "); }
            bldr.Append(">Ch. 6-8 - Page 2</option>");
            bldr.Append("<option value='index.aspx?ID=3'");
            if (x == 3) { bldr.Append(" selected "); }
            bldr.Append(">Ch. 9-10 - Page 3</option>");
            bldr.Append("<option value='index.aspx?ID=4'");
            if (x == 4) { bldr.Append(" selected "); }
            bldr.Append(">Ch. 11-14 - Page 4</option>");
            bldr.Append("<option value='index.aspx?ID=5'");
            if (x == 5) { bldr.Append(" selected "); }
            bldr.Append(">Others - Page 5</option>");
            bldr.Append("<option value='index.aspx?ID=6'");
            if (x == 6) { bldr.Append(" selected "); }
            bldr.Append(">More Others - Page 6</option>");
            bldr.Append("</select>");

            string SamplesText = "<b><font color='white'>View Applets:</font></b>";
            UC_Header1.P_HeaderText = SamplesText + " " + bldr.ToString().Replace("ReplaceThisSizeWithAnInteger", "1");//"See the \"View Applets\" drop down menu below";	
            ltWorkNav.Text = SamplesText + "<br>" + bldr.ToString().Replace("ReplaceThisSizeWithAnInteger", "7");

            string strInstructions = "<br /><b><span class=small>Solutions to Selected Problems from <i>Java, How to Program</i> by Deitel & Deitel.</span></b><br />";
            switch (x)
            {
                case 0:
                    ltTheBody.Text = ltWork0.Text;
                    ltTitle.Text = "Overview";
                    break;
                case 1:
                    ltTheBody.Text = strInstructions;
                    ltTheBody.Text += ltWork1.Text;
                    ltTitle.Text = "Ch. 1-5: Page 1";
                    break;
                case 2:
                    ltTheBody.Text = strInstructions;
                    ltTheBody.Text += ltWork2.Text;
                    ltTitle.Text = "Ch. 6-8: Page 2";
                    break;
                case 3:
                    ltTheBody.Text = strInstructions;
                    ltTheBody.Text += ltWork3.Text;
                    ltTitle.Text = "Ch. 9-10: Page 3";
                    break;
                case 4:
                    ltTheBody.Text = strInstructions;
                    ltTheBody.Text += ltWork4.Text;
                    ltTitle.Text = "Ch. 11-14: Page 4";
                    break;
                case 5:
                    ltTheBody.Text = ltWork5.Text.Replace("ReplaceThisWithTheParamLocationParameters", MakeParamLocs());
                    ltTitle.Text = "Others : Page 5";
                    break;
                case 6:
                    ltTheBody.Text = ltWork6.Text;
                    ltTitle.Text = "More Others : Page 6";
                    break;
            }
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
                    retVal = -1;
                }
            }
            return retVal;
        }


        private string MakeParamLocs()
        {

            System.Text.StringBuilder bldr = new System.Text.StringBuilder();

            for (int i = 0; i <= 5; i++)
            {
                bldr.Append("<param name=\"location");
                bldr.Append(i);
                bldr.Append("\"");
                bldr.Append(" value=\"");
                if (Request.ServerVariables["Server_Name"].ToLower() == "localhost")
                {
                    bldr.Append("http://localhost");
                }
                else
                {
                    bldr.Append("http://www13.brinkster.com/vanman798");
                }
                bldr.Append("/me/Applet/index.aspx?ID=");
                bldr.Append(i + 1);
                bldr.Append("\">\n\r");
            }
            return bldr.ToString();
        }
    </script>
    <title>Java Applets</title>
    <script language="javascript" src="../JScript1.js"></script>
    <link rel="stylesheet" href="../StyleSheet1.css" type="text/css">
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <noscript>
        <meta http-equiv="REFRESH" content="0; URL= ../intro/index.aspx">
    </noscript>
    <table cellspacing="3" cellpadding="3" border="0" width="100%">
        <tr>
            <td width="1%" valign="top" align="center" valign="top">
                <uc1:UC_LeftNav ID="UC_LeftNav1" runat="server"></uc1:UC_LeftNav>
            </td>
            <td valign="top" width="99%" style="padding-left: 25px">
                <uc1:UC_Header ID="UC_Header1" runat="server"></uc1:UC_Header>
                <!-- PAGE STUFF	-->
                <br />
                <asp:Label ID="ltTitle" runat="server" Visible="true" CssClass="caption"></asp:Label>
                <asp:Literal ID="ltTheBody" runat="server" Visible="true"></asp:Literal>
                <br />
                <asp:Literal ID="ltWorkNav" runat="server" Visible="true"></asp:Literal>
                <!-- END Page Stuff -->
            </td>
        </tr>
    </table>
    <uc1:UC_Footer ID="UC_Footer1" runat="server"></uc1:UC_Footer>
    <asp:Literal ID="ltWork0" runat="server" Visible="false">
		<table cellspacing=0 cellpadding=15 border=0  width=85% align=center>	
	        <tr>
		        <td width="100%"  valign="middle" bgcolor="black" >
			        From here you can access a collection of "applets" that I programmed in 1999.  
			        Applets are 
			        compiled programs written in Java (in this case JAVA 1.2) that run in 
			        a Java enabled 
			        browser.  When applets are compiled they are not compiled into machine 
			        language but rather into bytecodes.  Java enabled browsers interpret the 
			        bytecodes.
			        <p>Most of the applets in my collection are solutions to problems from 
			        "JAVA: How To Program" by Deitel and Deitel, second edition.  
			        Each page contains solutions
			        to problems from certain chapters.  Applets not from the Deitel book are 
			        contained in the "other" sections (see table of contents).  
        			
			        <p>The uncompiled source code for each applet can be viewed by 
			        clicking it's name.  Applets from the Deitel book are named for the 
			        chapter and 
			        problem number (i.e. ex0120 is exercise 20 of chapter 1).  To use these 
			        applets in your own pages you will need to copy and compile the source code.  
			        Compiler programs are available for free from the Sun Microsystems web site 
			        (http://java.sun.com/)
			        <hr>
		        </td>
	        </tr>
	    </table>
    </asp:Literal>
    <asp:Literal ID="ltWork1" runat="server" Visible="false"> 
               <div class="AppletScollingDiv">
				<table width="100%"  height="410" border="0">
					<tr>
						<td valign="top"><nobr><A href="ex0120.txt" target="_new">ex0120</A> -- This applet</nobr> demonstrates 
							reading in data from a textbox.</td>
						<td  valign="top"><APPLET height="250" width="300" code="ex0120.class" class="ridge"> </APPLET></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<td valign="top"><nobr><A href="ex0211.txt" target="_new">ex0211</A> -- This applet</nobr> remembers all data 
							entered into the text boxes (as demonstrated by the overall MPG). To use it 
							enter data in both boxes and hit enter. Repeat several times, notice overall 
							MPG is based on all enteries not just the current entry.</td>
						<td valign="top"><APPLET height="150" width="300" code="ex0211.class" class="ridge"> </APPLET></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<td valign="top"><nobr><A href="ex0423.txt" target="_new">ex0423</A> -- Demostrates</nobr> the use of a 
							button.</td>
						<td valign="top"><APPLET height="250" width="300" code="ex0423.class" class="ridge"> </APPLET></td>
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						
						<td valign="top"><nobr><A href="ex0430.txt" target="_new">ex0430</A> -- Simulates</nobr> the tossing of a 
							coin. A random number generator is used to ensure true randomness.</td>
						<td valign="top"><APPLET height="200" width="300" code="ex0430.class" class="ridge"> </APPLET></td>
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
							
						<td valign="top"><nobr><A href="ex0520.txt" target="_new">ex0520</A> -- Uses a</nobr> 2 
							dimensional array. Unfortunately IE 4.0 has problems with double arrays. Maybe 
							this will work in other browsers. With the proper browser valid data entered in 
							the textboxes are added to the matrix below.</td>	
						<td valign="top"><APPLET height="350" width="350" code="ex0520.class" class="ridge"> </APPLET></td>
						<td>&nbsp;</td>
					</tr>
				</table>    
               </div> 	
    </asp:Literal>
    <asp:Literal ID="ltWork2" runat="server" Visible="false">    
               <div class="AppletScollingDiv">
				<table width="100%" height="410" border="0">
					<tr>
						<td valign="top"><nobr><a target = "_new" href ="ex0603.txt">ex0603</a>
                         -- This</nobr> problem teaches the concept of using an abstract data type (ADT).
                        <br>What you see below is an applet that reduces fractions and
                        performs mathematical operations on the reduced fractions.</td>
                        <td valign="top"><applet code="ex0603.class" width="550" height="200" class="ridge"> </APPLET></td>
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>


						<td valign="top"><nobr><a target = "_new" href ="ex0822a.txt">ex0822a</a>  -- This applet</nobr> is a demonstration of string manipulation.  
						Enter in a string and the applet counts the number of A's, B's, C's....Z's.</td>
						<td valign="top"><applet code="ex0822a.class" width=350 height=400 class="ridge"> </APPLET></td>
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<td valign="top"><nobr><a target = "_new" href ="ex0822b.txt">ex0822b</a> -- This is</nobr> another 
						demonstration of string manipulation.  Enter in a string and the applet counts  
						the number of word of various lengths (i.e.  2 four letter words).</td>
						<td valign="top"><applet code="ex0822b.class" width=300 height=350 class="ridge"> </APPLET></td>
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<td valign="top"><nobr><a target = "_new" href ="ex0822d.txt">ex0822d</a> 
						 -- This is</nobr> yet another demonstration of string manipulation.  
						 Enter in a string and the applet returns the frequency of each unique word.</td>
						<td valign="top"><applet code="ex0822d.class" width="300" height="400" class="ridge"> </APPLET></td>
						<td>&nbsp;</td>
					</tr>
			    </table>
			   </div>
    </asp:Literal>
    <asp:Literal ID="ltWork3" runat="server" Visible="false">
               <div class="AppletScollingDiv">
				<table width="100%"  height="410" border="0">
					<tr>
						<td valign="top"><nobr><a target=_new href="ex0924.txt">ex0924</a>
						 -- This applet simulates a screen saver</nobr> by printing 300 random lines on the screen, 
						 then clearing and repeating. <br /><br /><a href="#" onclick="MyModalDlg('ex0924.html',305,305)">Click To View</a>
						 <br /><br /> 
						 (This applet hogs a lot of resources and can interfer with the others on the page, hence it opens in it's own window)</td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<td valign="top"><nobr><a target=_new href="ex0931.txt">ex0931</a> -- This applet is</nobr> a simple game, a race between a tortise and a hare.  
						The first one to reach the top of the hill is the winner.  </td>
						<td  valign="top"><applet code="ex0931.class" width=350 height=350 class="ridge"> </APPLET></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						
						<td valign="top"><nobr><a target=_new href="ex1018.txt">ex1018</a> -- 
						This applet</nobr> draws a circle, an oval, a rectangle, or a line 
						in a random color, and places the shape at the point 
						in the applet where the user presses a mouse button.</td>
						<td  valign="top"><applet code="ex1018.class" width=450 height=200 class="ridge"> </APPLET></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						
						<!-- last one -->
						<td valign="top"><nobr><a target=_new href="ex1029.txt">ex1029</a> -- 
						Select</nobr> a color and a shape from the CHOICE BOXES.</td>
						<td valign="top"><applet code="ex1029.class" width=400 height=350 class="ridge"> </APPLET></td>
						<td>&nbsp;</td>
					</tr>
			    </table>
			   </div>
    </asp:Literal>
    <asp:Literal ID="ltWork4" runat="server" Visible="false"> 
               <div class="AppletScollingDiv">
				<table width="100%" height="410" border="0">
					<tr>
					
						<td valign="top"><nobr><a target=_new href="ex1107.txt">ex1107</a> -- 
						 This applet</nobr> draws a random sized circle at a random spot 
						 on the applet canvas (the pink area).  In the text area, 
						 the radius, diameter, circumference and area are displayed.  The 
						 units are in pixels.</td>
						<td  valign="top"><applet code="ex1107.class" width=600 height=220 class="ridge"> </APPLET></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<td valign="top"><nobr><a target=_new href="ex1108.txt">ex1108</a> -- This applet</nobr> allows the user to set the radius of a 
                            circle in the pixel range 100-200, by adjusting a scrollbar.</td>
						<td  valign="top"><applet code="ex1108.class" width=600 height=400 class="ridge"> </APPLET></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<td valign="top"><nobr><a target=_new href="ex1113.txt">ex1113</a> -- Another</nobr> color testing applet.</td>
						<td  valign="top"><applet code=ex1113 width = "600" height = "150" class="ridge"> </APPLET></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<td valign="top"><nobr><a target=_new href="ex1428ie.txt">ex1428</a> -- A much improved</nobr> version of the 
						tortise and the hare race.<p>
						This applet actually plays sounds, however IE doesn't seem to support the sounds.</td>
						<td  valign="top"><applet code="ex1428ie.class" width=349 height=340 class="ridge"> </APPLET></td>
						<td>&nbsp;</td>
					</tr>
			    </table>
			   </div>  
    </asp:Literal>
    <asp:Literal ID="ltWork5" runat="server" Visible="false">
               <div class="AppletScollingDiv">
				<table width="100%" height="410" border="0">
					<tr>						
						<td valign="top"><nobr><a target=_new href="calcf.txt">Fraction calculator</a></nobr>
						 -- This applet is a much improved version of ex0603.</td>
						<td  valign="top"><applet code="calcf.class" width=600 height=150 class="ridge"> </APPLET></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<td valign="top"><nobr><a target=_new href="testcolors.txt">Colors</a>
						 -- This applet</nobr> can be used to test various color settings.  Valid enteries range from 0 to 255.  
						 <i>Compare to ex1113.</i></td>
						<td  valign="top"><applet code="testcolors.class" width=310 height=200 class="ridge"> </APPLET></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<td valign="top"><nobr><a target=_new href="toc.txt">Drop Down Menu</a> -- Similiar to the</nobr> select tag drop down HTML form element.
						<br /><br />
						<center><applet code="toc.class" width=150 height=30 class="ridge">                                          
                                            <param name="title0" value="Chapters 1 - 5">
                                            <param name="title1" value="Chapters 6 - 8">
                                            <param name="title2" value="Chapters 9 - 10">
                                            <param name="title3" value="Chapters 11 - 14">
                                            <param name="title4" value="Others">
                                            <param name="title5" value="More Others">
                                            ReplaceThisWithTheParamLocationParameters

                                            </applet></center></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<td valign="top"><nobr><A target =_new href="fhe1.txt">FHE</a> -- 
						This is</nobr> an animation I made for my <A href="http://www.geocities.com/langleyward/fhe.html" target=new>ward's</A> 
						web page.</td>
						<td  valign="top"><applet code="fhe1.class" width=75 height=56 class="ridge"> </APPLET></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<!-- last one -->
						<td valign="top"><nobr><A target=_new href="fhec.txt">FHE2</a> --  
						This is</nobr> a variation on the above animation.</td>
						<td valign="top"><applet code="fhec.class"  width=180 height=135 class="ridge"> </APPLET></td>
						<td>&nbsp;</td>
					</tr>
			    </table>
			   </div>
    </asp:Literal>
    <asp:Literal ID="ltWork6" runat="server" Visible="false">
               <div class="AppletScollingDiv">
				<table width="100%" height="410" border="0">
					<tr>
						<td valign="top"><nobr><a target=_new href="urlstuff.txt">Link Button</a> -- This applet 
						links to another web page when</nobr> the button is pressed.  The label on the button and the 
						URL to link to are set in the HTML code with the PARAM tag and passed to the applet through method getParameter.
						<center>
						<br />
						<applet code="urlstuff.class" width=80 height=30 class="ridge">
                                <param name="label" value="Yahoo">
                                <param name="link" value="http://www.yahoo.com">
                        </applet></center></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<td valign="top"><nobr><a target=_new href="imagemap.txt">Image Map</a></nobr> -- Click an Icon to link to that page.</td>
						<td  valign="top"><applet code="imagemap.class" width=610 height=190 class="ridge"> </APPLET></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<td valign="top"><nobr><a target=_new href="imagemap2.txt">Image Map #2</a></nobr> -- Notice the different text bar.</td>
						<td  valign="top"><applet code="imagemap2.class" width=610 height=190 class="ridge"> </APPLET></td>							
						<td valign="middle"><img src="../images/seperator.gif" /><br /><img src="../images/seperator.gif" /></td>
						
						<!-- last one -->
						<td valign="top"><nobr><a target=_new href="rsbanner.txt">Animated Banner</a></nobr></td>
						<td valign="top"><applet code="rsbanner.class" width=400 height=170 class="ridge"> </APPLET></td>
						<td>&nbsp;</td>
					</tr>
			    </table>
			   </div>
    </asp:Literal>
    </form>
</body>
</html>
