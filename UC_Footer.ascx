<%@ Control Language="c#" %>

<script language="C#" runat="server">
		public String P_LastModified
		{
			get {  return lblLastModified.Text; }
			set {  lblLastModified.Text = value; }
		}
</script>
<div align="right"><a href="#top">Top</a></div>
<div class="hideFromPrinter">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <hr>
    <div>
        <b><small>©Graphic design and programming by Walter VanderHeide®, see <a href="../resume/index.aspx">
			    resume</a> for contact details.<br>
		    Last modified: <asp:Label ID="lblLastModified" Runat="server"></asp:Label></small></b></div>
</div>