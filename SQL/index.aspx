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
            UC_LeftNav1.P_GraphicName = "SQL";
            UC_LeftNav1.P_ImageName = "image9";

            UC_Header1.P_HeaderTitle = "SQL Server Class";
            UC_Footer1.P_LastModified = "November 20, 2012";
            UC_Header1.P_HeaderText = "As Power Point Slides";
        }
    </script>
    <title>SQL Server</title>
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
                <table width="95%">
                    <tr>
                        <td align="center">
                            <font color="white"><b>Here is a collection of Power Point Slide shows that I created
                                to instruct a SQL Server 2000 course in 2002.</b></font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ul>
                                <li><a target="_blank" href="InterImageSql1.ppt">Introduction to the SQL Server Environment
                                </a>
                                    <li><a target="_blank" href="InterImageSql2.ppt">Creating Data Bases and Tables</a>
                                        <li><a target="_blank" href="InterImageSql3.ppt">Components, Identifiers, and Data Types</a>
                                            <li><a target="_blank" href="InterImageSql4.ppt">Roles/Logins</a>
                                                <li><a target="_blank" href="InterImageSql5.ppt">Simple Queries</a>
                                                    <li><a target="_blank" href="InterImageSql6.ppt">Complex Queries</a>
                                                        <nobr></nobr>
                                                        <li><a target="_blank" href="InterImageSql7.ppt">Data Modification</a>
                                                            <nobr></nobr>
                                                            <li><a target="_blank" href="InterImageSql8.ppt">System Objects</a>
                                                                <li><a target="_blank" href="InterImageSql9.ppt">Views</a>
                                                                    <li><a target="_blank" href="InterImageSql10.ppt">Stored Procedures</a>
                                                                        <li><a target="_blank" href="InterImageSql11.ppt">Accessing SQL Server data</a>
                                                                            <li><a target="_blank" href="InterImageSql12.ppt">Triggers</a>
                                                                                <li><a target="_blank" href="InterImageSql13.ppt">Transactions</a>
                                                                                    <li><a target="_blank" href="InterImageSql14.ppt">Locking</a>
                                                                                        <li><a target="_blank" href="InterImageSql15.ppt">Indexes</a></li>
                            </ul>
                            <table cellpadding="4" cellspacing="0" border="1" bordercolor="#000000" width="580">
                                <tr>
                                    <td valign="top">
                                        <p align="center">
                                            Quizzes
                                        </p>
                                        <ul>
                                            <li><a target="_blank" href="InterImageQuiz1.doc">Quiz 1</a></li>
                                        </ul>
                                    </td>
                                    <td valign="top">
                                        <p align="center">
                                            Answers</p>
                                        <ul>
                                            <li><a target="_blank" href="InterImageQuiz1Answers.doc">Quiz 1</a></li>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                            <br>
                            <table cellpadding="4" cellspacing="0" border="1" bordercolor="#000000" width="580">
                                <tr>
                                    <td valign="top">
                                        <p align="center">
                                            Homework
                                        </p>
                                        <ul>
                                            <li><a target="_blank" href="homework1.doc">HW 1</a>Supporting file <a target="_blank"
                                                href="Walkton_data.sql">Walkton_Data.sql</a></li>
                                        </ul>
                                    </td>
                                    <td valign="top">
                                        <p align="center">
                                            Answers</p>
                                        <ul>
                                            <li><a target="_blank" href="hw_Answers.sql">HW 1</a></li>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font color="white"><b>Tip:</b> When viewing a table in SQL Server and you wish to change
                                a field value to &lt;null&gt;, use cntrl -0 (zero)!</font>
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
