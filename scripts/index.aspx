<!DOCTYPE html>

<%@ Page Language="c#" %>

<%@ Register TagPrefix="uc1" TagName="UC_Header" Src="../UC_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_LeftNav" Src="../UC_LeftNav.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_FiveTabs" Src="../UC_FiveTabs.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_Footer" Src="../UC_Footer.ascx" %>
<html>
<head>
    <title>JavaScripts</title>
    <meta name="CODE_LANGUAGE" content="C#">
    <script language="C#" runat="server">
        private void Page_Load(object sender, System.EventArgs e)
        {
            //don't forget to set the <title> tag in the HTML
            UC_LeftNav1.P_GraphicName = "scripts";
            UC_LeftNav1.P_ImageName = "image2";

            UC_Header1.P_HeaderTitle = "JavaScript";
            UC_Header1.P_HeaderText = "JavaScript Collection";
            UC_Footer1.P_LastModified = "November 20, 2012";

            if (!Page.IsPostBack)
            {
                UC_Header1.P_HeaderText = "Introduction";

                //fiv tables vis
                //UC_FivTabs1 can not be set to invisible until after the other properties are set, 
                // else it thinks the tabs are invisible
                //UC_FiveTabs1.P_Visible = false;
                Literal1.Text = "<!-- ";
                Literal2.Text = " -->";
                //Char x;

            }

            //Set Five Tabs properties
            UC_FiveTabs1.P_MainAreaScrolls = "no";
            UC_FiveTabs1.P_FiveTabSelected = "1"; //this doesn't work when not in a code behind
            UC_FiveTabs1.P_FiveTabsHeight = "400px"; //100%

            //tab labels
            UC_FiveTabs1.P_Tab1Name = "Scripts 1-5";
            UC_FiveTabs1.P_Tab2Name = "Scripts 6-10";
            UC_FiveTabs1.P_Tab3Name = "Scripts 11-15";
            UC_FiveTabs1.P_Tab4Name = "Scripts 16-20";
            UC_FiveTabs1.P_Tab5Name = "Scripts 21-25";
            UC_FiveTabs1.P_Tab6Name = "Scripts 26-30";

            //tab content
            UC_FiveTabs1.P_Tab1Text = iframe(lblTab1.Text.ToString());
            UC_FiveTabs1.P_Tab2Text = iframe(lblTab2.Text.ToString());
            UC_FiveTabs1.P_Tab3Text = iframe(lblTab3.Text.ToString());
            UC_FiveTabs1.P_Tab4Text = iframe(lblTab4.Text.ToString());
            UC_FiveTabs1.P_Tab5Text = iframe(lblTab5.Text.ToString());
            UC_FiveTabs1.P_Tab6Text = iframe(lblTab6.Text.ToString());


            //tab visibile
            //UC_FiveTabs1.P_Tab3Visible = false;			
        }

        private string iframe(string pagename)
        {
            string x;
            x = "\n<iframe src=\"" + pagename;
            x = x + "\" width=\"100%\" height=\"100%\" scrolling=\"auto\" frameborder=\"0\">";
            x = x + "(Unfortunately, you are using an older browser that doesn't support the iframe tag that is used in this site. <a href=\"http://www.webstandards.org/upgrade\" target=\"_blank\">Click here</a> to learn how to upgrade your browser.)";
            x = x + "</iframe>\n";
            return x;
        }


        private void Button1_Click(object sender, System.EventArgs e)
        {
            PanelMenu.Visible = false;
            Literal1.Text = "<br><table cellspacing=\"0\" cellpadding=\"3\" border=\"0\" width=\"98%\" align=\"center\"><tr><td>";
            Literal2.Text = "</td></tr></table>";

        }

    </script>
    <script language="javascript" src="../JScript1.js"></script>
    <link rel="stylesheet" href="../StyleSheet1.css" type="text/css" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <noscript>
        <meta http-equiv="REFRESH" content="0; URL= ../intro/index.aspx">
    </noscript>
    <table cellspacing="3" cellpadding="3" border="0" width="100%">
        <tr>
            <td width="1%" valign="top" align="center">
                <uc1:UC_LeftNav ID="UC_LeftNav1" runat="server"></uc1:UC_LeftNav>
            </td>
            <td valign="top" width="99%" style="padding-left: 25px">
                <uc1:UC_Header ID="UC_Header1" runat="server"></uc1:UC_Header>
                <asp:Panel ID="PanelMenu" runat="server">
                    <table cellspacing="0" cellpadding="10" width="81%" align="center" border="0">
                        <tr>
                            <th>
                                &nbsp;
                            </th>
                        </tr>
                        <tr>
                            <td valign="middle" bgcolor="black">
                                From here you can access a collection of client-side "JavaScript's" that I have
                                written. JavaScript isn't Java and likewise JavaScript's are not applets. JavaScript
                                is a scripting language invented by Netscape. JavaScript code is written in the
                                same file as the HTML (or in a *.js file) and is not compiled. To obtain the code
                                for a JavaScript just look at the source code of the containing page. I have tried
                                to include comments to offset the script code. Feel free to copy and use the code
                                in your own WebPages.
                                <br>
                                <br>
                                In this JavaScript collect, each complete "tab" contains 5 examples.
                                <hr>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <div align="center">
                        <br>
                        <asp:Button ID="Button1" runat="server" Text="View JavaScripts" OnClick="Button1_Click">
                        </asp:Button><br>
                        [click the button above to view the javascripts]
                    </div>
                </asp:Panel>
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                <uc1:UC_FiveTabs ID="UC_FiveTabs1" runat="server"></uc1:UC_FiveTabs>
                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    <uc1:UC_Footer ID="UC_Footer1" runat="server"></uc1:UC_Footer>
    <%-- Content for Tab1 --%>
    <asp:Label ID="lblTab1" runat="server" Visible="False">js1.htm</asp:Label>
    <%-- Content for Tab2 --%>
    <asp:Label ID="lblTab2" runat="server" Visible="False">js2.htm</asp:Label>
    <%-- Content for Tab3 --%>
    <asp:Label ID="lblTab3" runat="server" Visible="False">js3.htm</asp:Label>
    <%-- Content for Tab4 --%>
    <asp:Label ID="lblTab4" runat="server" Visible="False">js4.htm</asp:Label>
    <%-- Content for Tab5 --%>
    <asp:Label ID="lblTab5" runat="server" Visible="False">js5.htm</asp:Label>
    <%-- Content for Tab6 --%>
    <asp:Label ID="lblTab6" runat="server" Visible="False">js6.htm</asp:Label>
    </form>
</body>
</html>
