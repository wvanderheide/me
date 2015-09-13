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
            UC_LeftNav1.P_GraphicName = "video";
            UC_LeftNav1.P_ImageName = "image12";

            UC_Header1.P_HeaderTitle = "Random Videos";
            UC_Header1.P_HeaderText = "";
            
            UC_Footer1.P_LastModified = "November 20, 2012";

            if (!IsInternetExplorerBrowser())
                ltBrowser.Text = "<br><br><font color=red><b>If the video's will not play, please switch to an Internet Explorer browser.</b></font>";
        }

        private bool IsInternetExplorerBrowser()
        {
            bool retVal = false;

            System.Web.HttpBrowserCapabilities browser = Request.Browser;
            if (browser.Browser.ToUpper().Trim() == "IE")
                retVal = true;

            return retVal;
        }
    </script>
    <title>My Random Videos</title>
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
                            <span class="caption">Random Videos</span>
                            <br />
                            <br />
                            Over the years I have made a few random video's just for my own interest and/or
                            entertainment. In March 2007, I discovered <a href="http://www.youtube.com/profile_videos?user=vanman798"
                                target="_blank">youtube.com</a>, and decided to post a few of my clips on there.
                            Some of these clips date back to the early 1990's, and some of them are inside jokes
                            that have meaning only to me and the people involved. None of them are well down,
                            and in the conversion process from VHS video to *.avi to YouTube format (whatever
                            that is) most of them are in pretty rough shape.
                            <br />
                            <br />
                            September 5, 2008 - I bought a camera back in May and as a result my collection
                            of video is getting bigger and bigger, so I'm no longer going to update this page.
                            To see my video's click on the youtube.com link above.
                            <asp:Literal ID="ltBrowser" runat="server"></asp:Literal><br />
                            <br />
                            <div class="VideoScollingDiv">
                                <table border='1' bgcolor='#232323'>
                                    <tr>
                                        <!-- First -->
                                        <td align='center' valign='top'>
                                            <div>
                                                <b>Pfeifferhorn</b>&nbsp;&nbsp;September 15, 2007</div>
                                            <object width="425" height="350">
                                                <param name="movie" value="http://www.youtube.com/v/8KIylOaDSMA"></param>
                                                <param name="wmode" value="transparent"></param>
                                                <embed src="http://www.youtube.com/v/8KIylOaDSMA" type="application/x-shockwave-flash"
                                                    wmode="transparent" width="425" height="350"></embed></object>
                                        </td>
                                        <td align='center' valign='top'>
                                            <div>
                                                <b>Mt. Nebo</b>&nbsp;&nbsp;September 3, 2007</div>
                                            <object width="425" height="350">
                                                <param name="movie" value="http://www.youtube.com/v/3Heptm6Jxb4"></param>
                                                <embed src="http://www.youtube.com/v/3Heptm6Jxb4" type="application/x-shockwave-flash"
                                                    width="425" height="350"></embed></object>
                                        </td>
                                        <td align='center' valign='top'>
                                            <div>
                                                <b>Lone Peak</b>&nbsp;&nbsp;August 23, 2007</div>
                                            <object width="425" height="350">
                                                <param name="movie" value="http://www.youtube.com/v/woNgsCr1TZc"></param>
                                                <embed src="http://www.youtube.com/v/woNgsCr1TZc" type="application/x-shockwave-flash"
                                                    width="425" height="350"> </embed>
                                            </object>
                                        </td>
                                        <td align='center' valign='top'>
                                            <div>
                                                <b>The God I Believe in Isn't Short on Cash!</b>&nbsp;&nbsp;July, 2005</div>
                                            <object width="425" height="350">
                                                <param name="movie" value="http://www.youtube.com/v/Ce25iO6gLfs"></param>
                                                <param name="wmode" value="transparent"></param>
                                                <embed src="http://www.youtube.com/v/Ce25iO6gLfs" type="application/x-shockwave-flash"
                                                    wmode="transparent" width="425" height="350"></embed></object>
                                        </td>
                                        <td align='center' valign='top'>
                                            <div>
                                                <b>Skydiving Hartwood Paracenter, VA.</b>&nbsp;&nbsp;Summer, 2004</div>
                                            <object width="425" height="350">
                                                <param name="movie" value="http://www.youtube.com/v/dJ21HfpHaTM"></param>
                                                <param name="wmode" value="transparent"></param>
                                                <embed src="http://www.youtube.com/v/dJ21HfpHaTM" type="application/x-shockwave-flash"
                                                    wmode="transparent" width="425" height="350"></embed></object>
                                        </td>
                                        <td align='center' valign='top'>
                                            <div id='Raft1'>
                                                <div>
                                                    Part 1 of 4: <b>Youghiogheny River Rafting</b>&nbsp;&nbsp;September 2003</div>
                                                <object width="425" height="350">
                                                    <param name="movie" value="http://www.youtube.com/v/K8toMbUxa-Y"></param>
                                                    <param name="wmode" value="transparent"></param>
                                                    <embed src="http://www.youtube.com/v/K8toMbUxa-Y" type="application/x-shockwave-flash"
                                                        wmode="transparent" width="425" height="350"></embed></object>
                                            </div>
                                            <div id='Raft2' style="display: none">
                                                <div>
                                                    Part 2 of 4: <b>Youghiogheny River Rafting</b>&nbsp;&nbsp;September 2003</div>
                                                <object width="425" height="350">
                                                    <param name="movie" value="http://www.youtube.com/v/KClZrfJ6uBE"></param>
                                                    <param name="wmode" value="transparent"></param>
                                                    <embed src="http://www.youtube.com/v/KClZrfJ6uBE" type="application/x-shockwave-flash"
                                                        wmode="transparent" width="425" height="350"></embed></object>
                                            </div>
                                            <div id='Raft3' style="display: none">
                                                <div>
                                                    Part 3 of 4: <b>Youghiogheny River Rafting</b>&nbsp;&nbsp;September 2003</div>
                                                <object width="425" height="350">
                                                    <param name="movie" value="http://www.youtube.com/v/ia3RByHUd-g"></param>
                                                    <param name="wmode" value="transparent"></param>
                                                    <embed src="http://www.youtube.com/v/ia3RByHUd-g" type="application/x-shockwave-flash"
                                                        wmode="transparent" width="425" height="350"></embed></object>
                                            </div>
                                            <div id='Raft4' style="display: none">
                                                <div>
                                                    Part 4 of 4: <b>Youghiogheny River Rafting</b>&nbsp;&nbsp;September 2003</div>
                                                <object width="425" height="350">
                                                    <param name="movie" value="http://www.youtube.com/v/4ES_4LKpMrY"></param>
                                                    <param name="wmode" value="transparent"></param>
                                                    <embed src="http://www.youtube.com/v/4ES_4LKpMrY" type="application/x-shockwave-flash"
                                                        wmode="transparent" width="425" height="350"></embed></object>
                                            </div>
                                            <div align="center">
                                                <div align="center">
                                                    <a href='#' onclick="ShowVideo(1, 'Raft')">Part 1</a> | <a href='#' onclick="ShowVideo(2, 'Raft')">
                                                        Part 2</a> | <a href='#' onclick="ShowVideo(3, 'Raft')">Part 3</a> | <a href='#'
                                                            onclick="ShowVideo(4, 'Raft')">Part 4</a></div>
                                        </td>
                                        <td align='center' valign='top'>
                                            <div>
                                                <b>Rug Burn</b>&nbsp;&nbsp;Fall 2000</div>
                                            <object width="425" height="350">
                                                <param name="movie" value="http://www.youtube.com/v/U_cXXj_eY-M"></param>
                                                <param name="wmode" value="transparent"></param>
                                                <embed src="http://www.youtube.com/v/U_cXXj_eY-M" type="application/x-shockwave-flash"
                                                    wmode="transparent" width="425" height="350"></embed></object>
                                        </td>
                                        <td align='center' valign='top'>
                                            <div>
                                                <b>My VCR</b>&nbsp;&nbsp;Fall 2000</div>
                                            <object width="425" height="350">
                                                <param name="movie" value="http://www.youtube.com/v/IoloqrAjrTw"></param>
                                                <param name="wmode" value="transparent"></param>
                                                <embed src="http://www.youtube.com/v/IoloqrAjrTw" type="application/x-shockwave-flash"
                                                    wmode="transparent" width="425" height="350"></embed></object>
                                        </td>
                                        <td align='center' valign='top'>
                                            <div id='Elehondro1'>
                                                <div>
                                                    Part 1 of 2: <b>Elehondro the Dancer!</b>&nbsp;&nbsp;October 2000</div>
                                                <object width="425" height="350">
                                                    <param name="movie" value="http://www.youtube.com/v/Se-uMrwz_60"></param>
                                                    <param name="wmode" value="transparent"></param>
                                                    <embed src="http://www.youtube.com/v/Se-uMrwz_60" type="application/x-shockwave-flash"
                                                        wmode="transparent" width="425" height="350"></embed></object>
                                            </div>
                                            <div id='Elehondro2' style="display: none">
                                                <div>
                                                    Part 2 of 2: <b>Elehondro the Dancer!</b>&nbsp;&nbsp;October 2000</div>
                                                <object width="425" height="350">
                                                    <param name="movie" value="http://www.youtube.com/v/Lhxz9Nxr1DI"></param>
                                                    <param name="wmode" value="transparent"></param>
                                                    <embed src="http://www.youtube.com/v/Lhxz9Nxr1DI" type="application/x-shockwave-flash"
                                                        wmode="transparent" width="425" height="350"></embed></object>
                                            </div>
                                            <div align="center">
                                                <div align="center">
                                                    <a href='#' onclick="ShowVideo(1, 'Elehondro')">Part 1</a> | <a href='#' onclick="ShowVideo(2, 'Elehondro')">
                                                        Part 2</a></div>
                                        </td>
                                        <td align='center' valign='top'>
                                            <div id='Jammin1'>
                                                <div>
                                                    Part 1 of 2: <b>Eric and Dave Jammin</b>&nbsp;&nbsp;Summer 2000</div>
                                                <object width="425" height="350">
                                                    <param name="movie" value="http://www.youtube.com/v/Cn8v46C3MxA"></param>
                                                    <param name="wmode" value="transparent"></param>
                                                    <embed src="http://www.youtube.com/v/Cn8v46C3MxA" type="application/x-shockwave-flash"
                                                        wmode="transparent" width="425" height="350"></embed></object>
                                            </div>
                                            <div id='Jammin2' style="display: none">
                                                <div>
                                                    Part 2 of 2: <b>Eric and Dave Jammin</b>&nbsp;&nbsp;Summer 2000</div>
                                                <object width="425" height="350">
                                                    <param name="movie" value="http://www.youtube.com/v/x1k6uohw5JU"></param>
                                                    <param name="wmode" value="transparent"></param>
                                                    <embed src="http://www.youtube.com/v/x1k6uohw5JU" type="application/x-shockwave-flash"
                                                        wmode="transparent" width="425" height="350"></embed></object>
                                            </div>
                                            <div align="center">
                                                <a href='#' onclick="ShowVideo(1, 'Jammin')">Part 1</a> | <a href='#' onclick="ShowVideo(2, 'Jammin')">
                                                    Part 2</a></div>
                                        </td>
                                        <td align='center' valign='top'>
                                            <div>
                                                <b>Calling in Sick to Work</b>&nbsp;&nbsp;September 1996</div>
                                            <object width="425" height="350">
                                                <param name="movie" value="http://www.youtube.com/v/UD6cKKvE5Yw"></param>
                                                <param name="wmode" value="transparent"></param>
                                                <embed src="http://www.youtube.com/v/UD6cKKvE5Yw" type="application/x-shockwave-flash"
                                                    wmode="transparent" width="425" height="350"></embed></object>
                                        </td>
                                        <td align='center' valign='top'>
                                            <div>
                                                <b>How Cold is it?</b>&nbsp;&nbsp;September 1995</div>
                                            <object width="425" height="350">
                                                <param name="movie" value="http://www.youtube.com/v/PBemW3OJhic"></param>
                                                <param name="wmode" value="transparent"></param>
                                                <embed src="http://www.youtube.com/v/PBemW3OJhic" type="application/x-shockwave-flash"
                                                    wmode="transparent" width="425" height="350"></embed></object>
                                        </td>
                                        <td align='center' valign='top'>
                                            <div>
                                                <b>Small Town</b>&nbsp;&nbsp;Winter 1992/93</div>
                                            <object width="425" height="350">
                                                <param name="movie" value="http://www.youtube.com/v/v0_KHnQuoXc"></param>
                                                <param name="wmode" value="transparent"></param>
                                                <embed src="http://www.youtube.com/v/v0_KHnQuoXc" type="application/x-shockwave-flash"
                                                    wmode="transparent" width="425" height="350"></embed></object>
                                        </td>
                                        <!-- Last -->
                                        <td align='center' valign='top'>
                                            <div>
                                                <b>College Graduation</b>&nbsp;&nbsp;April 1992</div>
                                            <object width="425" height="350">
                                                <param name="movie" value="http://www.youtube.com/v/_KqahmXjNHU"></param>
                                                <param name="wmode" value="transparent"></param>
                                                <embed src="http://www.youtube.com/v/_KqahmXjNHU" type="application/x-shockwave-flash"
                                                    wmode="transparent" width="425" height="350"></embed></object>
                                        </td>
                                    </tr>
                                </table>
                                <asp:Literal ID="ltPicTable" runat="server"></asp:Literal>
                            </div>
                        </td>
                    </tr>
                </table>
                <!-- END Page Stuff -->
            </td>
        </tr>
    </table>
    <div align="center">
        Please use the SCROLL bar above to access more videos</div>
    <uc1:UC_Footer ID="UC_Footer1" runat="server"></uc1:UC_Footer>
    </form>
</body>
</html>
