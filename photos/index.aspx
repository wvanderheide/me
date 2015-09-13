<!DOCTYPE html>
<%@ Register TagPrefix="uc1" TagName="UC_LeftNav" Src="../UC_LeftNav.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_Header" Src="../UC_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_Footer" Src="../UC_Footer.ascx" %>

<%@ Page Language="c#" %>

<html>
<head>
    <script language="C#" runat="server">	
        private void Page_Load(object sender, System.EventArgs e)
        {
            System.Collections.ArrayList albums = GetAlbumList();  //This should be "System.Collections.Generic.List<Album>", but Brinkster doesn't support Generic.Lists - November 19, 2012

            litAlbums.Text = string.Empty;

            foreach (Album a in albums)
            {
                litAlbums.Text = litAlbums.Text + ImageLink(a);
            }

            UC_LeftNav1.P_GraphicName = "photos";
            UC_LeftNav1.P_ImageName = "image10";

            UC_Header1.P_HeaderTitle = "Photo Albums";
            UC_Header1.P_HeaderText = "Click thumbnail to open photo album";
            UC_Footer1.P_LastModified = "Oct 1, 2014";

            litDatePicker1.Text = MakeDatePicker("PickYear1");
            litDatePicker2.Text = MakeDatePicker("PickYear2");
        }

        private System.Collections.ArrayList GetAlbumList()
        {
            //This should return a "System.Collections.Generic.List<Album>", but Brinkster doesn't support Generic.Lists - November 19, 2012

            // System.Collections.Generic.List<Album> albums = new System.Collections.Generic.List<Album>();
            System.Collections.ArrayList albums = new ArrayList();


            string URL = "";
            string img = "";
            string Title = ""; //Goal is to do away with this Var
            string Date = ""; //Goal is to do away with this Var

            /* ******  Every time you add a new album, update some old ones to 
            albums.Add(new Album(true, 1355, "title", "thumbnails/Peak8753On.jpg", "date"));
            ********* */

            //Missing Pics:
            //Bday 2009
            //Y Oct 2007
            //Thanksgiving 2006 (Squaw Peak with Yenny)
            albums.Add(new Album("2014", "", "", "", true));

            URL = "https://picasaweb.google.com/107082436175597733376/EnglesteadCanyon?authuser=0&authkey=Gv1sRgCMeyodCygbbRCA&feat=directlink";
            img = "https://lh4.googleusercontent.com/-m7R_nFbGubY/VCxIDbK69JI/AAAAAAAAGh8/rUjzHzL_0dg/s144/EnglesteadCanyon%2520%25287%2529.JPG";
            albums.Add(new Album(URL, "Englestead", img, "August 9, 2014"));

            URL = "https://picasaweb.google.com/107082436175597733376/DenaliNP?authuser=0&authkey=Gv1sRgCMfYm8akyJK7_AE&feat=directlink";
            img = "https://lh5.googleusercontent.com/-AHbm6-PVhOo/VCwuhdszAvI/AAAAAAAAGU0/ReJF-dJVvY4/s144/NP%2520%252842%2529.JPG";
            albums.Add(new Album(URL, "Denali NP", img, "June 16, 2014"));
            
            URL = "https://picasaweb.google.com/107082436175597733376/DenaliJune2104?authuser=0&authkey=Gv1sRgCLOyuMqWyaOwIg&feat=directlink";
            img = "https://lh6.googleusercontent.com/-s3i0R5eDQFM/VCtgBJQ-XWI/AAAAAAAAFxQ/ClR_Pg-p2j4/s144/Denali%2520%2528115%2529.JPG";
            albums.Add(new Album(URL, "Mt. McKinley", img, "June 7, 2014"));

            URL = "https://picasaweb.google.com/107082436175597733376/CoyoteGulch?authuser=0&authkey=Gv1sRgCJ-a7LTvlPytiQE&feat=directlink";
            img = "https://lh3.googleusercontent.com/-zyed_Kw1geM/U3D7sYChjVI/AAAAAAAAFWk/-SycKbAlqfc/s144/DSC07362.JPG";
            albums.Add(new Album(URL, "Coyote Gulch", img, "May 10, 2014"));

            URL = "https://picasaweb.google.com/107082436175597733376/RockCanyonInFebruary?authuser=0&authkey=Gv1sRgCKaHrq_fuJChhQE&feat=directlink";
            img = "https://lh6.googleusercontent.com/-q0HRUq7GjwM/UwAtyf3c0xI/AAAAAAAAFOw/ZJDqjGZ3Ji4/s144/DSC07301.JPG";
            albums.Add(new Album(URL, "Feb Rock Climbing", img, "Feb 15, 2014"));

            URL = "https://picasaweb.google.com/107082436175597733376/OurayCO?authuser=0&authkey=Gv1sRgCJqEmquxlKakcw&feat=directlink";
            img = "https://lh6.googleusercontent.com/-tto7zWZKEOc/Uu_XiP9-DuI/AAAAAAAAEs0/uUMuFevJPLY/s144/031.JPG";
            albums.Add(new Album(URL, "Ouray", img, "Jan 31, 2014"));
            
            URL = "https://picasaweb.google.com/107082436175597733376/Reception?authuser=0&authkey=Gv1sRgCP_yq62IlPCZhgE&feat=directlink";
            img = "https://lh5.googleusercontent.com/-5Kr1o8X8Qww/UvqulBkGgWI/AAAAAAAAE8E/AKbuMNoxCww/s144/Cake010.JPG";
            albums.Add(new Album(URL, "Reception", img, "Jan 25, 2014"));

            URL = "https://picasaweb.google.com/107082436175597733376/AFCanyon?authuser=0&authkey=Gv1sRgCM2Y7ZjJjZXW6QE&feat=directlink";
            img = "https://lh6.googleusercontent.com/-jIdKAVnWfeQ/UtwI4Q4sEhI/AAAAAAAAEmo/f4xDbmuKPpg/s144/DSC07062.JPG";
            albums.Add(new Album(URL, "AF Canyon", img, "Jan 14, 2014"));
            
            URL = "https://picasaweb.google.com/107082436175597733376/MillersThriller?authuser=0&authkey=Gv1sRgCNnetqeYl67MFA&feat=directlink";
            img = "https://lh6.googleusercontent.com/-u-Na6oFFexU/Us8_AYKFo1I/AAAAAAAAEa0/uUBBkFPckpM/s144/07.jpg";
            albums.Add(new Album(URL, "Millers Thriller", img, "Jan 3, 2014"));

			albums.Add(new Album("2013", "", "", "", true));

            URL = "https://picasaweb.google.com/107082436175597733376/Wedding?authuser=0&authkey=Gv1sRgCNub-Mbr1MG82QE&feat=directlink";
            img = "https://lh6.googleusercontent.com/-0F6ZgqyBVNo/UtSfbzh60yI/AAAAAAAAEfY/PnuDB1MaIrg/s144/Capture.JPG";
            albums.Add(new Album(URL, "Wedding", img, "Dec 12, 2013"));
            
            URL = "https://picasaweb.google.com/107082436175597733376/MexicoCity?authuser=0&authkey=Gv1sRgCPvnsvKJs6fTHQ&feat=directlink";
            img = "https://lh4.googleusercontent.com/-_tapn0z3OAI/UsDmP4pgcBI/AAAAAAAAEIs/wIABl2KNO9k/s144/015.JPG";
            albums.Add(new Album(URL, "Mexico City", img, "Dec 2, 2013"));
            
            URL = "https://picasaweb.google.com/107082436175597733376/Teotihuacan?authuser=0&authkey=Gv1sRgCK7vmaXC_snuXg&feat=directlink";
            img = "https://lh5.googleusercontent.com/-TJLSgY3F5sw/UsDiOb8fm5I/AAAAAAAAEE8/xzL27j3gJH4/s144/020.JPG";
            albums.Add(new Album(URL, "Teotihuacan", img, "Dec 1, 2013"));
            
            URL = "https://picasaweb.google.com/107082436175597733376/Iztaccihuatl?authuser=0&authkey=Gv1sRgCIWa6Lut3pSlfg&feat=directlink";
            img = "https://lh5.googleusercontent.com/-0n6YY_KSmIE/UsDcs7Xxs3I/AAAAAAAAEAM/X2i2JiXFr8k/s144/023-SNOW.gif";
            albums.Add(new Album(URL, "Itza", img, "Nov 30, 2013"));

            URL = "https://picasaweb.google.com/107082436175597733376/Orizaba?authuser=0&authkey=Gv1sRgCOCIwJuUjtWUkAE&feat=directlink";
            img = "https://lh3.googleusercontent.com/-Z1nJL870WeA/Uq-VxOhrpiI/AAAAAAAAD5E/o6ifdoZF8e8/s144/0480.JPG";
            albums.Add(new Album(URL, "Orizaba", img, "Nov 27, 2013"));

            URL = "https://picasaweb.google.com/107082436175597733376/DirtcicleNov192013?authuser=0&authkey=Gv1sRgCI7V75Xy2u-ArQE&feat=directlink";
            img = "https://lh4.googleusercontent.com/-8kwL2L4cOpI/Uo6hEuu3NWI/AAAAAAAADuE/MZcgvDvwcII/s144/GoodWalter.jpg";
            albums.Add(new Album(URL, "Dirtcicle", img, "Nov 19, 2013"));

            URL = "https://picasaweb.google.com/107082436175597733376/DirtcicleNov192013?authuser=0&authkey=Gv1sRgCI7V75Xy2u-ArQE&feat=directlink";
            img = "https://lh4.googleusercontent.com/-8kwL2L4cOpI/Uo6hEuu3NWI/AAAAAAAADuE/MZcgvDvwcII/s144/GoodWalter.jpg";
            albums.Add(new Album(URL, "Dirtcicle", img, "Nov 19, 2013"));
            
            URL = "https://picasaweb.google.com/107082436175597733376/ZionCanyon?authuser=0&authkey=Gv1sRgCKHl29P5npnnpAE&feat=directlink";
            img = "https://lh4.googleusercontent.com/-Sa9vTM-xfQs/Unlz09rHVdI/AAAAAAAADYc/-iRQnT14lf8/s144/DSC06649.JPG";
            albums.Add(new Album(URL, "Zion NP", img, "Nov 1, 2013"));

            URL = "https://picasaweb.google.com/107082436175597733376/RedRockAndProphecy?authuser=0&authkey=Gv1sRgCLPY7tWtzenw4QE&feat=directlink";
            img = "https://lh6.googleusercontent.com/-apL_A2QMFxg/UoA88Z2cMHI/AAAAAAAADnE/n86nV6WTIB8/s144/027.JPG";
            albums.Add(new Album(URL, "RR", img, "Oct 26, 2013"));

            
            URL = "https://picasaweb.google.com/107082436175597733376/RedRockCanyon?authuser=0&authkey=Gv1sRgCMn_p__p3K7gwQE&feat=directlink";
            img = "https://lh6.googleusercontent.com/-AYn-0E__vsM/Ukc7EcdhRBI/AAAAAAAADPw/ATlJQyGq4go/s144/018.JPG";
            albums.Add(new Album(URL, "RR Canyon", img, "Sept 25, 2013"));


            URL = "https://picasaweb.google.com/107082436175597733376/CityOfRocks?authuser=0&authkey=Gv1sRgCOadrbnshcODVw&feat=directlink";
            img = "https://lh6.googleusercontent.com/-ywdI3oTk2M4/Ukc33PxKFxI/AAAAAAAADL8/1ycN25AUajE/s144/009.JPG";
            albums.Add(new Album(URL, "City of Rocks", img, "Sept 20, 2013"));
            
            URL = "http://tinyurl.com/k425jrb ";
            img = "https://lh6.googleusercontent.com/-XvFtg0clyOQ/UjaOcDbryUI/AAAAAAAAC78/1r10VIrYoIk/s144/DSC06460%2520copy.jpg";
            albums.Add(new Album(URL, "Pingora, Wy", img, "Sept 10, 2013"));

			URL = "http://tinyurl.com/keb97mt";
			img = "https://lh4.googleusercontent.com/-uWAqbd5WTgc/UdMFohxqsHI/AAAAAAAACsA/h8x4EjAanjg/s144/DSC06356%2520copy.jpg";
			albums.Add(new Album(URL, "Wheeler, NV", img, "June 29, 2013"));

			URL = "http://tinyurl.com/n62akro";
			img = "https://lh6.googleusercontent.com/-QEGzbhzojAE/UcihxKHtMpI/AAAAAAAACj0/bqBnTYBPpm8/s144/011.jpg";
			albums.Add(new Album(URL, "Teewinot", img, "June 21, 2013"));

			URL = "https://picasaweb.google.com/107082436175597733376/GuadalupePeak?authuser=0&authkey=Gv1sRgCOiUkryTksPXRQ&feat=directlink";
			img = "https://lh5.googleusercontent.com/-Go9felgOWGw/UbdaGAxx1BI/AAAAAAAACcQ/SS0or4vDLfk/s144/DSC06300.JPG";
			albums.Add(new Album(URL, "Guadalupe Peak", img, "June 8, 2013"));	

			URL = "http://tinyurl.com/mzjcrux";
			img = "https://lh6.googleusercontent.com/-FnmZJEYhtcw/Ua4NCqcp7-I/AAAAAAAACXE/eMhtdXjbJXA/s144/031.JPG";
			albums.Add(new Album(URL, "Twin Couloirs", img, "June 1, 2013"));		

			URL = "https://picasaweb.google.com/107082436175597733376/GeurtsRidge?authuser=0&authkey=Gv1sRgCLqJ4PWXor-mJg&feat=directlink#";
			img = "https://lh4.googleusercontent.com/-h7M8loeV2gA/UaTMVU_-CPI/AAAAAAAACPs/LQq6oyywCTg/s144/DSC06167.JPG";
			albums.Add(new Album(URL, "Geurts Ridge", img, "May 27, 2013"));

			URL = "https://picasaweb.google.com/107082436175597733376/WheelerPeakNM?authkey=Gv1sRgCM781Y6ow7n0tQE&noredirect=1#";
			img = "https://lh3.googleusercontent.com/-ihjkRcooKd8/UYFpsZPAmDI/AAAAAAAACEU/QRkchLk2_4E/s144/DSC06103.JPG";
			albums.Add(new Album(URL, "Wheeler, NM", img, "April 27, 2013"));
			
            URL = "https://picasaweb.google.com/107082436175597733376/HenrySForkSkiTourCamping?authuser=0&authkey=Gv1sRgCLn81YL8qpOrowE&feat=directlink";
            img = "https://lh5.googleusercontent.com/-IH8jS9TrfYU/USaGWHkCR2I/AAAAAAAAB0E/hDDE3V_eAYk/s144/003_LT.jpg";
            albums.Add(new Album(URL, "Henrys Fork", img, "Feb 16-18, 2013"));


            albums.Add(new Album("2012", "", "", "", true));
            URL = "https://picasaweb.google.com/107082436175597733376/ChristmasVacation2012?authuser=0&authkey=Gv1sRgCLXNmp7fmdnuDg&feat=directlink";
            img = "https://lh3.googleusercontent.com/-xmNU_olZe-s/UORfWJEOMiI/AAAAAAAABYc/YOkXhFol3EY/s144/DSC05939.JPG";
            albums.Add(new Album(URL, "Christmas", img, "Dec 22-31, 2012"));

            URL = "https://picasaweb.google.com/107082436175597733376/DirtcicleDec202012?authuser=0&authkey=Gv1sRgCM6sl8-nifjT9AE&feat=directlink";
            img = "https://lh3.googleusercontent.com/-t0JZvBHR_3Q/UORdxLU-iGI/AAAAAAAABWk/-TmcIs55M14/s144/PICT0604_zpsaee684fa.jpg";
            albums.Add(new Album(URL, "Dirtcicle ", img, "Dec 20, 2012"));

            URL = "https://picasaweb.google.com/107082436175597733376/JoeSValley?authuser=0&authkey=Gv1sRgCO-o35nL3_XAhQE&feat=directlink";
            img = "https://lh4.googleusercontent.com/-tMobaFkeSi0/UM9NzvxqyEI/AAAAAAAABP4/RInUomHvWqU/s144/DSC05910.JPG";
            albums.Add(new Album(URL, "Joe's Valley", img, "Dec 16, 2012"));

            URL = "https://picasaweb.google.com/107082436175597733376/DirtcicleDec152012?authuser=0&authkey=Gv1sRgCJKbruXstvaRAw&feat=directlink";
            img = "https://lh3.googleusercontent.com/-v-JaUAnC2wA/UM9KBLO_FdI/AAAAAAAABM8/06VfScd9WVY/s144/DSC05899.JPG";
            albums.Add(new Album(URL, "Dirtcicle", img, "Dec 15, 2012"));

            URL = "https://picasaweb.google.com/107082436175597733376/DirtcicleDec92012?authuser=0&authkey=Gv1sRgCLHxvYaBo8DFRw&feat=directlink";
            img = "https://lh6.googleusercontent.com/-CTRjAd4_kQU/UM9Wo4GndvI/AAAAAAAABSQ/ABiWiEhwEE0/s144/P1000065.JPG";
            albums.Add(new Album(URL, "Dirtcicle", img, "Dec 9, 2012"));


            albums.Add(new Album(true, 2357, "Grand Staircase", "thumbnails/GrandStaircase.jpg", "Nov.23-26 , 2012"));

            URL = "https://picasaweb.google.com/107082436175597733376/WillardPeakAndBenLomond?authuser=0&authkey=Gv1sRgCJ3m5vS3hKSa1AE&feat=directlink";
            img = "https://lh3.googleusercontent.com/-Ulks_yxg3xk/UE35s7xuf2I/AAAAAAAAA2I/qSdtyKkIfzc/s144/DSC05735.JPG";
            albums.Add(new Album(URL, "Willard Peak", img, "Sept 8, 2012"));

            URL = "https://picasaweb.google.com/107082436175597733376/CrystalPeak?authuser=0&authkey=Gv1sRgCJaopLmL7_mSag&feat=directlink";
            img = "https://lh5.googleusercontent.com/-stOvVre5n2Y/UEZ7CpqIZCI/AAAAAAAAAyE/noChgiGnYb8/s144/DSC05708.JPG";
            albums.Add(new Album(URL, "Crystal Peak", img, "Sept 2, 2012"));

            URL = "https://picasaweb.google.com/107082436175597733376/NotchPeak?authuser=0&authkey=Gv1sRgCKyFwYmXhoaddQ&feat=directlink";
            img = "https://lh6.googleusercontent.com/-COg4c_OdLZk/UEZSiHx_yOI/AAAAAAAAAqw/uVll3FNI9lE/s144/DSC05664.JPG";
            albums.Add(new Album(URL, "Notch Peak", img, "Sept 1, 2012"));

            URL = "https://picasaweb.google.com/107082436175597733376/GranitePeak?authuser=0&authkey=Gv1sRgCL-Vg4Wh89OpAQ&feat=directlink";
            img = "https://lh4.googleusercontent.com/-kBheZ7pEOOM/UDOwOhtS8_I/AAAAAAAAAgo/VFx2O9shOgE/s144/DSC05644.JPG";
            albums.Add(new Album(URL, "Granite Peak", img, "August 18, 2012"));

            URL = "https://picasaweb.google.com/107082436175597733376/MtOgdenEastFace?authuser=0&authkey=Gv1sRgCPizlbvMp531-QE&feat=directlink";
            img = "https://lh3.googleusercontent.com/-XBB30Y4_HYw/UBafW_917yI/AAAAAAAAALM/5OxZIA09nq0/s144/DSC05521.JPG";
            albums.Add(new Album(URL, "Mt. Ogden", img, "July 28, 2012"));

            URL = "https://picasaweb.google.com/107082436175597733376/TheGrandTeton?authuser=0&authkey=Gv1sRgCMfT2onZmejVxgE&feat=directlink#";
            img = "https://lh3.googleusercontent.com/-nSkWucaY-BE/UA1qFLFNWTI/AAAAAAAAAEA/fJBITHVjP_Q/s144/010.JPG";
            albums.Add(new Album(URL, "Grand Teton", img, "July 21, 2012"));

            URL = "https://picasaweb.google.com/116738453430397687681/LondonSpire?authuser=0&authkey=Gv1sRgCOiYku3f0MrNBg&feat=directlink#";
            img = "https://lh3.googleusercontent.com/-NMYencvQb6Y/T_sJsQIeGoI/AAAAAAAAE9o/SniqgueCW_k/s144/029.JPG";
            albums.Add(new Album(URL, "London Spire", img, "July 7, 2012"));

            URL = "https://picasaweb.google.com/116738453430397687681/LonePeakCirque?authuser=0&authkey=Gv1sRgCP3Qo978r6K_Kw&feat=directlink";
            img = "https://lh6.googleusercontent.com/-_GfSouTkIHI/T_MGMVCtXrI/AAAAAAAAE3k/9XraKM8CeQI/s144/029J.jpg";
            albums.Add(new Album(URL, "Lone Peak", img, "June 29, 2012"));

            URL = "https://picasaweb.google.com/116738453430397687681/IbapahJune232012?authuser=0&authkey=Gv1sRgCNbNooH_5dqLSQ&feat=directlink";
            img = "https://lh4.googleusercontent.com/-nkFsQLBFT_o/T-fPXOsoA7I/AAAAAAAAEP8/c49owM3gupc/s144/DSC05140.JPG";
            albums.Add(new Album(URL, "Ibapah", img, "June 23, 2012"));

            URL = "https://picasaweb.google.com/116738453430397687681/WestSlabsMountOlympus?authuser=0&authkey=Gv1sRgCMaq0-_W8rXqxAE&feat=directlink#";
            img = "https://lh4.googleusercontent.com/-i_nugEmlP7E/T93h-mIEqnI/AAAAAAAAEEk/jv0nPKmXHpI/s144/DSC05011.JPG";
            albums.Add(new Album(URL, "West Slabs", img, "June 16, 2012"));

            URL = "https://picasaweb.google.com/116738453430397687681/Sundial11thHourJune82012?authuser=0&authkey=Gv1sRgCKf4kYGz_9yEIA&feat=directlink";
            img = "https://lh5.googleusercontent.com/-O-QaL_z70a8/T9YUbN4SqUI/AAAAAAAAD9U/cndzk8qqtho/s144/03The%2520red%2520line%2520is%2520the%2520route%2520we%2520took.%2520The%2520orange%2520line%2520is%2520the%2520more%2520traditional%2520route.jpg";
            albums.Add(new Album(URL, "11th Hour", img, "June 8, 2012"));

            URL = "https://picasaweb.google.com/116738453430397687681/SantaquinLoafer?authuser=0&authkey=Gv1sRgCK38wtHR4r7G6wE&feat=directlink";
            img = "https://lh3.googleusercontent.com/-oFUqhbSCh3A/T4JaYyhdZaI/AAAAAAAADp0/VDgNZkG1lGs/s144/DSC04833.JPG";
            albums.Add(new Album(URL, "Santaquin/Loafer", img, "April 7, 2012"));

            URL = "https://picasaweb.google.com/lh/sredir?uname=116738453430397687681&target=ALBUM&id=5726824876545562977&authkey=Gv1sRgCNLy16SvrNnz_gE&feat=email";
            img = "https://lh5.googleusercontent.com/-CtWt4qNZygU/T3nFAsaxR8I/AAAAAAAADi0/nqbLjGHJ4xM/s144/DSC04800%2520copy.jpg";
            albums.Add(new Album(URL, "Dollar Lake", img, "March 29, 2012"));

            URL = "https://picasaweb.google.com/116738453430397687681/HenrysFork?authuser=0&authkey=Gv1sRgCIOR2P7KpvaAJg&feat=directlink";
            img = "https://lh5.googleusercontent.com/-aLUjv44JHL8/Tx1_Bx6Yy7I/AAAAAAAADZU/vM_vYxPW2Fo/s144/DSC04704.JPG";
            albums.Add(new Album(URL, "Elkhorn Crossing", img, "Jan 20, 2012"));

            albums.Add(new Album("2011", "", "", "", true));

            URL = "https://picasaweb.google.com/116738453430397687681/Christmas2011?authuser=0&authkey=Gv1sRgCIzwhOjnl7L_RA&feat=directlink";
            img = "https://lh4.googleusercontent.com/-NsbEggtkLnc/TwMmYk_G-7I/AAAAAAAADYY/vaDbu0ELcFM/s144/DSC04620.JPG";
            albums.Add(new Album(URL, "Waterton", img, "Dec, 2011"));

            URL = "https://picasaweb.google.com/116738453430397687681/MillerSThrillerIceClimbingDec102011?authuser=0&authkey=Gv1sRgCIWwp_WltM3KEA&feat=embedwebsite";
            img = "https://lh6.googleusercontent.com/-ajTxYnLpmHU/TuYu6UcCgaI/AAAAAAAADHU/9ik74AMk5S8/s144/DSC04595.JPG";
            albums.Add(new Album(URL, "Millers Thriller", img, "Dec 10, 2011"));

            URL = "https://picasaweb.google.com/lh/sredir?uname=116738453430397687681&target=ALBUM&id=5685293069915951377&authkey=Gv1sRgCNzQ-ZammZvBkgE&feat=email";
            img = "https://lh5.googleusercontent.com/-UmEj5GW79vY/TuY3_SiR49I/AAAAAAAADJ4/y-DJlfAI0Mo/s144/DSC04571.JPG";
            albums.Add(new Album(URL, "Mt. Olympus", img, "Dec 9, 2011"));

            URL = "https://picasaweb.google.com/lh/sredir?uname=116738453430397687681&target=ALBUM&id=5656407684202190945&authkey=Gv1sRgCMSAjev_kreTmQE&feat=email";
            img = "https://lh5.googleusercontent.com/-6j9NEOSUsk4/ToHyXdxmNdI/AAAAAAAACww/N0ypSA0JAO4/s144/DSC04450.JPG";
            albums.Add(new Album(URL, "Mt. Whitney", img, "Sept 23, 2011"));

            URL = "https://picasaweb.google.com/lh/sredir?uname=116738453430397687681&target=ALBUM&id=5657162868728651969&authkey=Gv1sRgCMajvLm-4PmC5wE&feat=email";
            img = "https://lh6.googleusercontent.com/-Om_da2sPcfM/ToJHsvBtdYI/AAAAAAAAC2I/LrXTlE-aa14/s144/Untitled-7.jpg";
            albums.Add(new Album(URL, "Dirty Dash", img, "Sept 17, 2011"));

            URL = "https://picasaweb.google.com/116738453430397687681/SouthKingsPeakEtc?authkey=Gv1sRgCJjc36X-ya65zgE&feat=email#";
            img = "https://lh4.googleusercontent.com/-D23aggqbmKA/Tmd8DW9bouI/AAAAAAAACgA/2vXPaIM-xvw/s144/021.JPG";
            albums.Add(new Album(URL, "S. Kings", img, "Sept 4, 2011"));

            URL = "https://picasaweb.google.com/116738453430397687681/Timpanogos?authkey=Gv1sRgCP7n-uuJuOC5Lw&feat=email#";
            img = "https://lh6.googleusercontent.com/-UkTtmh2uJuA/TgZuR8ekEcI/AAAAAAAACb8/01jWr8KFPBw/s144/DSC04308.JPG";
            albums.Add(new Album(URL, "Timpanogos", img, "June 25, 2011"));

            URL = "https://picasaweb.google.com/116738453430397687681/TripleTraverse?authkey=Gv1sRgCMyClcKVpOb0MQ&feat=email#";
            img = "https://lh6.googleusercontent.com/-SYow9Bq8Fqc/TeGfFgh6pcI/AAAAAAAACZk/4-R3bmWF4KY/s144/DSC04281.JPG";
            albums.Add(new Album(URL, "Triple Traverse", img, "May 27, 2011"));

            URL = "https://picasaweb.google.com/lh/sredir?uname=116738453430397687681&target=ALBUM&id=5607474293751586817&authkey=Gv1sRgCKf0zJ7Qt46pbg&feat=email";
            img = "https://lh5.googleusercontent.com/_YZLXFz4omoA/Tdr2g8EnNVI/AAAAAAAACVw/LcA-GQ7jhiY/s144/005.JPG";
            albums.Add(new Album(URL, "North Timp", img, "May 16, 2011"));

            URL = "https://picasaweb.google.com/lh/sredir?uname=116738453430397687681&target=ALBUM&id=5605892506182421729&authkey=Gv1sRgCKHaj9mDwcq9UQ&feat=email";
            img = "https://lh3.googleusercontent.com/_YZLXFz4omoA/TdL7k4SJFpI/AAAAAAAACO0/8Bj7E3f85UU/s144/005c.JPG";
            albums.Add(new Album(URL, "Lone Peak", img, "May 5, 2011"));

            URL = "https://picasaweb.google.com/116738453430397687681/FlagstaffMtn?authkey=Gv1sRgCJCz2sGi8Oj0Dg&feat=directlink";
            img = "https://lh6.googleusercontent.com/_YZLXFz4omoA/TW2i3IChZCE/AAAAAAAAB-8/wVsr6LKZXPc/s160-c/FlagstaffMtn.jpg";
            albums.Add(new Album(URL, "Flagstaff Mountain", img, "February 21, 2011"));

            URL = "https://picasaweb.google.com/116738453430397687681/LewistonAndFlatopSkiTour?authkey=Gv1sRgCPuY29D2vYu9dQ&feat=directlink";
            img = "https://lh4.googleusercontent.com/_YZLXFz4omoA/TW2gDPG3g-E/AAAAAAAAB78/aDD38GOKPKM/s160-c/LewistonAndFlatopSkiTour.jpg";
            albums.Add(new Album(URL, "Flattop Mountain", img, "February 12, 2011"));

            URL = "https://picasaweb.google.com/116738453430397687681/CascadeJan122011?authkey=Gv1sRgCNrdksva2YrBtgE&feat=directlink";
            img = "https://lh4.googleusercontent.com/_YZLXFz4omoA/TW2cwAx3VxE/AAAAAAAAB6c/NcerBiP8vV0/s160-c/CascadeJan122011.jpg";
            albums.Add(new Album(URL, "Cascade Mountain", img, "January 12, 2011"));

            URL = "http://picasaweb.google.com/116738453430397687681/MapleMtn?authkey=Gv1sRgCMnQxKCamffQkAE&feat=directlink";
            img = "https://lh6.googleusercontent.com/_YZLXFz4omoA/TTEZifEkA-E/AAAAAAAAB1c/fgTGXjxPySE/s160-c/MapleMtn.jpg";
            albums.Add(new Album(URL, "Maple Mountain", img, "January 6, 2011"));

            albums.Add(new Album("2010", "", "", "", true));

            URL = "http://picasaweb.google.com/vanman798/BlueJohnCanyonAndHorseshoeCanyon?authkey=Gv1sRgCMOuicbw8dmrlgE&feat=email#";
            img = "http://lh5.ggpht.com/_YZLXFz4omoA/TKn1RWMWTII/AAAAAAAABmo/s-kJPoEvm-8/s144/DSC03711.JPG";
            albums.Add(new Album(URL, "Blue John", img, "October 2, 2010"));

            URL = "http://picasaweb.google.com/vanman798/TheCultAtSaltair?authkey=Gv1sRgCMf85M-4goj6ag&feat=directlink";
            albums.Add(new Album(URL, "The Cult", "http://lh5.ggpht.com/_YZLXFz4omoA/TKDoZ34VDoI/AAAAAAAABk8/s0QNtsA6x30/s144/021.jpg", "Sept 24, 2010"));

            URL = "http://picasaweb.google.com/lh/sredir?uname=vanman798&target=ALBUM&id=5514938302835612961&authkey=Gv1sRgCLKW08_qi479xAE&feat=email";
            albums.Add(new Album(URL, "City of Rocks", "thumbnails/CityOfRocksOn.jpg", "Sept 4, 2010"));

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
            albums.Add(new Album(true, 2158, "Roberts Horn", "thumbnails/RobertsOn.jpg", "Feb. 15, 2010"));
            albums.Add(new Album(true, 2141, "Maple Canyon", "thumbnails/MapleOn.jpg", "Jan. 30, 2010"));

            albums.Add(new Album("2009", "", "", "", true));

            albums.Add(new Album(true, 2075, "Christmas", "https://lh6.googleusercontent.com/-OqFbKvRTeiw/UKqe0j8tYYI/AAAAAAAABH8/grmhRWli7-Q/s144/144.jpg", "Dec, 2009"));
            albums.Add(new Album(true, 2059, "Gobblers Knob", "https://lh3.googleusercontent.com/-zMQHKos_YvM/UKqfRcsP9MI/AAAAAAAABIQ/QPHgfgVAgLQ/s800/144.jpg", "Nov. 28, 2009"));
            albums.Add(new Album(true, 2045, "Spanish Fork Peak", "thumbnails/SFOn.jpg", "Nov. 7, 2009"));
            albums.Add(new Album(true, 2021, "Halloween", "https://lh5.googleusercontent.com/-cb7ZCsDK-yE/UKqjTEY-zDI/AAAAAAAABI0/BpZbiZkBMp4/s800/144.jpg", "Oct. 31, 2009"));
            albums.Add(new Album(true, 2001, "Mt. Timpanogos", "thumbnails/OctoberTimpOn.jpg", "Oct. 24, 2009"));
            albums.Add(new Album(true, 1973, "Borah Peak", "thumbnails/BorahOn.jpg", "Sept. 5, 2009"));
            albums.Add(new Album(true, 1886, "Gannett Peak", "thumbnails/GannettOn.jpg", "August 19, 2009"));
            albums.Add(new Album(true, 1875, "Decades", "https://lh4.googleusercontent.com/-nOwQiRVk3Wg/UKqjzLxZ56I/AAAAAAAABJI/VOeyWVwdh4w/s800/144.jpg", "July 7, 2009"));
            albums.Add(new Album(true, 1851, "The 4th", "https://lh5.googleusercontent.com/-Mz5RY85Vyew/UKqkNXdhyMI/AAAAAAAABJc/98tBfZvRVOs/s800/144.jpg", "July 4, 2009"));
            albums.Add(new Album(true, 1833, "Potluck", "https://lh5.googleusercontent.com/-pNEQa2_nkm8/UKqmowIPXpI/AAAAAAAABKU/bCsg99niosA/s800/144.jpg", "June 13, 2009"));
            albums.Add(new Album(true, 1806, "R/W/R/W", "thumbnails/WhiteBaldyOn.jpg", "June 6, 2009"));
            albums.Add(new Album(true, 1735, "Grand Canyon", "thumbnails/GrandCanyonOn.jpg", "May 30 - June 1, 2009"));
            albums.Add(new Album(true, 1695, "Mt. Shasta", "thumbnails/ShastaOn.jpg", "May 23, 2009"));
            albums.Add(new Album(true, 1662, "Triple Traverse", "thumbnails/TTTon.jpg", "May 16, 2009"));
            albums.Add(new Album(true, 1641, "North Timp", "thumbnails/NTimp2on.jpg", "May 9, 2009"));
            albums.Add(new Album(true, 1604, "North Thunder", "thumbnails/NThunderOn.jpg", "May 6, 2009"));
            albums.Add(new Album(true, 1558, "Bald Mountain", "thumbnails/SharpOn.jpg", "March 7, 2009"));
            albums.Add(new Album(true, 1485, "Cardiac Ridge", "thumbnails/CardiacOn.jpg", "February 21, 2009"));
            albums.Add(new Album(true, 1440, "Lowe Peak", "thumbnails/LoweOn.jpg", "February 7, 2009"));
            albums.Add(new Album(true, 1386, "Flagstaff Mtn/Days Fork", "thumbnails/FlagStaffOn.jpg", "January 10, 2009"));
            albums.Add(new Album(true, 1355, "Peak 8753", "thumbnails/Peak8753On.jpg", "January 3, 2009"));

            albums.Add(new Album("2008", "", "", "", true));

            albums.Add(new Album(true, 1338, "Red Baldy", "thumbnails/RedBaldyOn.jpg", "December 6, 2008"));
            albums.Add(new Album(true, 1267, "Halloween", "https://lh6.googleusercontent.com/-5BmGA_-thMo/UKa5ahgNjHI/AAAAAAAABG8/Endyey6HcD0/s144/144.jpg", "Oct 31, 2008"));
            albums.Add(new Album(true, 1248, "Bomber Peak", "https://lh6.googleusercontent.com/-0XVuxE7X19o/UKa1pGUT8mI/AAAAAAAABGg/WIOGoVh5XcE/s800/144.jpg", "Oct 11 & 18, 2008"));
            albums.Add(new Album(true, 1198, "AAM Reunion", "https://lh3.googleusercontent.com/-A0N4m6Q-zmI/UKa0mWYzU1I/AAAAAAAABGM/Nw1JXcaMtqo/s800/144.jpg", "Oct 1-3, 2008"));
            albums.Add(new Album(true, 1177, "BF Twin Peaks", "thumbnails/BFTwinsOn.jpg", "September 6, 2008"));
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
            albums.Add(new Album(true, 865, "The Canyons", "thumbnails/CanyonsOn.jpg", "February 2, 2008"));
            albums.Add(new Album(true, 843, "Mt. Nebo", "thumbnails/NeboOn.jpg", "January 22, 2008"));

            albums.Add(new Album("2007", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/820";
            img = "https://lh5.googleusercontent.com/-OGkM-7LLhUE/UKae4fLdQTI/AAAAAAAABF0/9KjyhdOleU8/s144/temple.jpg";
            Title = "Alberta";
            Date = "Nov 21-26, 2007";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/808";
            img = "https://lh5.googleusercontent.com/-8VwXemjolu0/UKab2L06VfI/AAAAAAAABFY/yNx3d90t-mc/s144/p.jpg";
            Title = "Pfeifferhorn";
            Date = "Sept 14 & 15, 2007";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/802";
            img = "https://lh3.googleusercontent.com/-2vPKXjnIdvE/UKaKsQ2vNoI/AAAAAAAABEs/DUA5QmlxlIw/s144/nebo.jpg";
            Title = "Mt. Nebo";
            Date = "Sept 3, 2007";
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
            Date = "Feb 27 - March 2, 2005";
            albums.Add(new Album(URL, Title, img, Date));

            albums.Add(new Album("2004", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/412";
            img = "thumbnails/karaokeOn.jpg";
            albums.Add(new Album(URL, "Random 2004 Pics", img, "2004"));

            URL = "http://vanman798.shutterfly.com/pictures/400";
            img = "thumbnails/DCon.gif";
            Title = "DC";
            Date = "October, 2004";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/388";
            img = "https://lh4.googleusercontent.com/-0QeGWhPIKBQ/UKZpwgfH6gI/AAAAAAAABAo/r_y4F-LB700/s144/Reflection.jpg";
            albums.Add(new Album(URL, "Langley Dinner", img, "September, 2004"));

            URL = "http://vanman798.shutterfly.com/pictures/352";
            img = "thumbnails/skydivingOn.jpg";
            Title = "Skydiving";
            Date = "August 21, 2004";
            albums.Add(new Album(URL, Title, img, Date));

            URL = "http://vanman798.shutterfly.com/pictures/311";
            img = "thumbnails/hongkongOn.jpg";
            albums.Add(new Album(URL, "Hong Kong", img, "February, 2004"));

            albums.Add(new Album("2003", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/300";
            img = "thumbnails/rafting2003On.jpg";
            albums.Add(new Album(URL, "Yough River, PA", img, "September 13, 2003"));

            URL = "http://vanman798.shutterfly.com/pictures/248";
            img = "thumbnails/Summer2003On.jpg";
            albums.Add(new Album(URL, "Alberta", img, "August, 2003"));

            URL = "http://vanman798.shutterfly.com/pictures/211";
            img = "thumbnails/SavannahOn.jpg";
            albums.Add(new Album(URL, "Savannah", img, "July 4, 2003"));

            albums.Add(new Album("2002", "", "", "", true));

            URL = "http://vanman798.shutterfly.com/pictures/207";
            img = "thumbnails/GauleyOn.jpg";
            albums.Add(new Album(URL, "Gauley River, WV", img, "October 12, 2002"));

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
                bldr.Append(@"<a name=""");
                bldr.Append(a.AlbumURL);
                bldr.Append(@"""></a>");
                bldr.Append("\r\n");
                bldr.Append("<h1>");
                bldr.Append(a.AlbumURL);
                bldr.Append("</h1>");
                bldr.Append("\r\n");
            }
            else
            {
                bldr.Append(@"<a href=""");
                bldr.Append(a.AlbumURL);
                bldr.Append(@""" target=""_blank"" style=""color: white; text-decoration: none; font-weight:bold"">");
                bldr.Append(a.AlbumTitle);
                bldr.Append("</a>");
                bldr.Append("\r\n");
                bldr.Append("<br />");
                bldr.Append("\r\n");
                bldr.Append(@"<a href=""");
                bldr.Append(a.AlbumURL);
                bldr.Append(@""" target=""_blank"">");
                bldr.Append("\r\n");
                bldr.Append(@"<img src=""");
                bldr.Append(a.ThumbNailURL);
                bldr.Append(@""" width='100' height='75' border='0' alt='Click to open photo album...'");
                bldr.Append(@" style=""filter: progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)"" onmouseover=""this.style.filter=''""");
                bldr.Append(@" onmouseout=""this.style.filter='progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)'"" />");
                bldr.Append("</a>");
                bldr.Append("\r\n");
                bldr.Append("<br />");
                bldr.Append("\r\n");
                bldr.Append(a.Date);
                bldr.Append("\r\n");
                bldr.Append("<hr />");
                bldr.Append("\r\n");
                bldr.Append("\r\n");
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
    <form id="Form1" method="post" runat="server">
    <noscript>
        <meta http-equiv="REFRESH" content="0; URL= ../intro/index.aspx">
    </noscript>
    <table cellspacing="3" cellpadding="3" border="0" width="100%">
        <tr>
            <td width="1%" valign="top" align="center">
                <uc1:UC_LeftNav ID="UC_LeftNav1" runat="server"></uc1:UC_LeftNav>
            </td>
            <td valign="top" width="99%" style="padding-left: 25px">
                <uc1:UC_Header ID="UC_Header1" runat="server"></uc1:UC_Header>
                <!-- PAGE STUFF	-->
                <br />
                <table bgcolor="Black" align="center" cellspacing="0" style="border-radius: 8px;
                    border: 2px solid black">
                    <tr>
                        <td bgcolor="black" style="text-align: center">
                            <span class="caption">Featured Album</span>
                            <br />
                            <span style='color: white; text-decoration: none; font-weight: bold'>Denali</span>
                        </td>
                        <td bgcolor="black" align="center">
                            <span class="caption">Album Archive</span>
                            <br />
                            <asp:Literal ID="litDatePicker1" runat="server"></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="center" bgcolor="black">
                            <!-- Featured  title goes above under Featured Album caption -->
                            <br />
                           <embed type="application/x-shockwave-flash" src="https://photos.gstatic.com/media/slideshow.swf" width="600" height="400" flashvars="host=picasaweb.google.com&captions=1&hl=en_US&feat=flashalbum&RGB=0x000000&feed=https%3A%2F%2Fpicasaweb.google.com%2Fdata%2Ffeed%2Fapi%2Fuser%2F107082436175597733376%2Falbumid%2F6065040686994947793%3Falt%3Drss%26kind%3Dphoto%26authkey%3DGv1sRgCLOyuMqWyaOwIg%26hl%3Den_US" pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>
                           <br />
                            <span id="FeaturedDate">June, 2014</span>
                        </td>
                        <td valign="top" align="center" bgcolor="black">
                            <div id="AlbumList">
                                <asp:Literal ID="litAlbums" runat="server"></asp:Literal>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="black" align="center">
                            Photos hosted by: <a href="http://vanman798.shutterfly.com/pictures/5" target="_blank">
                                Shutterfly</a>, <a href="https://accounts.google.com/ServiceLogin?hl=en_US&continue=https%3A%2F%2Fpicasaweb.google.com%2Flh%2Flogin%3Fcontinue%3Dhttps%253A%252F%252Fpicasaweb.google.com%252Fhome%253Fhl%253Den%2526tab%253Dwq&service=lh2&ltmpl=gp&passive=true"
                                    target="_blank">Picasa <i>(vanman798 and vanman798II)</i></a>
                        </td>
                        <td align="center" bgcolor="black">
                            <asp:Literal ID="litDatePicker2" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
                <!-- END Page Stuff -->
            </td>
        </tr>
    </table>
    <uc1:UC_Footer ID="UC_Footer1" runat="server"></uc1:UC_Footer>
    </form>
</body>
</html>