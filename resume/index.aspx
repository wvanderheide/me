<!DOCTYPE html>
<%@ Page Language="C#" %>
<%@ Register TagPrefix="uc1" TagName="UC_LeftNav" Src="../UC_LeftNav.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_Header" Src="../UC_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_Footer" Src="../UC_Footer.ascx" %>
<html>
<script language="C#" runat="server">

    void Page_Load(Object sender, EventArgs e)
    {
        UC_LeftNav1.P_GraphicName = "resume";
        UC_LeftNav1.P_ImageName = "image3";

        UC_Header1.P_HeaderTitle = "Resume";

        UC_Footer1.P_LastModified = "November 20, 2012";
        UC_Header1.P_HeaderText = "Last Updated : " + UC_Footer1.P_LastModified;
    }//end sub
</script>
<head>
    <title>Resume of H. Walter VanderHeide</title>
    <script language="javascript" src="../JScript1.js"></script>
    <link href="../StyleSheet1.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <noscript>
        <meta http-equiv="REFRESH" content="0; URL= ../intro/index.aspx">
    </noscript>
    <table cellspacing="3" cellpadding="3" width="100%" border="0">
        <tr>
            <td valign="top" align="center" width="1%">
                <uc1:UC_LeftNav ID="UC_LeftNav1" runat="server"></uc1:UC_LeftNav>
            </td>
            <td valign="top" width="99%" style="padding-left: 25px">
                <uc1:UC_Header ID="UC_Header1" runat="server"></uc1:UC_Header>
                <br />
                <div style="border-radius: 8px; border: 2px solid black; background-color: black;
                    padding: 10px; width: 355px; text-align: center;">
                    <b><strong>H. Walter VanderHeide</strong></b>
                    <br />
                    <img src="../intro/images/email.jpg" />
                </div>
                <!--Close Header-->
                <div style="float: right">
                    <a target="_blank" href="resumeWalterVanderHeide.doc">Download/View as Word Doc</a>
                    | <a target="_blank" href="resumeWalterVanderHeide.pdf">Download/View as PDF Doc</a>
                </div>
                <div style="clear: both">
                </div>
                <!--Resume table-->
                <table width="95%">
                    <tr>
                        <td>
                            <br />
                            <br />
                            <span class="caption">DESIRED POSITION</span>
                            <br />
                            <br />
                            I am seeking employment as a Web Site/Application Developer.
                            <br />
                            <i>This site is full of examples of my work.</i>
                            <br />
                            <br />
                            <span class="caption">SUMMARY OF SKILLS</span>
                            <br />
                            <br />
                            <b>COMPUTER PROGRAMMING</b>
                            <table cellspacing="2" cellpadding="3" width="500" bgcolor="#232323" border="0">
                                <tr>
                                    <td width="200" bgcolor="black">
                                        Language
                                    </td>
                                    <td width="150" bgcolor="black">
                                        Experience
                                    </td>
                                    <td width="*" bgcolor="black">
                                        Last Used
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        ASP.NET
                                    </td>
                                    <td width="146">
                                        8.5 years
                                    </td>
                                    <td width="120">
                                        currently use
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        VB.NET
                                    </td>
                                    <td width="146">
                                        3 years
                                    </td>
                                    <td width="120">
                                        July 2005
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        C#
                                    </td>
                                    <td width="146">
                                        7 year
                                    </td>
                                    <td width="120">
                                        currently use
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        ADO.NET
                                    </td>
                                    <td width="146">
                                        8.5 year
                                    </td>
                                    <td width="120">
                                        currently use
                                    </td>
                                </tr>
                                <tr style="height: 12.15pt">
                                    <td style="height: 12.15pt" width="202">
                                        ASP
                                    </td>
                                    <td style="height: 12.15pt" width="146">
                                        10 years
                                    </td>
                                    <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                                        width: 1.25in; border-bottom: medium none; height: 12.15pt" width="120">
                                        November 2010
                                    </td>
                                </tr>
                                <tr style="height: 12.6pt">
                                    <td style="height: 12.6pt" width="202">
                                        VBScript
                                    </td>
                                    <td style="height: 12.6pt" width="146">
                                        10 year
                                    </td>
                                    <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                                        width: 1.25in; border-bottom: medium none; height: 12.6pt" width="120">
                                        November 2010
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        ADO
                                    </td>
                                    <td width="146">
                                        10 years
                                    </td>
                                    <td width="120">
                                        November 2010
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        SQL
                                    </td>
                                    <td width="146">
                                        13 years
                                    </td>
                                    <td width="120">
                                        currently use
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        JAVASCRIPT (including JQuery)
                                    </td>
                                    <td width="146">
                                        11 years
                                    </td>
                                    <td width="120">
                                        currently use
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        AJAX
                                    </td>
                                    <td width="146">
                                        6 years
                                    </td>
                                    <td width="120">
                                        currently use
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        HTML (raw coding)
                                    </td>
                                    <td width="146">
                                        14 years
                                    </td>
                                    <td width="120">
                                        currently use
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        CSS
                                    </td>
                                    <td width="146">
                                        11 years
                                    </td>
                                    <td width="120">
                                        currently use
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        XML
                                    </td>
                                    <td width="146">
                                        8 year
                                    </td>
                                    <td width="120">
                                        currently use
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        Flash
                                    </td>
                                    <td width="146">
                                        1 year
                                    </td>
                                    <td width="120">
                                        January 2005
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        SAS
                                    </td>
                                    <td width="146">
                                        4 years
                                    </td>
                                    <td width="120">
                                        February 2000
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        VBA
                                    </td>
                                    <td width="146">
                                        &lt; 1 year
                                    </td>
                                    <td width="120">
                                        currently use
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        Visual Basic
                                    </td>
                                    <td width="146">
                                        2 years
                                    </td>
                                    <td width="120">
                                        November 2003
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        ActiveX/COM
                                    </td>
                                    <td width="146">
                                        &lt; 1 year
                                    </td>
                                    <td width="120">
                                        sporadic use
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        JAVA
                                    </td>
                                    <td width="146">
                                        1.5 years
                                    </td>
                                    <td width="120">
                                        November 1999
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        FORTRAN
                                    </td>
                                    <td width="146">
                                        course work only
                                    </td>
                                    <td width="120">
                                        n/a
                                    </td>
                                </tr>
                                <tr>
                                    <td width="202">
                                        ASSEMBLY language
                                    </td>
                                    <td width="146">
                                        course work only
                                    </td>
                                    <td width="120">
                                        n/a
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <b>OPERATING SYSTEMS</b>
                            <br />
                            WINDOWS, UNIX,DOS.
                            <br />
                            <br />
                            <b></b><b>SOFTWARE</b>
                            <br />
                            VISUAL STUDIO (with Team Founation Server), OFFICE (which includes ACCESS, WORD,
                            EXCEL, and POWERPOINT), MS SQL SERVER, IBM INFORMIX (via Server Studio, or WINSQL),
                            PHOTOSHOP, ACROBAT, and IIS.
                            <br />
                            <br />
                            <b>OTHER SKILLS</b>
                            <br />
                            Trained in formal logic, calculus, differential equations, linear algebra, probability
                            theory, regression analysis, hypothesis testing, quality control, physics, and economics.
                            Accomplished in analysis and interpretation of statistical data; summarization and
                            presentation of data in narrative, tabular, or graphical form. Experienced and comfortable
                            working with the public. Three years experience living overseas. Completed one-year,
                            hands-on, and class room lead, management training course.
                            <br />
                            <br />
                            <span class="caption">EXPERIENCE</span>
                            <table>
                                <tr>
                                    <td>
                                        <b>SENIOR APPLICATIONS DEVELOPER</b> -- <small>Neways, Springvill, UT � June 2011 -
                                            present</small>
                                        <ul>
                                            <li>Develop Object-Oriented Internet-based web applications using ASP.NET (with C#),
                                                ADO.NET, XML, HTML, CSS, JavaScript, AJAX, JQuery and SQL (Informix). See <a href="http://www.neways.com"
                                                    target="_blank">http://www.neways.com</a>.</li>
                                            <li>Design normalized relational databases.</li>
                                            <li>Write stored procedures for IBM Informix database, and SQL Server.</li>
                                            <li>Develop web services, web forms, and user controls.</li>
                                            <li>Write new code, modify existing code, and repaired bugs.</li>
                                            <li>Create modules for Telerik Site Finity content management platform.</li>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <b>SENIOR INTERNET DEVELOPER</b> -- <small>Nature's Sunshine Products, Provo, UT � February
                                            2006 - November 2010</small>
                                        <ul>
                                            <li>Developed Object-Oriented Internet-based web applications using ASP.NET (with C#),
                                                ADO.NET, XML, HTML, CSS, JavaScript, AJAX, JQuery and SQL. See <a href="http://www.naturessunshine.com"
                                                    target="_blank">http://www.naturessunshine.com</a>.
                                                <li>Designed normalized relational databases for Microsoft SQL Server.
                                                    <li>Wrote stored procedures.
                                                        <li>Developed web services, web forms, and user controls.
                                                            <li>Consumed WFC services.
                                                                <li>
                                            Wrote new code, modified existing code, and repaired bugs.
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <b>SOFTWARE ENGINEER</b> -- <small>Net-Endeavor, Pleasant Grove, UT � August 2005 �
                                            February 2006</small>
                                        <ul>
                                            <li>Developed Object-Oriented Internet-based web applications using ASP.NET (with C#),
                                                ADO.NET, XML, HTML, CSS, JavaScript, and SQL.
                                                <li>Designed normalized relational databases.
                                                    <li>Wrote stored procedures.
                                                        <li>Developed web forms, and user controls.
                                                            <li>Wrote new code, modify existing code, found and repaired bugs.
                                                                <li>Performed code reviews on other developer�s work.
                                                                    <li>
                                            Developed and designed reports using SQL Reporting Services.
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <b>WEB APPLICATION DEVELOPER</b> -- <small>Air Line Pilots Association, Intl., Herdnon
                                            VA - April 2004 � August 2005</small>
                                        <ul>
                                            <li>Developed Internet/Intranet web applications, web sites, and web services with ASP.NET
                                                (with VB.NET and/or C#), ADO.NET, XML, HTML, CSS, JavaScript, and SQL (including
                                                stored procedures). See <a href="http://www.alpa.org" target="_blank">http://www.alpa.org</a>
                                                , <a href="https://crewroom.alpa.org" target="_blank">https://crewroom.alpa.org</a>
                                                , <a href="https://crewroom.alpa.org/ual/ualri/Default.aspx" target="_blank">https://crewroom.alpa.org/ual/ualri/Default.aspx</a>
                                                .</li>
                                            <li>Developed custom modules for use with the DotNetNuke open source portal product,
                                                in ASP.NET.</li>
                                            <li>Designed Interface Prototypes including create graphics using Adobe PhotoShop, and
                                                skins for DotNetNuke.</li>
                                            <li>Designed the "look and feel" of new sites, and make improvements to existing sites.</li>
                                            <li>Assisted and trained other developers.</li>
                                            <li>Designed normalized relational databases.</li>
                                            <li>Wrote SQL Server DTS scripts to transfer and transform data from flat files to SQL
                                                Server tables. For example the data for <a href="http://www.alpa.org/fdx/jumpseat/"
                                                    target="_blank">http://www.alpa.org/fdx/jumpseat/</a> is transferred from a
                                                flat file to SQL via DTS.</li>
                                            <li>Lead projects through the whole development lifecycle (from concept, through development,
                                                to installation). </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>WEB APPLICATION DEVELOPER</b> -- <small>InterImage Inc, Arlington, VA -- February
                                            2000 to April 2004</small>
                                        <ul>
                                            <li>Developed Internet/Intranet web applications and web sites using these technologies:
                                                ASP.NET (with VB.NET and or C#), ADO.NET, ASP (with VBScript), XML, JavaScript,
                                                ADO, SQL, COM, ActiveX, and Web Services. </li>
                                            <li>Designed and maintained relational databases. Expert with Microsoft SQL Server and
                                                Microsoft Access. </li>
                                            <li>Daily, wrote ASP, ASP.NET, JavaScript, VBScript, HTML (raw code), DHTML, SQL (including
                                                stored procedures), and CSS for new web sites and for maintenance to existing sites.
                                            </li>
                                            <li>Developed COM servers for use with MTS. </li>
                                            <li>Lead projects through the whole development lifecycle (from concept, through development,
                                                to installation). </li>
                                            <li>Designed the "look and feel" of new sites, and made improvements to existing sites.
                                                <li>Created Interface prototypes including creating graphics using Adobe PhotoShop,
                                                    Macromedia Fireworks, and Flash. </li>
                                                <li>Did Intranet contract work for several government agencies as the primary representative
                                                    of InterImage. </li>
                                                <li>Set up site-specific search engines using index server. </li>
                                                <li>Functioned as a Technical Lead, by managing the technical side of projects.
                                                    <li>Assisted and trained other developers. </li>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <b>WEBMASTER/ECONOMIST</b> -- <small>BLS Consumer Expenditure Surveys, Washington DC
                                            -- August 1997 to February 2000</small>
                                        <ul>
                                            <li>Wrote HTML for updates and improvements to the Consumer Expenditure Survey web site
                                                (<a href="http://www.bls.gov/cex/" target="_new">http://www.bls.gov/cex</a>).
                                            </li>
                                            <li>Designed, programmed, and maintain an Intranet that improved the storage and retrieval
                                                of data tables. </li>
                                            <li>Trained fellow employees in use of UNIX operating system. </li>
                                            <li>Wrote SAS programs to extract, analyze, and group data from a database. </li>
                                            <li>Prepared interpretations of price data in narrative, graphical, and/or tabular forms
                                                using Microsoft Office products. </li>
                                            <li>Analyzed expenditure data and calculated descriptive statistics. </li>
                                            <li>Wrote data documentation for both public-use data and in-house data. </li>
                                            <li>Researched consumer expenditure topics (published in the September 1999 <a href="http://stats.bls.gov/opub/mlr/1999/09/lmir.htm"
                                                target="_new"><i>Monthly Labor Review</i></a>, see <a href="http://stats.bls.gov/opub/mlr/1999/09/atissue.htm">
                                                    http://stats.bls.gov/opub/mlr/1999/09/atissue.htm</a>). </li>
                                            <li>Sited in <a href="http://www.exnet.iastate.edu/Publications/M20004-9.pdf" target="_new">
                                                Money 2000 and Beyond</a>, and <a href="http://www.epinet.org/briefingpapers/inequality/inequality.html"
                                                    target="_new">Any way you cut it </a>. </li>
                                            <li>Volunteered as a college recruiter doing both informational job fairs, and interviewing.</li>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <span class="caption">EDUCATION</span>
                            <br />
                            Bachelor of Science - 1992; Brigham Young University; Provo, Utah. Substantial course
                            work in economics, statistics, mathematics, and computer science. On going computer
                            training classes from various schools and training centers; over 18-computer or
                            web development related courses completed since 1998. Attended Dev Connections in
                            2007, and 2010.
                            <br />
                            <br />
                            <span class="caption">OVERVIEW</span>
                            <br />
                            <a href="../work/index.aspx">See Samples of my Work.</a>
                        </td>
                    </tr>
                </table>
                <!--end Resume table-->
            </td>
        </tr>
    </table>
    <uc1:UC_Footer ID="UC_Footer1" runat="server"></uc1:UC_Footer>
    </form>
</body>
</html>
