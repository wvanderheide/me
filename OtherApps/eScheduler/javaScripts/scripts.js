<!--
function ffocus(){
document.form1.event_title.focus();
}

		
function fSubmit(){
//#############################################
// Make sure neither or both hr and min were selected and that if hr = 24 then min = 00

	hrselected = document.form1.elements[6].selectedIndex
	hrvalue = document.form1.elements[6].options[hrselected].value
	
	minselected = document.form1.elements[7].selectedIndex
	minvalue = document.form1.elements[7].options[minselected].value
	
  if (hrvalue != "99" && minvalue == "99"){
  			alert("Time Error! Please select both hour and minute.")
			document.form1.elements[7].focus();
			return false;
			}
	
  if (hrvalue == "99" && minvalue != "99"){
  			alert("Time Error! Please select both hour and minute.")
			document.form1.elements[6].focus();
			return false;
			}
	
  if (hrvalue == "24" && minvalue != "00"){
  			alert("Time Error! If hour is 24, minute must be 00.")
			document.form1.elements[7].focus();
			return false;
			}


//#############################################
//make sure a whole number value was entered for each date field
 for (i=0; i <= 5; i++){
		if (isNaN(document.form1.elements[i].value) | document.form1.elements[i].value.length==0 | document.form1.elements[i].value < 1 ){
			alert("Date Error!  Please enter a numeric date using the mm/dd/yyyy format.");
			document.form1.elements[i].focus();
			return false;
			}//end if
  }//end for
  
  

//#############################################
//make sure the date years are four digits 
  if (document.form1.elements[2].value.length<4){
			alert("Date Error!  Please enter a numeric date using the mm/dd/yyyy format.");
			document.form1.elements[2].focus();
			return false;
			}

  if (document.form1.elements[5].value.length<4){
			alert("Date Error!  Please enter a numeric date using the mm/dd/yyyy format.");
			document.form1.elements[5].focus();
			return false;
			}
			  
 
//#############################################
// make sure the month is a valid number 
yyyy = document.form1.elements[2].value/10*10
mm = document.form1.elements[0].value/10*10
dd = document.form1.elements[1].value/10*10

yyyye = document.form1.elements[5].value/10*10
mme = document.form1.elements[3].value/10*10
dde = document.form1.elements[4].value/10*10

if (mm<1 | mm>12){
	alert("Date Error!  Invalid month.\n\nPlease enter a value between 1 and 12");
	document.form1.elements[0].focus();
	return false;}
	

if (mme<1 | mme>12){
	alert("Date Error!  Invalid month.  \n\nPlease enter a value between 1 and 12");
	document.form1.elements[3].focus();
	return false;}
	
	

 
//#############################################
// make sure the days are valid for the month entered
 
 monarr=new Array(0,31,28,31,30,31,30,31,31,30,31,30,31)
 
	// Adjust for leap year
	if( ((document.form1.elements[2].value%4==0) & (document.form1.elements[2].value%100!=0) ) | (document.form1.elements[2].value%400==0) ){
		monarr[2]=29 }//end leap year if

if (dd > monarr[mm]){
	alert("Date Error!  The Start Month doesn't contain " + dd + " days.");
			document.form1.elements[1].focus();
			return false;}


monarr[2]=28
 
// Adjust for leap year
if( ((document.form1.elements[5].value%4==0) & (document.form1.elements[5].value%100!=0) ) | (document.form1.elements[5].value%400==0) ){
	monarr[2]=29
	 }//end leap year if


if (dde > monarr[mm]){
	alert("Date Error!  The End Month doesn't contain " + dde + " days.");
			document.form1.elements[4].focus();
			return false;}

			
			
			

//#############################################
// make sure endDate >= Start Date
theDate = yyyy + "/" + mm + "/" + dd
dateStart = new Date(theDate);

theDate = yyyye + "/" + mme + "/" + dde
dateEnd = new Date(theDate);

if (dateEnd < dateStart){
	alert("End Date is before Start Date!");
	return false;
	}




 
//#############################################
// make an event title has been entered			
 if (document.form1.elements[8].value.length < 2){
 	alert("Please enter an event title");
	document.form1.elements[8].focus();
	return false}
	
	

//#############################################
// make sure the event title does include "--continued" or the delimiter "|^" 		
 if (document.form1.elements[8].value.indexOf("--continued") > 0 || document.form1.elements[8].value.indexOf("|") > 0 ){
 	alert("An Event Title cannot include the phrase \"--continued\" nor the \"|\" character.");
	document.form1.elements[8].focus();
	return false}
	

//#############################################
// make sure the details are less than 255 chars 		
 if (document.form1.details.value.length  > 255 ){
 	alert("The description entered contains " + document.form1.details.value.length  + " characters.\n\nPlease limit the description to 255 characters.");
	document.form1.details.focus();
	return false}	
	
return true
}

function Pop(linkname, width, height)
{
x=screen.width -330
panel =window.open(linkname,"","left=" + x + ", top=10,width=" + width + ",height=" + height + ", resizable,scrollbars=yes");
}//end function

function fkeyStroke(year){	
	if (isNaN(year.value)){
		alert("Please enter a four digit numeric year")}
	else if (year.value.length == 4) {
		document.form1.submit();}
}//end function

function fCheckAll(){

for(var i =0;i <document.form2.elements.length-4; i++) { 	
	document.form2.elements[i].checked = true
}
}//end function



function fClearAll(){

for(var i =0;i <document.form2.elements.length-4; i++) { 	
	document.form2.elements[i].checked = false
}
}//end function


function fCheck(){
var ToReturn = false
for(var i =0;i <document.form2.elements.length-4; i++) { 	
	if (document.form2.elements[i].checked == true){
		ToReturn = true}
}
if (ToReturn != true){
		alert("Nothing was selected to be removed.\n\nPlease check the items you want to remove and then click remove.");}
		
return ToReturn
}//end function


-->