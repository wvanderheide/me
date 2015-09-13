<%@ Control Language="c#" %>
<script language="C#" runat="server">
	
    
    public String P_HeaderTitle
    {
        get { return lblHeaderTitle.Text.ToString(); }
        set { lblHeaderTitle.Text = value; }
    }


    public String P_HeaderText
    {
        get { return lblHeaderText.Text.ToString(); }
        set { lblHeaderText.Text = value; }
    }

    private void Page_Load(object sender, System.EventArgs e)
    {
        if (Request.ServerVariables["SERVER_NAME"].ToString() == "localhost")
        {
            Session["LoggedIn"] = "yeap";
        }


        if (Session["LoggedIn"] == null && Session["LoggedIn"] != "yeap")
            Response.Redirect("../intro/index.aspx", true);
    }
</script>
<!-- Here is the Header -->
<div style="border-radius: 8px; border: 2px solid black; background-color: black;
    width=98%">
    <table cellspacing="0" cellpadding="3" border="0" width="100%" align="center">
        <tbody>
            <tr>
                <td colspan="2" align="right" valign="top" bgcolor="black">
                    <table width="100%" class="hideFromPrinter">
                        <tr>
                            <td width="99%" valign="baseline">
                                <hr>
                            </td>
                            <td width="1%" nowrap>
                                <a target="_top" href="#" onclick="javascript:MyModalDlg('../calendar/calendar.aspx', 516, 248);"
                                    onmouseout="ImageChange('image7', 'off')" onmouseover="ImageChange('image7','on')">
                                    <img name="image7" src="../Images/smCalendar.jpg" width="22" height="17" border="0"
                                        alt="View Calendar"></a> | <a href="../intro/index.aspx?Logout=true">Logout</a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td width="50%" valign="bottom" bgcolor="#000000">
                    <div style="font-weight: bold; font-style: italic; float: left" class="big">
                        &nbsp;&nbsp;<asp:Label ID="lblHeaderTitle" runat="server"></asp:Label>
                    </div>
                </td>
                <td width="50%" align="right" valign="bottom" bgcolor="#000000" height="30">
                    <nobr><i><asp:Label ID="lblHeaderText" Runat="server"></asp:Label></i></nobr>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<!--End of Header-->
