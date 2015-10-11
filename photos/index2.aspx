<!DOctoberYPE html>
<%@ Register TagPrefix="uc1" TagName="UC_LeftNav" Src="../UC_LeftNav.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_Header" Src="../UC_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_Footer" Src="../UC_Footer.ascx" %>

<%@ Page Language="c#" %>

<html>
<head>
    <script language="C#" runat="server">	
        private void Page_Load(object sender, System.EventArgs e)
        {
            System.Collections.ArrayList albums = GetAlbumList();  //This should be "System.Collections.Generic.List<Album>", but Brinkster doesn't support Generic.Lists - Novemberember 19, 2012

            litAlbums.Text = string.Empty;

            foreach (Album a in albums)
            {
                litAlbums.Text = litAlbums.Text + ImageLink(a);
            }

        }

        private System.Collections.ArrayList GetAlbumList()
        {
            //This should return a "System.Collections.Generic.List<Album>", but Brinkster doesn't support Generic.Lists - Novemberember 19, 2012

            // System.Collections.Generic.List<Album> albums = new System.Collections.Generic.List<Album>();
            System.Collections.ArrayList albums = new ArrayList();


            string URL = "";
            string img = "";
            string Title = ""; //Goal is to do away with this Var
            string Date = ""; //Goal is to do away with this Var

     
            albums.Add(new Album("2010", "", "", "", true));

            URL = "http://picasaweb.google.com/vanman798/BlueJohnCanyonAndHorseshoeCanyon?authkey=Gv1sRgCMOuicbw8dmrlgE&feat=email#";
            img = "http://lh5.ggpht.com/_YZLXFz4omoA/TKn1RWMWTII/AAAAAAAABmo/s-kJPoEvm-8/s144/DSC03711.JPG";
            albums.Add(new Album(URL, "Blue John", img, "Octoberober 2, 2010"));

            URL = "http://picasaweb.google.com/vanman798/TheCultAtSaltair?authkey=Gv1sRgCMf85M-4goj6ag&feat=directlink";
            albums.Add(new Album(URL, "The Cult", "http://lh5.ggpht.com/_YZLXFz4omoA/TKDoZ34VDoI/AAAAAAAABk8/s0QNtsA6x30/s144/021.jpg", "September 24, 2010"));

            URL = "http://picasaweb.google.com/lh/sredir?uname=vanman798&target=ALBUM&id=5514938302835612961&authkey=Gv1sRgCLKW08_qi479xAE&feat=email";
            albums.Add(new Album(URL, "City of Rocks", "thumbnails/CityOfRocksOn.jpg", "September 4, 2010"));

            URL = "http://picasaweb.google.com/vanman798/BirchHallowCanyon?authkey=Gv1sRgCOubhOjU1vCWXg&feat=directlink";
            albums.Add(new Album(URL, "Birch Hallow", "http://lh6.ggpht.com/_YZLXFz4omoA/TJJTnDz3QdI/AAAAAAAABPs/jQMax4lpVY4/s288/002.jpg", "August 21, 2010"));

            URL = "http://picasaweb.google.com/vanman798/BinghamCanyonMine?authkey=Gv1sRgCIbAj6DqxIbVSQ#";
            albums.Add(new Album(URL, "Kennecott Mine", "thumbnails/BinghamOn.jpg", "August 17, 2010"));

            URL = "http://picasaweb.google.com/lh/sredir?uname=vanman798&target=ALBUM&id=5496018945788815905&authkey=Gv1sRgCLfppqTJuNCBtQE&feat=email";
            albums.Add(new Album(URL, "Mt. Rainier", "thumbnails/RainierOn.jpg", "July 17, 2010"));

            URL = "http://picasaweb.google.com/lh/sredir?uname=vanman798&target=ALBUM&id=5496012297701290529&authkey=Gv1sRgCNnjueu7yeyKPA&feat=email";
            albums.Add(new Album(URL, "Mt. Hood", "thumbnails/HoodOn.jpg", "July 12, 2010"));

            URL = "http://picasaweb.google.com/vanman798/SouthTimp?authkey=Gv1sRgCM-D48yqkLKOtwE&feat=directlink";
            albums.Add(new Album(URL, "South Timp", "http://lh6.ggpht.com/_YZLXFz4omoA/TDNSu1AzgHI/AAAAAAAAAuc/4g0pcHWMgEY/s144/DSC03385.JPG", "July 4, 2010"));

            URL = " http://picasaweb.google.com/lh/sredir?uname=vanman798&target=ALBUM&id=5483402799537772529&authkey=Gv1sRgCPTmgfTyhcjF2gE&feat=email";
            albums.Add(new Album(URL, "Grunge Couloir", "thumbnails/GrungeOn.jpg", "June 15, 2010"));

            URL = "http://picasaweb.google.com/vanman798/TheObeliskAndThePfeifferhorn?authkey=Gv1sRgCPK4t8nbm7viggE#";
            albums.Add(new Album(URL, "Obelisk/Pfeiff", "thumbnails/ObeliskOn.jpg", "June 5, 2010"));

            URL = "http://picasaweb.google.com/vanman798/SundialPeak?authkey=Gv1sRgCN-Xn5Lw_pNR#";
            albums.Add(new Album(URL, "Sundial Peak", "thumbnails/CrazyManOn.jpg", "May 31, 2010"));

            albums.Add(new Album(true, 2333, "Upper Pole Couloir", "thumbnails/UpperPoleOn.jpg", "May 15, 2010"));

            URL = "http://picasaweb.google.com/vanman798/MountNebo#";
            albums.Add(new Album(URL, "Mt. Nebo", "thumbnails/NeboPoleOn.jpg", "May 8, 2010"));

            URL = "http://picasaweb.google.com/vanman798/EverestRidge?feat=email#";
            albums.Add(new Album(URL, "Everest Ridge", "thumbnails/EverestRidgeOn.jpg", "April 17, 2010"));

            URL = "http://picasaweb.google.com/vanman798/ElephantButte#";

            albums.Add(new Album(URL, "Elephant Butte", "thumbnails/ElephantOn.jpg", "April 11, 2010"));
            albums.Add(new Album(true, 2282, "Flood", "https://lh4.googleusercontent.com/-t4t-IzCi_Ro/UKqdVnD_EBI/AAAAAAAABHU/KRGEnKgfH6o/s144/144.jpg", "March 28, 2010"));
            albums.Add(new Album(true, 2261, "Box Elder", "thumbnails/BoxElder2On.jpg", "March 20, 2010"));
            albums.Add(new Album(true, 2218, "Over The Years", "https://lh3.googleusercontent.com/-kBizQk7wM3c/UKqeDC5ALfI/AAAAAAAABHo/HQt2s3g27Xw/s800/144.jpg", "2010 and earlier"));

            URL = "https://picasaweb.google.com/116738453430397687681/SpanishForkPeakViaCrowdRidge?authuser=0&authkey=Gv1sRgCM3v1MG-7bu0Pw&feat=directlink";
            albums.Add(new Album(URL, "Crowd Ridge", "thumbnails/CrowdOn.jpg", "March 6, 2010"));

            albums.Add(new Album(true, 2171, "Lone Peak", "thumbnails/LonePeakOn.jpg", "March 2, 2010"));
            albums.Add(new Album(true, 2158, "Roberts Horn", "thumbnails/RobertsOn.jpg", "February. 15, 2010"));
            albums.Add(new Album(true, 2141, "Maple Canyon", "thumbnails/MapleOn.jpg", "January. 30, 2010"));

            albums.Add(new Album("2009", "", "", "", true));

            albums.Add(new Album(true, 2075, "Christmas", "https://lh6.googleusercontent.com/-OqFbKvRTeiw/UKqe0j8tYYI/AAAAAAAABH8/grmhRWli7-Q/s144/144.jpg", "December, 2009"));
            albums.Add(new Album(true, 2059, "Gobblers Knob", "https://lh3.googleusercontent.com/-zMQHKos_YvM/UKqfRcsP9MI/AAAAAAAABIQ/QPHgfgVAgLQ/s800/144.jpg", "November. 28, 2009"));
            albums.Add(new Album(true, 2045, "Spanish Fork Peak", "thumbnails/SFOn.jpg", "November. 7, 2009"));
            albums.Add(new Album(true, 2021, "Halloween", "https://lh5.googleusercontent.com/-cb7ZCsDK-yE/UKqjTEY-zDI/AAAAAAAABI0/BpZbiZkBMp4/s800/144.jpg", "October. 31, 2009"));
            albums.Add(new Album(true, 2001, "Mt. Timpanogos", "thumbnails/OctoberoberTimpOn.jpg", "October. 24, 2009"));
            albums.Add(new Album(true, 1973, "Borah Peak", "thumbnails/BorahOn.jpg", "September. 5, 2009"));
            albums.Add(new Album(true, 1886, "Gannett Peak", "thumbnails/GannettOn.jpg", "August 19, 2009"));
            albums.Add(new Album(true, 1875, "Decemberades", "https://lh4.googleusercontent.com/-nOwQiRVk3Wg/UKqjzLxZ56I/AAAAAAAABJI/VOeyWVwdh4w/s800/144.jpg", "July 7, 2009"));
            albums.Add(new Album(true, 1851, "The 4th", "https://lh5.googleusercontent.com/-Mz5RY85Vyew/UKqkNXdhyMI/AAAAAAAABJc/98tBfZvRVOs/s800/144.jpg", "July 4, 2009"));
            albums.Add(new Album(true, 1833, "Potluck", "https://lh5.googleusercontent.com/-pNEQa2_nkm8/UKqmowIPXpI/AAAAAAAABKU/bCsg99niosA/s800/144.jpg", "June 13, 2009"));
            albums.Add(new Album(true, 1806, "R/W/R/W", "thumbnails/WhiteBaldyOn.jpg", "June 6, 2009"));
            albums.Add(new Album(true, 1735, "Grand Canyon", "thumbnails/GrandCanyonOn.jpg", "May 30 - June 1, 2009"));
            albums.Add(new Album(true, 1695, "Mt. Shasta", "thumbnails/ShastaOn.jpg", "May 23, 2009"));
            albums.Add(new Album(true, 1662, "Triple Traverse", "thumbnails/TTTon.jpg", "May 16, 2009"));
            albums.Add(new Album(true, 1641, "North Timp", "thumbnails/NTimp2on.jpg", "May 9, 2009"));
            albums.Add(new Album(true, 1604, "North Thunder", "thumbnails/NThunderOn.jpg", "May 6, 2009"));
            albums.Add(new Album(true, 1558, "Bald Mountain", "thumbnails/SharpOn.jpg", "March 7, 2009"));
            albums.Add(new Album(true, 1485, "Cardiac Ridge", "thumbnails/CardiacOn.jpg", "Februaryruary 21, 2009"));
            albums.Add(new Album(true, 1440, "Lowe Peak", "thumbnails/LoweOn.jpg", "Februaryruary 7, 2009"));
            albums.Add(new Album(true, 1386, "Flagstaff Mtn/Days Fork", "thumbnails/FlagStaffOn.jpg", "Januaryuary 10, 2009"));
            albums.Add(new Album(true, 1355, "Peak 8753", "thumbnails/Peak8753On.jpg", "Januaryuary 3, 2009"));

            albums.Add(new Album("2008", "", "", "", true));

            albums.Add(new Album(true, 1338, "Red Baldy", "thumbnails/RedBaldyOn.jpg", "Decemberember 6, 2008"));
            albums.Add(new Album(true, 1267, "Halloween", "https://lh6.googleusercontent.com/-5BmGA_-thMo/UKa5ahgNjHI/AAAAAAAABG8/Endyey6HcD0/s144/144.jpg", "October 31, 2008"));
            albums.Add(new Album(true, 1248, "Bomber Peak", "https://lh6.googleusercontent.com/-0XVuxE7X19o/UKa1pGUT8mI/AAAAAAAABGg/WIOGoVh5XcE/s800/144.jpg", "October 11 & 18, 2008"));
            albums.Add(new Album(true, 1198, "AAM Reunion", "https://lh3.googleusercontent.com/-A0N4m6Q-zmI/UKa0mWYzU1I/AAAAAAAABGM/Nw1JXcaMtqo/s800/144.jpg", "October 1-3, 2008"));
            albums.Add(new Album(true, 1177, "BF Twin Peaks", "thumbnails/BFTwinsOn.jpg", "Septemberember 6, 2008"));
            albums.Add(new Album(true, 1127, "High Uintas", "thumbnails/WGunsightOn.jpg", "July 24-27, 2008"));
            albums.Add(new Album(true, 1112, "AF Twin Peaks", "thumbnails/AFTwinsOn.jpg", "July 18, 2008"));
            albums.Add(new Album(true, 1088, "Crowsnest Mountain", "thumbnails/CrowsnestOn.jpg", "July 12, 2008"));
            albums.Add(new Album(true, 1076, "Mount Crandell", "thumbnails/CrandellOn.jpg", "July 10, 2008"));
            albums.Add(new Album(true, 1060, "Turtle Mtn & Waterton", "thumbnails/Alberta2008On.jpg", "July 7 - 9, 2008"));
            albums.Add(new Album(true, 1026, "Vimy Peak", "thumbnails/VimyOn.jpg", "July 5, 2008"));
            albums.Add(new Album(true, 1010, "Box Elder", "thumbnails/BoxElderOn.jpg", "June 21, 2008"));
            albums.Add(new Album(true, 982, "S. Thunder &<br />Big Horn", "thumbnails/SThunderOn.jpg", "June 14, 2008"));
            albums.Add(new Album(true, 959, "North Timp", "thumbnails/NTimpOn.jpg", "May 31, 2008"));
            albums.Add(new Album(true, 941, "Mt. Superior", "thumbnails/MonteOn.jpg", "May 16, 2008"));
            albums.Add(new Album(true, 917, "Mt. Dromedary", "thumbnails/dromedaryon.jpg", "May 10, 2008"));
            albums.Add(new Album(true, 888, "Wolverine Cirque", "thumbnails/wolverineOn.jpg", "March 29, 2008"));
            albums.Add(new Album(true, 865, "The Canyons", "thumbnails/CanyonsOn.jpg", "Februaryruary 2, 2008"));
            albums.Add(new Album(true, 843, "Mt. Nebo", "thumbnails/NeboOn.jpg", "Januaryuary 22, 2008"));

            albums.Add(new Album("2007", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/820";
            img = "https://lh5.googleusercontent.com/-OGkM-7LLhUE/UKae4fLdQTI/AAAAAAAABF0/9KjyhdOleU8/s144/temple.jpg";
            Title = "Alberta";
            Date = "November 21-26, 2007";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/808";
            img = "https://lh5.googleusercontent.com/-8VwXemjolu0/UKab2L06VfI/AAAAAAAABFY/yNx3d90t-mc/s144/p.jpg";
            Title = "Pfeifferhorn";
            Date = "September 14 & 15, 2007";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/802";
            img = "https://lh3.googleusercontent.com/-2vPKXjnIdvE/UKaKsQ2vNoI/AAAAAAAABEs/DUA5QmlxlIw/s144/nebo.jpg";
            Title = "Mt. Nebo";
            Date = "September 3, 2007";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/776";
            img = "https://lh3.googleusercontent.com/-NZSjyblSwAM/UKaIm_JBhPI/AAAAAAAABEQ/Nr4ANgmdgkc/s144/lone.jpg";
            Title = "Lone Peak";
            Date = "Aug 23, 2007";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/748";
            img = "https://lh3.googleusercontent.com/-gGmYadj1OA0/UKaHtbwrd_I/AAAAAAAABD4/Wr-JuluQ7ms/s144/timp.jpg";
            Title = "Mt. Timpanogos";
            Date = "Aug 3 & 4, 2007";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/722";
            img = "https://lh3.googleusercontent.com/-umud3zC5n7Q/UKaG_0OpuRI/AAAAAAAABDg/0B6IAewIz1Y/s144/cascade.jpg";
            Title = "Cascade";
            Date = "July 14, 2007";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/709";
            img = "https://lh5.googleusercontent.com/-4FbuhP-b1ww/UKaGBSf5DEI/AAAAAAAABDI/BZn-zxFlbcE/s144/shed.jpg";
            Title = "Shed";
            Date = "June & July 2007";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/640";
            img = "https://lh6.googleusercontent.com/-p99iiDp5v9w/UKaFFnbdhbI/AAAAAAAABC0/-61_7CN2XKw/s144/shadow.jpg";
            Title = "Spring & Summer";
            Date = "2007";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/601";
            img = "https://lh6.googleusercontent.com/-slpLhRzou1E/UKaERVcK5FI/AAAAAAAABCc/kuiJk5m9ynE/s144/arches.jpg";
            Title = "Moab Area";
            Date = "May 2007";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/593";
            img = "https://lh5.googleusercontent.com/-EH60FmXxbFQ/UKaCqjYgb0I/AAAAAAAABCI/mBCCT4MYx6M/s144/HOrsts.jpg";
            Title = "Horsts Funeral";
            Date = "April 25, 2007";
            albums.Add(new Album(URL, Title, img, Date));

            albums.Add(new Album("2006", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/560";
            img = "thumbnails/2006On.jpg";
            Title = "Random 2006";
            Date = "2006";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/541";
            img = "https://lh5.googleusercontent.com/-pezDmwXNCd4/UKZvUsOgC4I/AAAAAAAABBs/hK0BalTq6bI/s144/39b-day.jpg";
            Title = "B-day 2006";
            Date = "August 2006";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/525";
            img = "https://lh5.googleusercontent.com/-ZR9xNO-TKhs/UKZssDKu2SI/AAAAAAAABBA/z70SdqWRmGY/s144/waterton.jpg";
            Title = "Summer 2006";
            Date = "July 2006";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/507";
            img = "thumbnails/ZionNarrows2005On.jpg";
            Title = "Zion Narrows";
            Date = "June 10, 2006";
            albums.Add(new Album(URL, Title, img, Date));

            albums.Add(new Album("2005", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/488";
            img = "thumbnails/AdiOn.jpg";
            Title = "Adirondacks";
            Date = "July 1-5, 2005";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/472";
            img = "thumbnails/WVOn.gif";
            Title = "West Virginia";
            Date = "May 28-29, 2005";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/440";
            img = "thumbnails/DVOn.jpg";
            Title = "Desert SW";
            Date = "May 17-21, 2005";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/426";
            img = "thumbnails/skiOn.gif";
            Title = "Snowshoe, WV";
            Date = "February 27 - March 2, 2005";
            albums.Add(new Album(URL, Title, img, Date));

            albums.Add(new Album("2004", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/412";
            img = "thumbnails/karaokeOn.jpg";
            albums.Add(new Album(URL, "Random 2004 Pics", img, "2004"));

            URL = "http://vanman798.shutterfly.com/pictures/400";
            img = "thumbnails/DCon.gif";
            Title = "DC";
            Date = "Octoberober, 2004";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/388";
            img = "https://lh4.googleusercontent.com/-0QeGWhPIKBQ/UKZpwgfH6gI/AAAAAAAABAo/r_y4F-LB700/s144/Reflection.jpg";
            albums.Add(new Album(URL, "Langley Dinner", img, "Septemberember, 2004"));

            URL = "http://vanman798.shutterfly.com/pictures/352";
            img = "thumbnails/skydivingOn.jpg";
            Title = "Skydiving";
            Date = "August 21, 2004";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/311";
            img = "thumbnails/hongkongOn.jpg";
            albums.Add(new Album(URL, "Hong Kong", img, "Februaryruary, 2004"));

            albums.Add(new Album("2003", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/300";
            img = "thumbnails/rafting2003On.jpg";
            albums.Add(new Album(URL, "Yough River, PA", img, "Septemberember 13, 2003"));

            URL = "http://vanman798.shutterfly.com/pictures/248";
            img = "thumbnails/Summer2003On.jpg";
            albums.Add(new Album(URL, "Alberta", img, "August, 2003"));

            URL = "http://vanman798.shutterfly.com/pictures/211";
            img = "thumbnails/SavannahOn.jpg";
            albums.Add(new Album(URL, "Savannah", img, "July 4, 2003"));

            albums.Add(new Album("2002", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/207";
            img = "thumbnails/GauleyOn.jpg";
            albums.Add(new Album(URL, "Gauley River, WV", img, "Octoberober 12, 2002"));

            albums.Add(new Album("2001", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/171";
            img = "thumbnails/grandfatheron.jpg";
            albums.Add(new Album(URL, "Grandfather, NC", img, "May 2001"));

            albums.Add(new Album("1993", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/159";
            img = "thumbnails/90On.jpg";
            albums.Add(new Album(URL, "Random 90's Pics", img, "1993-1999"));

            albums.Add(new Album("1989", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/149";
            img = "https://lh4.googleusercontent.com/-BqUCyDqr9RE/UKWKfhaMuBI/AAAAAAAABAM/afghK5motIc/s144/college.jpg";
            albums.Add(new Album(URL, "College", img, "1989-92"));

            albums.Add(new Album("1986", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/123";
            img = "https://lh5.googleusercontent.com/-7GUwCXXHs8c/UKWIQejqzSI/AAAAAAAAA_4/DjBRBw86Q38/s144/aam.jpg";
            albums.Add(new Album(URL, "AAM", img, "1986-88"));

            albums.Add(new Album("1970", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/97";
            img = "https://lh4.googleusercontent.com/-WPV2NLsE27Y/UKWEAV2tb-I/AAAAAAAAA_g/vwx9pnOYPKU/s144/sliding.jpg";
            albums.Add(new Album(URL, "Kid Photos", img, "1970-81"));

            return albums;
        }

        private string MakeDatePicker(string id)
        {
            System.Text.StringBuilder bldr = new StringBuilder();

            bldr.Append(@"<select name=""PickYear"" id=""");
            bldr.Append(id);
            bldr.Append(@""" onchange=""PhotoYear(document.getElementById('");
            bldr.Append(id);
            bldr.Append(@"').selectedIndex);"">\r\n");
            bldr.Append("<option>2014</option>\r\n");
            bldr.Append("<option>2013</option>\r\n");
            bldr.Append("<option>2012</option>\r\n");
            bldr.Append("<option>2011</option>\r\n");
            bldr.Append("<option>2010</option>\r\n");
            bldr.Append("<option>2009</option>\r\n");
            bldr.Append("<option>2008</option>\r\n");
            bldr.Append("<option>2007</option>\r\n");
            bldr.Append("<option>2006</option>\r\n");
            bldr.Append("<option>2005</option>\r\n");
            bldr.Append("<option>2004</option>\r\n");
            bldr.Append("<option>2003</option>\r\n");
            bldr.Append("<option>2002</option>\r\n");
            bldr.Append("<option>2001</option>\r\n");
            bldr.Append("<option>1993</option>\r\n");
            bldr.Append("<option>1989</option>\r\n");
            bldr.Append("<option>1986</option>\r\n");
            bldr.Append("<option>1970</option>\r\n");
            bldr.Append("</select>\r\n");

            return bldr.ToString();
        }

        private string ImageLink(Album a)
        {
            System.Text.StringBuilder bldr = new StringBuilder();

            if (a.IsAnchor)
            {
                bldr.Append("\r\n");
                bldr.Append("\r\n");
                bldr.Append("<h1>--");
                bldr.Append(a.AlbumURL);
                bldr.Append("</h1>");
                bldr.Append("\r\n");
            }
            else
            {
                //INSERT INTO [dbo].[Photos] ([Title] ,[URL] ,[Date]) VALUES ('Alberta','','12/25/2012')
                bldr.Append("INSERT INTO [dbo].[Photos] ([Title] ,[URL] ,[Date])<br> &nbsp; VALUES ('");
                bldr.Append(a.AlbumTitle);
                bldr.Append("','");
                bldr.Append(a.AlbumURL);
                bldr.Append("','");
                bldr.Append(a.Date);
                bldr.Append("')\r\n");
                bldr.Append("<br />");
                bldr.Append("<br />");
            }
            return bldr.ToString();
        }

        public class Album
        {
            public Album()
            {
                this.IsAnchor = false;
                this.IsShutterFly = false;
            }

            public Album(string AlbumURL, string AlbumTitle, string ThumbNailURL, string Date)
            {
                this.AlbumTitle = AlbumTitle;
                this.AlbumURL = AlbumURL;
                this.Date = Date;
                this.ThumbNailURL = ThumbNailURL;
                this.IsAnchor = false;
                this.IsShutterFly = false;
            }

            public Album(string AlbumURL, string AlbumTitle, string ThumbNailURL, string Date, bool Anchor)
            {
                this.AlbumTitle = AlbumTitle;
                this.AlbumURL = AlbumURL;
                this.Date = Date;
                this.ThumbNailURL = ThumbNailURL;
                this.IsAnchor = Anchor;
                this.IsShutterFly = false;
            }

            public Album(bool ShutterFly, int ShutterFlyNumber, string AlbumTitle, string ThumbNailURL, string Date)
            {
                if (ShutterFly)
                    this.AlbumURL = "http://vanman798.shutterfly.com/pictures/" + ShutterFlyNumber.ToString();

                this.AlbumTitle = AlbumTitle;
                this.Date = Date;
                this.ThumbNailURL = ThumbNailURL;
                this.IsAnchor = false;
            }

            private string _AlbumURL;
            private string _AlbumTitle;
            private string _ThumbNailURL;
            private string _Date;
            private bool _IsAnchor = false;
            private bool _IsShutterFly = false;

            public bool IsShutterFly
            {
                get { return _IsShutterFly; }
                set { _IsShutterFly = value; }
            }

            public bool IsAnchor
            {
                get { return _IsAnchor; }
                set { _IsAnchor = value; }
            }

            public string AlbumURL
            {
                get { return _AlbumURL; }
                set { _AlbumURL = value; }
            }

            public string AlbumTitle
            {
                get { return _AlbumTitle; }
                set { _AlbumTitle = value; }
            }

            public string ThumbNailURL
            {
                get { return _ThumbNailURL; }
                set { _ThumbNailURL = value; }
            }

            public string Date
            {
                get { return _Date; }
                set { _Date = value; }
            }
        }   
    </script>
    <title>Photo Albums</title>
    <script language="javascript" src="../JScript1.js"></script>
    <script type="text/javascript" src="../jquery-1.4.1.min.js"></script>
    <link rel="stylesheet" href="../StyleSheet1.css" type="text/css">
</head>
<body>
    
                                <asp:Literal ID="litAlbums" runat="server"></asp:Literal>
</body>
</html>