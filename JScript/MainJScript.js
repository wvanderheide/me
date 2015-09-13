<script language="JavaScript1.2">
<!--
 // July 7, 2011 I don't think this MainJScript.js file is used anymore????????????????????????????????????????
// ChangeImages is used by the "my work" pages
function changeImages(name, onoff) 
{
	  document[name].src = eval(onoff + ".src");
} //end f

	
// Popup is used by the "my work" pages	
function popup()
	 {
	  var args,filename, title;
	
	  args = popup.arguments;
	  title   = args[1];
	  filename=args[0];
	
	 panel=window.open(filename,title,"top=10, left=10, toolbar=no,width=720,height=510,resizable=0")
	 } // end f

//MenuSubmit is used by Applets, and My Work pages
function MenuSubmit(obj){	
	selected = obj.selectedIndex	
	value = obj.options[selected].value
	
	if (value != "NA") {
		location = value}
	else{
		obj.selectedIndex = 1
		}
}//end AppletMenuSubmit



if (document.images) {
//These are the objects used for the left nav roll-overs
  image0on = new Image();
  image0on.src="../images/wlogo.jpg";
  image0off = new Image();
  image0off.src="../images/wlogo.jpg";
  
  image1on = new Image();
  image1on.src="../images/applet2.jpg";
  image1off = new Image();
  image1off.src="../images/applet.jpg";

  image2on = new Image();
  image2on.src="../images/scripts2.jpg";
  image2off = new Image();
  image2off.src="../images/scripts.jpg";

  image3on = new Image();
  image3on.src="../images/resume2.jpg";
  image3off = new Image();
  image3off.src="../images/resume.jpg";

  image4on = new Image();
  image4on.src="../images/family2.jpg";
  image4off = new Image();
  image4off.src="../images/family.jpg";
  
  image5on = new Image();
  image5on.src="../images/work2.jpg";
  image5off = new Image();
  image5off.src="../images/work.jpg";
  
  image6on = new Image();
  image6on.src="../images/asp2.jpg";
  image6off = new Image();
  image6off.src="../images/asp.jpg";
  
  image7on = new Image();
  image7on.src="../images/calendar2.jpg";
  image7off = new Image();
  image7off.src="../images/calendar.jpg";
  
  image8on = new Image();
  image8on.src="../images/vb2.jpg";
  image8off = new Image();
  image8off.src="../images/vb.jpg";
  
  
  image9on = new Image();
  image9on.src="../images/SQL2.jpg";
  image9off = new Image();
  image9off.src="../images/SQL.jpg";
  
  
  image10on = new Image();
  image10on.src="../images/photos2.jpg";
  image10off = new Image();
  image10off.src="../images/photos.jpg";
  
  image11on = new Image();
  image11on.src="../images/hiking2.jpg";
  image11off = new Image();
  image11off.src="../images/hiking.jpg";
}


//ImageChange does the disjointed rollover on the left nav
function ImageChange(objname,onoff){			
	//alert(objname)
	//alert(onoff)	
		x = objname + onoff
		document[objname].src = eval(x + ".src")
		
		if (onoff == 'on') {
			document['<%= ImageName %>'].src = eval('<%= ImageName %>off.src') }
			
		if (onoff == 'off'){
			document['<%= ImageName %>'].src = eval('<%= ImageName %>on.src') }
		
}//end function

// Use to add a note for things that work only in IE browser
// Returns true if browser is not IE, else returns false
function NoteForNonIE(){
	if (navigator.appName.indexOf("Microsoft") == -1) {
	var msg = "<DIV ALIGN=LEFT>Your browser (" + navigator.appName + ")"
	msg += " is not compatible with this script. Instead, you "
	msg += "should use Microsoft Internet Explorer 4.0 or above."
	document.write("<LI>")
	document.write(msg)
	document.write("</DIV>")
	return true
	}
	return false
}//end function

// -->
</script>