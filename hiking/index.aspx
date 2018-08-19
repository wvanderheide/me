<!DOCTYPE html>
<%@ Register TagPrefix="uc1" TagName="UC_LeftNav" Src="../UC_LeftNav.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_Header" Src="../UC_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_Footer" Src="../UC_Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_FiveTabs" Src="../UC_FiveTabs.ascx" %>

<%@ Page Language="c#" %>

<html>
<head>
    <script language="javascript" type="text/javascript" src="../jquery-1.4.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="../jquery.tablesorter.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#myTable").tablesorter();

            $("#SeeRockClimbingTbl").click(function () {
                $("#RockClimbingTbl").fadeIn('slow');
            });

            $("#RockPicClose").click(function () {
                $("#RockClimbingTbl").fadeOut('slow');
            });
        });
    </script>
    <script language="C#" runat="server">        
        private void Page_Load(object sender, System.EventArgs e)
        {
            //don't forget to set the <title> tag in the HTML
            UC_LeftNav1.P_GraphicName = "hiking";
            UC_LeftNav1.P_ImageName = "image11";

            UC_Header1.P_HeaderTitle = "Mountaineering & Rock Climbing Log";
            UC_Header1.P_HeaderText = "Click 'Peaks' or 'Rock Climbs' to see lists.";
            UC_Footer1.P_LastModified = "March 13, 2016";

            //Set Five Tabs properties
            UC_FiveTabs1.P_MainAreaScrolls = "auto";
            UC_FiveTabs1.P_FiveTabSelected = "1"; //this doesn't work when not in a code behind
            UC_FiveTabs1.P_FiveTabsHeight = "100%";

            //tab labels
            UC_FiveTabs1.P_Tab1Name = "Introduction";
            UC_FiveTabs1.P_Tab2Name = "Peaks";
            UC_FiveTabs1.P_Tab3Name = "Rock Climbs";


            //Peak Count
            int UniqueCount = 159;
            int TotalCount = 291;

            //tab content
            UC_FiveTabs1.P_Tab1Text = ltTheBody.Text;
            UC_FiveTabs1.P_Tab2Text = ltPeakLog.Text.Replace("?&*UniqueCount?&*", UniqueCount.ToString()).Replace("?&*TotalCount?&*", TotalCount.ToString());
            UC_FiveTabs1.P_Tab3Text = ltRockClimbLog.Text;


            //tab visibile
            UC_FiveTabs1.P_Tab4Visible = false;
            UC_FiveTabs1.P_Tab5Visible = false;
            UC_FiveTabs1.P_Tab6Visible = false;
        }
    </script>
    <title>Mountaineering</title>
    <script language="javascript" type="text/javascript" src="../JScript1.js"></script>
    <link rel="stylesheet" href="../StyleSheet1.css" type="text/css" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <noscript>
            <meta http-equiv="REFRESH" content="0; URL= ../intro/index.aspx">
        </noscript>
        <div style="display: none; background-color: Silver; color: Black; border: dotted 1px white; width: 800px; z-index: 1000; position: absolute; left: 5; top: 5"
            id="DivCountTotal">
            <div style="text-align: left; padding: 2px 1px 1px 3px; color: Black">
                Since I have climbed a lot of these mountains more than once, <b>total count</b>
                is an approximation of the number of times I've climbed mountains. It's not 100%
            accurate because I'm not sure I have included every mountain I have ever climbed
            in this list, nor have I recorded everytime I have climbed a mountain. For example
            Old Rag, and Big Schloss are guesses, as are others.
            </div>
        </div>
        <div style="display: none; background-color: Silver; color: Black; border: dotted 1px white; width: 800px; z-index: 1000; position: absolute; left: 5; top: 5"
            id="DivCountDiff">
            <div style="text-align: left; padding: 2px 1px 1px 3px; color: Black">
                Note: The "<i>Climber's Logs I've Signed</i>" count on <b>SummitPost.org</b> doesn't
            necessarily include the same mountains as this list. The summitpost count is "mountains
            & rocks" plus "routes" plus "canyons".
            <table border="1" bgcolor="black">
                <tr>
                    <td valign="top">The count HERE includes 14 mountains not found on Summit Post:
                        <ol>
                            <li>Bear's Hump</li>
                            <li>Victoria Peak (hong kong)</li>
                            <li>Chimney Rock NC</li>
                            <li>Mt. Tuscarora <i>(summit post has Tuscarora as part of Mt. Wolverine)</i></li>
                            <li>Peak 420</li>
                            <li>Monte Cristo <i>(summit post has Monte Cristo as part of Mt. Superior)</i></li>
                            <li>Cathedral Rock</li>
                            <li>Red Top Mountain</li>
                            <li>Roberts Horn</li>
                            <li>Peak 9990</li>
                            <li>East Peak</li>
                            <li>Peak 10009</li>
                            <li>First Gemini</li>
                            <li>Second Gemini</li>
                        </ol>
                    </td>
                    <td valign="top">This count omits 3 mountain:
                        <ol>
                            <li>Juniper Peak, NV -- didn't summit but counted on SummitPost to remember it. Was up there again Oct 2013 when we climbed the Solar Slab route and walked off down Oak Creek Canyon..</li>
                            <li>Eichorn Pinnacle (Yosemite National Park)</li>
                            <li>Royal Arches (Yosemite National Park) </li>
                        </ol>
                    </td>
                </tr>
            </table>
                So, The count here should equal 12 more than summitpost.org (without areas/routes/canyons). SummitPost has X number of mountains (without areas/routes/canyons).
            X minus 3 omitted here, plus 14 extra mountains (included here), plus
            1 Canyon (Grand Canyon, here but not on summitpost) equals the count here.
            </div>
        </div>
        <table cellspacing="3" cellpadding="3" border="0" width="100%">
            <tr>
                <td width="1%" align="center" valign="top">
                    <uc1:UC_LeftNav ID="UC_LeftNav1" runat="server"></uc1:UC_LeftNav>
                </td>
                <td valign="top" width="99%" style="padding-left: 25px">
                    <uc1:UC_Header ID="UC_Header1" runat="server"></uc1:UC_Header>
                    <!-- PAGE STUFF	-->
                    <br />
                    <!-- Change the width on the table below to resize the tabs area -->
                    <table cellspacing="3" cellpadding="3" border="0" width="100%" align="left">
                        <tr>
                            <td>
                                <uc1:UC_FiveTabs ID="UC_FiveTabs1" runat="server"></uc1:UC_FiveTabs>
                            </td>
                        </tr>
                    </table>
                    <!-- END Page Stuff -->
                </td>
            </tr>
        </table>
        <uc1:UC_Footer ID="UC_Footer1" runat="server"></uc1:UC_Footer>
        <asp:Literal ID="ltTheBody" runat="server" Visible="false">
    <table width="100%">
        <tr>
            <td>          
                <p>I considered myself to be an outdoors enthusiast.  Very few
                activities provide me with as much joy as hiking, camping, skiing, mountain
                biking, rock climbing, ice climbing and exploring.  </p>

                <p>This passion began in my childhood.  At the young age of 10 years, I climbed Chief 
                Mountain in Glacier Park, MT.  At the age of 12 years, with my scout troop, 
                I did a 26 mile back-packing trek from Chief
                Mountain Customs (<i>USA/Canada border</i>) over Stoney Indian Pass to Goat Haunt at
                the head of Wateron Lakes (<i>interestingly, I still
                use  the down-filled sleeping bag bought for that trip</i>).  In 1981 &amp; 1982 I camped and hiked in Kananaskis
                country Alberta, first at the Canadian Boy Scout Jamboree and again for the
                World Jamboree Hike Master camp.  As a teen I fished a lot of the lakes and streams
                in Southern Alberta, and Northern Montana.  In college, I took a High Country
                Backpacking class.</p>

                <p>I can brag about having hiked every marked-trail in Waterton Park, Alberta, and even a few of the now 
                closed ones such as over the cliff into Lineham Lakes.  While driving in Glacier Park, MT I was once charged 
                by a moose. Twice on mountain bikes in Waterton I have crossed trails with grizzly bears, and
                another time spotted a cougar. In 1993 I biked the 330-km Golden Triangle from Banff, Alberta through 
                Radium and Golden BC.  I have rock climbed at Stone Hill, MT, ice climbed in Ouray CO, scaled the Grand Teton, and explored the Grand Canyon. 
                My mother, brother and myself, at the stroke of midnight, welcomed in the 21<sup>st</sup> century from Bear's Hump, and 
				I spent the rest of that day skiing at Castle Mountain.
                I have white-water rafted on the Gauley river in WV and the Youghiogheny river in PA. During the
                1998-2005 time frame I did countless hikes in the GW Forest, and Shenandoah Park, VA; 
                with a favorite being from the park boundary to White Oaks Falls.  I have sky-dived.
                In 2003 I completed biking the 184.5 mile long C&amp;O canal trail from Washington, DC to Cumberland, MD.  
                During the 2005/2006 ski season I skied 21 full days (did the same number of days in the 2006/2007 season).  Between December 
                2007 and July 2008 I climbed at least one mountain or spent at least one day skiing a week for 29 weeks in a row.  Between 
                August 23, 2007 and August 11, 2008 I climbed 52 peaks exceeding my goal of 40 peaks in one year!  As of June 2013 I have climbed to the highest point in 15 of the 50 US states.  
                The 2013/14 ski season I got in 32 days at Sundance for a total of 431 lift rides/runs.</p>

                <p>Since 2010 I started getting more and more into Rock Climbing</p>

                <p>Bearing the description above in mind, a list of hikes, and other 
                outdoor adventures, it seems, would run on endlessly, and so instead I have
                decided to log here all of the mountain peaks I have stood on top of.  
                <span onmouseover="document.getElementById('DivUnsuccesful').style.display = '';document.getElementById('DivUnsuccesful').style.top = 1*(event.clientY)-230;document.getElementById('DivUnsuccesful').style.left = 1*(event.clientX)-111;" onmouseout="document.getElementById('DivUnsuccesful').style.display = 'none';" class="FakeLink">Incomplete</span>  
                attempts have been omitted.  A few scenic overlooks worth mentioning have been included.</p>
                <div style="display:none; background-color:Silver; color:Black; border:dotted 1px white; width:200px; z-index:100; position:absolute;" id="DivUnsuccesful">
                <div style="text-align:center"><b>Incomplete Climbs</b><br />(Reattempt pending)</div>
                    <li>Juniper Peak, Nevada -- May 2005</li>
                    <br /><br />
                </div>                
                
                <p>
                Click the "Peaks" tab, or the "Rock Climbs" tab to see the respective log.
                </p>
                See pictures and learn more about my mountain adventures (including an incomplete list of canyons) at <a href="http://www.summitpost.org/user_page.php?user_id=23249" target="_blank">summitpost.org</a>.
            </td>
        </tr>
    </table>
        </asp:Literal>
        <asp:Literal ID="ltPeakLog" runat="server" Visible="false">
       <table width="100%">
            <tr>
                <td width="80%">An incomplete list of mountains I have summited.&nbsp;&nbsp;
                    Use <a href="http://www.acme.com/mapper" target="_blank">ACME Mapper 2.0</a> to view topo map.</td>
                <td align="right" width="20%">Unique Count:&nbsp;
                    <span onmouseover="$('#DivCountDiff').slideDown('slow');" 
                    onmouseout="$('#DivCountDiff').slideUp('slow');"  class="FakeLink">?&*UniqueCount?&*</span>
                    
                    <span class="daption">Total Count:</span>&nbsp;
                    <span onmouseover="$('#DivCountTotal').slideDown('slow');" 
                    onmouseout="$('#DivCountTotal').slideUp('slow');"  class="FakeLink">?&*TotalCount?&*</span>
                   </td>
            </tr>
        </table>
         <table border="1" cellspacing="1" cellpadding="2"  id="myTable" class="normal tablesorter" width="100%">
        <thead>
                <tr>
                    <th align="left" style="cursor:pointer" class="caption" title="Initially the list is sorted by order climbed, with most recent on top. Click to sort asc, and click again for desc">
                        Mountain</th> <!-- Needs to be a TH for sorting to work -->
                    <td class="caption">
                        Elevation</td>
                    <td class="caption">
                        Summit Date</td>
                    <td class="caption">
                        Location</td>
                </tr>  
                 </thead>
        <tbody>   
              
  		<tr>
                    <td valign="top">
                        Squaw Peak</td>
                    <td  valign="top">
                        7,876 ft<br />(2,401 m)</td>
                    <td valign="top">
			<ol>
                        <li>June 17, 2006</li>
                        <li>November 25, 2006</li>
                        <li>December 26, 2007</li>
                        <li>September 27, 2008</li>
                        <li>December 27, 2008</li>
                        <li>May 2, 2009</li>
                        <li>October 18, 2009</li>
                        <li>January 2, 2010</li>
                        <li>February 28, 2010</li>
                    	<li>November 26, 2010</li>
			<li>June 5, 2011</li>
		        <li>August 28, 2011</li>
		        <li>February 26, 2012</li>
		        <li>November 10, 2012</li>
                        <li>February 10, 2013</li>
                        <li>October 8, 2013</li>
                        <li>March 16, 2014</li>
                        <li>December 9, 2014</li>
			<li>April 19, 2015</li>
			<li>July 5, 2015</li>
                <li>Oct 4, 2015</li>
			</ol>
                    </td>
                    <td valign="top">
                        40.272N / 111.616W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>  
                       
                <tr>
                    <td valign="top">
                        Mount Timpanogos</td>
                    <td  valign="top">
                        11,749 ft<br />(3,581 m)</td>
                    <td valign="top">
                    <ol>
                        <li>September 16, 1995 -- Aspen Grove Trail</li>
                        <li>September 3, 2005 -- Aspen Grove Trail</li>
                        <li>August 4, 2007 -- Timponooke Trail on summit at
                            <nobr>5:28 am</nobr></li>
                        <li>August 9, 2008 -- via the snowfield</li>
                        <li>October 24, 2009 -- Aspen Grove Trail</li>
                        <li>April 17, 2010 -- Everest Ridge</li>                            
                        <li>June 25, 2011 -- Primrose Cirque</li>                       
                        <li>October 26, 2012 -- As part of full traverse</li>
                        <li>July 7, 2015 -- Aspen Grove Trail</li>
                        <li>September 25, 2015 Aspen Grove Trail</li>
                    </ol>
                    </td>
                    <td valign="top">
                        40.38460N / 111.636W<br />
                        <b>USA/Utah</b></td>
                </tr>      
            <tr>
                    <td valign="top">
                        Mount Lineham</td>
                    <td  valign="top">
                        8,950 ft<br />(2,728 m)</td>
                    <td valign="top">
                    <ol>
                        <li>August 10, 2015</li>
                    </ol>
                    </td>
                    <td valign="top">
                          49.06965N / 114.04912W   <br />
                        <b>Canada/Alberta</b></td>
                </tr>        
            <tr>
                    <td valign="top">
                        Mount Hawkins</td>
                    <td  valign="top">
                         8,839 ft<br />(2,694 m)</td>
                    <td valign="top">
                    <ol>
                        <li>August 10, 2015</li>
                    </ol>
                    </td>
                    <td valign="top">
                          49.08770N / 114.07705W   <br />
                        <b>Canada/Alberta</b></td>
                </tr>    
            <tr>
                    <td valign="top">
                        Mount Blakiston</td>
                    <td  valign="top">
                        9547 ft  ft<br />(2,910 m)</td>
                    <td valign="top">
                    <ol>
                        <li>August 10, 2015</li>
                    </ol>
                    </td>
                    <td valign="top">
                          49.09393N / 114.03551W  <br />
                        <b>Canada/Alberta</b></td>
                </tr>  
            <tr>
                    <td valign="top">
                        Bertha Peak</td>
                    <td  valign="top">
                        8,005 ft<br />(2,440 m)</td>
                    <td valign="top">
                    <ol>
                        <li>August 9, 2015</li>
                    </ol>
                    </td>
                    <td valign="top">
                          49.03890N / 113.9444W <br />
                        <b>Canada/Alberta</b></td>
                </tr>  
            <tr>
                    <td valign="top">
                        Grandeur Peak</td>
                    <td  valign="top">
                        8,299 ft<br />(2,530 m)</td>
                    <td valign="top">
                    <ol>
                        <li>August 4, 2015 -- West Slopes</li>
                    </ol>
                    </td>
                    <td valign="top">
                        40.70700N / 111.7592W <br />
                        <b>USA/Utah</b></td>
                </tr> 
		<tr>
		<td valign="top">
                        White Butte</td>
                    <td  valign="top">
                        3,507 ft <br />(1,069 m)</td>
                    <td valign="top">
			<ol>
				<li>May 31, 2015</li>
			</ol>
                    </td>
                    <td valign="top">
                        46.38680N / 103.3021W  
                        <br />
                        <b>USA/ND</b></td>
                </tr> 
		<tr>
		<td valign="top">
                        Harney Peak</td>
                    <td  valign="top">
                        7,242 ft  <br />(2,207 m)</td>
                    <td valign="top">
			<ol>
				<li>May 30, 2015</li>
			</ol>
                    </td>
                    <td valign="top">
                        43.86610N / 103.5311W  
                        <br />
                        <b>USA/SD</b></td>
                </tr> 
		<tr> 
     		<td valign="top">
                        Panorama Point</td>
                    <td  valign="top">
                        5,429 ft <br />(1,655 m)</td>
                    <td valign="top">
			<ol>
				<li>May 29, 2015</li>
			</ol>
                    </td>
                    <td valign="top">
                        41.00720N / 104.0305W 
                        <br />
                        <b>USA/NE</b></td>
                </tr>  
		<tr>
                    <td valign="top">
                        Mount Tuscarora</td>
                    <td  valign="top">
                        10,660 ft<br />(3,249 m)</td>
                    <td valign="top">
			<ol>
				<li>March 29, 2008</li>

				<li>March 19, 2015</li>
			</ol>
                    </td>
                    <td valign="top">
                        40.58438N / 111.59878W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>

                <tr>
                    <td valign="top">
                        Mount Wolverine</td>
                    <td  valign="top">
                        10,795 ft<br />(3,290 m)</td>
                    <td valign="top">
                    <ol>
                        <li>April 18, 2009</li>
                        <li>March 29, 2008</li>
			<li>March 19, 2015</li>
			<li>March 19, 2015</li>
                    </ol>
                    </td>
                    <td valign="top">40.58542N / 111.60341W
                        <br />
                        <b>USA/Utah</b></td>
                </tr> 
    
                <tr>
                    <td valign="top">
                        Patsy Marley</td>
                    <td  valign="top">
                        10,525 ft<br />(3,208 m)</td>
                    <td valign="top">
                    <ol>
                        <li>March 29, 2008</li>
                        <li>April 18, 2009</li>
                        <li>Dec 8, 2012</li>
                        <li>March 16, 2013</li>
                        <li>March 23, 2013</li>
			<li>April 20, 2013</li>
			<li>March 2, 2015</li>
			<li>March 19, 2015</li>
                    </ol>
                    </td>
                    <td valign="top">40.58815N / 111.60863W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>     
        
      
        <tr>
                    <td valign="top">
                       Cathedral  Peak</td>
                    <td  valign="top">
                          10,911 ft<br />(3,326 m)</td>
                    <td valign="top">
                    <ol>
                        <li>Oct 7, 2014</li>
                    </ol></td>
                    <td>
                        37.84780N / 119.4047W 
                        <br />
                        <b>USA/California</b></td>
                </tr> 
        <tr>
                    <td valign="top">
                       Montgomery Peak</td>
                    <td  valign="top">
                         13,441 ft<br />(4,097 m)</td>
                    <td valign="top">
                    <ol>
                        <li>Oct 6, 2014</li>
                    </ol></td>
                    <td>
                         37.83800N / 118.356W 
                        <br />
                        <b>USA/California</b></td>
                </tr> 
          <tr>
                    <td valign="top">
                       Boundary Peak</td>
                    <td  valign="top">
                        13,140 ft<br />(4,005 m)</td>
                    <td valign="top">
                    <ol>
                        <li>Oct 6, 2014</li>
                    </ol></td>
                    <td>
                         37.84610N / 118.35W 
                        <br />
                        <b>USA/Nevada</b></td>
                </tr> 
                <tr>
                    <td valign="top">
                        Mt. Olympus</td>
                    <td  valign="top">
                        9,026 ft<br />(2,751 m)</td>
                    <td valign="top">
                    <ol>
                       <li>May 10, 2008</li>
                       <li>December 9, 2011</li>
                       <li>June 16, 2012 - West Slabs to N. Peak, and scramble to S. Peak</li>
						<li>May 27, 2013 - Geurts Ridge</li>
                        <li>Sept 15, 2014</li>
                    </ol></td>
                    <td>
                         40.65700N / 111.77W
                        <br />
                        <b>USA/Utah</b></td>
                </tr> 
            <tr>
                    <td valign="top">
                        Mt. McKinley (Denali)</td>
                    <td  valign="top">
                        20,320 ft<br />(6,194 m)</td>
                    <td valign="top">                        
                    <ol>
                        <li>June 7, 2014</li>
			        </ol>
                    </td>
                    <td>
                         63.06927N / 151.00777W 
                        <br />
                        <b>USA/Alaska</b></td>
                </tr>   
                                                  
                <tr>
                    <td valign="top">
                        Monte Cristo</td>
                    <td  valign="top">
                        11,132 ft<br />(3,393 m)</td>
                    <td valign="top">                        
                    <ol>
                        <li>May 16, 2008</li>
                        <li>Aug. 3, 2012</li>
                        <li>May 4, 2014</li>
			        </ol></td>
                    <td>
                         40.59125N / 111.67114W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>   
                              
                <tr>
                    <td valign="top">
                        Mt. Superior</td>
                    <td  valign="top">
                        11,040 ft<br />(3,365 m)</td>
                    <td valign="top">
                     <ol>
                        <li>May 16, 2008</li>
                        <li>February 21, 2009</li>
                        <li>Aug. 3, 2012</li>
                        <li>April 5, 2014 (within 150 feet of top, electric storm)</li>
                        <li>May 3, 2014</li>
                     </ol>
                    </td>
                    <td>
                         40.59215N / 111.66698W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>       
             <tr>
                    <td valign="top">
                        Y-Mountain</td>
                    <td  valign="top">
                        8,568 ft<br />(2,612 m) 
                        </td>
                    <td valign="top">                  
                        <ol>
                        <li>October 6, 2007<br />(West Peak)</li>
                        <li>May 24, 2008<br />(West and East Peaks)</li>  
                        <li>November 11, 2013<br />(East Peak)</li> 
                        <li>April 19, 2014<br />(East Peak)</li>
                        </ol>
                     </td>
                    <td valign="top">
                        40.25434N / 111.61049W
                        <br />
                        <b>USA/Utah</b>               
  
                    </td>
                </tr>
         <tr>
                    <td valign="top">
                        Mount Raymond</td>
                    <td  valign="top">
                    10,241  ft <br />(3,121  m) 
                        </td>
                    <td valign="top">  
                    <ol>   
                        <li>March 29, 2014</li> 
				    </ol>   
                    </td>
                    <td valign="top">
                        40.65800N / 111.701W 
                        <br />
                        <b>USA/Utah</b></td>
                </tr>  
         <tr>
                    <td valign="top">
                        Iztaccihuatl</td>
                    <td  valign="top">
                    17,159  ft <br />(5,230  m)
                        </td>
                    <td valign="top">  
                    <ol>   
                        <li>November 30, 2013</li> 
				    </ol>   
                    </td>
                    <td valign="top">
                        19.18330N / 98.6333W 
                        <br />
                        <b>Mexico/Puebla</b></td>
                </tr>  
         <tr>
                    <td valign="top">
                        Pico de Orizaba</td>
                    <td  valign="top">
                    18,490 ft <br />(5,636 m)
                        </td>
                    <td valign="top">  
                    <ol>   
                        <li>November 27, 2013</li> 
				    </ol>   
                    </td>
                    <td valign="top">
                        19.02190N / 97.2675W 
                        <br />
                        <b>Mexico/Puebla</b></td>
                </tr>          
              <tr>
                    <td valign="top">
                        Maple Mountain</td>
                    <td  valign="top">
                        9,089 ft<br />(2,770 m)  
                        </td>
                    <td valign="top">  
                    <ol>   
                        <li>October 27, 2007</li>               
						<li>January 6, 2011</li>
                        <li>November 11, 2013</li>
				    </ol>   
                    </td>
                    <td valign="top">
                        40.23720N / 111.5972W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>                  
        <tr>
        <td valign="top">
                        Lady Mountain</td>
                    <td  valign="top">
                        6,945 ft<br />(2,117 m)</td>
                    <td valign="top">
					<ol>
                    <li>Nov 3, 2013</li>
                    </ol>
                    </td>
                    <td valign="top">
                        37.25430N / 112.9665W 
                        <br />
                        <b>USA/Utah</b></td>
        </tr>
        <tr>
        <td valign="top">
                        Aries Butte</td>
                    <td  valign="top">
                        6,492 ft<br />(m)</td>
                    <td valign="top">
					<ol>
                    <li>Nov 1, 2013</li>
                    </ol>
        </td>
        
                    <td valign="top">
                        37.23250N / 112.9077W 
                        <br />
                        <b>USA/Utah</b></td>
        </tr> 
        <tr>
                    <td valign="top">
                        Pingora Peak
                        </td>
                    <td  valign="top">
                      11,884 ft<br />(3,622 m)
                        </td>
                    <td valign="top">
                    <ol>
                        <li>Sept 10, 2013</li>
			        </ol>
			</td>
                    <td>
                        42.77920N / 109.2247W <br />
                        <b>USA/Wyoming</b>
                    </td>
                </tr>         
                <tr>
                    <td valign="top">
                        Sundial Peak
                        </td>
                    <td  valign="top">
                      10,320 ft<br />(3,146 m)
                        </td>
                    <td valign="top">
                    <ol>
			            <li>May 31, 2010</li>
			            <li>June 8, 2012 (North Peak)</li>
                        <li>Sept 6, 2013 (11th Hour Route)</li>
			        </ol>
			</td>
                    <td>
                        40.59712N / 111.68467W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr>              
           <tr>
                    <td valign="top">
                        Kings Peak
                    </td>
                    <td  valign="top">
                        13,528 ft<br />(4,123 m)</td>
                    <td valign="top">
					<ol>
					    <li><a href="http://www.summitpost.org/trip-report/338275/Conquering-Kings-Peak-Via-Henry-s-Fork.html" target="_blank">September 2, 2006</a></li>
                        <li>July 26, 2008</li>
                        <li>Sept 4, 2011</li>
                        <li>August 31, 2013</li>
                    </ol>
                    </td>
                    <td>
                        40.77650N / 110.3723W<br />
                        <b>USA/Utah</b>
                        <br />
                        Highest point in the state of Utah.
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                     Jeff Davis Peak</td>
                    <td  valign="top">
                          12,771 ft<br />(3,893 m)</td>
                    <td valign="top">
                         <ol>
                       <li>June 29, 2013</li>
							 </ol></td>
                    <td>
                          38.98860N / 114.296W  
                        <br />
                        <b>USA/Nevada</b></td>
                </tr> 
			      
                <tr>
                    <td valign="top">
                     Jefferson Needle</td>
                    <td  valign="top">
                         12,630  ft<br />(3,850 m)</td>
                    <td valign="top">
                         <ol>
                       <li>June 29, 2013</li>
							 </ol></td>
                    <td>
                           38.98520N / 114.30566W 
                        <br />
                        <b>USA/Nevada</b></td>
                </tr> 
                <tr>
                    <td valign="top">
                     Wheeler Peak</td>
                    <td  valign="top">
                          13,063 ft<br />(3,982 m)</td>
                    <td valign="top">
                         <ol>
                       <li>June 29, 2013</li>
							 </ol></td>
                    <td>
                          38.98610N / 114.3125W 
                        <br />
                        <b>USA/Nevada</b></td>
                </tr> 
			
                <tr>
                    <td valign="top">
                       Teewinot Mtn</td>
                    <td  valign="top">
                          12,325 ft<br />(3,757 m)</td>
                    <td valign="top">
                         <ol>
                       <li>June 21, 2013</li>
							 </ol></td>
                    <td>
                        43.74720N / 110.7792W 
                        <br />
                        <b>USA/Wyoming</b></td>
                </tr> 
                <tr>
                    <td valign="top">
                        El Capitan Peak</td>
                    <td  valign="top">
                          8,085 ft<br />(2,464 m)</td>
                    <td valign="top">
                         <ol>
                       <li>June 8, 2013</li>
							 </ol></td>
                    <td>
                        31.87700N / 104.858W 
                        <br />
                        <b>USA/Texas</b></td>
                </tr> 
                <tr>
                    <td valign="top">
                        Guadalupe Peak</td>
                    <td  valign="top">
                          8,749 ft<br />(2,667 m)</td>
                    <td valign="top">
                         <ol>
                       <li>June 8, 2013</li>
							 </ol></td>
                    <td>
                        31.89140N / 104.86W 
                        <br />
                        <b>USA/Texas</b></td>
                </tr> 
                <tr>
                    <td valign="top">
                        Deseret Peak</td>
                    <td  valign="top">
                        11,031 ft<br />(3,362 m)</td>
                    <td valign="top">
                         <ol>
                       <li>July 22, 2006</li>
                       <li>June 1, 2013</li>
							 </ol></td>
                    <td>
                        40.45970N / 112.6263W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>    			     
                <tr>
                    <td valign="top">
                        Wheeler Peak</td>
                    <td  valign="top">
                        13,161 ft<br />(4,003 m)</td>
                    <td valign="top">
                    <ol>
						<li>April 27, 2013</li>
                    </ol>
                    </td>
                    <td valign="top">36.56250N / 105.414W 
                        <br />
                        <b>USA/New Mexico</b></td>
                </tr>     
			    			     
                <tr>
                    <td valign="top">
                       Mount Walter</td>
                    <td  valign="top">
                        13,141 ft<br />(4,011 m)</td>
                    <td valign="top">
                    <ol>
						<li>April 27, 2013</li>
                    </ol>
                    </td>
                    <td valign="top">36.55670N / 105.4164W 
                        <br />
                        <b>USA/New Mexico</b></td>
                </tr>              
                <tr>
                    <td valign="top">
                        Little Water Peak</td>
                    <td  valign="top">
                        9,605 ft<br />(2,928 m)</td>
                    <td valign="top">
                    <ol>
                        <li>March 9, 2013</li>
                    </ol>
                    </td>
                    <td valign="top">40.67190N / 111.6277W 
                        <br />
                        <b>USA/Utah</b></td>
                </tr>              
                  
                <tr>
                    <td valign="top">
                        Lake Mountain</td>
                    <td  valign="top">
                        7,690 ft<br />(2,344  m)</td>
                    <td valign="top">
                    <ol>
                        <li>Feb 3, 2013</li>
                    </ol>
                    </td>
                    <td valign="top">40.27500N / 111.9398W 
                        <br />
                        <b>USA/Utah</b></td>
                </tr>     
                <tr>
                    <td valign="top">
                       North Timpanogos</td>
                    <td  valign="top">
                        11,441 ft<br />(3,487 m)</td>
                    <td valign="top">
                    <ol>
                        <li><a href="http://www.summitpost.org/trip-report/410266/Climbing-North-Timpanogos-via-the-Cold-Fusion-Couloir-May-31-2008.html" target="_blank">May 31, 2008</a> via Cold Fusion Couloir</li>
                        <li>May 9, 2009 via Cold Fusion Couloir</li>
                        <li>June 15, 2010 via Grunge Couloir</li>
                        <li>May 16, 2011 via Grunge Couloir</li> 
			            <li>April 21, 2012 via Cold Fusion Couloir</li>                                      
                        <li>October 26, 2012</li>
                    </ol>
                    </td>
                    <td valign="top">
                        40.41620N / 111.6669W<br />
                        <b>USA/Utah</b></td>
                </tr>            
                               
                <tr>
                    <td valign="top">
                        Bomber Peak</td>
                    <td  valign="top">
                         11,347 ft<br />(3,459 m)</td>
                    <td valign="top">
                    <ol>
                        <li>October 18, 2008</li>                                         
                        <li>October 26, 2012</li>
                        </ol>
                    </td>
                    <td valign="top">
                       40.40417N / 111.65778W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>                  
                <tr>
                    <td valign="top">
                        South Timpanogos / Second Summit</td>
                    <td  valign="top">
                        11,722 ft<br />(3,573 m) </td>
                    <td valign="top">
                    <ol>
                       <li> August 9, 2008</li>
                        <li> July 4, 2010</li>                    
                        <li>October 26, 2012</li>
                    </ol>
                    </td>
                    <td>
                         40.38442N / 111.63645W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>  
   
                <tr>
                    <td valign="top">
                        Buffalo Peak</td>
                    <td  valign="top">
                        8,029 ft<br />(2,447 m)</td>
					<td valign="top">
                    <ol>
                        <li>April 15, 2012</li>
                        <li>Oct 21, 2012</li>
                    </ol>
					</td>
                    <td>
                        40.28280N / 111.61672W<br />
                        <b>USA/Utah</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Provo Peak</td>
                    <td  valign="top">
                        11,068 ft<br />(3,374 m)
                    </td>
                    <td valign="top">
                    <ol>
                        <li>September 30, 2006</li>
                        <li>August 11, 2008</li>
                        <li>June 20, 2009</li>
                        <li>September 29, 2012</li>
                    </ol>
                    </td>
                    <td>
                        40.24400N / 111.556W<br />
                        <b>USA/Utah</b></td>
                </tr>
        <tr>
                    <td valign="top">Ben Lomond</td>
                    <td  valign="top">9,712 ft<br />(2,960 m)</td>
                    <td valign="top">
                        <ol>
                            <li>Sept 8, 2012</li>
                        </ol>
                    </td>
                    <td valign="top">
                        41.36315N / 111.96068W 
                        <br />
                        <b>USA/Utah</b></td>
                </tr>     
                <tr>
                    <td valign="top">Willard Peak</td>
                    <td  valign="top">9,764 ft<br />(2,976 m)</td>
                    <td valign="top">
                        <ol>
                            <li>Sept 8, 2012</li>
                        </ol>
                    </td>
                    <td valign="top">
                        41.38299N / 111.97429W 
                        <br />
                        <b>USA/Utah</b></td>
                </tr>       
                <tr>
                    <td valign="top">Crystal Peak</td>
                    <td  valign="top">7,106 ft<br />(2,167 m)</td>
                    <td valign="top">
                        <ol>
                            <li>Sept 2, 2012</li>
                        </ol>
                    </td>
                    <td valign="top">
                        38.79080N / 113.6003W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>             
                <tr>
                    <td valign="top">Notch Peak</td>
                    <td  valign="top">9,654 ft<br />(2,943 m)</td>
                    <td valign="top">
                        <ol>
                            <li>Sept 1, 2012</li>
                        </ol>
                    </td>
                    <td valign="top">
                        39.14300N / 113.409W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>     
                <tr>
                    <td valign="top">Granite Peak</td>
                    <td  valign="top">12,799 ft<br />(3,901 m)</td>
                    <td valign="top">
                        <ol>
                            <li>August 18, 2012</li>
                        </ol>
                    </td>
                    <td valign="top">
                        45.16330N / 109.8072W
                        <br />
                        <b>USA/Montana</b></td>
                </tr>     
                <tr>
                    <td valign="top">
                        Devil's Castle<br /><i></i></td>
                    <td  valign="top">10,920 ft<br />(3,328 m)</td>
                    <td valign="top">
                        <ol>
                        <li>March 22, 2008 - East Castle [Peak] 10,880 ft (3,316 m)</li>
                        <li>April 5, 2008- East Castle [Peak] 10,880 ft (3,316 m)</li>
                        <li>August 11, 2012 - via Portable Darkness route</li>
                        </ol>
                    </td>
                    <td valign="top">
                        40.56603N / 111.61101W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>   
                <tr>
                    <td valign="top">
                        Mount Ogden</td>
                    <td  valign="top">
                       9,572  ft<br />2,918  m</td>
                    <td valign="top">
                    <ol>
                        <li>July 28, 2012</li>
			        </ol>
                    </td>
                    <td valign="top">
                       41.20000N / 111.882W<br />
                        <b>USA/Utah</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Grand Teton</td>
                    <td  valign="top">
                       13,770 ft<br />4,197 m</td>
                    <td valign="top">
                    <ol>
                        <li>July 21, 2012</li>
			        </ol>
                    </td>
                    <td valign="top">
                       43.74110N / 110.802W<br />
                        <b>USA/Wyoming</b></td>
                </tr>    
                <tr>
                    <td valign="top">
                        London Spire</td>
                    <td  valign="top">
                       ~8,400? ft<br />(2,560 m)</td>
                    <td valign="top">
                    <ol>
                        <li>July 7, 2012</li>
			        </ol>
                    </td>
                    <td valign="top">
                        41.39883N?/111.99862W?<br />
                        <b>USA/Utah</b></td>
                </tr>    
                <tr>
                    <td valign="top">
                        Lone Peak</td>
                    <td  valign="top">
                        11,253 ft<br />(3,430 m)</td>
                    <td valign="top">
                    <ol>
                        <li>August 23, 2007 -- Schoolhouse Springs Route
                            <br />
                        <i>Bagged West, South, and North Peaks</i></li>
                        <li>March 2, 2010 -- North Peak.</li>
			            <li>May 5, 2011 -- via NE Coulior.</li>
						<li>June 29 & 30, 2012 -- Rock Climbing.</li>
			        </ol>
                    </td>
                    <td valign="top">
                        40.52688N / 111.75628W<br />
                        <b>USA/Utah</b></td>
                </tr>    
          <tr>
                    <td valign="top">
                       Ibapah Peak</td>
                    <td  valign="top">
                        12,087 ft<br />(3,684 m)</td>
                    <td valign="top">
                    <ol>
                       <li>June 23, 2012</li>
                    </ol></td>
                    <td>
                        39.8282N / 113.919W
                        <br />
                        <b>USA/Utah</b></td>
                </tr> 
                <tr>
                    <td valign="top">
                        South Thunder
                        </td>
                    <td  valign="top">
                    11,154 ft<br />(3,400 m)
                        </td>
                    <td valign="top">
                        <ol>
                        <li>June 14, 2008</li>
                        <li>May 19, 2012</li>
                        </ol> </td>
                    <td>
                        40.53330N / 111.734W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr>              
                <tr>
                    <td valign="top">
                        Chipman Peak</td>
                    <td  valign="top">
                        10,954 ft<br />(3,339 m)
                    </td>
                    <td valign="top">
                    <ol>
                    <li>July 31, 2009</li>
                    <li>May 19, 2012</li>
                    </ol>
                        </td>
                    <td>
                        40.522600N / 111.723W<br />
                        <b>USA/Utah</b></td>
                </tr>      
                <tr>
                    <td valign="top">
                        Upwop</td>
                    <td  valign="top">
                       11,137 ft<br />(3,395 m)
                        </td>
                    <td valign="top">   
                    <ol>
                        <li>May 19, 2012</li>
                    </ol>                 
                    </td>
                    <td valign="top">
                        40.53262N / 111.71302W
                        <br />
                        <b>USA/Utah</b>                  
                    </td>
                </tr>                
                <tr>
                    <td valign="top">
                        Pfeifferhorn</td>
                    <td  valign="top">
                        11,326 ft<br />(3,452 m)
                        </td>
                    <td valign="top">   
                    <ol>
                        <li><a href="http://www.summitpost.org/trip-report/340703/An-Overnight-Trip-Up-Pfeifferhorn-via-the-East-Ridge.html" target="_blank">September 15, 2007</a></li>
                        <li>July 31, 2009</li>
                        <li>June 5, 2010</li>
                        <li>May 19, 2012</li>
                    </ol>                 
                    </td>
                    <td valign="top">
                        40.53370N / 111.7052W
                        <br />
                        <b>USA/Utah</b>                  
                    </td>
                </tr>          
                <tr>
                    <td valign="top">
                        Box Elder Peak
                        </td>
                    <td  valign="top">
                     11,101 ft<br />(3,384 m) 
                        </td>
                    <td valign="top">
                    <ol>
                        <li>June 21, 2008</li>
                        <li>March 20, 2010</li>
                        <li>May 5, 2012</li>
                    </ol>
                    </td>
                    <td>
                        40.49000N / 111.696W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr>               
                <tr>
                    <td valign="top">
                        Loafer Peak</td>
                    <td  valign="top">
                        10,687 ft<br />(3,257 m)</td>
                    <td valign="top">
                        April 7, 2012</td>
                    <td>
                        39.97620N / 111.6153W<br />
                        <b>USA/Utah</b></td>
                </tr>

                <tr>
                    <td valign="top">
                        Santaquin Peak</td>
                    <td  valign="top">
                        10,685 ft<br />(3,257 m)</td>
					<td valign="top">
						<ol>
						<li>July 29, 2006</li>
						<li>April 7, 2012</li>
						</ol>
					</td>
                    <td>
                        39.98300N / 111.623W<br />
                        <b>USA/Utah</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Reynolds Peak</td>
                    <td  valign="top">
                        9422 ft<br />(2,872 m)</td>
                    <td valign="top">
                    <ol>
                    <li>March 10, 2012</li>
                    <li>March 17, 2012</li>
                    </ol>
                   </td>
                    <td>
                         40.66220N / 111.6458W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>                          
                <tr>
                    <td valign="top">
                       Mt. Whitney
                    </td>
                    <td valign="top">
                        14,497 ft<br />(4,080 m)</td>
                    <td valign="top">
                        Sept 23, 2011 (via the East Buttress)
                     </td>
                     <td>
                        36.57860N / 118.293W<br />
                        <b>USA/California</b>
                    </td>
                </tr>              
                <tr>
                    <td valign="top">
                       First Gemini
                    </td>
                    <td  valign="top">
                        13,387 ft<br />(4,080 m)</td>
                    <td valign="top">
                        Sept 4, 2011
                     </td>
                     <td>
                        40.75319N / 110.35921W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr>         
                <tr>
                    <td valign="top">
                       Second Gemini
                    </td>
                    <td  valign="top">
                        13,306 ft<br />(4,056 m)</td>
                    <td valign="top">
                        Sept 4, 2011
                     </td>
                     <td>
                        40.75512N / 110.36912W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr>      
                <tr>
                    <td valign="top">
                       South Kings Peak
                    </td>
                    <td  valign="top">
                        13,512 ft<br />(4,118 m)</td>
                    <td valign="top">
                        Sept 4, 2011
                     </td>
                     <td>
                        40.76580N / 110.3778W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr>   
             
                <tr>
                    <td valign="top">
                       Bald Mountain
                        </td>
                    <td  valign="top">
					11,947 ft ft<br />(3,641 m)</td>
                    <td valign="top">
                            July 15, 2011</td>
                            <td valign="top">
                            40.69900N / 110.902W
                        <br />
                        <b>USA/Utah</b>
                    </td>
                </tr>      
                <tr>
                    <td valign="top">
                        Cascade
                        </td>
                    <td  valign="top">
					<li>10,908 ft<br />(3,325 m) (North Peak)
                   <li>10,761 ft<br />(3,280 m) (South Peak)
                        </td>
                    <td valign="top">
                    <ol> 
                        <li><a href="http://www.summitpost.org/trip-report/344138/South-Peak-of-Cascade-Via-Big-Springs-and-South-Ridge.html" target="_blank">July 14, 2007</a> <i>South Peak</i> via Big Springs</li>
                       <li>June 11, 2008 <i>North Peaks (both)</i> via Upper Pole Coulior</li>
                       <li>January 12, 2011 <i>North Peak</i></li>                          
                       <li>July 2, 2011 <i>North Peak</i></li>                      
					</ol>
                    </td>
                    <td valign="top">
                        40.30700N / 111.588W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr>                                                                      
                <tr>
                    <td valign="top">
                        Broads Fork Twin Peaks</td>
                    <td  valign="top">
                        11,330 ft<br />(3,453 m)</td>
                    <td valign="top">
                    <ol>
                        <li>September 6, 2008</li>
                        <li>May 16, 2009</li>
			            <li>May 27, 2011</li>
                        </ol>
                     </td>
                    <td>
                        40.59390N / 111.7203W<br />
                        <b>USA/Utah</b></td>
                </tr>        
                <tr>
                    <td valign="top">
                        Sunrise Peak</td>
                    <td  valign="top">
                        11,275 ft<br />(3,437 m)</td>
                    <td valign="top">
                    <ol>
                        <li>May 16, 2009</li>
			            <li>May 27, 2011</li>
                    </ol>
                    </td>
                    <td>
                        40.59110N / 111.7105W<br />
                        <b>USA/Utah</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Mt. Dromedary</td>
                    <td  valign="top">
                        11,107 ft<br />(3,385 m) </td>
                    <td valign="top">
                    <ol>
                        <li>May 10, 2008</li>
                        <li>May 16, 2009</li>
			            <li>May 27, 201l</li>
                    </ol>
                    </td>
                    <td>
                         40.59310N / 111.7061W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>

              <tr>
                    <td valign="top">
                        Corral Mountain</td>
                    <td  valign="top">
						10,435 ft <br /> (3,181 m)</td>
                    <td valign="top">                       
						March 18, 2011</td>
                    <td valign="top">
						40.22850N / 111.55402W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>  
                <tr>
                    <td valign="top">
                        Flagstaff Mountain</td>
                    <td  valign="top">
                        10,651 ft<br />(3,246 m)
                        <br />
                        <i>The Higher Peak</i></td>
                    <td valign="top">
                    <ol>
			            <li>January 10, 2009</li>
			            <li>Feb 12, 2011 (ski tour, not highest peak)</li>
                    </ol>
                    </td>
                    <td valign="top">
                        N 40.60493 W 111.64448
                        <br />
                        This peak is 471 m NxNE (14°) of what the USGS labels as Flagstaff Mountain.                        
                        <br />
                        <b>USA/Utah</b></td>
                </tr>

              <tr>
                    <td valign="top">
                        Flat Top Mountain</td>
                    <td  valign="top">
						10,620 ft <br />(3,237 m)</td>
                    <td valign="top">                       
						February 12, 2011</td>
                    <td valign="top">
						40.37260N / 112.1881W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>     

              <tr>
                    <td valign="top">
                        Lewiston Peak</td>
                    <td  valign="top">
						10,411 ft <br/>(3,173 m)</td>
                    <td valign="top">                       
						February 12, 2011</td>
                    <td valign="top">
						40.36021N / 112.19393W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>           
                <tr>
                    <td valign="top">
                       Humphreys Peak</td>
                    <td  valign="top">
                        12,633 ft <br />(3,851 m) 
                        </td>
                    <td valign="top">  
                   November 18, 2010</td>
                    <td valign="top">
                        35.3464N/111.6778W
                        <br />
                        <b>USA/Arizona</b></td>
                </tr>
                <tr>
                    <td valign="top">
                       West Mountain</td>
                    <td  valign="top">
                        9,070 ft<br />(2,765 m) 
                        </td>
                    <td valign="top"> 
                    <ol>
                        <li>July 7, 2007 -- Drove up!</li>
                        <li>August 17, 2010 -- Drove up and walked to summit</li>
                    </ol> 
                    </td>
                    <td valign="top">
                        40.50000N/112.17607W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>

 		<tr>
                    <td valign="top">
                       Lightening Peak</td>
                    <td  valign="top">
                        10,055 ft<br />(3,065  m)
                        </td>
                    <td valign="top">   
                       August 13, 2010
                        </td>
                    <td valign="top">
                       40.28218N / 111.52186W 
                        <br />
                        <b>USA/Utah</b>                  
                    </td>
                </tr>

                <tr>
                    <td valign="top">
                       Mt Rainier</td>
                    <td  valign="top">
                        14,411 ft<br />(4,392 m) </td>
                    <td valign="top">
                        July 17, 2010
                    <td>
                         46.85280N / 121.759W
                        <br />
                        <b>USA/Washington</b></td>
                </tr>    
                <tr>
                    <td valign="top">
                       Mt Hood</td>
                    <td  valign="top">
                        11,239 ft<br />(3,426 m) </td>
                    <td valign="top">
                        July 12, 2010</td>
                    <td>
                         45.37360N / 121.6925W
                        <br />
                        <b>USA/Oregon</b></td>
                </tr>  
                <tr>
                    <td valign="top">
                       Obelisk</td>
                    <td  valign="top">
                        10,516 ft<br />(3,205 m)
                        </td>
                    <td valign="top">   
                       June 5, 2010
                        </td>
                    <td valign="top">
                       40.54511N / 111.70795W
                        <br />
                        <b>USA/Utah</b>                  
                    </td>
                </tr>
              <tr>
                    <td valign="top">
                        Mount Nebo                        
                        </td>
                    <td  valign="top">
                        11,928 ft<br />(3,636 m)
                        </td>
                    <td valign="top">   
                    <ol>
                        <li>October 15, 2005 (<i>South Peak</i>)</li>
                        <li>September 3, 2007 (<i>North Peak</i>)</li>
                        <li>November 1, 2008 -- <a target="_blank" href="http://www.summitpost.org/trip-report/462959/The-Triple.html">traversed all three peaks from North to South</a></li>
                        <li>May 8, 2010 (<i>North Peak</i>)</li>
                    </ol>
                    </td>
                    <td valign="top">
                        39.81080N / 111.7644W
                        <br />
                        <b>USA/Utah</b>
                        <br />
                        Highest peak in the Wasatch range.                        
                    </td>
                </tr>         
                <tr>
                    <td valign="top">
                        Elephant Butte
                        </td>
                    <td  valign="top">
                      5,653 ft<br />(1,723 m)
                        </td>
                    <td valign="top">April 11, 2010</td>
                    <td>
                        38.69580N / 109.5401W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr> 
                <tr>
                    <td valign="top">
                        Kessler Peak</td>
                    <td  valign="top">
                        10,403 ft<br />(3,171 m)</td>
                    <td valign="top">March 16, 2010</td>
                    <td>
                       40.62520N / 111.668W<br />
                        <b>USA/Utah</b></td>
                </tr>    
                <tr>
                    <td valign="top">
                        Spanish Fork Peak</td>
                    <td  valign="top">
                        10,192 ft<br />(3,107 m)</td>
                    <td valign="top">
                    <ol>
                        <li>August 26, 2006</li>
                        <li>November 7, 2009</li>
                        <li>March 6, 2010 via Crowd Ridge</li>
                     </ol>
                    </td>
                    <td>
                        40.08800N / 111.527W<br />
                        <b>USA/Utah</b></td>
                </tr>      
                <tr>
                    <td valign="top">
                        Peak 10009</td>
                    <td  valign="top">
                        10,009 ft<br />(3,051 m)</td>
                    <td valign="top">
                        Jan 23, 2010</td>
                    <td>
                        40.63832N / 111.57745W<br />
                        <b>USA/Utah</b></td>
                </tr>           
                <tr>
                    <td valign="top">
                        Gobblers Knob</td>
                    <td  valign="top">
                        10,246 ft<br />(3,123 m)</td>
                    <td valign="top">
                    <ol>
                        <li>November 28, 2009</li>
                        <li>Jan 16, 2010 (Peak 10,224)</li>
                    </ol>
                    </td>
                    <td>
                        40.67080N / 111.683W<br />
                        <b>USA/Utah</b></td>
                </tr> 
                <tr>
                    <td valign="top">
                        Mt. Massive</td>
                    <td  valign="top">
                        14,421 ft<br />(4,396 m)
                        </td>
                    <td valign="top">   
                       September 19, 2009                
                     </td>
                    <td valign="top">
                        39.18720N / 106.4747W
                        <br />
                        <b>USA/Colorado</b>                  
                    </td>
                </tr>          
                <tr>
                    <td valign="top">
                        Mt. Elbert</td>
                    <td  valign="top">
                        14,433 ft<br />(4,399 m)
                        </td>
                    <td valign="top">   
                       September 18, 2009                
                     </td>
                    <td valign="top">
                        39.11780N / 106.4447W
                        <br />
                        <b>USA/Colorado</b>                  
                    </td>
                </tr>      
                <tr>
                    <td valign="top">
                        Borah Peak</td>
                    <td  valign="top">
                        12,662 ft<br />(3,859 m)
                        </td>
                    <td valign="top">   
                       September 5, 2009                
                     </td>
                    <td valign="top">
                        44.13720N / 113.7794W
                        <br />
                        <b>USA/Idaho</b>                  
                    </td>
                </tr>      
                <tr>
                    <td valign="top">
                        Gannett Peak</td>
                    <td  valign="top">
                        13,804 ft<br />(4,207 m)
                        </td>
                    <td valign="top">   
                        August 19, 2009                
                     </td>
                    <td valign="top">
                        43.18440N / 109.653W
                        <br />
                        <b>USA/Wyoming</b>                  
                    </td>
                </tr>                    
                <tr>
                    <td valign="top">
                        Angels Landing</td>
                    <td  valign="top">
                        5,785 ft<br />(1,763 m)
                    </td>
                    <td valign="top">
                        July 24, 2009</td>
                    <td>
                        37.26940N / 112.9486W<br />
                        <b>USA/Utah</b></td>
                </tr> 
                <tr>
                    <td valign="top">
                        North Peak</td>
                    <td  valign="top">
                        11,174 ft<br />(3,406 m)
                    </td>
                    <td valign="top">
                        June 27, 2009</td>
                    <td>
                        39.83850N / 111.7496W<br />
                        <b>USA/Utah</b></td>
                </tr> 
                <tr>
                    <td valign="top">
                        East Peak</td>
                    <td  valign="top">
                        11,044 ft<br />(3,366 m)
                    </td>
                    <td valign="top">
                        June 20, 2009</td>
                    <td>
                        40.24819N / 111.54659W<br />
                        <b>USA/Utah</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Red Baldy</td>
                    <td  valign="top">
                        11,171 ft<br />(3,405 m)</td>
                    <td valign="top">
                    <ol>
                        <li>December 6, 2008</li>
                        <li>June 6, 2009</li>
                    </ol>
                    </td>
                    <td valign="top">
                        40.53950N / 111.6681W
                        <br />
                        <b>USA/Utah</b>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                       White Baldy</td>
                    <td  valign="top">
                        11,321 ft<br />(3,451 m)</td>
                    <td valign="top">
                        June 6, 2009</td>
                    <td valign="top">
                        40.53300N / 111.6805W
                        <br />
                        <b>USA/Utah</b>
                    </td>
                </tr>     
                <tr>
                    <td valign="top">
                        Grand Canyon<br />R2R2R</td>
                    <td  valign="top">
                        8,421 ft<br />(2,512 m)<br /><i>North Rim</i></td>
                    <td valign="top">
                        May 30 - June 1, 2009</td>
                    <td valign="top">
                        36.19746N/112.05196W<br />
                        <b>USA/AZ</b></td>
                </tr>            
                <tr>
                    <td valign="top">
                        Mt. Shasta</td>
                    <td  valign="top">
                        14,162 ft<br />(4,317 m)</td>
                    <td valign="top">
                        May 23, 2009</td>
                    <td>
                        41.40940N / 122.1939W<br />
                        <b>USA/CA</b></td>
                </tr>              
                <tr>
                    <td valign="top">
                        North Thunder
                        </td>
                    <td  valign="top">
                    11,150 ft<br />(3,399 m)
                        </td>
                    <td valign="top">
                        May 6, 2009 </td>
                    <td>
                        40.54350N / 111.7314W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr> 
                <tr>
                    <td valign="top">
                       Silver Peak</td>
                    <td  valign="top">
                        10,006 ft<br />(3,050 m)</td>
                    <td valign="top">
                       <ol>
                       <li>Febraury 2(?), 2008</li>
                       <li>April 11, 2009</li>
                     </ol>
                     </td>
                    <td>
                         40.65199N / 111.59363W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>  
                
                <tr>
                    <td valign="top">
                       Peak 9990</td>
                    <td  valign="top">
                        9,990 ft<br />(3,046 m)</td>
                    <td valign="top">
                       <ol>
                       <li>Febraury 2(?), 2008</li>
                       <li>April 11, 2009</li>
                       </ol>
                    </td>
                    <td>
                         40.65896N / 111.59646W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>  
                
                <tr>
                    <td valign="top">
                       Bald Mountain East</td>
                    <td  valign="top">
                        10,006 ft<br />(3,050 m)</td>
                    <td valign="top">
                        March 7, 2009</td>
                    <td>
                         40.39895N / 112.26431W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>  
                <tr>
                    <td valign="top">
                       Jupiter Hill</td>
                    <td  valign="top">
                        9,998 ft<br />(3,047 m)</td>
                    <td valign="top">
                        February 28, 2009</td>
                    <td>
                         40.61340N / 111.54003W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>  
                <tr>
                    <td valign="top">
                        Lowe Peak</td>
                    <td  valign="top">
                        10,589 ft<br />(3,228 m)</td>
                    <td valign="top">February 7, 2009
                    </td>
                    <td valign="top">
                       40.42560N / 112.1989W                     
                        <br />
                        <b>USA/Utah</b></td>
                </tr>    
                <tr>
                    <td valign="top">
                        Peak 8753</td>
                    <td  valign="top">
                        8,753 ft<br />(2,668 m)</td>
                    <td valign="top">January 3, 2009
                    </td>
                    <td valign="top">
                        40.25228N / 111.58543W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>                             
                  
                <tr>
                    <td valign="top">
                        Roberts Horn</td>
                    <td  valign="top">
                        10,993 ft<br />(3,351 m) </td>
                    <td valign="top">
                        August 9, 2008</td>
                    <td>
                         40.39971N / 111.63744W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>   
                <tr>
                    <td valign="top">
                        Big Baldy</td>
                    <td  valign="top">
                        8,756 ft<br />(2,669 m) </td>
                    <td valign="top">
                       <ol>
                       <li>May 26, 2008 (south peak)</li>
                        <li>August 5, 2008 (traversed "both" peaks)</li>
                        </ol>
                    </td>
                    <td>
                         40.3663N /111.6551W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>    
                <tr>
                    <td valign="top">
                        Sunset Peak</td>
                    <td  valign="top">
                        10,648 ft<br />(3,246 m)</td>
                    <td valign="top">
                    <ol>
                        <li>April 5, 2008</li>
                        <li>August 2, 2008</li>
                        </ol>
                    </td>
                    <td valign="top">
                        40.57710N / 111.5938W
                        <br />
                        <b>USA/Utah</b></td>
                </tr> 
                <tr>
                    <td valign="top">
                       Henrys Fork Peak
                    </td>
                    <td  valign="top">
                        13,260 ft<br />(4,042 m)</td>
                    <td valign="top">
                       July 26, 2008</td>
                    <td>
                        40.78780N / 110.3898W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr>
                
                <tr>
                    <td valign="top">
                       West Gunsight (Dome) Peak
                    </td>
                    <td  valign="top">
                        13,103 ft<br />(3,994 m)</td>
                    <td valign="top">
                       July 26, 2008</td>
                    <td>
                        40.79290N / 110.3666W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr>
                
                <tr>
                    <td valign="top">
                       Gunsight Peak
                    </td>
                    <td  valign="top">
                        13,263 ft<br />(4,043 m)</td>
                    <td valign="top">
                       July 25, 2008</td>
                    <td>
                        40.8032N / 110.3517W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr>
                
                <tr>
                    <td valign="top">
                       Gilbert Peak
                    </td>
                    <td  valign="top">
                        13,442 ft<br />(4,097 m)</td>
                    <td valign="top">
                       July 25, 2008</td>
                    <td>
                        40.8235N / 110.3396W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                       American Fork Twin Peaks
                        </td>
                    <td  valign="top">
                     11,489 ft<br />(3,502 m) 
                        </td>
                    <td valign="top">
                        July 18, 2008 (both the west and the east)</td>
                   <td>
                        40.55170N / 111.6561W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr> 
                
                
                <tr>
                    <td valign="top">
                       Red Top Mountain
                        </td>
                    <td  valign="top">
                     11,360 ft<br />(3,463 m) 
                        </td>
                    <td valign="top">
                        July 18, 2008 (enroute to Twin Peaks)</td>
                   <td>
                        40.54911N / 111.66178W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr> 
                
                <tr>
                    <td valign="top">
                       Crowsnest Mountain
                        </td>
                    <td  valign="top">
                     9,137 ft<br />(2,785 m) 
                        </td>
                    <td valign="top">
                        July 12, 2008 </td>
                    <td>
                        49.63330N / 114.533W<br />
                        <b>Canada/Alberta</b>
                    </td>
                </tr> 
                <tr>
                    <td valign="top">
                       Mount Crandell
                        </td>
                    <td  valign="top">
                     7,812 ft<br />(2,381 m) 
                        </td>
                    <td valign="top">
                        July 10, 2008 </td>
                    <td>
                        49.07639N / 113.92778W<br />
                        <b>Canada/Alberta</b>
                    </td>
                </tr> 
                
                <tr>
                    <td valign="top">
                       Turtle Mountain
                        </td>
                    <td  valign="top">
                     7,250  ft<br />(2,210 m) 
                        </td>
                    <td valign="top">
                        July 7, 2008 </td>
                    <td>
                        49.57500N / 114.4139W<br />
                       <b>Canada/Alberta</b>
                    </td>
                </tr> 
                
                <tr>
                    <td valign="top">
                        Vimy Peak
                        </td>
                    <td  valign="top">
                     7,805 ft<br />(2,379 m) 
                        </td>
                    <td valign="top">
                        July 5, 2008 </td>
                    <td>
                        49.03750N / 113.85694W<br />
                        <b>Canada/Alberta</b>
                    </td>
                </tr>      
                
                <tr>
                    <td valign="top">
                        Bighorn (Upper Bells) Peak
                        </td>
                    <td  valign="top">
                     10,877 ft<br />(3,315 m)
                        </td>
                    <td valign="top">
                        June 14, 2008 </td>
                    <td>
                        40.52270N / 111.7434W<br />
                        <b>USA/Utah</b>
                    </td>
                </tr>  
               <tr>
                    <td valign="top">
                       West Mountain 2</td>
                    <td  valign="top">
                        6,904 ft<br />(2,104 m)</td>
                    <td valign="top">
                       June 7, 2008</td>
                    <td valign="top">
                        40.05528N / 111.82782W<br />
                        <b>USA/Utah</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Mahogany Mountain</td>
                    <td  valign="top">
                        9,001 ft<br />(2,744 m)</td>
                    <td valign="top">
                        May 17, 2008</td>
                    <td>
                         40.40984N / 111.71345W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>  
                <tr>
                    <td valign="top">
                        Peak 420 (aka Peak 10,420)</td>
                    <td  valign="top">
                        10,420 ft<br />(3,176 m)</td>
                    <td valign="top">
                        May 3, 2008</td>
                    <td>
                        40.60001N / 111.55839W
                        <br />
                        (1.0 km N 8 as the crow flies from Clayton Peak)
                        <br />
                        <b>USA/Utah</b>
                        <br />
                       Summitted it along with 3 other peaks.</td>
                </tr>
                <tr>
                    <td valign="top">
                        Mount Majestic (Clayton Peak)</td>
                    <td  valign="top">
                        10,721 ft<br />(3,268 m)</td>
                    <td valign="top">
                        May 3, 2008</td>
                    <td>
                        40.59070N / 111.5602W
                        <br />
                        <b>USA/Utah</b>
                        <br />
                       Summitted it along with 3 other peaks.</td>
                </tr>
                <tr>
                    <td valign="top">
                        Preston Peak</td>
                    <td  valign="top">
                        10,315 ft<br />(3,144 m)</td>
                    <td valign="top">
                        May 3, 2008</td>
                    <td>
                        40.58208N / 111.57208W
                        <br />
                        <b>USA/Utah</b>
                        <br />
                       Summitted it along with 3 other peaks.</td>
                </tr>
                <tr>
                    <td valign="top">
                        Pioneer Peak</td>
                    <td  valign="top">
                        10,447 ft<br />(3,184 m)</td>
                    <td valign="top">
                        May 3, 2008</td>
                    <td>
                        40.58090N / 111.5894W<br />
                        <b>USA/Utah</b>
                        <br />
                       Summitted it along with 3 other peaks.</td>
                </tr>
                <tr>
                    <td valign="top">
                        Sugarloaf Peak</td>
                    <td  valign="top">
                        11,051 ft<br />(3,368 m)</td>
                    <td valign="top">
                        April 26, 2008</td>
                    <td>
                        40.56600N / 111.624W<br />
                        <b>USA/Utah</b>
                        <br />
                       Skinned up the weekend after Alta closed for the 2008 season.
                        Skied down Devils Castle.</td>
                </tr>
                <tr>
                    <td valign="top">
                        Mount Baldy</td>
                    <td  valign="top">
                        11,068 ft<br />(3,374 m)</td>
                    <td valign="top">
                    <ol>
                        <li>April 7, 2007</li>
                        <li>April 12, 2008</li>
                        <li>April 18, 2008</li>
                     </ol>
                     </td>
                    <td>
                        40.56790N / 111.6375W<br />
                        <b>USA/Utah</b>
                        <br />
                        Mount Baldy is the summit that divides<br />
                        Alta and Snowbird ski resorts.<br />
                        I skied down the "main" chute April 7, 2007. April 12, 2008 skied the "shoulder", and April 18, 2008 I skied the little chute.
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Shingle Mill Peak</td>
                    <td  valign="top">
                        9089 ft<br />(2,770 m)  
                        </td>
                    <td valign="top">                       
                        November 9, 2007</td>
                    <td valign="top">
                        40.26934N / 111.54024W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>           
              <tr>
                    <td valign="top">
                        Freedom Peak</td>
                    <td  valign="top">
                        9,506 ft<br />(2,897 m) 
                        </td>
                    <td valign="top">                       
                        November 9, 2007</td>
                    <td valign="top">
                        40.26100N / 111.5448W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>
              <tr>
                    <td valign="top">
                        Buckley Mountain</td>
                    <td  valign="top">
                        9,506 ft<br />(2,897 m) 
                        </td>
                    <td valign="top">                       
                        October 12, 2007</td>
                    <td valign="top">
                        40.21382N / 111.58848W
                        <br />
                        <b>USA/Utah</b></td>
                </tr>               

                <tr>
                    <td valign="top">
                        Bear's Hump</td>
                    <td  valign="top">
                        5,050 ft<br />(1,539 m)</td>
                    <td valign="top">
                        July 4, 2006</td>
                    <td>
                    49.076389N / 113.927778W <!-- Latitude49; 04; 35 | Longitude 113; 55; 40 -->
                        <br />
                        <b>Canada/Alberta</b>
                        <br />
                        A <b>prominent outcropping</b> on Mount Crandell 
                        <br />
                        Climbed countless times over
                        <br />
                        my life time.
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Chief Mountain
                    </td>
                    <td  valign="top">
                        9,080 ft<br />(2,768 m)</td>
                    <td valign="top">
                    <ol>
                        <li>1978(?)</li>
                        <li>1979(?)</li>
                        <li>August 8, 2005</li>
                     </ol>
                    </td>
                    <td valign="top" align="left">
                        48.93260N / 113.61W
                        <br />
                        <b>USA/Montana</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Mt. Marcy
                    </td>
                    <td  valign="top">
                        5,344 ft<br />(1,629 m)</td>
                    <td valign="top">
                        <a href="http://www.summitpost.org/trip-report/341784/A-Two-Day-Hike-up-Mt-Marcy-via-South-Meadows.html" target="_blank">July 4, 2005</a></td>
                    <td>
                        44.11250N / 73.9239W
                        <br />
                        <b>USA/New York</b>
                        <br />
                        Highest point in state of New York
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Crane Mountain
                    </td>
                    <td  valign="top">
                        3,254 ft<br />(992 m)</td>
                    <td valign="top">
                        <a href="http://www.summitpost.org/trip-report/342079/Crane-Mountain-Loop-Hike.html" target="_blank">July 2, 2005</a></td>
                    <td>
                        43.55029N / 73.9464W
                        <br />
                        <b>USA/New York</b>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Backbone Mountain
                    </td>
                    <td  valign="top">
                        3,360 ft<br />(1,024 m)</td>
                    <td valign="top">
                        May 29, 2005</td>
                    <td>
                        39.24502N / 79.48557W
                        <br />
                        <b>USA/Maryland</b>
                        <br />
                        Highest point in Maryland</td>
                </tr>
                <tr>
                    <td valign="top">
                        Spruce Knob
                    </td>
                    <td  valign="top">
                        4,863 ft<br />(1,482 m)</td>
                    <td valign="top">
                        <ol>
                        <li>September 3, 2001</li>
                        <li>May 28, 2005</li>
                        </ol>
                        </td>
                    <td>
                        38.69970N / 79.5331W
                        <br />
                        <b>USA/West Virginia</b>
                        <br />
                        Highest point in West Virginia
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Seneca Rocks
                    </td>
                    <td  valign="top">
                        2,400 ft<br />(732 m)</td>
                    <td valign="top">
                    <ol>
                        <li>September 3, 2001</li>
                        <li>May 28, 2005</li>
                    </ol>
                    </td>
                    <td>
                        38.83500N / 79.366W
                        <br />
                        <b>USA/West Virginia</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Catherdral Rock
                    </td>
                    <td  valign="top">
                        8,000(?) ft<br />(2,438(?) m)</td>
                    <td valign="top">
                        May 20, 2005</td>
                    <td>
                        36.2577N(?) / 115.6485W(?)
                        <br />
                        <b>USA/Nevada</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Big Schloss</td>
                    <td  valign="top">
                        2,964 ft<br />(903 m)</td>
                    <td valign="top">
                    <ol>
                        <li>First time in June(?) 1998</li>
                        <li>March 12, 2012 I'm going to GUESS 4 more times between June 1998 and Nov 2004.</li>
                        <li>March 12, 2012 I'm going to GUESS 4 more times between June 1998 and Nov 2004.</li>
                        <li>March 12, 2012 I'm going to GUESS 4 more times between June 1998 and Nov 2004.</li>
                        <li>March 12, 2012 I'm going to GUESS 4 more times between June 1998 and Nov 2004.</li>
                        <li>November 6, 2004 (from the South side)</li></ol>
                    </td>
                    <td valign="top" align="left">
                        38.94070N / 78.6658W
                        <br />
                        <b>USA/Virginia</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Kennedy Peak
                    </td>
                    <td  valign="top">
                        2,560 ft<br />(780 m)</td>
                    <td valign="top">
                    <ol>
                        <li>October, 2001 (first time)</li>
                        <li>March 12, 2012 I'm going to GUESS 2 more times between October 2001 and October 9, 2004.</li>
                        <li>March 12, 2012 I'm going to GUESS 2 more times between October 2001 and October 9, 2004.</li>
                        <li>October 9, 2004</li>
                    </ol>
                    </td>
                    <td valign="top" align="left">
                        38.74200N / 78.488W
                        <br />
                        <b>USA/Virginia</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Old Rag</td>
                    <td  valign="top">
                        3,268 ft<br />(996 m)</td>
                    <td valign="top">
                        <oL>                        
                        <li>March 12, 2012 I'm going to GUESS first time was in 1998.</li>
                        <li>March 12, 2012 I'm going to GUESS at lest 4 more times between 1998 and 2004</li>
                        <li>March 12, 2012 I'm going to GUESS at lest 4 more times between 1998 and 2004</li>
                        <li>March 12, 2012 I'm going to GUESS at lest 4 more times between 1998 and 2004</li>
                        <li>March 12, 2012 I'm going to GUESS at lest 4 more times between 1998 and 2004</li>
                        <li>September 25, 2004</li>
                        </oL></td>
                    <td valign="top" align="left">
                        38.55170N / 78.316W
                        <br />
                        <b>USA/Virginia</b></td>
                </tr>

	
                <tr>
                    <td valign="top">
                        Rockytop
                    </td>
                    <td  valign="top">
                        3,620 ft<br />(1,103 m)</td>
                    <td valign="top">
                        May 29, 2004</td>
                    <td>
                          38.28970N / 78.7139W
                        <br />
                        <b>USA/Virginia</b>
			        </td>
		        </tr>

                <tr>
                    <td valign="top">
                        Victoria Peak
                    </td>
                    <td  valign="top">
                        1,811 ft<br />(552 m)</td>
                    <td valign="top">
                        February, 2004</td>
                    <td>
                        22.273333N / 114.143889E
                        <!-- 2216'24" N; 1148'38" E -->
                        <br />
                        <b>Hong Kong</b>
                        <br />
                        Tram goes to 1,299 ft
                        <br />
                        <i>(I only did the <b>scenic overlook</b> via the tram)</i>
                        <br />
                        Note: While in HK, I took a bus which
                        <br />
                        drove over <b>Tai Mo Shan</b>, HK's highest mountain.</td>
                </tr>

                <tr>
                    <td valign="top">
                        Bearfence Mountain
                    </td>
                    <td  valign="top">
                        3,620 ft<br />(1,103 m)</td>
                    <td valign="top">
                        Nov(?) 2003?</td>
                    <td>
                         38.44700N / 78.465W
                        <br />
                        <b>USA/Virginia</b>
			I know I did this on a solo trip to SNP, but can't remember the date or even the year!</td>
                </tr>

                <tr>
                    <td valign="top">
                        Hawksbill
                    </td>
                    <td  valign="top">
                        4,051 ft<br />(1,235 m)</td>
                    <td valign="top">
                        Fall(?) 2003?</td>
                    <td>
                        38.55500N / 78.395W
                        <br />
                        <b>USA/Virginia</b>
                        <br />
                       Hawksbill mountain is the highest mountain in Shenandoah National Park.  
			<br />???It's seems like Eric and I did this short walk one day??? 
                    </td>
                </tr>	

                <tr>
                    <td valign="top">
                        Sugarloaf Mountain
                    </td>
                    <td  valign="top">
                        1,282 ft<br />(391 m)</td>
                    <td valign="top">
                        Fall 2003</td>
                    <td>
                        39.26260N / 77.3936W
                        <br />
                        <b>USA/Maryland</b>
                        <br />
                        This "mountain" is really a hill you drive up, but in the DC area you take what
                        you can get.
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Maryland Heights
                    </td>
                    <td  valign="top">
                        1,299 ft<br />(396 m)
                        <br />
                        (Elevation Gain)
                    </td>
                    <td valign="top">
                     <ol>
                        <li>November 11, 2002</li>
                        <li>June 2003(?)</li>
                     </ol>
                    </td>
                    <td>
                        38.724N(?) / 90.440 W(?)
                        <br />
                        <b>USA/Maryland</b>
                        <br />
                        A <b>scenic overlook</b> of Harpers Ferry, WV
                        <br />
                        and the Potomac and Shenandoah rivers.
                        <br />
                        <i>(Possibly it should not be included here)</i>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Robertson Mountain
                    </td>
                    <td  valign="top">
                        3,296 ft<br />(1,005 m)</td>
                    <td valign="top">
                    <ol>
                    <li>November 28, 2002 - traversed it</li>
                    <li>Summited at least 2 other times prior to 2002</li>
                    <li>Summited at least 2 other times prior to 2002</li>
                    </ol></td>
                    <td valign="top" align="left">
                        38.56990N / 78.3429W
                        <br />
                        <b>USA/Virginia</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Looking Glass Rock</td>
                    <td  valign="top">
                        3,969 ft<br />(1,210 m)</td>
                    <td valign="top">
                        July 6, 2002</td>
                    <td>
                        35.30400N / 82.794W
                        <br />
                        <b>USA/North Carolina</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Grandfather Mountain<br />
                        <i>(Tanawha)</i></td>
                    <td  valign="top">
                        5,964 ft<br />(1,818 m)</td>
                    <td valign="top">
                    <ol>
                        <li>July 4, 2002</li>
                        <li> May 18, 2001</li>
                    </ol>                       
                    </td>
                    <td valign="top">
                        36.10000N / 81.82W
                        <br />
                        <b>USA/North Carolina</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Chimney Rock</td>
                    <td  valign="top">2,280 ft<br />(695 m)</td>
                    <td valign="top">
                        July 3(?), 2002
                    </td>
                    <td valign="top">
                        35.440706N/82.252642W(?)
                        <br />
                        <b>USA/North Carolina</b>
			<br />
			Really this was a hike down,<br>as this tourist trap has an elevator<br>in the mountain to take you up.
			<br />The hike down crossed Hickory Nut Falls,<br>a 404 ft<br />( m) waterfall as seen in<br><i>The Last of the Mohicans</i>.
		     </td>
                </tr>
                <tr>
                    <td valign="top">
                        Mt. Mitchell</td>
                    <td  valign="top">
                        6,684 ft<br />(2,037 m)</td>
                    <td valign="top">
                        May 19, 2001
                    </td>
                    <td>
                        35.76470N / 82.2653W
                        <br />
                        <b>USA/North Carolina</b>
                        <br />
                        Highest Point East of the Mississippi
                        <br />
                        and, of course, highest point in North Carolina.</td>
                </tr>

                <tr>
                    <td valign="top">
                        Mary's Rock
                    </td>
                    <td  valign="top">
                        3,514 ft<br />(1,071 m) </td>
                    <td valign="top">
                        April 2000
                            <br />
                        (Hiked at least 2 other times prior)</td>
                    <td valign="top" align="left">
                        38.64970N / 78.3175W
                        <br />
                        <b>USA/Virginia</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        Signal Knob</td>
                    <td  valign="top">
                        2,500(?) ft<br />(762 m)</td>
                    <td valign="top">
                        August(?), 1999
                    </td>
                    <td>
                        38 57.67N / 78 19.89 W
                        <br />
                        <b>USA/Virginia</b>
                        <br />
                        <b>Scenic overlook</b>(?)
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Maisan</td>
                    <td  valign="top">
                        2208 ft<br />(673 m)</td>
                    <td valign="top">
                        July(?) 1996</td>
                    <td>35.79167N / 127.42528E
                        <br />
                        <b>South Korea/Chollabuk-do Province </b>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Chirisan</td>
                    <td  valign="top">
                        6,282 ft<br />(1,915 m)</td>
                    <td valign="top">
                        March(?) 1996</td>
                    <td>
                        35.18N, 128.08E<br />
                        <b>South Korea/South Kyongsang Province</b>
                        <br />
                        Second highest mountain in South Korea.
                    </td>
                </tr>
        </tbody>
        </table>
        1 foot = 0.3048 meters :: 1 meter = 3.2808399 feet
        <br />
        </asp:Literal>
        <asp:Literal ID="ltRockClimbLog" runat="server" Visible="false">
        <table width="100%">
          <tr>
            <td>    
            <p style="text-align:left">Jump to <a href='#RockLog'>log</a>.</p>      
                <p>My first introduction to the sport of Rock Climbing was in 1981.  To be precise I didn’t actually climb but I learned to 
                rappel and as such I was introduced to ropes, setting up anchors, using harnesses, etc.  I was a member of the Ventures scouting 
                program of the fifth Ward in Cardston, Alberta.  Our leader was George Toone, who must have been in his twenties at the time.  
                At least twice, if not more times, George took us to this sizeable dirt (or perhaps sandstone) cliff on Gregson’s land.  He’d set up a 
                redundant anchor by slinging a big rock with some webbing and then backing it up with some webbing around a tree; to both pieces of webbing he’d 
                attached the rope and position it over the cliff.  Out of webbing he’d tie a harness for whoevers turn it was to abseil.  I’m sure he gave 
                us detailed instructions, but that part I don’t remember, also I don’t recall using a fireman’s belay.  Nevertheless no one got hurt so 
                George must have been a good teacher and safety conscious as well.  I remember rappelling with no concerns, and even trying to get down in 
                just a couple of jumps.  We must have used a figure eight to have been able to get down as rapidly as we did.  I was so confident with rappelling 
                that George even had me go head first commando style!</p>
                <p>Those rappelling experiences must have planted a rock climbing seed in me, because in 1986 during my second semester at college I attempted to sign up for a spring rock climbing class. Pre-registration was full but I suggested to my friend Sean Skelton that we attend the first day and see if we could get in.  It was all my idea and Sean just tagged along, as such, imagine my disappointment when Sean won the name drawing getting him into the class, while I didn’t. </p>
                <p> I’m not sure if this was 1986 or sometime later, but Sean borrowed a rope, harnesses, etc., and he and I went up to Rock Canyon in Provo and set up a top-rope and climbed.  I want to say we climbed at Red Slab but most likely it was the Kitchen, as in those days you could drive right to it.  I remember feeling nervous, not because of the height, or anything to do with the climb, but because I noticed Sean wasn’t paying attention while belaying me.  That was a negative experience, and I believe it sidetracked me, for the moment, from my interest in rock climbing.</p>
                <p>The summer of 1993 rock climbing found me again.  In Cardston Cliff Smith, Jon Strong and friends had attached a few holds to one of the walls of the old Fern’s Chocolates building.  Although I climbed it just a couple of times, I remember really liking it, and I thought it was so cool.</p>
                <p>In October of 1993 a group of us, including Jon Strong, Becky Hatch, Karen Broadhead, Darrell Scott, Cliff Smith, Corey McCarthy, and Duane Beazer took a trip to Stone Hill MT. I don’t know the names or rating of the climbs we did, but most of the climbs were right next to the road, and at one point I cranked up the cassette player in my Isuzu Rodeo and blasted out “Cocaine” by Eric Clapton, much to the liking of Duane Beazer.  I also recall a climb on the west side of the road that over looked a body of water.  On that trip I had a deep cut on my right pointer finger as a result of catching it in the car door just a few days prior.</p>
                <p>Also I did a day trip, another time, to Stone Hill, MT with Duane Beazer and Jon Strong. Duane drove his BMW. I don’t recollect if anyone else came with us or what we climbed but I remember leaving very early in the morning and filling up with gas in the Crowsnest pass. That could have also been the autumn of 1993 or perhaps it was the spring of 1994.</p>
                <p>The summer of 1994 I spent in Edmonton Alberta.  Duane Beazer was also living there, and he had discovered a bridge with a stone support wall at one end that folks climbed on.  We gave it a try one day, and for some unknown reason we tied the rope to the bumper of my Rodeo.  Another time that summer I was in Waterton and a few acquaintances had a top-rope set up on a cliff below Bears Hump; Kyle Heniger let me use his harness and shoes and I climbed it.</p>
                <p>From Edmonton a few years went by before I did any climbing again. Then in 1998 a fellow named Mat befriended me at the Langley Ward in Northern Virginia and invited me to go to a climbing gym with him in Alexandria.  On March 22, 1998 I wrote in my journal “Last Saturday, I went indoor climbing at Sport-Rock with Mat (a guy I met at Church).  Thursday we went again and this time his fiancée Kimberly came along. Now I want to get my own equipment and join the gym”.  Clearly I really enjoyed it, and also I felt like it was something I could be good at, but I didn’t end up buying the gear or joining the gym.</p>
                <p>With just that limited background, and not even owning any gear, I to some extent thought that I was a climber, even though I never went climbing again for at least two or three more years.  The next opportunity presented itself when Colin Gibb, a friend of my buddy Eric Parker, announced one day that he had a rope and other climbing gear, and he wanted to go climb on the Virginia side of the Potomac River across from Carter Rock, Maryland.  I was eager to go.  If memory serves, Colin and I rappelled down a vertical, stone, river bank, while our friends Eric, Yolanda, Yenny, and Shalin (Colin’s fiancée) waited at the top. We climbed out, and that was that!  A very basic outing, but once again it enticed my appetite for the sport to the point where I again considered buying the necessary gear.  However a little research on climbing opportunities in the DC area changed that when I learned that like most things in DC they were often over-crowded.  Colin and Shalin married June 29, 2001, so if I had to guess I’d say the Potomac climbing experience was most likely that same summer.</p>
                <p>In 2005 I moved to Utah, and soon after started climbing a lot of mountains via hiking and scrambling.  I thought about getting into rock climbing, but was content, and busy with, the mountaineering skills I was learning doing non-technical peak- bagging.  It might seem odd but I also refrained from rock climbing, during my first few years in Utah as I didn’t see it as much of an aerobic sport, and since I was pursuing mountaineering I want to stay aerobically fit.</p>
                <p>A few more years went by when in the spring 2009 while driving back to Utah from a climbing/skiing trip to Mt. Shasta, CA Mark Borges asked me if I rock climbed.   I guess to some extent I still thought of myself as a climber and so I said that I did, but qualified it by adding that I needed to get a harness.  He invited me to go climb in Little Cottonwood Canyon with him, and even followed up the invitation later with an email.  I wanted to go, and I think I even planned on it, but in the end I let the opportunity slip by.  Then in August 2009 while I was on a Gannet Peak trip in Wyoming Jans Wager watered that rock climbing seed in me, when she informed me that I really should get into rock climbing as it would make me a more well-rounded mountaineer.</p>
                <p>The seed found a way to finally grow when in 2010 the right opportunity came along.   It came as a result of my desire to climb Mt. Rainer in Washington.  Without luck, since the end of 2009, I had been trying to find partners for a summer 2010 trip to Mt. Rainer when in early January 2010, while driving home from a Saturday ski tour to Gobblers Knob, Matt Jesperson told me about the Utah Climbing Club.  He said the club was scheduled to do Rainer that year and he suggested I join them.  He also informed me that the leaders of the club were, in his words “world class rock climbers” and that through them I could really learn how to rock climb.  I was so convinced that I went directly to Mountain Works in Provo,  upon are return to Utah County, and signed up for the club.</p>
                <p>My first event with the club was Ice Climbing in Maple Canyon January 31, 2010 – which was so amazing to me, and which I seemed to do very well at.  Doug Stout, the guy who took me under his wing at the event, commented that I didn’t seem like a first timer.  I top-roped seven routes that day namely Rubber Cup Nausea, Moroni Turkey Plant, Arch (not real name), Lemon, Running Man, Road Side Coulior, and Under Wraps.  I remember being disappointed that I didn’t have time to climb Cobble Cruncher.</p>
                <p>A benefit of being in the UCC was that we were allowed to use the local climbing gym, named The Quarry, for free for the month of February.   As such on February 1, 2010 I purchased a rope, GriGri, shoes, and four quickdraws. For the ice climbing event I had acquired a harness, helmet, locking karabiner, and an ATC.  Finally, approximately twenty-nine years since my introduction to climbing I had my own gear!</p>
                <p>Armed with the gear I frequented the Quarry two or three times a week during February 2010.  Also during that month the club held lead climbing, and falling clinics. At the lead clinics we learned how to clip quickdraws and lead belaying techniques (like standing close to the wall).  At the falling clinics we were taught to trust the rope, with the thought being that we would then not be afraid to fall, and would push ourselves to climb harder.  I think I learned not to fall as a result of how my controlled fall at the clinic played out.  Christian Knight (one of the world class climbers) had me climb up the lead wall just a few feet above my last quickdraw and then he told me to fall.  I hesitated giving him time to sneak a lot slack into the line, and so when I “fell”, I fell at least 20 feet.  He thought it was funny but I didn’t.  Bearing that bad experience in mind, I really took to a statement made by Reinhold Messner in which he declared he had never taken a fall climbing.</p>
                <p>In April 2010 the UCC took a trip to Moab, where we climbed at Wall Street.  At that event I was introduced to cams and learned the difference between a slab and a wall.  In June 2010 the UCC learned how to use stoppers during an event at the meat wall in Rock Canyon.  Although cams and stoppers are used for “trad” (traditional) climbing we didn’t in fact trad climbing at these events.</p>
                <p>On July 17, 2010 I summited Mt. Rainer with Josh Jones.   A few days prior the two of us also climbed Mt. Hood in Oregon.  In preparation for those two alpine climbs I learned a lot about glacier travel, and crevasse rescue, and in so doing discovered there are a lot of shared practices between alpinism and rock climbing.</p>
                <p>With the Mt. Rainier goal realized time opened up for more rock climbing, and by the first part of August I started climbing fairly regularly with Glenn Merrill at Rock Canyon in Provo, Utah.  On my birthday Glenn introduced me to multi-pitch climbing– I don’t think he realized it was my birthday but what a great present none-the-less.  Although not typically done as a multi-pitch climb, my first multi-pitch was a variation/combo of Curious George, and George.  We ended the climb with another new-to-me practice by simul-rappelling off it. Having caught the multi-pitch bug Glenn later introduced me to the Layer Cakes area on the north side of Rock Canyon.</p>
                <p>I also got out a few times in August and September with Carl Line, a fellow from the UCC.  I picked up a few good tips from him such as hanging my shoes on the outside of my pack so they have a chance to air out, and the importance of looking at ones feet when climbing.  On August 14, I climbed at the Red Wonder Wall in Santaquin Canyon with the UCC, and liked it so much that I returned a couple weeks later with Glenn.</p>
                <p>Over the Labor Day weekend of 2010, Glenn and I took a trip to Idaho and climbed at both the City of Rocks, and Castle Rock.  On this trip I learned how easy it is to get a rope stuck. Probably too late in the afternoon we climbed Cruel Shoes on Stripe Rock where we took the wrong rappel down, in the dark (to boot).  We had two ropes tied together for the rappel and we were able to pull them to the knot, but not beyond, allowing us to retrieve only one of them – leaving my rope stuck.  We had to return the next morning to work out the problem and fortunately we managed to get the rope unstuck. I ended up back at the City of Rocks Sept 10 & 11 due to the cancelation of a UCC event to Devils Tower, WY. This time Jacob Moon and Wayne Pulllman joined Glenn and I, and along with a few other routes we climbed a couple of long multi-pitch sports routes namely Theater of Shadows on Jackson’s Thumb, and Sinocranium on Steinfelds Dome.  Glen, Jacob and I also free soloed the Cowboy Route on Bath Rock. At the end of September I climbed in American Fork Canyon at the Hard Rock area with the Adventure Seekers Society (ASS).</p>
                <p>Through the UCC I had been introduced to cams and stoppers but it wasn’t until I joined Glenn, Matt Long, and Matt Jesperson at Red Rock Canyon, NV, October 23, that I truly experienced traditional climbing. On that trip we simul-climbed Solar Slab gully on the lower tier, followed by the Solar Slab route on the upper tier.  That was also my initiation to simul-climbing.</p>
                <p>In summary, rock climbing was something I was interested in for many years but 2010 was the year I actually learned technical climbing. It all started with ice climbing in January followed by gym climbing in February, slab climbing in April, glacier travel in July, multi-pitch climbing in August, and traditional climbing in October.  I owe a lot of thanks to the UCC and to good friends.</p>
                
                <a id="RockLog"></a>
                
                <p style="text-align:left">
                           See <a href="javascript:void(0);" id="SeeRockClimbingTbl">photos</a> of those who helped me get into rock/ice climbing.
                            </p>
                 <table width="720" align="center" style="display:none" id="RockClimbingTbl">
                    <tr>
                        <td>
                            <div class="RockClimbingScollingDiv">
                                <table border='1' BGCOLOR='#232323'>
                                    <tr>
                                        <td align='center'><div style="text-align:center"><img src="People/001_GeorgeToone.jpg" alt="George Toone" title="George Toone" /><br />George Toone in 2000-something</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/002_SeanSkelton_June13_2011.jpg" alt="Sean Skelton" title="Sean Skelton" /><br />Sean Skelton, June 2011</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/003_JonStrong.jpg" alt="Cliff Smith and Jon Strong" title="Cliff Smith and Jon Strong" /><br />Cliff Smith and Jon Strong in 1989</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/004_StoneHillOct1993.jpg" alt="Stone Hill, MT, Oct 1993" title="Becky Hatch, Walter, Karen Broadhead, Darrell Scott, Cliff Smith, Corey McCarthy, Duanne Beazer. Stone Hill, MT, Oct 1993" /><br />Stone Hill, MT, Oct 1993</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/005_DuaneBeazer_Jan2_2011.jpg" alt="Duane Beazer" title="Duane Beazer" /><br />Duane Beazer, Jan. 2011</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/006_KyleHeniger_Dec24-2011.jpg" alt="Kyle Heniger" title="Kyle Heniger" /><br />Kyle Heniger, Dec. 2011</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/007_ColinGibb_Dec30_2008.jpg" alt="Colin Gibb" title="Colin Gibb" /><br />Colin Gibb, Dec. 2008</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/008_MarkBorges_May23_2009.jpg" alt="Mark Borges" title="Mark Borges" /><br />Mark Borges, May 2009</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/009_JansWagerAugust19_2009.jpg" alt="Jans Wager" title="Jans Wager" /><br />Jans Wager, August 2009</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/010_MattJesperson_Sept23_2011.jpg" alt="Matt Jesperson" title="Matt Jesperson" /><br />Matt Jesperson, Sept. 2011</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/011_DougStout_Dec31_2012.jpg" alt="Doug Stout" title="Doug Stout" /><br />Doug Stout, Dec. 2012</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/012_ChristianKnight_Dec3_2012.jpg" alt="Christian Knight" title="Christian Knight" /><br />Christian Knight, Dec. 2012</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/013_JoshJones_July12_2010_MtHood.jpg" alt="Josh Jones" title="Josh Jones" /><br />Josh Jones, July 2010</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/014_GlennMerrill_Sept04_2010_StripRock.jpg" alt="Glenn Merrill" title="Glenn Merrill" /><br />Glenn Merrill, Sept. 2010</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/015_JacobMoon_Sept10_2010.jpg" alt="Jacob Moon" title="Jacob Moon" /><br />Jacob Moon, Sept. 2010</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/016_WaynePullman_Oct26_2013.jpg" alt="Wayne Pullman" title="Wayne Pullman" /><br />Wayne Pullman, Oct. 2013</div></td>
                                        <td align='center'><div style="text-align:center"><img src="People/017_MattLong_Oct22_2010_SolarSlab.jpg" alt="Matt Long" title="Matt Long" /><br />Matt Long, Oct. 2010</div></td>
                                        <td align='center'><div style="text-align:center; width:250px;"><br /><br /><br /><h2 id="RockPicClose" title="Close" style="cursor:pointer">Close</h2></td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                <h2>Rock Climbing Log</h2>
                <a href="#pre2010">Pre-2010</a> | <a href="#2010">2010</a> | <a href="#2011">2011</a> | <a href="#2012">2012</a> | <a href="#2013">2013</a> | <a href="#2014">2014</a> | <a href="#2015">2015</a> | <a href="#2016">2016</a>
                <br />
                <br />
                <a id="pre2010"></a>1981 – 2009 (Approximation logged Nov 15, 2013)
                <ol>
                <li>1981 - Learned to rappel outside Cardston, Alberta on Gregson’s land with Ventures.</li>
                <li>1986(?) - Top-roped in Rock Canyon, Provo, with Sean Skelton.</li>
                <li>Spring 1993 - Ferns Chocolate wall in Cardston with Duane Beazer.</li>
                <li>Summer 1993 - Top roped on Bears Hump, Waterton, Alberta with Kyle Heniger and friends.</li>
                <li>October 1993 - Stone Hill, MT (2 trips) with Duane Beazer and friends.</li>
                <li>Summer 1994 - Bridge wall in Edmonton, Alberta with Duane Beazer.</li>
                <li>March 1998 - Sport-Rock gym in Alexandria, VA with Mat.</li>
                <li>Summer 2001(?) - Potomac River, VA, with Colin Gibb</li>
                </ol>
                
                <a id="2010"></a>2010 (Approximation logged Nov 15, 2013)
                <ol>
                <li>January 30 – Ice climbed at Maple Canyon, UT with UCC. Top-roped seven routes that day namely Rubber Cup Nausea, Moroni Turkey Plant, Arch (not real name), Lemon, Running Man, Road Side Coulior, and Under Wraps.</li>
                <li>February 2010 – Gym membership at The Quarry, Provo, UT.</li>
                <li>April 10 – Wall Street in Moab with UCC.</li>
                <li>June 19 – Meat Wall, Rock Canyon, Provo, UT with UCC.</li>
                <li>July 29 – Appendage: Only Wimps(?), Full Appendage(?), Lead(?); Rock Canyon, Provo, UT with Glenn Merrill.</li>
                <li>August 10 – The Wild, Rock Canyon, Provo, UT with Carl Line.</li>
                <li>August 12 – First multi-pitch climb, and simul-rappel.  George area of Rock Canyon with Glenn Merrill.</li>
                <li>August 14 – Red Wonder Wall, Santaquin Canyon, UT with UCC.</li>
                <li>August 19 –The Wild, Rock Canyon, Provo, UT with Carl Line.</li>
                <li>August 24 – Green Monster Slab: Green Jello, Green Monster (route), Rock Canyon, Provo, UT with Glenn Merrill.</li>
                <li>August 28 – Red Wonder Wall, Santaquin Canyon, UT with Glenn Merrill.</li>
                <li>August 31 – Job Site/Layer Cakes area, Rock Canyon, UT with Glenn Merrill.</li>
                <li>September 2 - The Wild, Rock Canyon, Provo, UT with Carl Line.</li>
                <li>September 4 – Rain Dance on Flaming Rock at the City of Rocks Idaho, as well as Tribal Boundaries and Reservations. Followed by Cruel Shoes on Stripe Rock. With Glenn Merrill.</li>
                <li>September 5 – Skin the Cat at Site 18 City of Rocks, followed by Big Time at Castle Rock. With Glenn Merrill.</li>
                <li>September 10 – Jackson’s Thumb via the Theater of Shadows, City of Rocks, with Glenn Merrill, Jake Moon, and Wayne Pullman followed by Delay of Game, and Scream Cheese on Parking Lot Rock and Anteater Rock respectfully. Free soloed Cowboy Route on Bath Rock with Jake, and Glenn.</li>
                <li>September 11 – Steinfelds Dome via Sinocranium with Glenn Merrill, Jake Moon, and Wayne Pullman followed by “Too Much Fun” on Bumblie Rock. City of Rocks, Idaho.</li>
                <li>September 15 – Cosmic Dust Lazers, Rock Canyon, with Carl Line.</li>
                <li>September 18 – Curious George, Rock Canyon, with Glenn Merrill.</li>
                <li>September 25 – Hard Rock area in American Fork Canyon with A.S.S.</li>
                <li>October 23 – Solar Slab Gully, and Solar Slab Route at Red Rock Canyon, NV – with Glenn Merrill, Matt Long, and Matt Jesperson.</li>
                <li>Nov 27 - Ice climbed CCC in Joes Valley with Matt Jesperson.</li>
                <li>Dec 3 - Quarry with Lucy Ordaz.</li>
                </ol>
                
                <a id="2011"></a>2011 (Approximation logged Nov 15, 2013)
                <ol>
                <li>July 2 – Bolt Slab: Dance of the Pregnant Wildebeest ,Rock Canyon with Ana Serrano.</li>
                <li>Aug 20 – Cosmic Dust Lazers(?) with Glenn M, then the Appendage: Only Wimps(?), Lead(?).</li>
                <li>Aug 27 – Curious George, Rock Canyon with Matt Long, followed by The Zoo.</li>
                <li>Sept 3 – Trilogy Buttress with Matt Long and Matt Jesperson. MJ lead the 5.8 first pitch just below Wizardly Way.  I lead Wizardly Way, Matt Long took the 5.9 pitch 3 to the left of Shards of Narsil.</li>
                <li>Sept 10 - Jackson Marvell and I climbed Cosmic Dust Lazers, followed by the same first two pitches on Trilogy Buttress as Sept 3.  We did it as four pitches; he lead 1 and 3 I lead 2 and 4.  For the fourth pitch I got on My Precious and it turned out to be trad, and I had no pro. Jackson dropped his Go-Pro from the top and it was okay.</li>
                <li>Sept 16 – Western Front followed by followed by the same first two pitches on Trilogy Buttress as Sept 3, and Shards of Narsil for pitches 3 and 4.  I lead P1 & 3.  With Matt Long(?).</li>
                <li>Sept 23 – East Buttress of Mt. Whitney, CA with Matt Jesperson and Matt Long.</li>
                <li>Dec 10 – Ice climbed Millers Thriller in Provo Canyon with Alec LaLonde.</li>
                </ol>
                
                <a id="2012"></a>2012 (Approximation logged Nov 15, 2013)
                <ol>
                <li>May 11 – Western Front & Cosmic Dust Lazers, Rock Canyon with Sam Cannon.</li>
                <li>May 22 -  Cosmic Dust Lazers again with Sam Cannon.</li>
                <li>May 26 – Layer Cakes area, explored someone project with Matt Long.</li>
                <li>May 28 – Galaxy area, Tatooine wall, various route, Rock Canyon, with Jackson Marvel. Rappelled down Squaw Struck.</li>
                <li>May 31 – Jawa Jam and other routes in Galaxy Area with Matt Long.</li>
                <li>June 8 – Sundial Peak via the 11th hour route with Tristian Higbee.</li>
                <li>June 12 - Red Slab: Pregnant Guppy, Mr. Cornflakes, The Mantel Route with Sam Cannon.</li>
                <li>June 16 – West Slabs of Mt. Olyumpus with Brad Yates, Andrew May, and Alex and Lani Wilson.</li>
                <li>June 22 – Cosmic Space Dust Lazers, all 6 pitches, with Tristian Higbee.</li>
                <li>June 29 – Open Book route in the Lone Peak Cirque with Matt Long along with Matt Jesperson with Thomas Gappmayer, and Jake Moon with Sam Cannon.</li>
                <li>June 30 – Lowe Route on Question Mark Wall with Jake Moon and Sam Cannon.</li>
                <li>July 7 –London Spire with Sam Cannon and Scott Cooney.</li>
                <li>July 10 - Trilogy Buttress with Sam Cannon.</li>
                <li>July 21 – Upper Exum route on the Grand Teton with Scott Cooney, Ben Brutsch,  & Gabe Diarte.</li>
                <li>July 28 – Mt Ogden with Jackson Marvel, and Scott Cooney with Jessica Goelz.  I had just ordered seven camalots and a set of stoppers, the cams arrived and we used them.</li>
                <li>August 3 – SE Ridge of Superior, free soloed.</li>
                <li>August 11 – Devils Castle at Alta, UT via the Portable Darkness route with Scott Cooney.</li>
                <li>November 13 – Pitch one of Stairway to Heaven Ice Climb, Provo Canyon, with Dan Christopherson.</li>
                <li>December 7 – 4th class scramble, solo, to old restaurant above Bridal Falls, Provo Canyon.</li>
                <li>December 9 – Dirtcicle, Helper UT, with Rick Barrett.</li>
                <li>December 11 - Pitch one of Stairway to Heaven Ice Climb, Provo Canyon, with Ana Serrano.</li>
                <li>December 15 – Dirtcicle, Helper UT, with Jackson Marvel (my first time leading ice).</li>
                <li>December 16 – CCC at Joes Valley with Rick Barrett.  Rappelled Donorcicle but it was too wet to climb.</li>
                <li>December 18 – Stairway with Jackson Marvel.</li>
                <li>December 20 – Dirtcicle with Jackson Marvel, Ammon Hatch, and John Rogers.</li>
                <li>December 26 – French Kiss in Waterton Alberta, belayed by Chad London (Kyle Henigers brother in-law).</li>
                <li>December 31 – Quick and Dirty , Waterton Alberta, with Jon Low.</li>
                </ol>
                
                <a id="2013"></a>2013 (Approximation between May 2 and August 10. Logged November 16, 2013)
                <ol>
                <li>Jan. 5 – 2 pitches of Stairway to Heaven with Jackson Marvel.</li>
                <li>Jan. 10 – Far left (east) line on Stairway with Matt Long.</li>
                <li>Jan. 17 – Stairway with Matt Long, Dan Thrasher, Jackson Marvel.</li>
                <li>Jan. 19 – Maple Canyon with Rick Barrett & Jackson Marvel. Climbed Running Man, Underwraps and Cobble Cruncher.</li>
                <li>Jan. 25 – Ouray Ice Park at the Uncompahgre Gorge, CO with Rick Barrett. Alcove area(?): Verminator(?), Duncan’t Delight(?). Five Fingers area: In The Pink.  Scottish Gullie: UK Garage(?). New Funtier: Pocahontas(?), and GNR(?).Flamenco(?) (at lower end of the trestle).</li>
                <li>Jan 26 - Ouray Ice Park at the Uncompahgre Gorge, CO with Rick Barrett. Popsicle route, Tooth Decay, Shithouse wall:  Tucks, and Picnic area.</li>
                <li>Jan 31 – Stairway with Jackson Marvel.</li>
                <li>Feb 7 – Pitch one of Millers Thriller with Jackson Marvel.</li>
                <li>Feb 14 - Stairway with Jackson Marvel.</li>
                <li>Feb 21 – Stairway with Ben Brutsch.</li>
                <li>Feb 22 – Great White Icicle in Little Cottonwood Canyon, with Scott Cooney.</li>
                <li>Feb 23 – Itchy and Scratchy with Ben Brustch.</li>
                <li>Feb 27 – Itchy and Scratchy with Jackson Marvel.</li>
                <li>Feb 28 – Itchy and Scratchy with Ben Brustch.</li>
                <li>Mar 2 - Great White Icicle and Scruffy Band with Ben Brustch.</li>
                <li>March 14 – Appendage: Only Wimps(?),Lead(?) with Ben Brustch.</li>
                <li>March 15 – Red Slab: Mr. Cornflakes, The Mantel Route, self-belay.</li>
                <li>April 4 – Cosmic Dust Lazers with Ben Brustch.</li>
                <li>April 11 – Tinker Toys: G.I Joe, Barbie, K’Nex with Ben Brustch.</li>
                <li>April 18 – Western Front with Ben Brustch.</li>
                <li>May 2(?) – Tatooine : Jawa Jam, and the route to its left,  with Ben Brustch.</li>
                <li>May 9(?) - Red Slab: Mr. Cornflakes, The Mantel Route; self-belay.</li>
                <li>May 24 – Beckey’s Wall, LCC, with Scott Cooney.</li>
                <li>May 24 – Tingeys Terror, LCC, with Scott Cooney.</li>
                <li>May 24 - Gate Buttress LCC , Half A Figure, LCC with Scott Cooney & Jake Moon.</li>
                <li>May 27 – Guerts Ridge with Jackson Marvel.</li>
                <li>June 12 – Red Slab: Mr. Cornflakes, The Mantel Route, Rock Canyon, with Tim Chen and Lani Wilson.</li>
                <li>June 13 – Tinker Toys: G.I Joe, Barbie, K’Nex, RC, with Jenny Quinn Overdiek.</li>
                <li>June 25 – Red Slab route and Main Crack (Ed & Terry Wall), with guys I meet at the crag.</li>
                <li>June 27 - Cosmic Dust Lazer, RC, with Jenny Quinn Overdiek.</li>
                <li>July 2(?) - Main Crack (Ed & Terry Wall),self-belay.</li>
                <li>July 5 – Maple Canyon with WMC - Road Kill Wall: “Listen to your Dinner” and the 5.9 on the arête just right of “Listen to your Dinner”, “Roach on Rye”, “Tomato Man”, “Worm Hole Boodie”.  Schoolroom Wall “Drowning Baby Fish” with Steve Duncan and Tom Oaks. Oxygen Wall: Key Lime Sky with Nathan Schweitz.</li>
                <li>July 6 - Maple Canyon with WMC - Billy the Kid Wall: “I’ll Make You Famous”, Salsa Vasa .  Oxygen Wall: Key Lime Sky, and the one to the left of it with Tom Oaks. Birthday Corridor: Steve & Elsie with Aymara Jimenez, High Desert Pelicans with Tom Oaks. Rock Island Area(?) – Unnamed route, with Nathan Schweitz.</li>
                <li>July 7 - Thessalonian Buttress, via the Grecian Highway  route at Maple with John Shields.</li>
                <li>July 13 – Hard Rock: Gas Boost, Plantinum Blonde, Stoic Calculus, Unknown Right(?), Unknown Left(?);  AF, with Glenn Merrill, Aymara Jimenez, and Mike Gibby.</li>
                <li>July 17 – Hard Rock: Rockapella, Stoic Calculus(both pitches), Eight to Eleven (P1 only) ; AF, with Glen Merrill, and others.</li>
                <li>July 18 – Green Monster Slab: Green Jello (route) & Curious George, RC, with Jenny Quinn Overdiek.</li>
                <li>July 25(?) – Appendage: Only Wimps(?), Full Appendage(?), Lead(?) with Glenn Merrill , Candice Morgan & others. Green Monster Slab: Green Jello, Green Monster (route) with Glenn Merrill.</li>
                <li>July 27 – School Room: Big Kahuna, Chocolate Doobie, Redemption of Madonna, Hot 4 Teacher;  Changing the Stripes, Key Lime Sky at Maple with Michael & Helene Ramsey & Ken Meleta.</li>
                <li>July 28 – “Tachycardia” on Heart Rock with Helene Ramsey & Ken Meleta.</li>
                <li>July 31 – Red Rock: Third Molar Roundup(?), Draper, UT – self-belay.</li>
                <li>Aug. 1 (?) – Tank Canyon(?) area of AF canyon 4 routes, with Glenn Merrill, Carole Hughes Jenson, and others.</li>
                <li>Aug. 2 – Red Slab route with Shazia and Taylor Chiu.</li>
                <li>Aug. 3 – Attempted Kamps Ridge, Mt. Olympus with Chris Pattillo.</li>
                <li>Aug. 6 (?) – Jawa Jam in Galaxy area of Rock Canyon, with Ana Serrano.</li>
                <li>Aug. 8 – Tinker Toys: G.I Joe, Barbie, K’Nex, RC, with Austin Kenison, Carole Hughes Jenson, Erin DeLlamas.</li>
                <li>Aug. 10 – Red Rock Draper: Face Plant(?), Bloody Impact(?), Facial Fracture(?), UT – with Aymara Jimenez and Luke.</li>
                <li>August 16, climbed Penta Pitch with Tom Oaks  - we did it in 3 pitches I lead P1 & 3.  P3 was tough.</li>
                <li>Aug. 17 - Cosmic Dust Lazers, 6 pitches, with William DaBell.</li>
                <li>Aug. 18 - P.A’s Mother Ana belayed me on the Exposed Cleavage route.</li>
                <li>Aug. 19 - Outer Corner on the JHCOB with Neil Steinert .  I lead p2-p4.  Also climbed at Salt Lake Slips area.</li>
                <li>Aug.20 (or was this August 15?) climbed Black Rose with Ana on the Pink Canoe route.</li>
                <li>Aug.22 - Green Monster Slab: Green Jello, Green Monster (route) and Curious George with Rob Hyldah.</li>
                <li>Aug.23 - Maple Canyon with William DaBell and Ben Brutsch , just “Tachycardia” on Heart Rock, as we got rained out.</li>
                <li>Aug. 25 - Red Slab: Mr. Cornflakes, The Mantel Route belayed by Ana.</li>
                <li>Sept. 2  - Meat Wall: Tofu, The Cleaver; Super Bowl Wall: Where’s my Sherpa;with Josh Jones.</li>
                <li>Sept. 4 - Western Front with Josh Jones and Crystal.</li>
                <li>Sept. 6 - 11th Hour on Sundial Peak with William DaBell.</li>
                <li>Sept 10  - NE face of Pingora (1000 feet), WY with Mike Sullivan.</li>
                <li>Sept.  13 - Attempted Wolf’s Head, WY, but retreated due to incoming rain. With Mike Sullivan.</li>
                <li>Sept 20 - Couple of the routes on Practice Rock, first pitch of “Rain Dance” on Flaming Rock, and Too Much Fun on Bumblie Rock belayed by Ana Serrano. Free-soloed the “Cowboy Route. City of Rocks, Idaho.</li>
                <li>Sept 21 – Bolted route on Elephant Rock, rock just south (and a bit east) of Elephant Rock.  ½ bolted and ½ trad route. Cruel Shoes on Stripe Rock. City of Rocks, Idaho with Crystal, Josh Jones, and MaryMegan. Free-soloed the “Cowboy Route with Josh Jones.</li>
                <li>Sept 22 - Parking Lot Rock:  “Delay of Game” and “Norma’s Book” with Josh Jones at City of Rocks, Idaho.</li>
                <li>Sept 24 - Dead Snag area (Jigs Up, East Dihedrals, and Steort’s Ridge) in BCC, with Josh Jones.</li>
                <li>Sept 25 - Hamlet Wall.  I did a 5.7, 5.8 (2 times), 5.9, and a 5.10a at Red Rock Canyon NV with Josh Jones.</li>
                <li>Sept 26 -  Cat-In-The-Hat route on Mescalito, Red Rock Canyon NV with Josh Jones.</li>
                <li>Sept 27 - Cookie Monster on Mescalito, Red Rock Canyon NV with Josh Jones.</li>
                <li>Oct 1 –Trilogy buttress with Matt Long.</li>
                <li>Oct 2 –  2nd East Face on JHCOB with Tom Oaks as well as Steorts Ridge.</li>
                <li>Oct 4 – 30 Seconds Over Potash, Nervous in Suburbia  at Wall Street, Moab UT. Left Slab, Parlor Game, Critical Mass, 5.6 Corner at Ice Cream Parlor.</li>
                <li>Oct 5 – Attempted Incredible Hand Crack  and Gorilla, climbed Twin Cracks at Supercrack Buttress at Indian Creek, UT with Danny Lay.</li>
                <li>Oct 6 - Charlies Pillar on the Optimator wall with Ruebin Cousin and again with William DaBell.</li>
                <li>Oct 18 – Attempted Kamp’s Ridge with William DaBell.</li>
                <li>Oct 22 –Maple with Tricia Hurst, “Tachycardia” on Heart Rock, simul-climbed Changing the Stripes.  I belayed her in Right Fork. The Great Chasm in the Middle Fork.</li>
                <li>Oct 23 – Climbed Outside Corner and East Dihedral with Tom Oaks.</li>
                <li>Oct 26 – Climbed Olive Oil route at Red Rock, NV with Wayne Pullman and Aaron White.</li>
                <li>Oct 27 – Climbed Johnny Vegas and Solar Slab at Red Rock, NV with Wayne Pullman and Aaron White.– over 1600 vertical in one day!</li>
                <li>Oct 28 – Climbed on Prophesy Wall outside St. George with Wayne Pullman and Aaron White.</li>
                <li>Nov 1 – Climbed ‘Led by Sheep’ and ‘Weep Rock Chimney – Left Side’ in Zion Canyon NP with Daniel Lay and William DaBell.</li>
                <li>Nov 2 – Climbed all but last two pitches of‘Chimney Sweep’ in Zion Canyon NP with Daniel Lay.</li>
                <li>Nov 3 – Scrambled (some 5th class sections) Old Cable Route to top of Lady Mtn Side’ in Zion Canyon NP with William DaBell.</li>
                <li>Nov 19 – Dirtcicle, Ice climbing, 5 laps – with William DaBell (Williams first time ice climbing).</li>
                <li>Dec 11 – Climbed Itchy and Scratchy with Ben Brutsch </li>
                <li>Dec 18 – P1 and P2 (as three pitches) on Stairway with Ben Brutsch</li>
                <li>Dec 20 – Stairway P1 (as two pitches, I led p1, Ben led p2), then meet Jake Moon, and William D and climbed White Nightmare and Bridal Veil right (Ben led both).</li>
                <li>Dec 23 - Itchy and Scratchy  with Jackson Marvel in the afternoon, led it once, then free soloed it (no rope), then did a mixed route on the right.</li>
                <li>Dec 27 – Did GWI with William DaBell.</li>
                </ol>
                  
                <a id="2014"></a>2014 
                <ol>
                <li>Jan 3 – 3 pitches on Millers Thriller with Ben B and Jackson M – each lead one pitch.</li>
                <li>Jan 4 – 2 pitches on Millers Thriller with William DaBell – I lead P2 – fun long pitch. </li>
                <li>Jan 5 – Lost in Time  with William DaBell, I lead it - bad ice at top.</li>
                <li>Jan 24 - Squash Head with William DaBell (aidded up rock to get rope in, ice was thin at bottom)</li>
                <li>Jan 31 - Ouray - 5 Laps on routes in Finger Fingers area, 1 route at lower bridge, and 1 at New Funtier (With Matt Long & William DaBell)</li>
                <li>Feb 1 - School Room at Ouray - 8 laps on 4 climbs.</li>
                <li>Feb 2 - 5 pitches of ice at South Park Area of Ouray.</li>
                <li>Feb 6 - Lead P1 of Stairway to Heavan, then did four TR laps. Climbed with Pat McGuinness</li>
                <li>Feb 8 - Mixed route to the left of Itchy & Scratchy, TR Itchy and Scratchy (3 times) plus 2 free solo climbs. (William D, and Pat M.)</li>
                <li>Feb 11 - Climbed solo belay laps on Itchy & Scratchy (3 laps).</li>
                <li>Feb 15 - Western Front (3-pitches with Pat McGuinness & Josh Jones) followed by 3 pitches of Cosmic Space Dust Lazers. Record Breaking warm weather in Provo.</li>
                <li>Feb 17 - Western Front (3-pitches with Pat McGuinness) followed by two laps on Along Came a Strider (I lead it).</li>
                <li>Feb 18 - Drivers Test and Paper Route at the Job Site, followed by Red Slab route and Desperado on Red Slab all with Pat McGuinness.</li>
                <li>Feb 24 - Sport routes on Panty Wall at Red Rock Canyon with Tom Oaks (4 climbs)</li>
                <li>Feb 25 - Sport routes on Panty Wall at Red Rock Canyon with Tom Oaks (4 climbs)</li>
                <li>Feb 26 -  Cat in the Hat at Red Rock Canyon with Tom Oaks (6 pitches)</li>
                <li>March 14 - Paper Route Rock Canyon with Pat McGuinness, followed by Run for Cover (2- pitches).</li>
                <li>March 15 - Brain Full of Spiders on Bad Bananas wall Rock Canyon with Pat McGuinness, as four pitches.</li>
                <li>March 22 - Trilogy Buttress via Along Came a Strider, and Shards of Narsil, with Pat McGuinness as four pitches.</li>
                <li>April 4 - Run for Cover and 3rd Pitch of Cosmic Space Dust Lazers, with Pat McGuinness</li>
                <li>April 29 - Seven climbs at the UVU gym with Ana and Dave Morrey</li>
                <li>May 1 - Seven climbs at the UVU gym with Ben B</li>
                <li>July 8 - First three pitches of Cosmic Dust Lazers with Sean Stanton.</li>
                <li>July 22  - The Cleaver on the Meat Wall in Rock Canyon with Sean Stanton, followed by TR of Green Monstor (route), and pitch one of Green Jello</li>
                <li>July 24 - Only Wimps Top-rope the Bulge with Sean Stanton</li>
                <li>July 29 - Red Slab and Desperdo with Sean Stanton</li>
                <li>July 31 - Western Front with Sean Stanton</li>
                <li>August 1 -The Hook (LCC) with William DaBell</li>
                <li>August 6  - The Cleaver on the Meat Wall in Rock Canyon with Pat McGuinness, followed by TR of Green Monstor (route), and pitch one of Green Jello</li>
                <li>August 14 - Curious George and K'Nex with Sean Stanton</li>
                <li>August 19 - left most route (5.6 ish) on the Tatooine wall with Sean Stanton in Rock Canyon.</li>
                <li>August 23 - Cosmic Dust Lazers, Rock Canyon, with Sean Stanton (2-pitches only).</li>
                <li>Sept 6 - Red Red Whine, Desperado, at Red Slab Rock Canyon with Sean Stanton</li>
                <li>Sept 12 – Climbed Tachycardia and The Grecian Highway in Maple Canyon with Pat M</li>
                <li>Oct 7 - Climbed SE Buttress of Cathedral Peak in Tuolumne Meadows of Yosemite with Danny Lay</li>
                <li>Oct 7 - Climbed North Face of Eichorn Pinnacle in Tuolumne Meadows of Yosemite with Danny Lay</li>
                <li>Oct 8/9 - Climbed 4 pitches of South Face of Washington Column Yosemite Valley with Danny Lay</li>
                <li>Oct 10 - Climbed all 16 pitches of Royal Arches in Yosemite Valley with Danny Lay</li>
                </ol>

                
                <a id="2015"></a>2015 
                <ol>
                    <li>Feb  7 - Western Front (3-pitches with Pat McGuinness)</li>
                    <li>March 13 - Trilogy Buttress (3-pitches with Pat McGuinness)</li>
                    <li>April 25 - Climbed at the indoor wall at Petzel in SLC - 4 pitches (routes)</li>
                    <li>June 9 - Curious George, and Along Came a Strider with Jacob Barzee</li>
                    <li>June 17 - Appendage with Mac Gilbert (3 or 4 routes)</li>
                    <li>June 19 - The Zoo and The Wild with Mac (5 or 6 routes)</li>
                    <li>June 23 - Jacob B and I  did P1 and 2 of Cosmic Dust Lazers,  and the third pitch the one to right of Cosmic</li>
                    <li>June 27 - Jacob B and I climbed  Tachycardia, Changing the Stripes, and Grecian Highway in Maple Canyon.</li>
                    <li>July 3 - Sam Pittman and I climbed 5 routes at the Wild.</li>
                    <li>July 9 - Pat M and I climbed Cool World Direct (5.6) twice each, then moved to the Hidden Wall and climbed Boltergeist (5.9), and TR Jugular (5.8) and Flakenstein </li>
                    <li>July 13 - Self belayed the main crack on Ed and Terry Wall four times, then dropped down to Red Slab and did two self belay laps on the Mantel Route.</li>
                    <li>July 15 - Red Spire, and Real McCoy (2-laps) with Jacob B</li>
                    <li>July 17 - Self belayed Real McCoy (2 laps), Main Crack (1 lap) and I.D Claire (2 laps).</li>
                    <li>July 22 - Cosmic Dust Lazers P1-3 with Ken Fairchild (his first outdoor climb, lead, and multi-pitch)</li>
                    <li>July 25 - Reb Slab, Red Red Whine, Red Dwarf, and Leave it to Bearer with Ken F.</li>
                    <li>August 1 -K'nex, Barbie, GI Joe, Lincoln Logs with Ken F</li>
                    <li>August 2 - West Slabs of Oly, solo.  Nightmare bushwack walk off two gullys over to the south heading west.</li>
		            <li>August 19 - Quarry (indoor):  Climbed 5.10a (for warm up), 5.10a to get lead cert, 5.10c. 5.10b, 5.11 a, 5.9</li>
		             <li>August 22 - Ken F and I climbed at P.A's Mother:  Exposed Clevage (lead once, TR once), R.R. Crossing (TR),High Hopes (lead)</li>
                    <li>Sept 3 - Joined the Quarry, climbed with Ken F</li>
                    <li>Sept 4 - Climbed at Quarry with Jacob B</li>
                    <li>Sept 7 - Quarry with Ken F</li>
                    <li>Sept 14 - Quarry with Ken F</li>
                    <li>Sept 17 - Quarry with Ken F</li>
                    <li>Sept 19 - Green Jello and Green Monster with Ken F</li>
                    <li>Sept 21 - Quarry with Ken F</li>
                    <li>Sept 23 - Quarry with Ken F</li>
                    <li>Sept 28 - Quarry with Ken F</li>
                    <li>Sept 30 - Quarry with Ken F</li>
                    <li>Oct 7 - Quarry with Jacob B</li>
                    <li>Oct 9 - Quarry with Ken F</li>
                    <li>Oct 14 - Quarry with Ken F</li>
                    <li>Oct 16 - Quarry with Ken F</li>
                    <li>Oct 19 - Quarry with Ken F</li>
                    <li>Oct 21 - Quarry with Ken F</li>
                    
                    <li>Oct 28 - Quarry with Ken F</li>
                    <li>Oct 30 - Quarry with Ken F</li>
                    <li>Nov 1 - Brain Full of Spiders on Bad Bananas wall Rock Canyon with Danny Lay, as two pitches.</li>

                    <li>Nov 2 - Quarry with Ken F</li>
                    <li>Nov 4 - Quarry Bouldering solo</li>
                    <li>Nov 6 - Quarry with Ken F</li>
                    <li>Nov 9 - Quarry with Ken F</li>
                    <li>Nov 14 - Quarry with Ana (belayer only)</li>
                    <li>Nov 16 - Quarry with Ken F</li>
                    <li>Nov 18 - Quarry with Ken F</li>
		    <li>Nov 21 - Dirtcicle (ice) with Brad Meyers (4 laps)</li>
                    <li>Nov 23 - Quarry with Glenn Merril</li>
                    <li>Nov 25 - Quarry with Ray Loveless, then again with Ken F</li>
		    <li>Nov 27 - Stairway (ice) with Brad Meyers (2 laps on center route, free solo the little right side, 3 laps left (tallest) route)</li>
                    <li>Nov 30 - Quarry with Ken F</li>
                    <li>Dec 2 - Quarry with Ken F</li>
                    <li>Dec 5 - CCC with Brad Meyers (ice)</li>
                    <li>Dec 7 - Quarry with Glenn M</li>
                    <li>Dec 9 - Quarry with Ken F</li>
                    <li>Dec 12 - Quarry with Ken F</li>
                    <li>Dec 16 - Quarry with Ken F</li>
                    <li>Dec 21 - Quarry with Ken F</li>
                    <li>Dec 23 - Quarry with Ken F</li>
		    <li>Dec 26 - Ice, Stairway, with Brad M</li>
		    <li>Dec 28 - Quarry with Ken F</li>
            </ol>

            <a id="2016"></a>2016 
            <ol>
		        <li>Jan 2 - GWI, with Brad M</li>
		        <li>Jan 6 - Quarry with Ken F</li>
		        <li>Jan 8 - Quarry with Ken F</li>
		        <li>Jan 11 - Quarry with Ken F</li>
		        <li>Jan 13 - Quarry with Ken F</li>
		        <li>Jan 18 - Quarry with Ken F</li>
		        <li>Jan 20 - Quarry with Ken F</li>
		        <li>Jan 23 - Ouray Ice with Brad M</li>
		        <li>Jan 24 - Ouray Ice with Justin Matis</li>
		        <li>Jan 27 - Quarry with Mike</li>
		        <li>Jan 29 - Quarry with Richard Hilton</li>
		        <li>Feb 1 - Quarry with Ken F</li>
		        <li>Feb 6 - Stairway to Heavan Ice with Rob Allen and Mike Gibby</li>
		        <li>Feb 8 - Quarry with Ken F</li>
		        <li>Feb 12 - Quarry with Richard Hilton</li>
		        <li>Feb 13 - Quarry with Ana, Paulina and Jakub</li>
		        <li>Feb 15 - GWI ice with Mike Gibby</li>
		        <li>Feb 15 - Quarry with Ken F</li>
		        <li>Feb 17 - Quarry with Ken F</li>
		        <li>Feb 22 - Quarry with Ken F</li>
		        <li>Feb 24 - Quarry with Ken F</li>
		        <li>March 8 - Quarry with Ana</li>
		        <li>March 10 - Quarry Bouldering alone</li>
		        <li>March 14 - Quarry with Ken F</li>
		        <li>March 16 - Quarry with Glenn M</li>
		        <li>March 23 - Quarry with Ken F</li>
		        <li>March 25 - Quarry with Richard Hilton</li>
		        <li>March 28 - Quarry with Ken F</li>
		        <li>March 30 - Quarry with Ken F</li>
		        <li>April 1 - Quarry with Fred Williams</li>
		        <li>April 2 - Rock Canyon with Brad from the Quarry. Green Jello, Green Monster, and Hamster Forever</li>
		        <li>April 4 - Quarry with Ken F</li>
		        <li>April 6 - Quarry with Ken F</li>
		        <li>April 11 - Quarry with Ken F</li>
		        <li>April 17 - Quarry with Derek and Cori</li>
		        <li>April 20 - Quarry with Derek and Cori</li>
		        <li>April 21 - Quarry with Jeff and Brad</li>
		        <li>April 25 - Quarry with Jeff, Brad, and Mike</li>
		    <li>April 28 - Started climbing at the Quarry with Alan Moore, and Mike Hall.  Mike faded away in September 2016, and Alan lasted until May 15, 2017 but would never learn to lead climb or lead belay.</li>
		    
		        <li>April 28 - Quarry with Alan Moore.  Brad belayed me on the lead climb (green 5.10d) and I got it clean</li>
		        <li>May 2 - Quarry with Jeff, Brad, and Mike</li>
		        <li>May 3 - Quarry with Alan Moore <b style="color:red">I continued to get two days a week in at the Quarry, so I'm not going to track it anymore!!!</b></li>
                <li>July 16 - Brad Meyers and I climbed Steorts Ridge in BCC</li>
                <li>July 30 - Brad Meyers and I climbed Western Front, and first pitch (the one below Wizardly Way) on Trilogy Buttress</li>
                <li>Aug 21 - Sundial Peak via the 11th hour route with Mike Halls</li>
                <li>Aug 27 - Portable Darkness on Devils Castle with Mike Halls</li>
                <li>Sept 10 - DJW Memorial, and Main Crack on Ed and Terry Wall Rock Canyon wiht Mike Halls</li>
                <li>Sept 15 - I have now lead 4 different 11a’s (some multiple times), and two of them I did on-sight.  I feel like I can safely say 11a lead at the gym is my level, and 11d on top-rope.</li>
                <li>Sept 17 - Maple Canyon with Mike Halls:  Dizzy Channel, Grecian Highway, Crime Scene(? Bridge Area?), Hematomia (? Bridge Area?), Man Muncher (Box Canyon)</li>
                <li>Sept 24 & 25 - Moonlight Buttress - Zion Canyon - Aid climbed with Danny Lay.</li>
                <li>Oct 1 – P1 and 2 of Western Front, then the third pitch of Feral Debutantes, Rock Canyon with Billy Hanncock.</li>
                <li>Oct 15 – Trilogy Buttress in Rock Canyon, with Brad Meyers</li>
                <li>Oct 22 – Pentapitch in LCC with Brad Meyers, skipped P5</li>

                <li>Nov 24 – Cookie Monster, and P6 of Cat in the Hat at Red Rock, followed by P1 and 2 of Dark Shadows with Daniel Lay</li>
		<li>Nov 25 - P1-P4 (as three pitches) of Triassics Sands on the Black Velvet Wall with Daniel Lay</li>
		<li>Nov 26 - Friedas's Flake on lower Solar Slab as one 70 m pitch followed by p3 and P4 of Johnny Vegas as one Pitch, with Daniel Lay</li>
		    <li>Dec 10 - Dirtcicle (ICE) with Brad Meyers</li>
		    <li>Dec 28 - Itchy and Scratchy (ICE) with Ken Wood</li>
		    <li>Dec 29 - Stairway to Heavan (ICE) with Ken Wood</li>
		    <li>Dec 31 - Great White Icicle with Brad Meyers</li>
            </ol>
		    
		      <a id="2017"></a>2017
            <ol>
		        <li>Jan 7 - Millers Thriller with Brad Meyers</li>
		        <li>Jan 28 - Ouray (4 climbs) with Brad Meyers</li>
		        <li>Jan 29 - Ouray (7 climbs) with Brad Meyers</li>
		        <li>Jan 30 - Ouray (5 climbs) with Brad Meyers</li>
		    <li>Feb 4 - Donercicle with Mike Gibby</li>
		    <li>March 4 - Climbed at the Quarry with a possible new lead partner kid named Hayes Campbell . March 29 he passed his lead test, and April 18 we climbed for the last time as he moved away shortly after that.</li>
		    <li>March 11 - Addenage and Curious George at RC with Hayes Campbell</li>
		    <li>May 3 - Quarry, lead climbing, with some guy named Austin who texted me from an add I posted on the board.</li>
		    <li>May 10 - Quarry again with Austin</li>
		    <li>May 15 - Froze my Quarry pass as Alan quit and I haven't found a steady partner.</li>
		    <li>May 28 - 7 pitches on Cosmic Dust Lazers with Brad Meyers</li>
		    <li>August 3(?) - Quarry on Jeff Roses guest pass</li>
		    <li>August 10 - Joined the Quarry (account from Frozen for a couple months, then cancelled in the summer of 2017.</li>
		    <li>August 20(?) - Rock Canyon with Jeff Rose.  Might have been Green Monster area and Tinker Toys(?)</li>
		    <li>August 27(?) - Rock Canyon with Jeff Rose.  Might have been The Hidden area(?)</li>
		    <li>Sept 30 - White Rocks (UT west Desert) with Jeff Rose</li>
		    <li>Oct 8 - Addenage at RC with Jeff Rose</li>
		    <li>Dec 2 - Dirtcicle with Mike Gibby</li>
		    <li>Dec 10 - Dirtcicle with Jeff Rose</li>
            </ol>
		    
		    
		    
		    
		      <a id="2018"></a>2018 
            <ol>
		        <li>Jan 7 - Stairway to Heaven and White Nightmare - with Jeff Rose/li>
		    <li>Feb 10 - Dirtcicle with Mike Gibby</li>
		    <li>Feb 11 - Dirtcicle with Mike Gibby</li>>
		    <li>Feb 17 - Dirtcicle and Highway to Heaven with Jeff Rose</li>
		    <li>Feb 24 - Donercicle/Highway to Heaven with Mike Gibby</li>
		    <li>March 3 - Squashead P1 lead, belayed by one of two brothers names unknown</li>
		    <li>March 7 - Highway to Heaven/CCC (P2)/Donercicle with Brent Zimmerman</li>
		    <li>March 10 - Dirtcicle with Mike Gibby</li>
		    <li>March 11 - Squashhead p1&2 with Jeff Rose</li>
		    <li>March 17 - Highway to Heaven/CCC (P2) with Mike Gibby</li>
		    <li>April 3 - Frozen in Time (aka Sundial Falls), WI3, with John Pettijon (forst bite two fingers)</li>
		    <li>April 6 - Highway to Heaven and Little Donercicle with Brent Zimmerman</li>
		    <li>May 5 - Jagged Edge with Brent Zimmerman</li>
		    <li>May 18 -Barbarian route on the Circus Wall in Snow Canyon with Mike Gibby. Thousand Pints of Lite with Brent Zimmerman/Mike Gibby.</li>
		    <li>May 19 - Green Valley Gap and Beaver Dam Mtns Road area called Sunset Alley with Brent Zimmerman/Mike Gibby.</li>
		    <li>May 20 - Past Lives on Prophesy Wall with Brent Zimmerman/Mike Gibby.</li>
		    <li>July 15 - Bear Hollow in Echo Canyon with Jeff Rose</li>
		    <li>July 22 - Red Wonder Wall with Jeff Rose</li>
		    <li>August 18 - Rasberry Dream, Hall of Flags, 29, Fern Gully, Insane in the Membrane AF Canyon with Jeff Rose and Darren Knezek</li>
            </ol>
		    
		    
            </td>
          </tr>
        </table>        
        </asp:Literal>
    </form>
</body>
</html>
