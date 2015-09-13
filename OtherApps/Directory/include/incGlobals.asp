<% 

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
' fnOpenDatabase
'
' This function is used throughout the application to open 
' a connection to the database. Using this function allows the
' data source name to be changed in one place and not affect the
' rest of the code. 
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Function fnOpenDatabase()	    	
    if LCase(request.ServerVariables("server_name")) = "localhost" then
        MainPath = Server.MapPath("\me\OtherApps\Directory\directory.mdb")
    else
        MainPath = Server.MapPath("\vanman798\db\directory.mdb") 
    end if
    strConn = "Driver={Microsoft Access Driver (*.mdb)}; DBQ="
    strConn = strConn & MainPath
	
	Set dcnSystem = Server.CreateObject("ADODB.Connection")
	dcnSystem.open strConn
		
	Set fnOpenDatabase = dcnSystem	
End Function



'
' incGlobals.asp
'
' This file holds Constants used throughout this ASP application. 
' This file should be included at the top of each ASP page if necessary.
'

'Option Explicit

'
' ADO Constants
'
' CursorTypes
Const adOpenForwardOnly = 0
Const adOpenKeyset      = 1
Const adOpenDynamic     = 2
Const adOpenStatic      = 3

' LockTypes
Const adLockReadOnly    = 1
Const adLockPessimistic = 2
Const adLockOptimistic  = 3

' CommandTypeEnum Values
Const adCmdUnknown = 0
Const adCmdText = &H0001
Const adCmdTable = &H0002
Const adCmdStoredProc = &H0004


const adBoolean = 11
const adInteger = 3
const adSmallInt = 2
const adTinyInt = 16
const adVarChar = 200
const adParamInput = 1
const adParamInputOutput = 3
const adParamOutput = 2
const adParamReturnValue = 4

function GetIDCount(TableName)
	sqlstr = "sp_GetIDCount '" & TableName & "'"
	set CountSet = conn.Execute(sqlstr)
	if CountSet.EOF or CountSet.BOF then
		GetIDCount = 1
	else
		GetIDCount = CountSet(0)
	end if
	CountSet.Close
	set CountSet = nothing
end function


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
'This function checks &, < etc. and replace them to avoid 
'problems in insert these values into DB.
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
function CheckWord(CheckValue)
  CheckValue = replace(CheckValue, "&" , "&amp;")
  CheckValue = replace(CheckValue, "<", "&lt;")
  CheckValue = replace(CheckValue, ">", "&gt;")
  CheckValue = replace(CheckValue, "'", "''")
  CheckValue = replace(CheckValue, "%20", " ")
  CheckValue = trim(CheckValue)
  CheckWord=CheckValue
end function



'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
'fnOpenSnapshotRecordset (cnLConnection, strLTableName, strLFieldList, strLWhereClause)
'This function opens and returns the opened recordset intended for read operation only.
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Function fnOpenSnapshotRecordset (cnLConnection, strLTableName, strLFieldList, strLWhereClause)
	Dim sSQL			' As String
	Dim rsLRecordset	' As Recordset
	Set rsLRecordSet = Server.CreateObject("ADODB.Recordset")
	sSQL = "SELECT " & strLFieldList & " FROM " & strLTableName 
	sSQL = sSQL & strLWhereClause
	'response.write("fnsql=" & sSQL & "<br>")
	'wala
	rsLRecordset.Open sSQL, cnLConnection, adOpenStatic, adLockReadOnly
	Set fnOpenSnapshotRecordset = rsLRecordset
End function


'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' 
' subGetListBox(db_connection, sTblName, sKeyField, _
'               sDisplayField, sOrderKey, sVariableName, sDefaultString)
'
' This sub generates a list box if two fields are dispalyed.
'
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

sub subGetListBox(db_connection, sTblName, sKeyField, _
                  sDisplayField1, sDisplayField2, sOrderKey, sVariableName, sDefaultString)

dim rs
dim sFieldList
dim sWhereClause

if sDisplayField2 = "" then
  sFieldList = sKeyField & ", " & sDisplayField1
else  
  sFieldList = sKeyField & ", " & sDisplayField1 & ", " & sDisplayField2
end if

sWhereClause = " Order by " & sOrderKey & " "
         
Set rs = fnOpenSnapshotRecordset( db_connection, sTblName, sFieldList, sWhereClause)
      
  Response.Write "<select name='" & sVariableName & "' size='1'>" & vbnewline
  'Response.Write "<option value='" & sDefaultString & "'>" & sDefaultString & "</option>" & vbnewline 
  'Response.Write "<option value='0'>" & sDefaultString & "</option>" & vbnewline 
                      
  While Not rs.EOF
          
    Response.Write("<option " )
	
	if rs(sKeyField) = sDefaultString then	        'Select an entry if it was selected before.
        Response.Write ("selected ")	
	end if				                      
    Response.Write ("value='" & rs(sKeyField) & "'>")
	if sDisplayField2 = "" then
	  Response.Write( rs(sDisplayField1) & "</option>" )
	else
	  Response.Write( rs(sDisplayField1) & "&nbsp;&nbsp;" & rs(sDisplayField2) & "</option>" )
	end if
    
    Response.Write (VbNewLine)
    
    rs.MoveNext
            
  Wend
          
  rs.close
  set rs = nothing
  Response.Write "</select>"       
end sub


'*****************************************************************************
' fnGetWritableRecordset(cn, sSql)
'
'
'
'*****************************************************************************

function fnGetWritableRecordset(cn, sSql)

  dim rs

  Set rs = Server.CreateObject("ADODB.Recordset")
  rs.open sSql, cn, adOpenKeyset, adLockOptimistic

  set fnGetWritableRecordset = rs

end function



'*****************************************************************************
' 
'function fnCheckedYorN(blnIn)
'
'*****************************************************************************
function fnCheckedYorN(blnIn)
  dim sOut
  if cbool(blnIn) then
    sOut = "checked"
  end if
  fnCheckedYorN = sOut
end function


'*****************************************************************************
' 
'function fnCheckedFromYorN(sIn)
'
'*****************************************************************************
function fnCheckedFromYorN(sIn)
  dim sOut
  sOut = ""
  if sIn = "Y" then
    sOut = "checked"
  end if
  fnCheckedFromYorN = sOut
end function


'*****************************************************************************
' 
'function fnGetOutputStr(sIn, sCondition, sOutput1, sOutput2)
'
'*****************************************************************************
function fnGetOutputStr(sIn, sCondition, sOutput1, sOutput2)
  dim sOut
  if sIn = sCondition then
    sOut = sOutput1
  else
    sOut = sOutput2	
  end if
  fnGetOutputStr = sOut
end function

%>