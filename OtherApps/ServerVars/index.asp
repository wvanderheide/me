<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Server Variables</title>
</head>
<body bgcolor=black>

<h1 style="color: white">Server Variables</h1>
<TABLE style="border: dotted 2px silver">
      

      <% 
      count = 0
      For Each name In Request.ServerVariables 
		count = count + 1
		if count mod 2 <> 0 then
			bgcolor = "eeeeee"
		else
			bgcolor = "white"
		end if
      %>
      <TR bgcolor="<%= bgcolor %>">
           <TD valign="top">
                <b><%= name %></b>
           </TD>
           <TD valign="top">
                <%= Request.ServerVariables(name) %>
           </TD>
      </TR>
      <% 
      Next       
      
      %>
</TABLE>


</body>
</html>
