<%@ Control Language="c#" %>
<script language="C#" runat="server">
    private String GraphicName;
    public String P_GraphicName
    {
        get { return GraphicName; }
        set { GraphicName = value; }
    }

    private String ImageName = "";
    public String P_ImageName
    {
        get { return ImageName; }
        set { ImageName = value; }
    }

    void Page_Load(Object sender, EventArgs e)
    {
        //Label1.Text = Request.Browser.Version + "<br>";
        if (ImageName != "")
        {
            Label1.Text = "\n<input id=\"hThisPageImage\" type=\"hidden\" value=\"" + ImageName + "\" name=\"hThisPageImage\">";
        }

        Label1.Text += "\n<a href ='../intro/index.aspx' onMouseOut=\"ImageChange('image0', 'off')\" onMouseOver=\"ImageChange('image0','on')\"><img alt='Splash Page' src=\"../images/wlogo.jpg\" border=0 name='image0' width='95' height='40'></a><br>\n";
        Label1.Text += NavImage("resume", "3", "aspx");
        Label1.Text += NavImage("timeline", "8", "aspx");
        Label1.Text += NavImage("family", "4", "aspx");
        Label1.Text += NavImage("photos", "10", "aspx");
        Label1.Text += NavImage("hiking", "11", "aspx");
        Label1.Text += NavImage("quotes", "6", "aspx");
        Label1.Text += NavImage("work", "5", "aspx");
        Label1.Text += NavImage("scripts", "2", "aspx");
        Label1.Text += NavImage("SQL", "9", "aspx");
        Label1.Text += NavImage("applet", "1", "aspx");
        Label1.Text += NavImage("video", "12", "aspx");
    }//end sub

    private string NavImage(string LinkName, string LinkNumber, string ext)
    {
        System.Text.StringBuilder ImageTag = new System.Text.StringBuilder();

        ImageTag.Append("<a target=_top href='../" + LinkName + "/index." + ext + "' ");
        ImageTag.Append("onMouseOut=\"ImageChange('image" + LinkNumber + "', 'off')\" ");
        ImageTag.Append("onMouseOver=\"ImageChange('image" + LinkNumber + "','on')\">");
        ImageTag.Append("<img name='image" + LinkNumber + "' ");
        ImageTag.Append("src='../images/" + LinkName);
        if (GraphicName == LinkName) { ImageTag.Append("2"); }
        ImageTag.Append(".jpg' alt='" + LinkName + "'' width=90 height=56 border=0></a>\n");

        return ImageTag.ToString();
    }// end function NavImage
</script>
<div class="hideFromPrinter" style="border-radius: 8px; border: 2px solid black; background-color: black">
    <asp:Label ID="Label1" runat="server"></asp:Label>
</div>
