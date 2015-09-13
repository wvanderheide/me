<%@ Control Language="c#" %>
<script language="C#" runat="server">

		private String scroll = "auto";
		public String P_MainAreaScrolls
		{
			get {  return scroll; }
			set {  scroll = value; }
		}
		

		public Boolean P_Tab1Visible
		{
			get {  return td1.Visible; }
			set {  td1.Visible = value; }
		}
		
		public Boolean P_Tab2Visible
		{
			get {  return td2.Visible; }
			set {  td2.Visible = value; }
		}
		
		
		public Boolean P_Tab3Visible
		{
			get {  return td3.Visible; }
			set {  td3.Visible = value; }
		}

		
		public Boolean P_Tab4Visible
		{
			get {  return td4.Visible; }
			set {  td4.Visible = value; }
		}

		
		public Boolean P_Tab5Visible
		{
			get {  return td5.Visible; }
			set {  td5.Visible = value; }
		}

		
		public Boolean P_Tab6Visible
		{
			get {  return td6.Visible; }
			set {  td6.Visible = value; }
		}

		public String P_Tab1Name
		{
			get {  return tdTab1Name.InnerText; }
			set {  tdTab1Name.InnerText = value; }
		}
		
		public String P_Tab2Name
		{
			get {  return tdTab2Name.InnerText; }
			set {  tdTab2Name.InnerText = value; }
		}
		
		public String P_Tab3Name
		{
			get {  return tdTab3Name.InnerText; }
			set {  tdTab3Name.InnerText = value; }
		}

		public String P_Tab4Name
		{
			get {  return tdTab4Name.InnerText; }
			set {  tdTab4Name.InnerText = value; }
		}
		
		public String P_Tab5Name
		{
			get {  return tdTab5Name.InnerText; }
			set {  tdTab5Name.InnerText = value; }
		}

		public String P_Tab6Name
		{
			get {  return tdTab6Name.InnerText; }
			set {  tdTab6Name.InnerText = value; }
		}

		public String P_FiveTabSelected
		{
			get {  return ltabselected.Text.ToString(); }
			set {  ltabselected.Text = value; }
		}
		
		public String P_FiveTabsHeight
		{
			get {  return lblFiveTabsHeight.Text.ToString(); }
			set {  lblFiveTabsHeight.Text = value; }
		}
		public String P_Tab1Text
		{
			get {  return lbltab1.Text.ToString(); }
			set {  lbltab1.Text = value; }
		}
		public String P_Tab2Text
		{
			get {  return lbltab2.Text.ToString(); }
			set {  lbltab2.Text = value; }
		}
		public String P_Tab3Text
		 {
			 get {  return lbltab3.Text.ToString(); }
			 set {  lbltab3.Text = value; }
		 }
		public String P_Tab4Text
		{
			get {  return lbltab4.Text.ToString(); }
			set {  lbltab4.Text = value; }
		}

		public String P_Tab5Text
		{
			get {  return lbltab5.Text.ToString(); }
			set {  lbltab5.Text = value; }
		}

		
		public String P_Tab6Text
		{
			get {  return lbltab6.Text.ToString(); }
			set {  lbltab6.Text = value; }
		}


		private void Page_Load(object sender, System.EventArgs e)
		{

			System.Web.UI.WebControls.Label lbl;
			System.Web.UI.HtmlControls.HtmlTableCell td;

			// Tab Selected
			if (ltabselected.Text == "")
			{
				ltabselected.Text = "1";
				
			}

			
			//An invisible Tab can't be the "selected tab"			
			td = (HtmlTableCell)FindControl("td" + ltabselected.Text);
			
			if (td.Visible){ltabselected.Visible = false;}
			
			else {Response.Write("<font color=red>An invisible Tab can't be the \"selected tab\"</font>");}

			//height
			if (lblFiveTabsHeight.Text == "")
			{
				lblFiveTabsHeight.Text = "100%";
			}

			//Make tabs scrollable
			for (int i=1; i < 7; i++)
			{
				td = (HtmlTableCell)FindControl("td" + i);
				lbl = (Label)FindControl("lbltab" + i);
				if (td.Visible) 
				{
					lbl.Text = MakeTextScroll(lbl.Text.ToString(), i);
				}
				else {lbl.Text = "";
				}
			}
			
		}
		private string MakeTextScroll(string s, int TabNumber)
		{

			s = "<div id='tab365" + TabNumber + "' Style=\"PADDING-RIGHT:0px; PADDING-LEFT:0px; SCROLLBAR-FACE-COLOR:silver; FONT-WEIGHT:normal; FONT-SIZE:11px; PADDING-BOTTOM:0px; SCROLLBAR-HIGHLIGHT-COLOR:#ffffff; OVERFLOW:" + scroll + "; WIDTH:100%; SCROLLBAR-SHADOW-COLOR:#333333; COLOR:#232323; SCROLLBAR-3DLIGHT-COLOR:#ffffff; SCROLLBAR-ARROW-COLOR:#ffffff; PADDING-TOP:0px; SCROLLBAR-TRACK-COLOR:#ffffff; FONT-FAMILY:Verdana,Tahoma; SCROLLBAR-DARKSHADOW-COLOR:#000000; POSITION:relative; HEIGHT:" + lblFiveTabsHeight.Text + "\"><font color=white>" + s + "</font></div>";
			return s;
		}
</script>


<script language="JavaScript">
function MouseOverTab365(obj){
if (document.getElementById('SelectedTab365').value != obj.id){
obj.style.cursor='pointer';
obj.style.textDecoration='underline';
}
}//end func

function MouseOutTab365(obj){
if (document.getElementById('SelectedTab365').value != obj.id){
document.getElementById(obj.id).style.textDecoration = 'none';}
obj.style.cursor='auto';
}//end func

function TabLinkClicked365(tabnum){
  tablinkname = 'tabLinkTable365' + tabnum
  document.getElementById('SelectedTab365').value = tablinkname
  // hide all tabs
  for (var i = 1; i <= 6; i++) {
  strtab = 'tab365' + i;
  if(document.getElementById(strtab) != null){document.getElementById(strtab).style.display='none';}
  }// end for
  // show passed in tab number
  tabpagename = 'tab365' + tabnum;
  document.getElementById(tabpagename).style.display='';
  
  //set styles on unselected items
  for (var i = 1; i <= 6; i++) {
   strtab = 'tab365' + i
   strtabLinkTable = 'tabLinkTable365' + i
  if(document.getElementById(strtab) != null){
  document.getElementById(strtabLinkTable).style.textDecoration='none'
  document.getElementById(strtabLinkTable).style.backgroundColor = 'Gray';
  document.getElementById(strtabLinkTable).style.fontWeight = 'lighter';
  document.getElementById(strtabLinkTable).style.color = 'Black';
  document.getElementById(strtabLinkTable).style.fontFamily='Tahoma';
  document.getElementById(strtabLinkTable).style.fontSize = '12px';
  }// end if
  }// end for
  //set styles on selected items
  document.getElementById(tablinkname).style.color='Gray';
  document.getElementById(tablinkname).style.backgroundColor = 'silver';
  document.getElementById(tablinkname).style.fontWeight = 'bolder';
} //end func
</script>
<asp:Label id="lblFiveTabsHeight" runat="server" Visible="False"></asp:Label>
<INPUT id="SelectedTab365" type="hidden" value="tabLinkTable3651"></SPAN>
<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" bgColor="#232323" border="0">
	<TR>
		<TD>
			<TABLE cellSpacing="0" cellPadding="0" border="0">
				<TR>
					<td id="td1" runat="server">
						<TABLE id="tabLinkTable3651" onmouseover="MouseOverTab365(this)" onclick="javascript:TabLinkClicked365('1');"
							onmouseout="MouseOutTab365(this)" cellSpacing="0" cellPadding="0" border="0">
							<TR>
								<TD vAlign="top"><IMG src="../images/ALPAFiveTabsLeftCorner.gif" border="0"></TD>
								<td noWrap runat="server" id="tdTab1Name" style="COLOR:black"></td>
								<TD vAlign="top"><IMG src="../images/ALPAFiveTabsRightCorner.gif" border="0"></TD>
								<TD bgColor="#232323"><div style="width: 2px; height;4px"></TD>
							</TR>
						</TABLE>
					</td>
					<td id="td2" runat="server">
						<TABLE id="tabLinkTable3652" onmouseover="MouseOverTab365(this)" onclick="javascript:TabLinkClicked365('2');"
							onmouseout="MouseOutTab365(this)" cellSpacing="0" cellPadding="0" border="0">
							<TR>
								<TD vAlign="top"><IMG src="../images/ALPAFiveTabsLeftCorner.gif" border="0"></TD>
								<td noWrap runat="server" id="tdTab2Name" style="COLOR:black"></td>
								<TD vAlign="top"><IMG src="../images/ALPAFiveTabsRightCorner.gif" border="0"></TD>
								<TD bgColor="#232323"><div style="width: 2px; height;4px"></TD>
							</TR>
						</TABLE>
					</td>
					<td id="td3" runat="server">
						<TABLE id="tabLinkTable3653" onmouseover="MouseOverTab365(this)" onclick="javascript:TabLinkClicked365('3');"
							onmouseout="MouseOutTab365(this)" cellSpacing="0" cellPadding="0" border="0">
							<TR>
								<TD vAlign="top"><IMG src="../images/ALPAFiveTabsLeftCorner.gif" border="0"></TD>
								<td noWrap runat="server" id="tdTab3Name" style="COLOR:black"></td>
								<TD vAlign="top"><IMG src="../images/ALPAFiveTabsRightCorner.gif" border="0"></TD>
								<TD bgColor="#232323"><div style="width: 2px; height;4px"></TD>
							</TR>
						</TABLE>
					</td>
					<td id="td4" runat="server">
						<TABLE id="tabLinkTable3654" onmouseover="MouseOverTab365(this)" onclick="javascript:TabLinkClicked365('4');"
							onmouseout="MouseOutTab365(this)" cellSpacing="0" cellPadding="0" border="0">
							<TR>
								<TD vAlign="top"><IMG src="../images/ALPAFiveTabsLeftCorner.gif" border="0"></TD>
								<td noWrap runat="server" id="tdTab4Name" style="COLOR:black"></td>
								<TD vAlign="top"><IMG src="../images/ALPAFiveTabsRightCorner.gif" border="0"></TD>
								<TD bgColor="#232323"><div style="width: 2px; height;4px"></TD>
							</TR>
						</TABLE>
					</td>
					<td id="td5" runat="server">
						<TABLE id="tabLinkTable3655" onmouseover="MouseOverTab365(this)" onclick="javascript:TabLinkClicked365('5');"
							onmouseout="MouseOutTab365(this)" cellSpacing="0" cellPadding="0" border="0">
							<TR>
								<TD vAlign="top"><IMG src="../images/ALPAFiveTabsLeftCorner.gif" border="0"></TD>
								<td noWrap runat="server" id="tdTab5Name" style="COLOR:black"></td>
								<TD vAlign="top"><IMG src="../images/ALPAFiveTabsRightCorner.gif" border="0"></TD>
								<TD bgColor="#232323"><div style="width: 2px; height;4px"></TD>
							</TR>
						</TABLE>
					</td>
					<td id="td6" runat="server">
						<TABLE id="tabLinkTable3656" onmouseover="MouseOverTab365(this)" onclick="javascript:TabLinkClicked365('6');"
							onmouseout="MouseOutTab365(this)" cellSpacing="0" cellPadding="0" border="0">
							<TR>
								<TD vAlign="top"><IMG src="../images/ALPAFiveTabsLeftCorner.gif" border="0"></TD>
								<td noWrap runat="server" id="tdTab6Name" style="COLOR:black"></td>
								<TD vAlign="top"><IMG src="../images/ALPAFiveTabsRightCorner.gif" border="0"></TD>
								<TD bgColor="#232323"><div style="width: 2px; height;4px"></TD>
							</TR>
						</TABLE>
					</td>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>
<TABLE style="BORDER-RIGHT: silver 2px solid; BORDER-TOP: silver 2px solid; BORDER-LEFT: silver 2px solid; BORDER-BOTTOM: silver 2px solid"
	cellSpacing="0" cellPadding="4" width="100%" bgColor="#232323" border="0">
	<tr>
		<td>
			<asp:label id="lbltab1" Runat="server"></asp:label>
			<asp:label id="lbltab2" Runat="server"></asp:label>
			<asp:label id="lbltab3" Runat="server"></asp:label>
			<asp:label id="lbltab4" Runat="server"></asp:label>
			<asp:label id="lbltab5" Runat="server"></asp:label>
			<asp:label id="lbltab6" Runat="server"></asp:label>
		</td>
	</tr>
</TABLE>
<asp:literal id="ltabselected" Runat="server"></asp:literal>
<script language="JavaScript">TabLinkClicked365('1')</script>
