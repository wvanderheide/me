/**************************************************************
*	Author:  Walter VanderHeide
*	E-mail:  vanman798@yahoo.com
*	URL:	 www.geocities.com/vanderheide_w
*	
*	Purpose: The DateStuff function below caluclated the 
*		 difference between to dates, and returns the
*		 results in Years, Months, and days
*	
*		 The other two functions clear the "value" of the 
*		 input fields when focus is given the them
*
***************************************************************/

function clear1(field)
{
document.Form1.txtDate1.value="";
document.Form1.txtDiff.value="";
document.Form1.txtDate1.focus();
}	



function clear2(field)
{
document.Form1.txtDate2.value="";
document.Form1.txtDiff.value="";
document.Form1.txtDate2.focus();
}

function DateStuff()
{
	var x = document.Form1.txtDate1.value
	var y = document.Form1.txtDate2.value


	Date1 = new Date(x);
	Date2 = new Date(y); 



// verify two digit month and days were entered along with a four digit year and "/" seperators
  if (x.length != 10 | x.indexOf("/") == -1){ 
		alert("Error! \n \n" + "Please use a \"dd/mm/yyyy\" format")
		document.Form1.txtDate1.focus();
		return false 
			}

if (y.length != 10) { 
		alert("Error! \n \n" + "Please use a \"dd/mm/yyyy\" format")
		document.Form1.txtDate2.focus();
		return false 
			}

if (Date1.getFullYear() > Date2.getFullYear()) {
		alert("Error! \n \n" + "The end date must be greater than the start date")
		document.Form1.txtDate1.focus();
		return false 
	}
else if ( (Date1.getFullYear() == Date2.getFullYear() ) & (Date1.getMonth() > Date2.getMonth()) ) {
		alert("Error! \n \n" + "The end date must be greater than the start date")
		document.Form1.txtDate1.focus();
		return false 
	}

else if ( (Date1.getFullYear() == Date2.getFullYear() ) & (Date1.getMonth() == Date2.getMonth() ) & (Date1.getDate() > Date2.getDate() )) {
		alert("Error! \n \n" + "The end date must be greater than the start date")
		document.Form1.txtDate1.focus();
		return false 
	}

//Set up an Array containing the days in each month	
var monarr=new Array(0,31,28,31,30,31,30,31,31,30,31,30,31)

// Adjust for leap year
x = Date1.getFullYear()
if( ((x%4==0) & (x%100!=0) ) | (x%400==0) ){
	monarr[2]=29 }
		

// assign the dates, months, and years of each Date object to variables to be used in difference calculations
d1 = Date1.getDate()
m1 = Date1.getMonth() + 1
y1 = Date1.getFullYear()


d2 = Date2.getDate()
m2 = Date2.getMonth() + 1
y2 = Date2.getFullYear()


if ( (m2>m1) && (d2 < d1) ) {
	GTDay = d2 + monarr[m1] - d1
	GTMonth = m2-m1-1
	GTYear = y2 - y1 }
	
else if ( (m2>=m1) && (d2 >= d1) ){
	GTDay = d2 - d1
	GTMonth = m2-m1
	GTYear = y2 - y1 }
	
else if ( (m2<m1) && (d2 >= d1) ){
	GTDay = d2 - d1
	GTMonth = 12 - m1 + m2
	GTYear = y2 - y1 -1 }
	
else if ( (m2<=m1) && (d2 < d1) ){
	GTDay = d2 + monarr[m1] - d1
	GTMonth = 12 - m1 + m2 -1
	GTYear = y2 - y1 -1 }

else {
		alert("Error in DATE");
		GTDay = 0
		GTMonth = 0
		GTYear = 0
		document.Form1.txtDate1.focus();
		return false;
	}
				
TimeDiff= GTYear +' Years, ' + GTMonth +' Months, '+GTDay+' Days '

// Send the timeDiff to the form, so we view it
document.Form1.txtDiff.value = TimeDiff


}//end of function