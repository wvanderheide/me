
<!--


var slideimages=new Array()
var slidelinks=new Array()
var slideWindow=new Array()



function slideshowWindow(){
for (i=0; i<slideshowWindow.arguments.length; i++)
slideWindow[i] = slideshowWindow.arguments[i]
}

function slideshowimages()
{
for (i=0;i<slideshowimages.arguments.length;i++)
 {
 slideimages[i]=new Image()
 slideimages[i].src=slideshowimages.arguments[i]
 }
}

function slideshowlinks(){
for (i=0; i<slideshowlinks.arguments.length; i++)
slidelinks[i] = slideshowlinks.arguments[i]
}

function gotoshow(){
if (slideWindow[whichlink] != true)
//open in current frame
 document.location=slidelinks[whichlink]
else{
  
//open in new window
panel=window.open(slidelinks[whichlink])}

}

//-->