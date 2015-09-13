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
            UC_LeftNav1.P_GraphicName = "timeline";
            UC_LeftNav1.P_ImageName = "image8";

            UC_Header1.P_HeaderTitle = "Timeline";
            UC_Header1.P_HeaderText = "A brief visual biograph";

            UC_Footer1.P_LastModified = "November 30, 2012";
        }

    </script>
    <title>Timeline</title>
    <script type="text/javascript" src="../JScript1.js"></script>
    <script type="text/javascript" src="../jquery-1.4.1.min.js"></script>
    <link rel="stylesheet" href="../StyleSheet1.css" type="text/css">
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <noscript>
        <meta http-equiv="REFRESH" content="0; URL= ../intro/index.aspx">
    </noscript>
    <table cellspacing="3" cellpadding="3" border="0" width="100%">
        <tr>
            <td width="1%" valign="top"  align="center">
                <uc1:UC_LeftNav ID="UC_LeftNav1" runat="server"></uc1:UC_LeftNav>
            </td>
            <td valign="top" width="99%" style="padding-left: 25px">
                <uc1:UC_Header ID="UC_Header1" runat="server"></uc1:UC_Header>
                <!-- PAGE STUFF	-->
                <br />
                <div style="padding-left: 10px; text-align: left;">
                    Below is an interesting timeline of major technological events versus events in
                    my own life.
                    <br />
                    <div style="height: 390px; width: 1257px; position: relative;">
                        <div style="height: 390px; width: 100px; position: absolute; cursor: pointer;" onclick="ChangeImage('previous');">
                            <img src="images/spacer.gif" height="390" width="100" alt="< Previous" />
                        </div>
                        <img id="timeLineImage1" alt="Timeline Image 1 of 4" src="images/MyTimeLineBlk1.jpg" />
                        <img id="timeLineImage2" alt="Timeline Image 2 of 4" src="images/MyTimeLineBlk2.jpg"
                            style="display: none" />
                        <img id="timeLineImage3" alt="Timeline Image 3 of 4" src="images/MyTimeLineBlk3.jpg"
                            style="display: none" />
                        <img id="timeLineImage4" alt="Timeline Image 4 of 4" src="images/OverTheYearsAll.jpg"
                            style="display: none" />
                        <div style="height: 390px; width: 100px; position: absolute; top: 0; left: 1157;
                            cursor: pointer;" onclick="ChangeImage('next');">
                            <img src="images/spacer.gif" height="390" width="100" alt="Next >" />
                        </div>
                    </div>
                    Display image <span id="SpanImageNumber">1</span> of 4.
                    <br />
                    <span id="SpanPrevious" onclick="ChangeImage('previous');" style="cursor: pointer;
                        font-size: 28px" title="< Previous">&laquo;</span> &nbsp; <span id="SpanNext" onclick="ChangeImage('next');"
                            style="cursor: pointer; font-size: 28px" title="Next >">&raquo;</span>
                </div>
                <!-- END Page Stuff -->
            </td>
        </tr>
    </table>
    <uc1:UC_Footer ID="UC_Footer1" runat="server"></uc1:UC_Footer>
    </form>
    <script type="text/javascript">
        function ChangeImage(direction)
        {
            var x = $("#SpanImageNumber").text();
            var n = "#timeLineImage";
            var t;
            t = n + x.toString();
            //alert(t);
            x = parseInt(x);
            if (direction == 'next')
            {
                if (x == 4) x = 0;
                x++;
            }
            else
            {
                if (x == 1) x = 5;
                x--;
            }
            // alert(x);
            $("#SpanImageNumber").text(x);

            $(t).hide();
            t = n + x.toString();
            $(t).slideDown('slow');
        }
    </script>
</body>
</html>
