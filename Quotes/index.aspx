<!DOCTYPE html>
<%@ Page Language="C#" %>
<%@ Register TagPrefix="uc1" TagName="UC_LeftNav" Src="../UC_LeftNav.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_Header" Src="../UC_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="UC_Footer" Src="../UC_Footer.ascx" %>
<html>
<script language="C#" runat="server">
    void Page_Load(Object sender, EventArgs e)
    {
        UC_LeftNav1.P_GraphicName = "quotes";
        UC_LeftNav1.P_ImageName = "image6";

        UC_Header1.P_HeaderTitle = "Quotes";
        
        UC_Footer1.P_LastModified = "July 6, 2015";
        UC_Header1.P_HeaderText = "&nbsp;";
    }//end sub
</script>
<head>
    <title>Quotes</title>
    <script language="javascript" src="../JScript1.js" type="text/javascript"></script>
    <link href="../StyleSheet1.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <noscript>
        <meta http-equiv="REFRESH" content="0; URL= ../intro/index.aspx">
    </noscript>
    <table cellspacing="3" cellpadding="3" width="100%" border="0">
        <tr>
            <td valign="top" align="center" width="1%">
                <uc1:UC_LeftNav ID="UC_LeftNav1" runat="server"></uc1:UC_LeftNav>
            </td>
            <td valign="top" width="99%" style="padding-left: 25px">
                <uc1:UC_Header ID="UC_Header1" runat="server"></uc1:UC_Header>
                <br />
                <div style="padding-left: 10px;">
                    These are quotes that at the time of reading struck a chord with me, and as such
                    I thought they were worth remembering.
                </div>
                <br />
                <ol>   
                    <li>People with good intentions make promises, and people with good character keep them. <i>Author Unknown</i>. <br /><br /></li>              
                    <li>Give me six hours to chop down a tree and I will spend the first four sharpening the axe. <i>Author Unknown</i>. <br /><br /></li> 
                    <li>Politics is the lowest level of intellect. <i>Author Unknown</i>. <br /><br /></li> 
                    <li>You are difficulty when you tell the truth,  when you want what you want, when you have integrity, and when you will not sell out. <i>Chris Robinson (of the Black Crowes)</i>. <br /><br /></li> 
                    <li>How are you to imagine anything if the images are always provided for you? Twenty-fours hours a day for the rest of our lives, 
                        the powers that be are hard at work dumbing us to death. This is a marketing holocaust.  So to defend ourselves, and fight against assimilating this dullness into our thought processes, we must learn to read. 
                        To stimulate our own imagination, to cultivate our own consciousness, our own belief systems. We all need skills to defend, to preserve, our own minds. <i>From the movie Detachment</i>. <br /><br /></li>
                    <li>Satan is the author of complexity. <i>Marion D. Hanks</i>. <br /><br /></li>
                    <li>I want the liberty of thinking and believing as I please. <i>Joseph Smith</i>. <br /><br /></li>
                    <li>Being good with money means you always have some, you're always ahead of the game even if it's just a tiny bit ahead. <i> Adapted from Margaret Atwood</i>. <br /><br /></li>
                    <li>Speaking of money, it really about doing more with less, and that translates to you having control of your life. <i> Adapted from Margaret Atwood</i>. <br /><br /></li>
                    <li>In the thirteenth century to be thrity meant you were doing well.  By the nineteeth century the meaning had shifted to mean good economic management. 
                    By the twentieth century if was associated with frugality and both thirft and frugality had taken on a similiar conotation to stinginess.  
                    However to be thrity is to thrive. <i> Adapted from Marjorie Harris</i>. <br /><br /></li>
                    <li>Thrift is about buying less by buying well. <i> Adapted from Janice Lindsay</i>. <br /><br /></li>
                    <li>Materialism is mistaking quantity with quality. <i> Margaret Atwood</i>. <br /><br /></li>
                    <li>If an object was designed well in the first place I will not tire of it. <i>Valerie Murray</i>. <br /><br /></li>
                    <li>To those who have struggled with them, the mountains reveal beauties that they will not disclose to those who make no effort. That is the reward the mountains give to effort. And it is because they have so much to give and give it so lavishly to those who will wrestle with them that men love the mountains and go back to them again and again.  
                    The mountains reserve their choice gifts for those who stand upon their summits. <i>Sir Francis Younghusband</i>. <br /><br /></li>
                    <li>Mountaineering equipement should be treated as though one's life depended upon it - because of course it does. <i>Howard Snyder</i>. <br /><br /></li>
                    <li>An expedition must plan and act in a manner which will enable it to withstand some bad luck. <i>Howard Snyder</i>. <br /><br /></li>
                    <li>Walking makes us healthier, and happier, and it keeps us fit. <i>Adapted from Geoff Nicholson</i>. <br /><br /></li>
                    <li>The pace of walking is also the pace of thought. <i>Geoff Nicholson</i>. <br /><br /></li>
                    <li>If you would attain to what your are not yet, you must always be displeased by what you are. For where you are pleased with yourself, there you have remained. <i>St. Augustine</i>. <br /><br /></li>
                    <li>I no longer manage business or purse money beyond what I need. <i>Steve Vaught</i>. <br /><br /></li>
                    <li>Writing is one way of making the world our own, and walking is another. <i>Geoff Nicholson</i>. <br /><br /></li>
                    <li>My mind is not for rent. <i>Rush</i>. <br /><br /></li>
                    <li>Some people let themselves get stuck in jobs just because the jobs are easy or safe, but an easy or safe job without satisfaction is the hardest job of all. <i>Dan Baker</i>. <br /><br /></li>	
                    <li>Modern medicine is focused on fighting disease instead of building health. <i>Dan Baker</i>. <br /><br /></li>	
                    <li>We do not describe the world we see, we see the world we describe. <i>Dan Baker</i>. <br /><br /></li>
                    <li>Unfortunately millions of people toil their life away in pursuit of power, perfectionism, control, status, and possessions.  There’s a word for these people, unhappy. <i>Dan Baker</i>. <br /><br /></li> 
                    <li>It has been said that good judgement comes from experience, but experience comes from a lack of judgement. <i>Unknown</i>. <br /><br /></li>   
                    <li>The competitive principle is responsible for much that is evil. It tends to build, help, or 
                    promote the one (or the few) at the expense of the many.  By being competive we strive to down others so we can be on top. 
                    Being competitive causes us to see others (the competition) as the enemy and something to defeat rather than seeing them as our brothers that we should help.  <i>Modified by Walter from an Unknown source</i>. <br /><br /></li>   
                    <li>Camping is simple life reduced to actual practice. <i>Unknown</i>. <br /><br /></li>   
                    <li>What compels a man to leave hearth and home and venture into the embrace of Nature where danger and discomfort are the commenest forms of wildlife? It is nothing but a love for Creation and for all the creatures in it. <i>Unknown</i>. <br /><br /></li>                   
					<li>When a man who is honestly mistaken hears the truth, he will either quit being mistaken or cease to be honest. <i>Unknown</i>. <br /><br /></li>
                    <li>...and accordingly all experience hath shewn, that mankind are more disposed to suffer, while evils are sufferable, than to right themselves by abolishing the forms to which they are accustomed. <i>Declaration of Independence</i>. <br /><br /></li>	
                    <li>The secret of change is to focus all of your energy, not on fighting the old, but on building the new. <i>Socrates</i>. <br /><br /></li>	
                    <li>Complex systems that don't work were derived from simple systems that worked just fine! <i>Murphys Law</i>. <br /><br /></li>	
                    <li>Wilderness draws its beauty from the absence of people, attracts people, and then slowly loses its appeal. <i>Adapted from Eric Schlosser</i>. <br /><br /></li>	
                    <li>He was too smart to fit any sterotype <i>Eric Schlosser</i>. <br /><br /></li>	
                    <li>If the grass looks greener on the other side, it’s because they take care of it. <i>Cecil Selig</i>. <br /><br /></li>	
                    <li>Fear is the thief of dreams. <i>Unknown</i>. <br /><br /></li>	
                    <li>Kindness is the one commodity of which you should spend more than you earn. <i>T.N. Tiemeyer</i>. <br /><br /></li>	
                    <li>Sometimes we have the dream but we are not ourselves ready for the dream. We have to grow to meet it. <i>Louis L'amour</i>. <br /><br /></li>	                    	
                    <li>...igenuity, the gift that goes beyond learning. <i>Louis L'amour</i>. <br /><br /></li>	
                    <li>Man needs so little, yet he begins wanting so much. <i>Louis L'amour</i>. <br /><br /></li>                    	
                    <li>A man who travels with another is only half as watchful as when traveling alone, and often less than half, for a part of his attention is diverted by his companion. <i>Louis L'amour</i>. <br /><br /></li>                                        		
                    <li>Begin to depend on no one but yourself. The fewer people whom you trust, the fewer on whom you rely, the better for you. <i>Louis L'amour</i>. <br /><br /></li>
                    <li>Once a man has lived with mountains you can't offer him a home with a prairie dog. <i>Louis L'amour</i>. <br /><br /></li>	
                    <li>To truly know the mountains, one should go to meet them as one would meet a sweetheart, alone. <i>Louis L'amour</i>. <br /><br /></li>
                    <li>I use the technoloy of men of today, I drive their cars, I listen to their music, I understand their laws, but my heart is in the wilderness. <i>Inspired by Louis L'amour</i>. <br /><br /></li>
                    <li>Natural systems are priceless in value and nearly impossible to replace, but they are cheap to maintain. ALL you have to do is defend them. <i>Stuart Brand</i>. <br /><br /></li>
                    <li>We are shaped and fashioned by what we love.  <i>Goethe</i>. <br /><br /></li>
                    <li>True heroism is remarkably sober, very undramatic.  <i>Aruthur Ashe</i>. <br /><br /></li>
                    <li>Success is to be measured not so much by the position that one has reached in life as by the obstacles which one has overcome while trying to succeed.  <i>Brooker T Washington</i>. <br /><br /></li>	          
                    
                    <li>Often he who does too much, does too little.  <i>Italian Proverb</i>. <br /><br /></li>
                    <li>As odd as it sounds, I feel like my car in some ways inhibits my autonomy. It’s a drug that, though it might boost my performance, I have come to rely a little too heavily on. It’s an insulating, dulling layer between me and what’s going on around me.  <i>Tristan Higbee</i>. <br /><br /></li>
	    			<li>It is easy to make a climb more difficult, but aside from thorough preparation, it is perhaps impossible to make a climb easier. <i>Steve Bell</i>. <br /><br /></li>					
                    <li>There are only three sports: bullfighting, motor racing, and mountaineering; all the rest are merely games. <i>Ernest Hemingway</i>. <br /><br /></li>
					<li> There is no unhappiness like the misery of sighting land (and work) again after a cheerful, careless voyage. <i>Mark Twain</i>. <br /><br /></li>
					<li> Our growing softness, our increasing lack of physical fitness, is a menace to our security. 
					We do not want in the United States a nation of spectators. We want a nation of participants in the vigorous life. 
					This is not a matter which can be settled, of course, from Washington. It is really a matter which starts with each individual family <i>John F. Kennedy, Dec 1960</i>. <br /><br /></li>
					<li>One of nature's greatest beauties is the way fresh snow covers the world in a perfect blanket of crystalline white. Snow replaces sharp angles with gentle curves, and clings to surfaces to form ghostly silhouettes. <i>Paul Fearing</i>. <br /><br /></li>
	                <li>Travel is fatal to prejudice, bigotry, and narrow-mindedness, and many of our people need it sorely on these accounts. Broad, wholesome, charitable views of men 
	                and things cannot be acquired by vegetating in one little corner of the earth all one's lifetime. <i>Mark Twain</i>. <br /><br /></li>			
                    
					<li>We knocked the bastard off. <i>Hillary, 1953</i>. Then in 2003 Hillary said, It is not the mountain we conquer but ourselves. <i>Couldn't we all use 50 years of humble growth?</i> <br /><br /></li>					
                    <li>Rather than reacting with anger, react with amusement.  Similarly approach a problem with curiosity rather than confusion. <i>Walter VanderHeide</i><br /><br /></li>
					<li>There is no greater wonder in the Mountain Scenery than the tendency it has to shorten the distance to the eye and lengthen it to the feet!  <i>Nathaniel Langford</i><br /><br /></li>
					<li>Real happiness comes from spending time doing things you enjoy the most, not from earning more money. <i>Yaro Starak</i><br /><br /></li>
  					<li>Whoever came up with the expression, "It's better to give than to receive", must have been talking about bad news. <i>Author Unknown</i><br />
                        <br /></li>      
					<li>Human beings have the capacity to learn to want almost any conceivable material object.  
				Given, then, the emergence of a modern industrial culture capable of producing almost anything, the time is ripe for opening the storehouse of infinite "need"!... 
				It is the modern Pandora's box, and its plagues are loose upon the world.  <i>Jules Henry</i><br />
                        <br /></li>    
   					<li>Before the development of tourism, travel was conceived to be like study, and its fruits were considered to be the adornment of the mind and the formation of the judgement. <i>Paul Fussell,</i><br />
                        <br /></li>         
                <li>Most people will choose unhappiness over uncertainty. <i>Timothy Ferriss</i><br />
                        <br /></li>              
                 <li>Doing something unimportant well does not make it important.  <i>Timothy Ferriss</i><br />
                        <br />
                    </li>                    
                 <li>Requiring a lot of time does not make a task important.  <i>Timothy Ferriss</i><br />
                        <br />
                    </li>                    
                 <li>Limit tasks to the few important (80/20) to shorten work time, and shorten work time (allow less time for a task) to limit tasks to the important (Parkinson's Law).  <i>Adapted from Timothy Ferriss</i><br />
                        <br />
                    </li>                    
                 <li>Lack of time is actually a lack of priorities. <i>Timothy Ferriss</i><br />
                        <br />
                    </li>
                    <li>Learning to ignore things is one of the great paths to inner peace. <i>Robert J Sawyer</i><br />
                        <br />
                    </li>
                    <li>After years of repetitive work, you will often need to dig hard to find your passions, redefine your dreams, and revive hobbies.  <i>Timothy Ferriss</i><br />
                        <br />
                    </li>
                    <li>Money is multiplied in practical value depending on the number of W's you control in your life: WHAT you do, WHEN you do it, WHERE you do it, and with WHOM you do it.  <i>Timothy Ferriss</i><br />
                        <br />
                    </li>
                    <li>"Someday" is a disease that will take your dreams to the grave with you. <i>Timothy Ferriss</i><br />
                        <br />
                    </li>
                    <li>Conditions are never perfect so if doing something is important to you prepare as best as you can and then proceed to do it realizing you might have to correct course along the way. <i>Walter V - influenced
                            by Timothy Ferriss</i><br />
                        <br />
                    </li>
                    <li>Action is a great restorer and builder of confidence. Inaction is not only the result, but the cause, of fear. Perhaps the action you take will be successful; perhaps different action or adjustments will have to follow. But any action is better than no action at all. <i>Norman Vincent Peale</i><br />
                        <br />
                    </li>
                    <li>Too much of, too many of, and/or doing what you "want" too often results in what you "want" becoming what you don't what.  Just as "more" is "less", or turning a hobbie into a job ruins the hobbie.<i> Walter V - influenced by Timothy Ferriss</i><br />
                        <br />
                    </li>
                    <li>The positive use of free time is doing what you want as opposed to doing what you feel obligated to do.  <i>Adapted from Timothy Ferriss</i><br /><br /></li>
                
                    <li>If you want to go quickly, go alone. If you want to go far, go together. <i>African proverb</i><br />
                        <br />
                    </li>
                    <li>Left unshackled, individual human greed will always lead to equilibriums which benefit
                        the few at the expense of the many and of society as a whole, for example the income
                        inequalites of the West, and thus the need for Government regulations. <i>Walter V - influenced
                            by Dambisa Moyo</i><br />
                        <br />
                    </li>
                    <li>Anyone who climbs [mountaineering] understands the relation of pleasure to risk
                        and the great joy of escaping hardships you have brought upon yourself. <i>Chip Brown</i><br />
                        <br />
                    </li>
                    <li>The guy was harder to read than a Chinese Bible. <i>David Levien</i><br />
                        <br />
                    </li>
                    <li>All cities have the same basic mixture of humanity -- they all have aspects of beauty
                        and ugliness - all have at least one Church and one jail. <i>David Levien</i><br />
                        <br />
                    </li>
                    <li>There is nothing more rewarding than taking a risk and succeeding. <i>Jim Haberl</i><br />
                        <br />
                    </li>
                    <li>By their very nature, patience and enthusiam are at odds. <i>Jim Haberl</i><br />
                        <br />
                    </li>
                    <li>It had been a challenging journey, much more difficult than I had expected, but
                        the treasure of the experience was fair compensation. <i>Jim Haberl</i><br />
                        <br />
                    </li>
                    <li>Risk is the process of engaging in an activity without the security of knowing the
                        consequences of your decision. <i>Jim Haberl</i><br />
                        <br />
                    </li>
                    <li>The best climber in the world is the climber having the most fun. <i>Alex Lowe</i><br />
                        <br />
                    </li>
                    <li>There are surfers, I imagine, who live witin a reasonable distance of a decent ocean
                        surf but who have never caught a wave outside a wave pool - all too soon, there
                        will be a climbing gym in Yosemite Valley, and they will pack it in. <i>Adapted from
                            Andrew Todhunter</i><br />
                        <br />
                    </li>
                    <li>When in doubt, go balls out. <i>Andrew Todhunter</i><br />
                        <br />
                    </li>
                    <li>Pain is only weakness leaving the body. <i>Tom Muccia</i><br />
                        <br />
                    </li>
                    <li>I love experience much more than material possessions. <i>Walter V (adapted from
                        a statement about Anatoli Boukreev)</i><br />
                        <br />
                    </li>
                    <li>The stories of mountaineers are new versions of old myths. <i>Maria Coffey</i><br />
                        <br />
                    </li>
                    <li>Mountaineers aren't disappointed people; they don't feel they are wasting their
                        lives; they have gone out there and done something. <i>Ruth Seifert</i><br />
                        <br />
                    </li>
                    <li>We live in relatively safe times, cocooned from most of the perils our ancestors
                        faced [as such] some people miss the element of risk and uncertainty [so they] seek
                        it out, and if necessary create it. <i>Maria Coffey</i><br />
                        <br />
                    </li>
                    <li>Endurance, fear, suffering cold, and the state between survival and death are such
                        strong experiences that we want them again and again. We become addicted.<i>Reinhold
                            Messner</i><br />
                        <br />
                    </li>
                    <li>It is better to live one day as a tiger than one thousand years as a sheep. <i>Tibetan
                        Proverb</i><br />
                        <br />
                    </li>
                    <li>Alpinism is the art of suffering. <i>Wojtek Kurtyka</i><br />
                        <br />
                    </li>
                    <li>You never conquer a mountain, you conquer yourself. <i>Anonymous</i><br />
                        <br />
                    </li>
                    <li>If all the insects were to disappear from the earth, within 50 years all life on
                        earth would end. If all human beings disappeared from the earth, within 50 years
                        all forms of life would flourish. <i>Jonas Salk</i><br />
                        <br />
                    </li>
                    <li>Toil and pleasure in their names opposite, are yet linked together in a kind of
                        necessary connection. <i>Livy</i><br />
                        <br />
                    </li>
                    <li>One can never consent to creep when one feels an impulse to soar. <i>Helen Keller</i><br />
                        <br />
                    </li>
                    <li>Mountaineering is as much a mental exercise as it is a physical event. <i>Mike Gauthier</i><br />
                        <br />
                    </li>
                    <li>Getting to the top is optional. Getting down is mandatory. <i>Ed Viesturs</i><br />
                        <br />
                    </li>
                    <li>Just because you love the mountains doesn't mean the mountains love you. <i>Lou
                        Whittaker</i><br />
                        <br />
                    </li>
                    <li>For us the mountains had been a natural field of activity where, playing on the
                        frontiers of life and death, we had found the freedom for which we were blindly
                        groping and which was as necessary to us as bread. The mountains had bestowed upon
                        us their beauties, and we adored them with a child's simplicity and revered them
                        with a monk's veneration of the divine. <i>Maurice Herzog</i><br />
                        <br />
                    </li>
                    <li>Victory awaits him who has everything in order luck, people call it. Defeat is
                        certain for him who has neglected to take the necessary precautions in time; this
                        is called bad luck. <i>Roald Amundsen</i><br />
                        <br />
                    </li>
                    <li>I am more afraid of not living than I am of dying. <i>Ruth Anne Kocour</i><br />
                        <br />
                    </li>
                    <li>Very good is the enemy of great. <i>Bono</i><br />
                        <br />
                    </li>
                    <li>I believe that all girls are fundamentally crazy. The essence of romance is really
                        finding a girl whose crazy makes your heart beat a little faster, rather than one
                        whose crazy makes you want to run off to your man cave in the mountains of Bhutan.
                        <i>Brian Sommers</i><br />
                        <br />
                    </li>
                    <li>If I could tell the story in words, I wouldn't need to lug around a camera. <i>Lewis
                        Hine</i><br />
                        <br />
                    </li>
                    <li>Above all, do not lose your desire to walk. Every day I walk myself into a state
                        of well-being and walk away from every illness. <i>Soren Kierkegaard, the 19th-century
                            Danish philosopher</i><br />
                        <br />
                    </li>
                    <li>When choosing between two evils, I always like to try the one I've never tried before.
                        <i>Mae West</i><br />
                        <br />
                    </li>
                    <li>A woman gets married when she thinks she's found the fairy tale. A man gets married
                        when he realizes it doesn't exist. <i>Darcy Partridge</i><br />
                        <br />
                    </li>
                    <li>Mountains are cathedrals; grand and pure, the houses of my religion. I go to them
                        as humans go to worship. From their lofty summits, I view my past, dream of the
                        future, and with unusual acuity I am allowed to experience the present moment. My
                        strength renewed, my vision cleared, in the mountains I celebrate creation. On each
                        journey, I am reborn. <i>Anatoli Boukreev</i><br />
                        <br />
                    </li>
                    <li>I realize that humor isn't for everyone. It's only for people who want to have fun,
                        enjoy life, and feel alive. <i>Anne Wilson Schaef</i><br />
                        <br />
                    </li>
                    <li>We dont stop playing because we grow old; we grow old because we stop playing. <i>
                        George Bernard Shaw</i><br />
                        <br />
                    </li>
                    <li>The Problem with retirement is that you can't take a day off. <i>Unknown</i><br />
                        <br />
                    </li>
                    <li>To be happy we need someone to love, something to do, and something to look forward
                        to. <i>Unknown</i><br />
                        <br />
                    </li>
                    <li>Don't worry about the world coming to an end today. It's already tomorrow in Australia!
                        <i>Charles Schultz</i><br />
                        <br />
                    </li>
                    <li>It is odd to watch with what feverish ardor Americans pursue prosperity. Ever tormented
                        by the shadowy suspicion that they may not have chosen the shortest route to get
                        it. They cleave to the things of this world as if assured that they will never die,
                        and yet rush to snatch any that comes within their reach as if they expected to
                        stop living before they had relished them. Death steps in, in the end, and stops
                        them before they have grown tired of this futile pursuit of that complete felicity
                        which always escapes them. <i>Alexis de Tocqueville in "Democracy in America" (1835)</i><br />
                        <br />
                    </li>
                    <li>It is not easy to find happiness in ourselves, and it is not possible to find it
                        elsewhere. <i>Agnes Repplier</i><br />
                        <br />
                    </li>
                    <li>Remember that great love and great achievements involve great risk. <i>Unknown</i><br />
                        <br />
                    </li>
                    <li>Mountaineering is more than climbing (exercise), panoramic views, and wilderness
                        experience. It is also challenge, risk, and hardship (self reliance). And it is
                        not for everyone. Those drawn to the mountains can find them exhilarating and irresistible,
                        as well as frustrating and sometimes even deadly. There are qualities to mountaineering
                        that bring inspiration and joy in a pursuit that is more than a pastime, more than
                        a sport a passion, certainly, and sometimes a compulsion. <i>Mountaineering: The Freedom
                            of the Hills</i><br />
                        <br />
                    </li>
                    <li>The mountains may well be a way of escape - from the cities and men, from the turmoil
                        and doubt, from the complexities and uncertainties and sorrows that thread our life.
                        But in the truest and most profound sense, it is an escape not from but to reality.
                        <i>James Ramsey Ullman</i><br />
                        <br />
                    </li>
                    <li>When you are unsure, say 'no'. <i>Inspired by Henry Cloud or John Townsend</i><br />
                        <br />
                    </li>
                    <li>Though we certainly need each other, no one but God is indispensable. <i>Henry Cloud
                        or John Townsend</i><br />
                        <br />
                    </li>
                    <li>I admit I've always had trouble accepting responsibility for my actions. But I blame
                        my parents for that. <i>Mike Peters - "Mother Goose Grimm"</i><br />
                        <br />
                    </li>
                    <li>The biggest risk in life is that you will waste your opportunity to really live
                        it. <i>Unknown</i><br />
                        <br />
                    </li>
                    <li>All other things being equal, the simplest solution is the best. <i>Occam's razor</i><br />
                        <br />
                    </li>
                    <li>In a world that what we want is only what we want until it's ours. <i>Train</i><br />
                        <br />
                    </li>
                    <li>Sharing your heart is a win-win situation. Either you learn, or you get to love.
                        <i>Unknown</i><br />
                        <br />
                    </li>
                    <li>My definition of love, the transitive verb, is to strive for the happiness of another,
                        and to accept no substitute for that happiness. <i>Unknown</i><br />
                        <br />
                    </li>
                    <li>The most common form of terrorism in the U.S.A. is that carried on by bulldozers
                        and chain saws. <i>Edward Abbey</i><br />
                        <br />
                    </li>
                    <li>A man must fill his life with meaning, meaning is not automatically given to life.
                        <i>Chian Potol</i><br />
                        <br />
                    </li>
                    <li>Life is either a daring adventure, or nothing at all. <i>Helen Keller</i><br />
                        <br />
                    </li>
                    <li>Too many people adjust their lifestyle to their income. That's a very dangerous
                        thing to do. <i>Herb Hopwood</i><br />
                        <br />
                    </li>
                    <li>If You Are Prepared You Shall Not Fear. <i>From On High</i><br />
                        <br />
                    </li>
                    <li>Youth is wasted on the young. <i>Unknown</i><br />
                        <br />
                    </li>
                    <li>To do all the talking and not be willing to listen is a form of greed. <i>Democritus
                        of Abdera</i><br />
                        <br />
                    </li>
                    <li>Happiness in older years of life, like happiness in every year of life, is a matter
                        of choice - your choice for yourself. <i>Harold Azine</i><br />
                        <br />
                    </li>
                    <li>To innovate does not necessarily mean to expand; very often it means to simplify.
                        <i>Russell Ballard</i><br />
                        <br />
                    </li>
                    <li>You cannot plough a field by turning it over in your mind. <i>Unknown</i><br />
                        <br />
                    </li>
                    <li>One man alone can be pretty dumb sometimes, but for real bona fide stupidity, there
                        ain't nothin' can beat teamwork. <i>Edward Abbey</i><br />
                        <br />
                    </li>
                    <li>Happiness is not achieved by the conscious pursuit of happiness; it is generally
                        the by-product of other activities. <i>Aldous Huxley</i><br />
                        <br />
                    </li>
                    <li>There is more to life than increasing its speed. <i>Mahatma Ghandi</i><br />
                        <br />
                    </li>
                    <li>The thing always happens that you really believe in; and the belief in a thing makes
                        it happen. <i>Frank Loyd Wright</i><br />
                        <br />
                    </li>
                    <li>Don't worry about what people think; they don't do it very often. <i>Unknown</i><br />
                        <br />
                    </li>
                    <li>Everything can be taken from a person, but one thing: the last of the human freedoms,
                        to choose one's attitude in any given set of circumstances to choose ones own way.
                        <i>Viktor Frankl</i><br />
                        <br />
                    </li>
                    <li>It's not the years in your life but the life in your years that counts! <i>Adlai
                        Stevenson</i><br />
                        <br />
                    </li>
                    <li>Rather than love, than money, than faith, than fame, than fairness - give me truth.
                        <i>H. D. Thoreau</i><br />
                        <br />
                    </li>
                    <li>It requires some effort to achieve a happy outlook on life, and most people don't
                        make it. <i>Gregg Easterbrook</i><br />
                        <br />
                    </li>
                    <li>At either end of the social spectrum lies a leisure class. <i>Unknown</i><br />
                        <br />
                    </li>
                    <li>Who needs wilderness? Civilization needs wilderness. <i>Edward Abbey</i><br />
                        <br />
                    </li>
                </ol>
            </td>
        </tr>
    </table>
    <uc1:UC_Footer ID="UC_Footer1" runat="server"></uc1:UC_Footer>
    </form>
</body>
</html>