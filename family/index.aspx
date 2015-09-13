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
            UC_LeftNav1.P_GraphicName = "family";
            UC_LeftNav1.P_ImageName = "image4";

            UC_Header1.P_HeaderTitle = "Family Photographs";
            UC_Header1.P_HeaderText = "Click a photograph for a description";

            UC_Footer1.P_LastModified = "November 20, 2012";

            System.Text.StringBuilder bldr = new System.Text.StringBuilder();
            bldr.Append("<table border='1' BGCOLOR='#232323'>");
            bldr.Append("<tr>");
            bldr.Append(MakeCell(10, "imageGrandKids", "GrandKids2008.jpg", "July 3, 2008 :: Lethbridge"));
            bldr.Append(MakeCell(8, "imageLethbridge", "Lethbridge2007.jpg", "November, 2007 :: Lethbridge"));
            bldr.Append(MakeCell(9, "imageBoys", "Boys2007.jpg", "November, 2007 :: Cardston"));
            bldr.Append(MakeCell(1, "imageReunion", "Reunion2006.jpg", "July 8, 2006 :: Cardston"));
            bldr.Append(MakeCell(2, "imageWat", "Waterton2006.jpg", "July 4, 2006 :: Waterton"));
            bldr.Append(MakeCell(3, "imageCry", "crystal.jpg", "August 1999 :: Crystal Peak, CA"));
            bldr.Append(MakeCell(4, "imageBou", "bountiful.jpg", "February 1998 :: Bountiful"));
            bldr.Append(MakeCell(5, "imageCar", "cardston.jpg", "December 1989 :: Cardston"));
            bldr.Append(MakeCell(6, "imageHaw", "hawaii.jpg", "August 1989 :: Honolulu"));
            bldr.Append(MakeCell(7, "image1970", "1970.jpg", "1970 :: Utah"));
            bldr.Append("</tr>");
            bldr.Append("</table>");

            ltPicTable.Text = bldr.ToString();
        }

        private string MakeCell(int DescriptionID, string image, string JPEG, string ALT)
        {
            System.Text.StringBuilder retVal = new System.Text.StringBuilder();
            retVal.Append("<td align='center'>");
            retVal.Append("<input type='hidden' id='pic");
            retVal.Append(DescriptionID);
            retVal.Append("' name='pic");
            retVal.Append(DescriptionID);
            retVal.Append("' value='true'>");
            //retVal.Append(ALT);
            //retVal.Append("<br />");
            retVal.Append("<a href='#' onMouseOver=\"changeImages('");
            retVal.Append(image);
            retVal.Append("', '");
            retVal.Append(image);
            retVal.Append("on')\"");
            retVal.Append(" onMouseOut=\"if(document.forms[0].pic");
            retVal.Append(DescriptionID);
            retVal.Append(".value == 'true'){changeImages('");
            retVal.Append(image);
            retVal.Append("', '");
            retVal.Append(image);
            retVal.Append("off')}\" onClick = \"document.forms[0].pic");
            retVal.Append(DescriptionID);
            retVal.Append(".value=false;changeImages('");
            retVal.Append(image);
            retVal.Append("', '");
            retVal.Append(image);
            retVal.Append("on'); if(document.forms[0].pic");
            retVal.Append(DescriptionID);
            retVal.Append(".value = MyModalDlg('Descriptions.aspx?ID=");
            retVal.Append(DescriptionID);
            retVal.Append("', 300, 300)){changeImages('");
            retVal.Append(image);
            retVal.Append("', '");
            retVal.Append(image);
            retVal.Append("off')};\">");
            retVal.Append("<img name=\"");
            retVal.Append(image);
            retVal.Append("\" src=\"");
            retVal.Append(JPEG);
            retVal.Append("\" alt='");
            retVal.Append(ALT);
            retVal.Append("' width='300' height='250' border='0'></a>");
            retVal.Append("</td>");

            return retVal.ToString();
        }
    </script>
    <title>Family Photographs</title>
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
            <td width="1%" valign="top" align="center">
                <uc1:UC_LeftNav ID="UC_LeftNav1" runat="server"></uc1:UC_LeftNav>
            </td>
            <td valign="top" width="99%" style="padding-left: 25px">
                <uc1:UC_Header ID="UC_Header1" runat="server"></uc1:UC_Header>
                <!-- PAGE STUFF	-->
                <br />
                <table width="720" align="center">
                    <tr>
                        <td>
                            <span class="caption">Brief Family History</span>
                            <br />
                            <br />
                            My mother Jutta was married in 1963. The first child born to this union was my sister
                            Lisa, followed less than 14 months later by my brother Peter, and a little over
                            20 months after that by me.
                            <br />
                            <br />
                            In the late 1960's my mother's first marriage ended. As a result she re-entered
                            the work force and moved her family from Utah, USA to Alberta Canada. A few months
                            after my twelfth birthday, my mom married again, and about four and a half years
                            later my brother Kenny was born.
                            <br />
                            <br />
                            My ancestors on my mother's side, including my mother, are from Germany . On my
                            birth-father's side my ancestors are Dutch, with my birth-father being a second
                            generation American. My mom has an older brother and an older sister. My birth-father
                            was an only child.
                            <br />
                            <br />
                            The family photographs below are of my mother's father's descendants.
                            <br />
                            <div class="FamilyScollingDiv">
                                <asp:Literal ID="ltPicTable" runat="server"></asp:Literal>
                            </div>
                        </td>
                    </tr>
                </table>
                <br />
                <!-- END Page Stuff -->
            </td>
        </tr>
    </table>
    <uc1:UC_Footer ID="UC_Footer1" runat="server"></uc1:UC_Footer>
    </form>
</body>
</html>
