dim strDBFileSpec
dim conn
dim TrackError

function fnOpenDataBase(strDBFileSpec)
	if inStr(LCase(strDBFileSpec),".mdb") then
		set SysConn = CreateObject("ADODB.Connection")
		
		'Access DB
			strConn = "Driver={Microsoft Access Driver (*.mdb)}; DBQ="			
			strConn = strConn  & strDBFileSpec
			
		SysConn.Open strConn
		set fnOpenDataBase = SysConn
	else
		alert(strDBFileSpec + " is not an access DB!")
		set fnOpenDataBase = Nothing
	end if
end function

sub ProcessData()	
		set obj = document.form1
		strDBFileSpec = obj.DBName.value
		'alert("ProcessDAta has filepsec as : " + obj.DBName.value)
		
		set conn = fnOpenDataBase(strDBFileSpec)
		TrackError = false
		'Get Names of all user tables in the Access db
		call OpenMSysObejcts()
		'alert("TrackError = " & TrackError)
		if TrackError = true then
			document.write("Need This to fake out the browser!")
			location.replace("test1.html?Error=True")
		end if
end sub

	


	function GetQS()
			'url = UnEscape(location.href)
			' .search brings back just the QS, however the UnEscape seems not to UnEscape the "+" in the QS, is November 6 note below
			url = UnEscape(location.search)
			'document.write("<hr>url : " + url + "<hr>")
			document.writeln("<a href=test1.html>Select another Access DataBase</a><a name=Top></a><br><br>")
			if inStr(url,"?TableName") > 0 then
				url = Replace(url,"&submitName=Submit","")
				x = Len(url) - instr(url,"?")
				
				QS = Right(url,x)
				QS = Replace(QS,"DBFileSpec=", "TableNames=")
				QS = replace(QS,"&TableNames=",",")
				QS = replace(QS,"TableNames=",",")
				QS = Right(QS,Len(QS)-1)
				' November 6, 2002 I noticed that DBFileSpec of folder names containing blanks have "+" instead of blanks 
				' hence this replace
				QS = Replace(QS,"+"," ")
				if instr(QS,",") then
					Dim A
					A = Split(QS,",")
					DataBase = UnEscape(A(Ubound(A)))
					set conn = fnOpenDataBase(DataBase)
					document.writeln("<font face='Arial' size='+2' color='Maroon'>DataBase  -" & DataBase & "</font><br><br>")
					temp = "Menu : | "
					for j = LBound(A) to UBound(A)-1
						temp = temp & "<a href='#" & Replace(A(j),"+"," ") & "'>" & Replace(A(j),"+"," ") & "</a> | "
					next
					
					document.write(temp & "<br>")
						
					for i = LBound(A) to UBound(A)-1
						TableProperties(Replace(A(i),"+", " "))
					next
				end if
				
			else
				document.writeln("Error: At least one table must be selected!")
				document.write("<p><a href = 'javascript:history.go(-2)'>Back<a>")
			end if			
	end Function	

	function fType(x)
		Select Case x
				Case 17 x= "TinyInt"
				Case 11 x = "boolean"
			   Case 2 x = "SmallInt"
	           Case 3    x = "Integer"
	           Case 200  x = "Text"
	           Case 201 x = "Memo"
	           Case 202 x = "Text"
			   Case 135 x = "Date/Time"
	           Case Else     x = x
	      End Select
	fType = x
	end function
	
	Function TableProperties(x)
		x = UnEscape(x)
		document.write("<p><a name='" & x & "'></a>")
		document.writeln("<font face='Arial' size='+1' color='Purple'><b>" & x & "</b></font><br>")
			
		qry = "Select * from [" & x & "]"
		set rs = conn.execute(qry)
		
		document.writeln("<table border=1>")
		document.writeln("<tr><th>Field</th><th>Type</th><th>Size</th></tr>")
		
		Dim item
		set item = Nothing
		
		for each item in rs.fields
			document.writeln("<tr>")
			thetype = fType(item.Type)
			document.writeln("<td>" & item.name & "</td><td>" & thetype & "</td><td>"  & item.DefinedSize & "</td>")
			document.writeln("</tr>")
		next
		document.writeln("</table><center><a href=#Top>Top</a></center></p>")
end Function
	
sub OpenMSysObejcts()		
on error resume next
		sql = "SELECT name FROM msysobjects WHERE type=1 and name not like 'msys%' ORDER By Name"
		
		if Not conn is Nothing then
			set NameRS = conn.execute(sql)
			
			if Err.Number = 0 then 			
				document.writeln("<a href=test1.html>Select another Access DataBase</a><br><br>")
				document.writeln("<form name='form1' method=get action='test2.html'>")
				document.write("<font face='Arial' color='Maroon' size='+2'>")
				document.write(strDBFileSpec) 
				document.writeln("</font><br><br>")
				document.writeln("<font face='Arial' color='Black'>Pick the table(s) you wish to see the fields of</font><br>")
				document.write("<br><font face='Arial' color='Black'><b>Table Names</b></font><br>")
				document.writeln("<select name='TableNames' size=5 multiple>")
				While not NameRS.eof
					document.writeln("<option>" + NameRS(0))
					NameRs.movenext
				Wend
				document.writeln("</select>")
				document.write("<br><font face='Arial' size='-2' color='Black'>(Use the Cntrl Key to select multiple items)</font><br>")
				document.writeln("<br><input type='submit' name='submitName' value='Submit'>")
				document.write("<input type=hidden name='DBFileSpec' value='")
				document.write( strDBFileSpec + "'>")
				document.writeln("</form>")
				NameRs.close
				set NameRs = Nothing
				conn.close
				set conn = Nothing
			else
				alert("Whoops! You need to set read permissions on the MSysObjects Table of your Access DataBase." & vbcrLf & vbcrLf & "See the instructions at the bottom of the page.")
				Err.Clear    ' Clear the error.
				TrackError = True
			end if
		else
			location.replace("test1.html?")
		end if	
end sub