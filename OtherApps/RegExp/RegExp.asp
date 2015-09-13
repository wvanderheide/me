<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Regular Expressions</title>
	<basefont size="1" face="Verdana">
	<style>		
	td{
		color: black; 
		font-family : helvetica, verdana, arial ;
		font-size : 11px ;
		}
		a.left{ 
		text-decoration : none;
		color: #c6d5dd; 
		font-family : helvetica, verdana, arial ;
		font-size : 11px ;
		line-height : 11px;
		font-weight: 600;  
		background-color : black;
		width : 100%;}
		
a.left:link { 
text-decoration : none;
color: #c6d5dd; 
font-family : helvetica, verdana, arial ;
font-size : 11px ;
line-height : 11px;
font-weight: 600;  
background-color : black;
width : 100%;}


a.left:active { 
text-decoration : none;
color: #c6d5dd; 
font-family : helvetica, verdana, arial ;
font-size : 11px ;
line-height : 11px;
font-weight: 600;  
background-color : black;
width : 100%;
}


/*
The problem with having a "visited" style is that then the hover doesn't work after a link is visited. -- IF VISITED IS DEFINED AFTER HOVER, THE SOLUTION IS TO DEFINE HOVER LAST LIKE I DID HERE */
a.left:visited {
text-decoration : none;
color: #c6d5dd; 
font-family : helvetica, verdana, arial ;
font-size : 11px ;
font-weight: 600;  
background-color : black;
width : 100%;
}

a.left:hover {
text-decoration : none ; 
color: #315b83;
font-family : helvetica, verdana, arial ;
font-size : 11px ;
font-weight: 600;  
background-color : #c6d5dd;
width : 100%;
}
	</style>
</head>

<body leftmargin="0" topmargin="0" marginwidth="1" marginheight="0" bgcolor=white>
<table cellpadding=0 cellspacing=0 width=100% bgcolor=black>
	<tr>
		<td width="95%">&nbsp;</td>
		<td width=1%><a href=RegExp_Character.htm target=_blank class=left><nobr>Meta Characters</nobr></a></td>
		
		<td width="1%"><font color="White">&nbsp;|&nbsp;</font></td>
		<td width=1%><a href='http://www.regexlib.com/' target=_blank class=left><nobr>Regular Expressions Library</nobr></a></td>
		<td width="1%"><font color="White">&nbsp;|&nbsp;</font></td>
		<td width=1%><a href='RegExp.doc' target=_blank class=left><nobr>Simple Examples</nobr></a></td>
	</tr>
</table>
<h1>RegExp Object</h1>
<table border=0 cellspacing=10><tr>
<td valign=top>
	<table bgcolor=Maroon>
		<tr><td>
		<form>
			<font color="White">Pattern:</font><br><input type="text" name="Pattern" size="27" value="<%= trim(request.querystring("Pattern")) %>">
			<br>
			<font color="White">String:	</font><br><textarea rows=3 name="String"><%= trim(request.querystring("String")) %></textarea>
			<br>
			<font color="White">Replacement:</font><br><input type="text" size="27" name="Replace" value="<%= trim(request.querystring("Replace")) %>">
			<br>
			<font color="White">Ignore Case:	</font><input type="checkbox" name="case" value="true" <% if request("case") then %>checked<% end if %>>
			<center>
			<input type="submit" value="RUN!"><input type="button" value="Clear" onClick="location='<%= Request.ServerVariables("SCRIPT_NAME") %>'"
			</center>
		</td></form></tr>
	</table>	
<% 
if trim(request.querystring("Pattern")) <> "" and trim(request.querystring("String")) <> "" then
	response.write("<hr>")
	response.write("Pattern: " & Server.HtmlEncode(trim(request.querystring("Pattern"))) & "<br>")
	response.write("String: " & Server.HtmlEncode(trim(request.querystring("String"))) & "<hr>")
	response.write RegExpTest(trim(request.querystring("Pattern")), trim(request.querystring("String")),request("case"),trim(request.querystring("Replace")))
	%>
	<br><br>
	<b>Notes:</b>
	<ul>
		<li>The first character in the "string" is position ZERO.
		<li>This function trims (removes) both leading & trailing white space from both the pattern and the string.
	</ul>
	<%
end if
 %>
</td>
<td valign=top>
		<table cellpadding=0 cellspacing=0 border=0 bordercolor=silver>  
			<tr>
			
			    <td>
			Function RegExpTest(patrn, strng, blncase,strReplace) <br>
			<ul>
			Dim regEx, Match, Matches ' Create variable. <br>
			<font color="Maroon"><b>Set regEx = New RegExp ' Create a regular expression. </b></font><br>
			regEx.Pattern = patrn ' Set pattern. <br>
			<br>
			if blncase then <br>
			regEx.IgnoreCase = True ' Set case insensitivity. <br>
			else <br>
			regEx.IgnoreCase = false <br>
			end if <br>
			regEx.Global = true ' Sets or returns a Boolean value that indicates if a pattern should match all occurrences in an entire search string or just the first one. True = all : False = first <br>
			<br>
			Set Matches = regEx.Execute(strng) ' Execute search. <br>
			For Each Match in Matches ' Iterate Matches collection. <br>
			RetStr = RetStr & "Match found at position " <br>
			RetStr = RetStr & Match.FirstIndex & ". Match Value is '" <br>
			RetStr = RetStr & Match.Value & "' with a length of " <br>
			RetStr = RetStr & Match.length & "<br>" & vbCRLF <br>
			Next <br>
			if RetStr = "" then <br>
			RetStr = "No match found!" <br>
			elseif strReplace <> "" then <br>
			RetStr = RetStr & "<%= Server.HtmlEncode("<hr><b>") %>Matches Replaced with " & strReplace & "<%= Server.HtmlEncode("</b><br>") %>" & regEx.Replace(strng,strReplace) <br>
			end if <br>
			RegExpTest = RetStr <br>
			</ul>
			End Function
			    </td>
			  </tr>
			</table> 
</td>
</tr></table>
<hr>
 <table bgcolor=eeeeee align=left  width=200 border=1 bordercolor=black>
 	<tr>
		<td>RegExp Object Properties 
			<hr>
			<li><b>Global: </b>Sets or returns a Boolean value that indicates if a pattern should match all occurrences in an entire search string or just the first one. <i>True = all : False = first</i> 
			<li><b>IgnoreCase: </b> Sets or returns a Boolean value that indicates if a pattern search is case-sensitive or not. 
			<li><b>Pattern: </b> Sets or returns the regular expression pattern being searched for. 
		</td>
	</tr>
 </table>
 
 <table bgcolor=white align=left>
 	<tr>
		<td>
			&nbsp;&nbsp;
		</td>
	</tr>
 </table>
 <table bgcolor=eeeeee align=left width=200 border=1 bordercolor=black border=1 bordercolor=black>
 	<tr>
		<td>RegExp Object Methods
			<hr>
			<li><b>Execute: </b>Executes a regular expression search against a specified string.<i>The Execute method returns a Matches collection containing an Match object for each match found in string. Execute returns an empty Matches collection if no match is found. <b>Set Matches = regEx.Execute(strng)	</b></i>
			<li><b>Replace: </b>Replaces text found in a regular expression search
			<li><b>Test: </b>Executes a regular expression search against a specified string and returns a Boolean value that indicates if a pattern match was found.

		</td>
	</tr>
 </table>
 
 <table bgcolor=white align=left>
 	<tr>
		<td>
			&nbsp;&nbsp;
		</td>
	</tr>
 </table>
 <table bgcolor=eeeeee align=left width=200 border=1 bordercolor=black>
 	<tr>
		<td>Match Object<hr>
		Provides access to the read-only properties of a regular expression match
		<hr>
		Match Object Properties   
			<li><b>FirstIndex:</b> Returns the position in a search string where a match occurs.
			<li><b>Length:</b> Returns the length of a match found in a search string.
			<li><b>Value:</b> Returns the value or text of a match found in a search string
		</td>
	</tr>
 </table>
</body>
</html>

<% 
Function RegExpTest(patrn, strng, blncase,strReplace)
  Dim regEx, Match, Matches		' Create variable.
  Set regEx = New RegExp			' Create a regular expression.
  regEx.Pattern = patrn			' Set pattern.
  
  if blncase then
    regEx.IgnoreCase = True			' Set case insensitivity.
  else
    regEx.IgnoreCase = false
  end if
  regEx.Global = true			' Sets or returns a Boolean value that indicates if a pattern should match all occurrences in an entire search string or just the first one. True = all : False = first

  Set Matches = regEx.Execute(strng)	' Execute search.
  For Each Match in Matches		' Iterate Matches collection.
    RetStr = RetStr & "Match found at position "
    RetStr = RetStr & Match.FirstIndex & ". Match Value is '"
    RetStr = RetStr & Server.HtmlEncode(Match.Value) & "' with a length of  " 
    RetStr = RetStr & Match.length & "<br>" & vbCRLF
  Next
  if RetStr = "" then 
  	RetStr = "No match found!"
   elseif strReplace <> "" then
   	RetStr = RetStr & "<hr><b>Matches Replaced with " & Server.HtmlEncode(strReplace) & "</b><br>" & regEx.Replace(strng,strReplace)
   end if
  RegExpTest = RetStr
End Function

sub Menu(strTag)
%>
	<table cellpadding=2 cellspacing=0 border=0 align=right valign=top>
		<tr>
			<td  valign=top><%= strTag %></td>
		</tr>
	</table>
<%
end sub
 %>
