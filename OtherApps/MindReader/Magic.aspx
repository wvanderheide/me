<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.IO" %>

<script runat="server">

    sub Page_load(sender As Object, e As EventArgs)
		lblToolBar.text = ToolBar
		lblToolBar.visible = true
					
        If Not Page.IsPostBack Then
            lblRightCell.Text = lookup()
            lblRightCell.Visible = True
            OnOff()
        End If
    End Sub
    
    
    function lookup()
        lblSpacer1.visible = false
        Randomize ' Initialize random-number generator.
    
         dim j,count,e, i as Integer
         dim symbol,ReturnValue as String
		 dim strFontFace as String
		 dim strbgcolor,SecretValue as String
    
		
		 SecretValue = chr((89 * Rnd) + 33)	' Generate secret value
		
		 if  Int((100 * Rnd) + 1) mod 2 = 0 then 
		 	strFontFace = "WingDings"
		else
			strFontFace = "WebDings"
		end if
				 
         textbox1.text = SecretValue
    	htxtFontFace.text = strFontFace
		
         ReturnValue = vbcrlf
    	count = 0
         for j = 99 to 0 step -20
			 count = count + 1
               e = j - 19
    			if count mod 2 <> 0 then 
					strbgcolor = "eeeeee"
				else
					strbgcolor = "white"
				end if
               ReturnValue = ReturnValue & "<table align=left border=0 bgcolor='" & strbgcolor & "' cellpadding=10 cellspacing=0><tr><td>" & vbcrlf
    
               for i = j to e  step -1
    			  symbol = chr((89 * Rnd) + 33)
    
                  if i = 99 or i = 0 then 'Result will never be 99 or 0, so don't display the SecretValue for these
                     symbol = chr((89 * Rnd) + 33)
                  elseif i mod 9 = 0  then		 
                     symbol = SecretValue
                  end if
    					   
                  ReturnValue = ReturnValue & "<li><font color=Silver>" & i & ".</font>&nbsp;&nbsp;<span class=big><font face='" & strFontFace & "'><nobr>" &  symbol & "</nobr></font></span>" & vbcrlf
				next
    
               ReturnValue = ReturnValue & "</td></tr></table>"
         next
    
            return ReturnValue
      end function
    
    sub OnOff()	
        lblLeftCell.visible = true
        btnMindReader.visible = true
        btnMindReader.text = "Read My Mind"
        image1.visible = false
        textbox1.visible = false
		htxtFontFace.visible = false
		
        lblLeftCell.text =   ""
		lblLeftCell.text =lblLeftCell.text & "<p align=center class=big><b>Instructions</b></p>"
		lblLeftCell.text = lblLeftCell.text &" Choose any two-digit number, add its digits " & _
                    "together, and subtract the result from " & _
                    "the original number. <!-- <br><sup><font color=""Red"">*</font></sup>  -->" & _
                    "<br><br>When you have the final number look it up in " & _
                    "the chart and memorize the corresponding symbol. "
        lblLeftCell.text = lblLeftCell.text & "<br /><br />" & _
                    "Once the symbol is firmly in your mind " & _
                    "click the <i>" & btnMindReader.text & "</I> " & _
                    "button below, and it will show "  & _
                    "you the symbol you are thinking of. " & _
                    "<br /><br />"
    
          lblExample.text = "<font color='Red'><sup>*</sup>For example:</font> <b>23</b>.  2+3 " & _
                    "= 5, 23-5=18. Look-up 18 in the chart."
    
    end sub
    
    Sub btnMindReader_Click(sender As Object, e As EventArgs)
	    lblSpacer1.visible = true  
        lblLeftCell.text = ""
    
        btnMindReader.visible = false
        lblRightCell.text = "<ul><nobr>You are thinking of :</nobr><br>" & _
									"<span style='color: black;font-weight : 700;FONT-SIZE: 196px; FONT-FAMILY: " & _
									 htxtFontFace.text & ";'>" & textbox1.text & "</span></ul>"
									 
        lblExample.text = "Can't believe it?&nbsp;&nbsp;<a href=Magic.aspx>Click " & _
                            "here to try again!</a>"
    
    End Sub

	function ToolBar()
        Dim bldr As System.Text.StringBuilder = New System.Text.StringBuilder()
        
        bldr.Append("<table align=right bgcolor=#336699 cellpadding=2 cellspacing=0><tr><td>")
        bldr.Append("<a href=# onClick=""var panel; ")
        bldr.Append("panel=window.open('','','top=10, left=10, toolbar=no,width=570,height=150,scrollbars=yes,resizable=1');")
        bldr.Append("panel.document.write('<body bgcolor=39BBDD><font face=verdana><nobr><b>URL: ")
        bldr.Append("</b>http://")
        bldr.Append(Request.ServerVariables.Item("Server_Name"))
        bldr.Append(Request.ServerVariables.Item("URL"))
        bldr.Append("</nobr><br>")
        bldr.Append("<b>Released:</b> March 18, 2003<br>")
        bldr.Append("<b>Developed By</b>:</b> Walter VanderHeide<br><b>Contact:</b> vanman798@yahoo.com<br><b>Solution: </b>")
        bldr.Append("Contact me, and I will provide you with the solution!</font></body>')""><font color=white>About</font></a></td></tr></table>")
		
        Return bldr.ToString()
	end Function
</script>
<html>
<head>
	<title>Mind Reader</title>
	<style type="text/css">
		
		TD {
			FONT-SIZE: 14px; 
			COLOR: black; 
			FONT-FAMILY: arial}
			
		li{color:#bbbbbb}
			
	IGNORE_INPUT {BORDER-RIGHT: black 5px ridge;
			BORDER-TOP: black 1px ridge; 
			FONT-WEIGHT: 700; 
			FONT-SIZE: 11px; 
			BORDER-LEFT: black 1px ridge; 
			COLOR: #ffffff; 
			BORDER-BOTTOM: black 1px ridge; 
			FONT-FAMILY: verdana; 
			BACKGROUND-COLOR: #336699} 
	sup {
		FONT-SIZE: 16px; 
		COLOR: black; 
		FONT-FAMILY: arial; }
			
	.TD {
			FONT-SIZE: 12px; 
			COLOR: black; 
			FONT-FAMILY: arial}
	
	.big {
		FONT-SIZE: 19px; 
		COLOR: black; 
		FONT-FAMILY: arial; }
	.SuperBig {
		color: #336699;
		font-weight : 700;
		FONT-SIZE: 26px; 
		FONT-FAMILY: arial; 
		FILTER: DropShadow(Color=silver, OffX=2, OffY=2, Positive=1);
		width:100%;}
</style>
</head>
<body alink=white vlink=336699 link=336699>
     <asp:Label id="lblToolBar" runat="server"></asp:Label>
	<span class=SuperBig>The Mind Reader</span>
    <form runat="server">
	    <asp:TextBox id="TextBox1" runat="server"></asp:TextBox>
        <asp:TextBox id="hTxtfontFace" runat="server"></asp:TextBox>
		<table border=0 width='99%' align=center cellpadding=5 cellspacing=0 bordercolor='#336699'>
        <tr>
            <td valign="top" width="200">
				<p align=center><img src=ball.gif></p>
                <asp:Label id="lblSpacer1" runat="server">
                    <br />
                    <br />
                </asp:Label>
                <asp:Label class="TD" id="lblLeftCell" runat="server"></asp:Label>
                <center>
                  <asp:Button id="btnMindReader" onclick="btnMindReader_Click" runat="server" Text="Mind Reader"></asp:Button> <hr color=white>
                </center>
            </td>
            <td valign="middle" width="*">
                <asp:Image id="Image1" runat="server" Visible="False"></asp:Image>
                <asp:Label id="lblRightCell" runat="server" Width="36px"></asp:Label>
            </td>
        </tr>
	</table>
        <asp:Label class="TD" id="lblExample" runat="server"></asp:Label>
		<br><br>
		<span class="TD"><b>Note:</b>&nbsp;&nbsp;Mind reader requires the <i><b>WingDing </b></i>and <i><b>WebDing</b></i> fonts be installed on your computer. <br>If you see a <b><i>smiley face</i></b>, and a <i><b>magnifying glass</b></i> under this line then you have the necessary fonts installed (<i>if you see a J and an L, then you need to install the required fonts</i>).</span><br><font face="Wingdings" size="+6" color="Yellow"><b>J</b></font><font face='WebDings' color=darkgray size=+6>L</font>
    </form>
</body>
</html>
