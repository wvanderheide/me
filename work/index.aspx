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
            UC_LeftNav1.P_GraphicName = "work";
            UC_LeftNav1.P_ImageName = "image5";

            UC_Header1.P_HeaderTitle = "Samples of My Work";
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
            bldr.Append(">1997-2000 - Page 1</option>");
            bldr.Append("<option value='index.aspx?ID=2'");
            if (x == 2) { bldr.Append(" selected "); }
            bldr.Append(">1997-2000 - Page 2</option>");
            bldr.Append("<option value='index.aspx?ID=3'");
            if (x == 3) { bldr.Append(" selected "); }
            bldr.Append(">Classic ASP - Page 3</option>");
            bldr.Append("<option value='index.aspx?ID=4'");
            if (x == 4) { bldr.Append(" selected "); }
            bldr.Append(">ASP.NET - Page 4</option>");
            bldr.Append("</select>");

            string SamplesText = "<b><font color='white'>View Samples:</font></b>";
            UC_Header1.P_HeaderText = SamplesText + " " + bldr.ToString().Replace("ReplaceThisSizeWithAnInteger", "1");//"See the \"View Samples\" drop down menu below";	
            ltWorkNav.Text = SamplesText + "<br />" + bldr.ToString().Replace("ReplaceThisSizeWithAnInteger", "5");

            string strInstructions = "<br /><i>(Click an image for more information)</i>";
            switch (x)
            {
                case 0:
                    ltTheBody.Text = ltWork0.Text;
                    break;
                case 1:
                    ltTheBody.Text = ltWork1.Text;
                    ltTitle.Text = "Work Samples from the early years 1997-2000: Page 1";
                    ltTitle.Text += strInstructions;
                    break;
                case 2:
                    ltTheBody.Text = ltWork2.Text;
                    ltTitle.Text = "Work Samples from the early years 1997-2000: Page 2";
                    ltTitle.Text += strInstructions;
                    break;
                case 3:
                    if (Request.ServerVariables["Server_Name"] == "www13.brinkster.com")
                    {
                        ltTheBody.Text = ltWork3.Text;
                        ltTheBody.Text = ltTheBody.Text.Replace("../OtherApps/eplanner/index.html", "http://www13.brinkster.com/vanman798/eplanner/index.html");
                        ltTheBody.Text = ltTheBody.Text.Replace("../OtherApps/escheduler/index.html", "http://www13.brinkster.com/vanman798/escheduler/View.asp");
                        ltTheBody.Text = ltTheBody.Text.Replace("../OtherApps/directory/rm_index.asp", "http://www13.brinkster.com/vanman798/directory/rm_index.asp");
                        ltTheBody.Text = ltTheBody.Text.Replace("../OtherApps/JSearch/index.asp", "http://www13.brinkster.com/vanman798/Jsearch/index.asp");
                    }
                    else
                        ltTheBody.Text = ltWork3.Text;

                    ltTitle.Text = "Classic ASP: Page 3";
                    break;
                case 4:
                    ltTheBody.Text = ltWork4.Text;
                    ltTitle.Text = "ASP.NET: Page 4";
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
    </script>
    <title>Samples of My Work</title>
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
            <td width="1%" align="center" valign="top">
                <uc1:UC_LeftNav ID="UC_LeftNav1" runat="server"></uc1:UC_LeftNav>
            </td>
            <td valign="top" width="99%" style="padding-left: 25px">
                <uc1:UC_Header ID="UC_Header1" runat="server"></uc1:UC_Header>
                <!-- PAGE STUFF	-->
                <br />
                <asp:Literal ID="ltTitle" runat="server" Visible="true"></asp:Literal>
                <asp:Literal ID="ltTheBody" runat="server" Visible="true"></asp:Literal>
                <br />
                <br />
                <asp:Literal ID="ltWorkNav" runat="server" Visible="true"></asp:Literal>
                <!-- END Page Stuff -->
            </td>
        </tr>
    </table>
    <uc1:UC_Footer ID="UC_Footer1" runat="server"></uc1:UC_Footer>
    <asp:Literal ID="ltWork0" runat="server" Visible="false">
		<table>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
						<span class="caption">OVERVIEW</span><br /><br />
						I am a software developer who specializes in web applications
						and websites. Most of my work has been done with the Microsoft ASP, ASP.NET, ADO, and ADO.Net
						technologies in conjunction with Microsoft SQL Server databases. I first began
						making websites in 1997 with HTML, CSS, and Javascript. As database driven
						websites, along with web-based applications, gained popularity I rapidly became
						an expert in writing sever-side code in ASP with VBScript. Since 2002, I’ve
						been using Microsoft Visual Studio.Net to develop ASP.NET web applications and
						web services in both VB.NET and C#. Over the years I have designed and
						normalized many databases, and have gained a strong knowledge of SQL including the
						writing of, and use of, stored procedures. I also have a good eye for colors
						and design, and I often do graphic design using Adobe PhotoShop.
						<br />
						<br />
						Since 1997, I have provided custom, database-driven, web applications to commercial, federal and municipal clients.  My client 
						list includes the Internal Revenue Service, Overseas Private Investment 
						Corporation, Veterans Affairs, Navy (Cormis &amp; FFSMIS), Institute of International Finance, DC Government, Air line Pilot's Association, 
						California Operating Engineers Union, Nature's Sunshine Products, and numerous other private and government agencies.
						<br />
						<br />
						Training and mentoring others in the latest technologies is something I enjoy. 
						I’ve taught several training lessons on ASP, as well as an in-depth, four month 
						long SQL Server class. In 2002, I lead a MSDN training course 
						entitle "Upgrading Web Development Skills from ASP to Microsoft ASP.NET". Most 
						recently, I wrote and taught training course on HTML and CSS. 					
						<br />
						<br />
						Much of my work has been done for internal sites, as well as for back-engines, and as such is not available 
						to demo to the public.  Bearing that in mind, I have put together a few samples of my work.  Please use the 
						drop-down menus above or below to  view the samples.						
				</td>
			</tr>
		</table>
    </asp:Literal>
    <asp:Literal ID="ltWork1" runat="server" Visible="false">
	    <table BORDER="yes" WIDTH="600" BGCOLOR="#232323">
		    <tr>
		    
			    <td valign="center"><a href="#" onclick="MyModalDlg('cexpopup.html',510,720)" onMouseOver="changeImages('imageCEX', 'imageCEXon')"
					    onMouseOut="changeImages('imageCEX', 'imageCEXoff')"> <img name="imageCEX" src="CEXoff.jpg" border="0" WIDTH="195" HEIGHT="148">
				    </a>
			    </td>
		        <td valign="center"><a href="#" onclick="MyModalDlg('korea_chinjupopup.html',510,720)" onMouseOver="changeImages('imageKChinju', 'imageKChinjuon')"
				        onMouseOut="changeImages('imageKChinju', 'imageKChinjuoff')"> <img name="imageKChinju" src="korea_chinjuoff.jpg" border="0" WIDTH="195" HEIGHT="148">
			        </a>
		        </td>
		    
			    <td valign="center"><a href="#" onclick="MyModalDlg('langleypopup.html',510,720)" onMouseOver="changeImages('imageLan', 'imageLanon')"
					    onMouseOut="changeImages('imageLan', 'imageLanoff')"> <img name="imageLan" src="langleyoff.jpg" border="0" WIDTH="195" HEIGHT="148">
				    </a>
			    </td>
			    
			 </tr>
			 <tr>
			    
			    <td valign="center"><a href="#" onclick="MyModalDlg('cexintrapopup.html',510,720)" onMouseOver="changeImages('imagecexi', 'imagecexion')"
					    onMouseOut="changeImages('imagecexi', 'imagecexioff')"> <img name="imagecexi" src="cexintraoff.jpg" border="0" WIDTH="195" HEIGHT="148">
				    </a>
			    </td> 
			    
			    
		    <td valign="center"><a href="#" onclick="MyModalDlg('goodkaypopup.html',510,720)" onMouseOver="changeImages('imageGoodKay', 'imageGoodKayon')"
				    onMouseOut="changeImages('imageGoodKay', 'imageGoodKayoff')"> <img name="imageGoodKay" src="goodkayoff.jpg" border="0" WIDTH="195" HEIGHT="148">
			    </a>
		    </td>
			    
			    <td valign="center"><a href="#" onclick="MyModalDlg('irspopup.html',510,720)" onMouseOver="changeImages('imageIRS', 'imageIRSon')"
					    onMouseOut="changeImages('imageIRS', 'imageIRSoff')"> <img name="imageIRS" src="irsoff.jpg" border="0" WIDTH="195" HEIGHT="148">
				    </a>
			    </td>
		    </tr>
	    </table>
    </asp:Literal>
    <asp:Literal ID="ltWork2" runat="server" Visible="false">
    <table BORDER="yes" WIDTH="600" BGCOLOR="#232323">
	    <tr>
		    <td valign="center"><a href="#" onclick="MyModalDlg('partypopup.html',510,720)" onMouseOver="changeImages('imageParty', 'imagePartyon')"
				    onMouseOut="changeImages('imageParty', 'imagePartyoff')"> <img name="imageParty" src="partyoff.jpg" border="0" WIDTH="195" HEIGHT="148">
			    </a>
		    </td>
			    <td valign="center"><a href="#" onclick="MyModalDlg('1on1popup.html',510,720)" onMouseOver="changeImages('image1on1', 'image1on1on')"
					    onMouseOut="changeImages('image1on1', 'image1on1off')"> <img name="image1on1" src="1on1off.jpg" border="0" WIDTH="195" HEIGHT="148">
				    </a>
			    </td>
			    <td valign="center"><a href="#" onclick="MyModalDlg('vadivorcepopup.html',510,720)" onMouseOver="changeImages('imagevad', 'imagevadon')"
					    onMouseOut="changeImages('imagevad', 'imagevadoff')"> <img name="imagevad" src="vadivorceoff.jpg" border="0" WIDTH="195" HEIGHT="148">
				    </a>
			    </td>
	    </tr>
	    <tr>
		    <td valign="center"><a href="#" onclick="MyModalDlg('cc_irspopup.html',510,720)" onMouseOver="changeImages('imageCC_IRS', 'imageCC_IRSon')"
				    onMouseOut="changeImages('imageCC_IRS', 'imageCC_IRSoff')"> <img name="imageCC_IRS" src="cc_irsoff.jpg" border="0" WIDTH="195" HEIGHT="148">
			    </a>
		    </td>
		    <td valign="center"><a href="#" onclick="MyModalDlg('opicpopup.html',510,720)" onMouseOver="changeImages('imageOpic', 'imageOpicon')"
				    onMouseOut="changeImages('imageOpic', 'imageOpicoff')"> <img name="imageOpic" src="opicoff.jpg" border="0" WIDTH="195" HEIGHT="148">
			    </a>
		    </td>
		    <td valign="center"><a href="#" onclick="MyModalDlg('eCardpopup.html',510,720)" onMouseOver="changeImages('imageECard', 'imageECardon')"
				    onMouseOut="changeImages('imageECard', 'imageECardoff')"> <img name="imageECard" src="eCardoff.jpg" border="0" WIDTH="195" HEIGHT="148">
			    </a>
		    </td>
	    </tr>
    </table>
    </asp:Literal>
    <asp:Literal ID="ltWork3" runat="server" Visible="false">
    <table cellspacing="0" cellpadding="5" width="90%" border="0" align="center">
		<tr>
			<td bgcolor="black">From here you can access a collection of "ASP Applications" 
				that I programmed. ASP (short for Active Server Pages) is a server-side 
				scripting technology available with Microsoft's Internet Information Server 
				(IIS). When a client requests an ASP page, the requested file is compiled by 
				the server converting the ASP code (and accompanying scripts) to HTML. This 
				generated HTML is then merged with any static HTML in the file, and together 
				the final "HTML-Only" page is sent back to the requesting client. This 
				environment allows the creation of dynamic, interactive web sites and 
				applications.</td>
			</tr>
	</table>
	
    <table cellspacing="0" cellpadding="5" border="0" align="center">
		<tr>
		<td >
		<b><big>Classic ASP Examples</big></b>
		<div class="smScollingDiv">
		<ul>
			<li>
				<a href="#" onclick="MyModalDlg('nsp.html',510,720)">Nature's Sunshine Products(E-Commerce)</a> &nbsp;<small>Did maintenance and made improvements to this ASP e-commerce site in <i>2006</i>.</small>
			
			<li>
				<a href="#" onclick="MyModalDlg('salmon.html',510,720)">The 
					Salmon</a> &nbsp;<small>A database driven protal, administered via a browser. <i>(Designed and developed between 2001-2003. Solo project.)</i></small>
			
			<li>
				<a href="#" onclick="MyModalDlg('housing.html',510,720)">Housing Message Board</a> &nbsp;<small><i>(2003. Solo project.)</i></small>
			<li>
				<a href="#" onclick="MyModalDlg('toolsMenu.aspx',280,500)">Seven Random Useful Tools</a> &nbsp;<small>Regular Expressions, HTML Codes, Directory Data, etc <i>(2003)</i></small>
		   <li>
				<a  target="_blank" href="../OtherApps/JSearch/index.asp">My Job Search Tool</a> &nbsp;<small>A web interface to an Access Database that I tracked applied for jobs in. <i>(2003)</i></small>
		   
			<li>
				<a href="#" onclick="MyModalDlg('ray.html',510,720)">Private Accounting Firm</a> 
				&nbsp;<small><i>(2002. Solo project.)</i></small>
			
			<li>
				<a target="_blank" href="../OtherApps/SimpleDynamicSiteDemo/demo.asp">A Simple 
					Dynamic Site Demo</a> &nbsp;<small>Add your own content to a sample dynamic 
						website. <i>(2002)</i></small>
							
			<li>
				<a target="_blank" href="../OtherApps/AccessDBReader/test1.html">
					Access DataBase Reader</a> &nbsp;<small>ASP tool used to get printable report of field types and sizes from 
					an Access Database table.  <i>(2002)</i></small>				
			<li>
				<a target="_blank" href="../OtherApps/SQLServerDBTool/Pg1.asp">SQL Server Database Tool</a> &nbsp;<small>Create and drop databases, and add and remove tables on a SQL Server via a browser. <i>(2001)</i></small>
					
			<li>
				<a target="_blank" href="../OtherApps/directory/rm_index.asp">Employee Directory</a> <small>A basic employee directory. <i>(2001)</i></small>			
						
			<li>
				<a target="_blank" href="../OtherApps/escheduler/index.html">Calendar</a> <small>Add and schedule events. <i>(2001)</i></small>			
			
			<li>
				<a target="_blank" href="../OtherApps/eplanner/index.html">the ePlanner</a> <small><i>(2000)</i></small>						
			<li>
				<a href="#" onclick="MyModalDlg('docmanpopup.html',510,720)">Document Manager</a> <small><i>(2000)</i></small>
			
			<li>
				<a href="#" onclick="MyModalDlg('linkmanagerpopup.html',510,720)">Link Manager</a>
					&nbsp;<small>A tool to store and categorize your favorite links <i>(2000)</i></small>
			
			
			<li>
				<a target="_blank" href="../OtherApps/guestbook/guestmain.html">Guestbook</a> <small><i>(2000)</i></small>
			
		</ul>
		</div></td>
		</tr>
	</table>
    </asp:Literal>
    <asp:Literal ID="ltWork4" runat="server" Visible="false">
	 <table cellspacing="0" cellpadding="5" width="90%" border="0" align="center">
		<tr>
			<td bgcolor="black">From here you can access a collection of "ASP.NET Applications" 
				that I programmed. ASP.NET is a programming framework that allows developers to build dynamic web 
				applications and web services using compiled languages like VB.NET and C#. It can be thought of as the 
				next-generation of ASP.</td>
			</tr>
	</table>
	
    <table cellspacing="0" cellpadding="5" border="0" align="center">
		<tr>
		<td >
		<b><big>ASP.NET Examples</big></b>
		<div class="smScollingDiv">
		<ul>	<li>
				<a href="#" onclick="MyModalDlg('NSPUSA.html',510,720)">NSP USA</a> &nbsp;<small>Main E-commerce website for NSP USA<i>(2009, ASP.NET with C#, WCF)</i></small>
		
			<li>
				<a href="#" onclick="MyModalDlg('NSPCanada.html',510,720)">NSP Canada</a> &nbsp;<small>Main E-commerce website for NSP Canada<i>(2006, ASP.NET with C#, WCF)</i></small>
			
			<li>
				<a href="#" onclick="MyModalDlg('NSPEmail.html',510,720)">NSP Email System</a> &nbsp;<small>Email System Admin Tool <i>(2006, ASP.NET with C#)</i></small>
			<li>
				<a href="#" onclick="MyModalDlg('MYNSP.html',510,720)">My NSP</a> &nbsp;<small> Personalized Distributor E-Commerce Application <i>(2006, ASP.NET with C#)</i></small>
				
			<li>
				<a href="#" onclick="MyModalDlg('UMExp.html',510,720)">UMExpress</a> &nbsp;<small> A worker dispatching application developed for an Operating 
				Engineers Union <i>(2005, ASP.NET with C#)</i></small>
				
			<li>
				<a href="#" onclick="MyModalDlg('RI.html',510,720)">UAL-MEC: Retirement &amp; Insurance</a> &nbsp;<small> A R&I issue tracking 
				system developed for United Air lines <i>(2005, ASP.NET with VB.NET)</i></small>
					
			<li>
				<a href="#" onclick="MyModalDlg('AlpaPhone.html',510,720)">ALPA Phone Book</a> &nbsp;<small>Stand alone and web base phone directory<i>(2004, ASP.NET with VB.NET & HTML with Clint-side VBScript)</i></small>
				
			<li>
				<a href="#" onclick="MyModalDlg('alpa.html',510,720)">Air Line Pilots Association, Int'l</a> <small>Developed custom controls, 
				and skins for this DNN site. <i>(2004, ASP.NET with VB.NET)</i>.</small>
				
			<li>
				<a href="#" onclick="MyModalDlg('jumpseat.html',510,720)">FDX Jumpseat Finder</a> &nbsp;<small> Simple application that allows FDX pilots 
				to find a "jumpseat". <i>(2004, ASP.NET with VB.NET)</i></small>
			
			
			<li>
				<a target="_blank" href="../OtherApps/MindReader/Magic.aspx">
					Mind Reader</a> &nbsp;<small>A fun application <i>(2003, ASP.NET with VB.NET)</i></small>			
		</ul>
		</div></td>
		</tr>
	</table>
    </asp:Literal>
    </form>
</body>
</html>
