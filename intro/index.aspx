<!DOCTYPE html>
<%@ Register TagPrefix="uc2" TagName="UC_LeftNav" Src="../UC_LeftNav.ascx" %>

<%@ Page Language="c#" %>

<html>
<head>
    <title>Walter VanderHeide -- Splash Page</title>
    <script language="C#" runat="server">
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool WasSuccesful = false;
            if (txtPass.Text.Trim() == "1234")
            {
                switch (txtUserName.Text.Trim().ToLower())
                {
                    case "guest":
                    case "walter":
                        Session["LoggedIn"] = "yeap";
                        WasSuccesful = true;
                        break;
                }
            }

            UpdateDataBase(txtUserName.Text.Trim(), "password", WasSuccesful);

            if (Session["LoggedIn"] == "yeap")
                Response.Redirect("../intro/index.aspx?user=" + txtUserName.Text.Trim().ToLower() + "&timer=" + DateTime.Now.Ticks.ToString(), true);
            else
                lbInvalid.Visible = true;
        }

        protected string GetQueryStringStringValue(string QSItemName)
        {
            string queryStringValue = Request.QueryString[QSItemName];
            if (!object.Equals(queryStringValue, null) && queryStringValue.Length > 0)
            {
                return Server.UrlDecode(queryStringValue);
            }
            return string.Empty;
        }

        protected void UpdateDataBase(string UserName, string PassWord, bool WasSuccessful)
        {
            //Database - Log the loggins
            //string sPath = @"\\genfs1\www13\vanman798\db\DB1.mdb";
            string sPath = @"E:\sites\www13\vanman798\db\DB1.mdb";
            string strConnection = "Provider=Microsoft.Jet.OleDb.4.0;Data Source=" + sPath + ";";
            //password
            //strConnection = strConnection + "Jet OLEDB:Database Password=y1q2w3e;";

            string sSQL = "INSERT INTO table1(UserName, [PassWord],LoginWasSuccessful,[When]) VALUES ('" + UserName + "', '" + PassWord + "'," + WasSuccessful.ToString() + ",'" + DateTime.Now.ToString() + "')";

            System.Data.OleDb.OleDbConnection objConnection = new System.Data.OleDb.OleDbConnection(strConnection);
            System.Data.OleDb.OleDbCommand objCommandAuction1 = new System.Data.OleDb.OleDbCommand(sSQL, objConnection);

            try
            {
                objConnection.Open();
                objCommandAuction1.ExecuteReader();
                //objCommandAuction1.ExecuteScalar(); 
            }
            catch // (System.Exception ex)
            {
                //Response.Write("<hr />" + sSQL + "<hr />");
                //Response.Write("<hr />" + ex.Message + "<hr />");
                //Response.End();
            }

            objConnection.Close();
        }

        //protected void ViewDataBase()
        //{
        //    //Database - Log the loggins
        //   // string sPath = @"\\genfs1\www13\vanman798\db\DB1.mdb";
        //    string sPath = @"E:\sites\www13\vanman798\db\DB1.mdb";
        //    string strConnection = "Provider=Microsoft.Jet.OleDb.4.0;Data Source=" + sPath + ";";
        //    //password
        //    //strConnection = strConnection + "Jet OLEDB:Database Password=y1q2w3e;";

        //    string sSQL = "Select * from table1";
        //    System.Data.OleDb.OleDbConnection objConnection = new System.Data.OleDb.OleDbConnection(strConnection);
        //    System.Data.OleDb.OleDbCommand objCommandAuction1 = new System.Data.OleDb.OleDbCommand(sSQL, objConnection);
        //    System.Data.IDataReader oDr = null;

        //    try
        //    {
        //        objConnection.Open();
        //        oDr = objCommandAuction1.ExecuteReader();

        //        while (oDr.Read())
        //        {
        //            Response.Write("<LI>User Name: " + oDr[0].ToString() + " Log in Date: " + oDr[3].ToString() + " Successful: " + oDr[2].ToString());
        //        }

        //        oDr.Close();
        //    }
        //    catch (System.Exception ex)
        //    {
        //        Response.Write(ex.Message);
        //    }

        //    objConnection.Close();
        //}

        private void Page_Load(object sender, System.EventArgs e)
        {
            if (GetQueryStringStringValue("Logout") != "")
                Session["LoggedIn"] = null;

            pnLognin.Visible = false;
            if (Session["LoggedIn"] == null && Session["LoggedIn"] != "yeap")
                pnLognin.Visible = true;



            UC_LeftNav1.P_GraphicName = "";
            UC_LeftNav1.P_ImageName = "image0";

            Random rand = new Random();
            int intRnd = rand.Next(1, 42); //Random number between 1 and 40

            //Response.Write("<font color=white>IntroPage</font>");

            TableVideo.Visible = !true;
            TableUnderWater.Visible = !true;
            TableBigGlasses.Visible = !true;
            TableNatural.Visible = !true;
            TableAction.Visible = !true;
            TableNebo.Visible = !true;
            TableQuestionWall.Visible = !true;
            TableClimbing.Visible = !true;


            if (intRnd <= 5)	//1,2,3,4,5
            {
                TableVideo.Visible = true;
            }
            else if (intRnd > 5 && intRnd <= 10) //6,7,8,9,10
            {
                TableUnderWater.Visible = true;
            }
            else if (intRnd > 10 && intRnd <= 15) //11,12,13,14,15
            {
                TableBigGlasses.Visible = true;
            }
            else if (intRnd > 15 && intRnd <= 20)
            { //16,17,18,19,20
                TableNatural.Visible = true;
            }

            else if (intRnd > 20 && intRnd <= 25)
            { //21,22,23,24,25
                TableAction.Visible = true;
            }
            else if (intRnd > 25 && intRnd <= 30)
            { //26,27,28,29,30
                TableNebo.Visible = true;
            }

            else if (intRnd > 30 && intRnd <= 35)
            {
                TableQuestionWall.Visible = true;
            }
            else //36,37,38,39,40
            {
                TableClimbing.Visible = true;
            }
        }
    </script>
    <script language="javascript" src="../JScript1.js" type="text/javascript"></script>
    <!-- Since the CSS has precedence over the bgcolor attribute on the body tab I comment out the style sheet on the intro page -->
    <link rel="stylesheet" href="../StyleSheet1.css" type="text/css" />
</head>
<body style="background-color: black">
    <noscript>
        <font color="red"><b>In order to provide the best experience possible to the greatest
            amount of users, this web site makes extensive use of Active Scripting (Client-Side
            JavaScript).
            <br />
            <br />
            You appear to have Active Scripting (Client-Side JavaScript) disabled in your browser,
            and thus, your experience would be less than optimal. We request you open 'Preferences'
            or 'Internet Options' in your browser and enabling Active Scripting (Client-Side
            JavaScript) before proceeding. </b></font>
    </noscript>
    <form id="Form1" method="post" runat="server">
    <table cellspacing="3" cellpadding="3" border="0" width="100%">
        <tr>
            <td width="1%" valign="top" bgcolor="black" align="center">
                <uc2:UC_LeftNav ID="UC_LeftNav1" runat="server"></uc2:UC_LeftNav>
            </td>
            <td width="99%" valign="top" align="right" bgcolor="black">
                <div id="DivAd" style="background-color: black; width: 400px; display: none; position: absolute;
                    text-align: left; z-index: 99">
                    <fieldset>
                        <legend align="left"><b><span style="font-size: 12px; color: silver; font-family: Courier">
                            Internet Services & Applications&nbsp;</span></b></legend>
                        <div style="padding-right: 4px; padding-left: 4px; font-size: 10px; padding-bottom: 4px;
                            color: white; padding-top: 4px; font-family: verdana">
                            <font color="blue"><b>Build a better business through smarter technology</b></font>
                            <br />
                            <br />
                            Since 1997, Walter VanderHeide has provided custom, database-driven, web applications
                            to commercial, federal and municipal clients. With a skilled, industry-leading approach
                            to web application development, Walter delivers solutions that solve critical business
                            problems effectively and affordably every time.
                            <br />
                            <br />
                            For all your website and web application needs contact:
                            <br />
                            <br />
                            <b>Walter VanderHeide</b>
                            <br />
                            <img src="images/email.jpg" alt="email" />
                            <br />
                            <i>Specializing in Internet-Intranet-Portal Web Applications.</i>
                        </div>
                    </fieldset>
                </div>
                <asp:Panel ID="pnLognin" runat="server" Visible="false">
                    <div style="position: absolute; left: 140; top: 50; background-color: Black; width: 600px;
                        padding: 10px; z-index: 5;">
                        <fieldset>
                            <legend align="left"><b><span style="font-size: 16px; color: white; font-family: verdana">
                                Welcome to my website!</span></legend>
                            <table>
                                <tr>
                                    <td valign="bottom">
                                        <span class="TDRed">To be able to access any of the menu items you will need to login.</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="bottom">
                                        <font color="silver">If you don't have a username/password or you have forgotten yours
                                            send an email to</font>
                                        <img src="images/email.jpg" alt="email" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <font color="White">User name:&nbsp;</font><asp:TextBox runat="server" ID="txtUserName"></asp:TextBox>
                            <font color="White">&nbsp;&nbsp;Password:&nbsp;</font><asp:TextBox runat="server"
                                ID="txtPass" TextMode="Password"></asp:TextBox>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                            <asp:Label runat="server" ID="lbInvalid" Visible="false"><font color="white"><i>Invalid UserName/Password</i></font></asp:Label>
                        </fieldset>
                    </div>
                </asp:Panel>
                <div style="float: right; width: 521px;" onmouseover="getXYPosition(event);" onmouseout="document.getElementById('DivAd').style.display = 'none';">
                    <table border="0" cellpadding="0" cellspacing="0" runat="server" id="TableUnderWater"
                        visible="False">
                        <tr>
                            <td bgcolor="black">
                                <img src="images/spacer.gif" width="210" height="60" border="0" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="images/UnderWater.png" alt="St. Mary River, Alberta.  2001" title="St. Mary River, Alberta.  2001" />
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" runat="server" id="TableVideo"
                        visible="False">
                        <tr>
                            <td>
                                <img alt="Video Wall, 1999" src="images/VideoWall.png" title="Video Wall, 1999" />
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" runat="server" id="TableNatural"
                        visible="False">
                        <tr>
                            <td>
                                <img src="images/NaturalBridge.png" alt="Natural Bridge, VA. 2000" title="Natural Bridge, VA. 2000" />
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" runat="server" id="TableBigGlasses"
                        visible="False">
                        <tr>
                            <td bgcolor="black">
                                <img src="images/spacer.gif" width="210" height="60" border="0" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="images/BigGlasses.png" alt="Big Glasses, Provo, Utah. 2006" title="Big Glasses, Provo, Utah. 2006" />
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" runat="server" id="TableAction"
                        visible="False">
                        <tr>
                            <td>
                                <img src="images/VAAction.png" alt="Virginia Outdoors, 2005" title="Virginia Outdoors, 2005" />
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" runat="server" id="TableNebo" visible="False">
                        <tr>
                            <td>
                                <img src="images/Nebo.png" alt="Mt. Nebo, Utah.  2008" title="Mt. Nebo, Utah.  2008" />
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" runat="server" id="TableQuestionWall"
                        visible="False">
                        <tr>
                            <td>
                                <img src="images/QuestionWall.png" alt="Climbing in Utah. 2012" title="Climbing in Utah. 2012" />
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" runat="server" id="TableClimbing"
                        visible="False">
                        <tr>
                            <td>
                                <img src="images/ClimbPics.png" alt="Climbing, 2012" title="Climbing, 2012" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <!--overall table-->
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    </form>
</body>
</html>
