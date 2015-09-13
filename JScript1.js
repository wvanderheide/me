<!--
function PhotoYear(Index)
{
    document.getElementById('PickYear1').selectedIndex = Index;
    document.getElementById('PickYear2').selectedIndex = Index;

    var year = document.getElementById('PickYear1').options[Index].text;
    year = "#" + year;
    window.location.hash=year;
}

function getXYPosition(e)
{
    myMouseX=(e||event).clientX;
    myMouseY=(e||event).clientY;

    myMouseX  = myMouseX -500
    if(myMouseX < 5)
        myMouseX = 5
    
    document.getElementById("DivAd").style.display = '';    
    document.getElementById("DivAd").style.left = myMouseX; 
    document.getElementById("DivAd").style.top = 5;
}
        
if (document.images) {
// Leftnav roll-overs 
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
  image6on.src="../images/quotes2.jpg";
  image6off = new Image();
  image6off.src="../images/quotes.jpg";
  
  image7on = new Image();
  image7on.src="../images/smCalendar2.jpg";
  image7off = new Image();
  image7off.src="../images/smCalendar.jpg";
  
  image8on = new Image();
  image8on.src="../images/timeline2.jpg";
  image8off = new Image();
  image8off.src="../images/timeline.jpg";
  
  
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
  
  image12on = new Image();
  image12on.src="../images/video2.jpg";
  image12off = new Image();
  image12off.src="../images/video.jpg";   
  
//Family Images
  imageCryon = new Image();
  imageCryon.src = "crystal2.jpg";
  imageCryoff = new Image();
  imageCryoff.src = "crystal.jpg";
  
  
  imageBouon = new Image();
  imageBouon.src = "bountiful2.jpg";
  imageBouoff = new Image();
  imageBouoff.src = "bountiful.jpg";
  
  
  imageCaron = new Image();
  imageCaron.src = "Cardston2.jpg";
  imageCaroff = new Image();
  imageCaroff.src = "Cardston.jpg";
  
  
  imageHawon = new Image();
  imageHawon.src = "Hawaii2.jpg";
  imageHawoff = new Image();
  imageHawoff.src = "Hawaii.jpg";
  
  
  imageWaton = new Image();
  imageWaton.src = "Waterton20062.jpg";
  imageWatoff = new Image();
  imageWatoff.src = "Waterton2006.jpg";
  
  imageReunionon = new Image();
  imageReunionon.src = "Reunion20062.jpg";
  imageReunionoff = new Image();
  imageReunionoff.src = "Reunion2006.jpg";
  
  
  
  imageGrandKidson = new Image();
  imageGrandKidson.src = "GrandKids20082.jpg";
  imageGrandKidsoff = new Image();
  imageGrandKidsoff.src = "GrandKids2008.jpg";
  
  imageBoyson = new Image();
  imageBoyson.src = "Boys20072.jpg";
  imageBoysoff = new Image();
  imageBoysoff.src = "Boys2007.jpg";
  
  
  imageLethbridgeon = new Image();
  imageLethbridgeon.src = "Lethbridge20072.jpg";
  imageLethbridgeoff = new Image();
  imageLethbridgeoff.src = "Lethbridge2007.jpg";
  
  image1970on = new Image();
  image1970on.src = "19702.jpg";
  image1970off = new Image();
  image1970off.src = "1970.jpg";
  
  //Featured  
  imageFeaturedon = new Image();
  imageFeaturedon.src = "thumbnails/Featuredon.jpg";
  imageFeaturedoff = new Image();
  imageFeaturedoff.src = "thumbnails/Featuredoff.jpg";
  
  //Photo thumbnails  
  
  imageCrowdon = new Image();
  imageCrowdon.src = "thumbnails/CrowdOn.jpg";
  imageCrowdoff = new Image();
  imageCrowdoff.src = "thumbnails/CrowdOff.jpg";
  
  imageLonePeakon = new Image();
  imageLonePeakon.src = "thumbnails/LonePeakOn.jpg";
  imageLonePeakoff = new Image();
  imageLonePeakoff.src = "thumbnails/LonePeakOff.jpg";
    
  imageCityOfRockson = new Image();
  imageCityOfRockson.src = "thumbnails/CityOfRocksOn.jpg";
  imageCityOfRocksoff = new Image();
  imageCityOfRocksoff.src = "thumbnails/CityOfRocksOff.jpg";
  
  imageBinghamon = new Image();
  imageBinghamon.src = "thumbnails/BinghamOn.jpg";
  imageBinghamoff = new Image();
  imageBinghamoff.src = "thumbnails/BinghamOff.jpg";
  
  imageRobertson = new Image();
  imageRobertson.src = "thumbnails/RobertsOn.jpg";
  imageRobertsoff = new Image();
  imageRobertsoff.src = "thumbnails/RobertsOff.jpg";
  
  imageMapleon = new Image();
  imageMapleon.src = "thumbnails/MapleOn.jpg";
  imageMapleoff = new Image();
  imageMapleoff.src = "thumbnails/MapleOff.jpg";
  
  imageTTTon = new Image();
  imageTTTon.src = "thumbnails/TTTon.jpg";
  imageTTToff = new Image();
  imageTTToff.src = "thumbnails/TTToff.jpg";
  
  imageSFon = new Image();
  imageSFon.src = "thumbnails/SFon.jpg";
  imageSFoff = new Image();
  imageSFoff.src = "thumbnails/SFoff.jpg";
  
  imageOctoberTimpon = new Image();
  imageOctoberTimpon.src = "thumbnails/OctoberTimpon.jpg";
  imageOctoberTimpoff = new Image();
  imageOctoberTimpoff.src = "thumbnails/OctoberTimpoff.jpg";
  
  imageBorahon = new Image();
  imageBorahon.src = "thumbnails/Borahon.jpg";
  imageBorahoff = new Image();
  imageBorahoff.src = "thumbnails/Borahoff.jpg";
  
  imageGannetton = new Image();
  imageGannetton.src = "thumbnails/Gannetton.jpg";
  imageGannettoff = new Image();
  imageGannettoff.src = "thumbnails/Gannettoff.jpg";
  
  imageWhiteBaldyon = new Image();
  imageWhiteBaldyon.src = "thumbnails/WhiteBaldyon.jpg";
  imageWhiteBaldyoff = new Image();
  imageWhiteBaldyoff.src = "thumbnails/WhiteBaldyoff.jpg";

  
  imageCrazyManon = new Image();
  imageCrazyManon.src = "thumbnails/CrazyManOn.jpg";
  imageCrazyManoff = new Image();
  imageCrazyManoff.src = "thumbnails/CrazyManOff.jpg";
  
  imageObeliskon = new Image();
  imageObeliskon.src = "thumbnails/ObeliskOn.jpg";
  imageObeliskoff = new Image();
  imageObeliskoff.src = "thumbnails/ObeliskOff.jpg";
  
  imageGrandCanyonon = new Image();
  imageGrandCanyonon.src = "thumbnails/GrandCanyonon.jpg";
  imageGrandCanyonoff = new Image();
  imageGrandCanyonoff.src = "thumbnails/GrandCanyonoff.jpg";
  
  imageShastaon = new Image();
  imageShastaon.src = "thumbnails/Shastaon.jpg";
  imageShastaoff = new Image();
  imageShastaoff.src = "thumbnails/Shastaoff.jpg";
  
  imageSkion = new Image();
  imageSkion.src = "thumbnails/skion.gif";
  imageSkioff = new Image();
  imageSkioff.src = "thumbnails/skioff.gif";
  
  
  imageDCon = new Image();
  imageDCon.src = "thumbnails/DCon.gif";
  imageDCoff = new Image();
  imageDCoff.src = "thumbnails/DCoff.gif";
  
  
  imageNThunderon = new Image();
  imageNThunderon.src = "thumbnails/NThunderOn.jpg";
  imageNThunderoff = new Image();
  imageNThunderoff.src = "thumbnails/NThunderOff.jpg";
  
  imageSkyon = new Image();
  imageSkyon.src = "thumbnails/skydivingOn.jpg";
  imageSkyoff = new Image();
  imageSkyoff.src = "thumbnails/skydivingOff.jpg";
  
  
  imageKon = new Image();
  imageKon.src = "thumbnails/karaokeOn.jpg";
  imageKoff = new Image();
  imageKoff.src = "thumbnails/karaokeOff.jpg";
  
  
  imageHKon = new Image();
  imageHKon.src = "thumbnails/hongkongOn.jpg";
  imageHKoff = new Image();
  imageHKoff.src = "thumbnails/hongkongOff.jpg";
  
  imageHalon = new Image();
  imageHalon.src = "thumbnails/Halloween2003On.jpg";
  imageHaloff = new Image();
  imageHaloff.src = "thumbnails/Halloween2003Off.jpg";
  
  imageYon = new Image();
  imageYon.src = "thumbnails/rafting2003On.jpg";
  imageYoff = new Image();
  imageYoff.src = "thumbnails/rafting2003Off.jpg";
  
    
  imageSon = new Image();
  imageSon.src = "thumbnails/Summer2003On.jpg";
  imageSoff = new Image();
  imageSoff.src = "thumbnails/Summer2003Off.jpg";
  
  imageSavon = new Image();
  imageSavon.src = "thumbnails/SavannahOn.jpg";
  imageSavoff = new Image();
  imageSavoff.src = "thumbnails/SavannahOff.jpg";
  
  imageGauleyon = new Image();
  imageGauleyon.src = "thumbnails/GauleyOn.jpg";
  imageGauleyoff = new Image();
  imageGauleyoff.src = "thumbnails/GauleyOff.jpg";  
  
  imageAAMon = new Image();
  imageAAMon.src = "thumbnails/aamOn.jpg";
  imageAAMoff = new Image();
  imageAAMoff.src = "thumbnails/aamOff.jpg";


  
  imageDVon = new Image();
  imageDVon.src = "thumbnails/DVOn.jpg";
  imageDVoff = new Image();
  imageDVoff.src = "thumbnails/DVOff.jpg";
  
  
  
  imageWVon = new Image();
  imageWVon.src = "thumbnails/WVOn.gif";
  imageWVoff = new Image();
  imageWVoff.src = "thumbnails/WVOff.gif";
  
  
  
  imageAdion = new Image();
  imageAdion.src = "thumbnails/AdiOn.jpg";
  imageAdioff = new Image();
  imageAdioff.src = "thumbnails/AdiOff.jpg";
  
  imageKidon = new Image();
  imageKidon.src = "thumbnails/kidon.jpg";
  imageKidoff = new Image();
  imageKidoff.src = "thumbnails/kidoff.jpg";
  
  
  imageZionon = new Image();
  imageZionon.src="thumbnails/ZionNarrows2005On.jpg";
  imageZionoff = new Image();
  imageZionoff.src="thumbnails/ZionNarrows2005Off.jpg";
    
  imagePeak8753on = new Image();
  imagePeak8753on.src="thumbnails/Peak8753On.jpg";
  imagePeak8753off = new Image();
  imagePeak8753off.src="thumbnails/Peak8753Off.jpg";
  
  imageFlagStaffon = new Image();
  imageFlagStaffon.src="thumbnails/FlagStaffOn.jpg";
  imageFlagStaffoff = new Image();
  imageFlagStaffoff.src="thumbnails/FlagStaffOff.jpg";
    
  imageSharpon = new Image();
  imageSharpon.src="thumbnails/SharpOn.jpg";
  imageSharpoff = new Image();
  imageSharpoff.src="thumbnails/SharpOff.jpg";
  
  imageCardiacon = new Image();
  imageCardiacon.src="thumbnails/CardiacOn.jpg";
  imageCardiacoff = new Image();
  imageCardiacoff.src="thumbnails/CardiacOff.jpg";
  
  imageLoweon = new Image();
  imageLoweon.src="thumbnails/LoweOn.jpg";
  imageLoweoff = new Image();
  imageLoweoff.src="thumbnails/LoweOff.jpg";
  
  imageRedBaldyon = new Image();
  imageRedBaldyon.src="thumbnails/RedBaldyOn.jpg";
  imageRedBaldyoff = new Image();
  imageRedBaldyoff.src="thumbnails/RedBaldyOff.jpg";
    
  imageBFTwinson = new Image();
  imageBFTwinson.src="thumbnails/BFTwinsOn.jpg";
  imageBFTwinsoff = new Image();
  imageBFTwinsoff.src="thumbnails/BFTwinsOff.jpg";
  
  imageGrandFatheron = new Image();
  imageGrandFatheron.src="thumbnails/GrandFatherOn.jpg";
  imageGrandFatheroff = new Image();
  imageGrandFatheroff.src="thumbnails/GrandFatherOff.jpg";
  
  
  imageBYUon = new Image();
  imageBYUon.src="thumbnails/byuOn.jpg";
  imageBYUoff = new Image();
  imageBYUoff.src="thumbnails/byuOff.jpg";
  
  image90on = new Image();
  image90on.src="thumbnails/90On.jpg";
  image90off = new Image();
  image90off.src="thumbnails/90Off.jpg";
  
  image2006on = new Image();
  image2006on.src="thumbnails/2006On.jpg";
  image2006off = new Image();
  image2006off.src="thumbnails/2006Off.jpg";
  
  imageshedon = new Image();
  imageshedon.src = "thumbnails/shedon.jpg";
  imageshedoff = new Image();
  imageshedoff.src = "thumbnails/shedoff.jpg";  
  
  imagedromedaryon = new Image();
  imagedromedaryon.src = "thumbnails/dromedaryon.jpg";
  imagedromedaryoff = new Image();
  imagedromedaryoff.src = "thumbnails/dromedaryoff.jpg";
  
  imagewolverineon = new Image();
  imagewolverineon.src = "thumbnails/wolverineon.jpg";
  imagewolverineoff = new Image();
  imagewolverineoff.src = "thumbnails/wolverineoff.jpg";
  
  imageMonteon = new Image();
  imageMonteon.src = "thumbnails/Monteon.jpg";
  imageMonteoff = new Image();
  imageMonteoff.src = "thumbnails/Monteoff.jpg";
    
    
  imageCrandellon = new Image();
  imageCrandellon.src = "thumbnails/Crandellon.jpg";
  imageCrandelloff = new Image();
  imageCrandelloff.src = "thumbnails/Crandelloff.jpg";
  
  imageCrowsneston = new Image();
  imageCrowsneston.src = "thumbnails/Crowsneston.jpg";
  imageCrowsnestoff = new Image();
  imageCrowsnestoff.src = "thumbnails/Crowsnestoff.jpg";
  
  imageAFTwinson = new Image();
  imageAFTwinson.src = "thumbnails/AFTwinson.jpg";
  imageAFTwinsoff = new Image();  
  imageAFTwinsoff.src = "thumbnails/AFTwinsoff.jpg";
    
  imageWGunsighton = new Image();
  imageWGunsighton.src = "thumbnails/WGunsighton.jpg";
  imageWGunsightoff = new Image();  
  imageWGunsightoff.src = "thumbnails/WGunsightoff.jpg";
  
  
  imageAlberta2008on = new Image();
  imageAlberta2008on.src = "thumbnails/Alberta2008on.jpg";
  imageAlberta2008off = new Image();
  imageAlberta2008off.src = "thumbnails/Alberta2008off.jpg";
    
  imageVimyon = new Image();
  imageVimyon.src = "thumbnails/Vimyon.jpg";
  imageVimyoff = new Image();
  imageVimyoff.src = "thumbnails/Vimyoff.jpg";
  
  imageUpperPoleon = new Image();
  imageUpperPoleon.src = "thumbnails/UpperPoleOn.jpg";
  imageUpperPoleoff = new Image();
  imageUpperPoleoff.src = "thumbnails/UpperPoleOff.jpg";
  
  imageGrungeon = new Image();
  imageGrungeon.src = "thumbnails/Grungeon.jpg";
  imageGrungeoff = new Image();
  imageGrungeoff.src = "thumbnails/Grungeoff.jpg";
  
  imageRainieron = new Image();
  imageRainieron.src = "thumbnails/Rainieron.jpg";
  imageRainieroff = new Image();
  imageRainieroff.src = "thumbnails/Rainieroff.jpg";
  
  imageHoodon = new Image();
  imageHoodon.src = "thumbnails/Hoodon.jpg";
  imageHoodoff = new Image();
  imageHoodoff.src = "thumbnails/Hoodoff.jpg";

  imageBoxElderon = new Image();
  imageBoxElderon.src = "thumbnails/BoxElderon.jpg";
  imageBoxElderoff = new Image();
  imageBoxElderoff.src = "thumbnails/BoxElderoff.jpg";
  
  imageBoxElder2on = new Image();
  imageBoxElder2on.src = "thumbnails/BoxElder2on.jpg";
  imageBoxElder2off = new Image();
  imageBoxElder2off.src = "thumbnails/BoxElder2off.jpg";
    
  imageElephanton = new Image();
  imageElephanton.src = "thumbnails/Elephanton.jpg";
  imageElephantoff = new Image();
  imageElephantoff.src = "thumbnails/Elephantoff.jpg";
  
  imageEverestRidgeon = new Image();
  imageEverestRidgeon.src = "thumbnails/EverestRidgeon.jpg";
  imageEverestRidgeoff = new Image();
  imageEverestRidgeoff.src = "thumbnails/EverestRidgeoff.jpg";
  
  imageSThunderon = new Image();
  imageSThunderon.src = "thumbnails/SThunderon.jpg";
  imageSThunderoff = new Image();
  imageSThunderoff.src = "thumbnails/SThunderoff.jpg";
  
  imageNTimpon = new Image();
  imageNTimpon.src = "thumbnails/NTimpon.jpg";
  imageNTimpoff = new Image();
  imageNTimpoff.src = "thumbnails/NTimpoff.jpg";
  
  imageNTimp2on = new Image();
  imageNTimp2on.src = "thumbnails/NTimp2on.jpg";
  imageNTimp2off = new Image();
  imageNTimp2off.src = "thumbnails/NTimp2off.jpg";
  
  imageNeboon = new Image();
  imageNeboon.src = "thumbnails/Neboon.jpg";
  imageNebooff = new Image();
  imageNebooff.src = "thumbnails/Nebooff.jpg";
  
  imageNeboPoleon = new Image();
  imageNeboPoleon.src = "thumbnails/NeboPoleon.jpg";
  imageNeboPoleoff = new Image();
  imageNeboPoleoff.src = "thumbnails/NeboPoleoff.jpg";
  
  imageCanyonson = new Image();
  imageCanyonson.src = "thumbnails/Canyonson.jpg";
  imageCanyonsoff = new Image();
  imageCanyonsoff.src = "thumbnails/Canyonsoff.jpg";
  
  //work samples
  imageIRSon = new Image();
  imageIRSon.src = "irson.jpg";  
  imageIRSoff = new Image();
  imageIRSoff.src = "irsoff.jpg";
	
  imageCEXon = new Image();
  imageCEXon.src = "cexon.jpg";
  imageCEXoff = new Image();
  imageCEXoff.src = "cexoff.jpg";
  
  
  imageLanon = new Image();
  imageLanon.src = "langleyon.jpg"; 
  imageLanoff = new Image();
  imageLanoff.src = "langleyoff.jpg";

  image1on1on = new Image();
  image1on1on.src = "1on1on.jpg";
  image1on1off = new Image();
  image1on1off.src = "1on1off.jpg";
  
  
  imagevadon = new Image();
  imagevadon.src = "vadivorceon.jpg";
  imagevadoff = new Image();
  imagevadoff.src = "vadivorceoff.jpg";


  imagecexion = new Image();
  imagecexion.src = "cexintraon.jpg";
  imagecexioff = new Image();
  imagecexioff.src = "cexintraoff.jpg";
  
  imagePartyon = new Image();
  imagePartyon.src = "partyon.jpg";  
  imagePartyoff = new Image();
  imagePartyoff.src = "partyoff.jpg";

  imageKChinjuon = new Image();
  imageKChinjuon.src = "korea_chinjuon.jpg";
    imageKChinjuoff = new Image();
  imageKChinjuoff.src = "korea_chinjuoff.jpg";

  imageCC_IRSon = new Image();
  imageCC_IRSon.src = "cc_irson.jpg";
  imageCC_IRSoff = new Image();
  imageCC_IRSoff.src = "cc_irsoff.jpg";
  
  imageGoodKayon = new Image();
  imageGoodKayon.src = "goodkayon.jpg";
  imageGoodKayoff = new Image();
  imageGoodKayoff.src = "goodkayoff.jpg";

  
  imageOpicon = new Image();
  imageOpicon.src = "opicon.jpg";
  imageOpicoff = new Image();
  imageOpicoff.src = "opicoff.jpg";
  

  imageECardon = new Image();
  imageECardon.src = "eCardon.gif";
  imageECardoff = new Image();
  imageECardoff.src = "eCardoff.jpg";  
}

//ImageChange does the disjointed rollover on the left nav
function ImageChange(objname,onoff){	
	//set the on-off src for the image
		x = objname + onoff		
	document[objname].src = eval(x + ".src")	

		//get hThisPageImage value
		if(document.getElementById("hThisPageImage") != null){
			x = document.getElementById("hThisPageImage").value
			if (onoff == 'on') {
				document[x].src = eval(x + 'off.src')}
			if (onoff == 'off'){
				document[x].src = eval(x + 'on.src') }	
		}		
}//end function

  
//  rollover
function changeImages() {
  if (document.images) {
    for (var i=0; i<changeImages.arguments.length; i+=2) {
		document[changeImages.arguments[i]].src = eval(changeImages.arguments[i+1] + ".src");
    }
  }
}//end function

function MyModalDlg(url, height, width )
{
	var strFeat = 'dialogHeight:' + height + 'px; dialogWidth:' + width + 'px; center:Yes; help:No; resizable:No; status:No; scroll:No;';
	var args = new Object;
	args.window = window;
	window.showModalDialog(url, args, strFeat );
	return true;
}


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

function ShowVideo(x, prefix)
{		
    // hide all
    for (var i = 1; i <= 4; i++) 
    {	
        video = prefix + i;
        if(document.getElementById(video) != null){document.getElementById(video).style.display='none';}
    }

    // show
    video = prefix + x
    document.getElementById(video).style.display='';
}

// Google Analytics
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-713574-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();



-->
