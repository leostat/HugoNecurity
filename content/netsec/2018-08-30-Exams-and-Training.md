+++
title = "Exams and Training in Infosec"  
categories = "netsec"  
date = 2018-08-30T19:58:58Z  
tags = ["CREST","Exams","OSCP","Immersive Labs","SANS"]   
+++
  

<div id="pagemenu">  
<ol>  
<li><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#Summary">Summary</a></li>  
<li><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#"eve>Exams vs Experience</a> </li>  
<li><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#Crest">CREST</a></li>  
<li><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#offsec">Offensive Security</a></li>  
<li><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#Tiger">Tiger Scheme</a></li>  
<li><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#other">Other Training Providers</a></li>  
<ul> 
	<li style="display:inline"><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#sans">SANS</a> </li> 
	<li style="display:inline"><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#cissp">ISC2</a> </li> 
	<li style="display:inline"><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#ceh">C|EH</a> </li> 
	<li style="display:inline"><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#cpa">Comptia</a> </li> <br>  
	<li style="display:inline"><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#iml">Immersive Labs</a> </li>  
	<li style="display:inline"><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#pa">Project Ares</a> </li>  <br>
	<li style="display:inline"><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#ptl">Pentester Labs</a> </li>  
	<li style="display:inline"><a href="https://necurity.co.uk/netsec/2018-08-30-exams-and-training#ctf">VulnHub / Hack the Box</a> </li>  
</ul> 
</ol>  
</div>  

 <div id="pagesummary">  

<h2 id="Summary"> <a>Summary </a> </h2>  

 <p>  

Recently I have seen a trend of people posting things on LinkedIn along the lines of "I have achieved X which makes me Y" or "I've not bothered with exams because they are useless". One post in-particular made me think, what exams are there? Are they needed? Are they useful? and is it possible to write a post which will make most people hate, and judge me? (I hope not!). In this post, I am going to look at a few of the options of training and certification in the industry as it stands, and such it may come across a tad ranty. <!--more-->    

</p><br><p>  

I am going to start with my personal views. Exams are needed in any industry to set a minimum standard for what knowledge and skills are needed for a practitioner of said industry, infosec being no exception. I don't believe that the current exam format offered by the three or four (if you include SANS) exam boards is perfect, each having their own advantages and disadvantages. However, it is a complex problem with no easy answer. Currently, I have studied for the CPSA, CRT, CCT-Web App, OSCP and CISSP. So what do I think that makes me?, Just another tester with a biased view on exams! Exams should be seen as a minimum standard, not a measure of ability. They are needed getting started in the industry, but for veterans of the industry they become less important, and there is no one path that you must take through the industry.  As I come across training and exam providers I will update this post. </p><br> 

</div>  

<div id="maincontent">  

<h2 id="EvE"> <a> Exams vs Experience  </a> </h2>  <p>   
So the reason I am writing this is over a LinkedIn post which caught my eye, in it, the tester had said: </p>
<blockquote>   
I would have got CRT and OSCP if employers had put me on the training but they always put me on projects as ultimately they are businesses. I've recreated CREST CRT labs and done many labs similar to OSCP. I completed all the Linux Privesc labs at <Company name> in two weeks. I could bypass every Antivirus solution and have been hacking for 15 years. I taught myself Mobile (Android) Penetration Testing in a few weeks. Someone give me a chance and I'll get any certification you feel validates my experience.   
</blockquote> <p>  
 The above has been trimmed a bit. In this, the tester is saying that they have the experience to not need to do the exams, and that given the chance they would be able to do them. I have two issues with this statement, with the first being many of the exams take just one or two days, meaning that time really should not be an issue. A <a href="https://www.ncsc.gov.uk/articles/composition-check-team">CTL</a> is worth more to some clients than a none CHECK member, and can win contracts. With OSCP there is no need (but it is highly recommended) to do the labs, only requiring two days. CREST exams take a few hours in the CREST offices, given they are in slough so an overnight stay may be needed, but both are not like SANS which will cost you 7+ days of time. Both exams offer weekend scheduling also, which is not the best if you are on site Monday to Friday, but is possible if you really don't have any off days in the week.  
</p><br><p>  
My second issue is around the comment about re-creating labs, which this user has on both the post, and on their LinkedIn profile. If the tester has not done the CRT or OSCP, them how are they doing the re-creation, and attempting boxes from the exam! This could mean that someone has broken an NDA leaking some boxes and information about labs and exams (a common rumour which I will discuss later) or the author is assuming about the content and complexity of the exams, and really has no idea about the actual content.  
</p><br><p>   
It is VERY important to say that I am not saying this person is not a good tester, nor calling into question their proficiency and professionality in the field. I personally do not know them and if what they have on their linked in is true they appear very gifted with low-level reverse engineering and web application testing. Also, LinkedIn is for selling yourself, and not posting high about yourself is not going to get you anywhere.  In the sections below I am going to look at some of the more common exams that you see, and will cover some good, and bad things about them.  
 </p><br> <h2 id="Crest"> <a> The CREST examination pathway  </a> </h2> <p>  
<a href="https://www.crest-approved.org/professional-qualifications/crest-exams/index.html">CREST's 15 exams </a> cover a number of infosec job areas, and aims to provide a pathway throughout starting in the industry, up to becoming a competent tester. The exams usually take the form a multiple choice section taken on a Computer, followed by a practical exam taken at the CREST offices. Each exam is valid for around three years, and they recommend that rather then re-taking the one you have, you should be aiming to take the next one up in the chain when it becomes time to renew.   

 </p><br> <img style="width:40%;padding-left:25%;" src="https://www.crest-approved.org/wp-content/uploads/Examinations-Diagram_Updated-1024x816.jpg"> <p>  

The multiple choice section of the exam is closed book, whereas the 'hacking' part is open book, being allowed take your own testing laptop setup to sit the exam. I have written a more in-depth view of the <a href="https://necurity.co.uk/netsec/2018-03-21-crest_CCT_ACE_exam/">CREST CCT-Web </a> and the <a href="https://necurity.co.uk/netsec/2015-03-13-crest-cpsa-exam/">CPSA</a> exams if you would like a more in-depth look at the exams. These exams are proficiency only, in that there is no training provided with them, they are examination only. Preparation wise, your options are to pay for the officially supported 'training' (Free is available if you're a student through Immersive labs), or review the reading list and syllabus provided by CREST.  The CRT confers CHECK team member status, and the CCT allow individuals to apply for CHECK team leader status.  

 </p><br>   

<h3> The Good</h3>  

 <p>  

The exams offer a large in-depth question bank, and aims to validate that a tester at each level meets the minimum required level for doing assessments.  The multiple-choice questions cover almost every topic from the syllabus, and the practical exams offer a number of different challenges to tackle.  

</p> <br> <p> 

Techniques and tooling are not restricted meaning you can test how you normally would (assuming you have set up an image to be able to do this), and a controversial point, the exams have to be re-taken every three years, meaning that the tester has to remain up to date with what CREST consider important to know.  

 </p><br>  

  <h3> The Bad</h3>  

<p>  

 The three biggest issues I have with the CREST exams are that; Some people claim to have seen 'copies' of the exam network, CREST do not provide good resources on where to learn, and the closed nature of the network you are testing on.    

</p><br>  

<p>  

Looking at my first issue, it comes down to statements made by people in infosec at some of the larger testing firms, and statements made by individuals such as the one above. All the exam content is covered by an NDA, so being able to have a practice run, being provided hints at the exam content any more than what is in the Syllabi provided by CREST, or by the Quoted snip 'recreating the CREST Labs' undermines the point of the exam, and makes it harder to properly asses an individual's ability. Fixing this issue is not an easy one, if you were to introduce new boxes all the time it would be resource intensive to keep the difficulty and  time-to-solve the same relative across the board. Another option is Box re-use, but have the vulnerability set quasi-random. Create more feature rich applications using the same technologies and vulnerabilities as the current box set, but each one would be 'Floating' on launch using a SEED. This way, it may be possible for someone to sit the exam, and describe the application but it would not be possible to replicate all the vulnerabilities present in the box. By rotating or including new boxes every 3/6 months it would prevent the claims of people sitting and copying the boxes from the exam.  

 </p><br>  

<p>  

My second issue is around the closed network used during the exam. It boils down to unless you have the tool you need to do a specific thing, you will not be able to do a question. As your drive gets wiped after the exam, it is tempting to stick a default Kali Live CD onto a small drive and be done with it, but you forget how much extra content you pull into your build after day to day work. To fix this, I ended up creating a custom Kali2 ISO image which comes pre-packed with my everyday tools, bash history, and non-APT programs. This is not perfect as it is only the nix side of my build and not the Windows Image, and it does not address the issue of if something is not pre-installed, it is missing for the exam. This one is a tad harder to fix, a filtered internet could be provided only allowing access to a 'read-only' proxy', allowing access whitelist of addresses and requires TLS inspection.  

 </p><br>  

<p>  

Finally, CREST only act as an exam board. There reading list is woefully short, and the training available is either expensive, or lacking in quality and content. It would be nice for CREST to invest into a sort of 'living' testing guidance, and offer some of the expertise they have into the OWASP project, and an equivalent for testing infrastructure. It is great that they are pushing the exams to include modern tech, but if you are going to offer exam questions on it, they should offer insight into how to test against it!  

 </p><br>  

<h2 id="Offsec"> <a> The Offensive Security Pathway </a> </h2>  

The second most common certification I see people trying to obtain is the ones offered by Offensive Security. These are practical examinations which come bundled with training in the form of labs and videos to work through before taking the exams. Being an exam from the maintainers of kali, it is a great starting point for your stuides. They have three stages of exams like CREST, but they focus on slightly different skill sets. You start at the OSCP, move onto OSCE (more in-depth labs) and OSWP (attacking wireless networks), and the top tier they have the OSEE and OSWE, advanced windows and web application attacks. As I only have the OSCP I will not try to compare the two exams too much. Currently, these exams are not accredited by the NCSC in the UK and do not offer CHECK team member or Team Leader status, a major downside for Offsec. 

 </p><br> <p>  

OSCP takes the candidate through a series of instructional videos, reading and following along with common attack methodologies. After which the candidate can move onto attacking the labs with the provided common tool set, going through the stages of vulnerability scanning, basic web application testing, basic infrastructure exploits, stack buffer overflows, and the basics of report writing. There are around 50 boxes to attack in the labs, and the exam consists of 5 boxes of varying difficulty. Each box provided by OSCP has two tokens, with every box requiring the user to elevate their privileges from the compromised user to equivalent root privileges. The labs are also not on a flat network, meaning should you want to attack all the available machines, you will need to pivot throughout the network, and figure out which boxes have a dependency on other boxes present. Each exam in the series builds on this, increasing the difficulty of attacking the boxes by introducing new types of overflows, defeating anti-malware software, and bypassing security controls.   

</p><br>   

<h3> The Good </h3>  

 <p>  

Compared to CREST, if you are a student looking for a certification, oscp would win hands down, they offer a series of instructional videos and follow along labs, training, a positive feedback loop of pop -> privesc repeat, and forums and IRC to chat in if you are having problems. And now that you can get one year of CREST equivalency, in the UK at least it does make more sense to do this exam first.</p><p> 

The exams put you in front of dozens of boxes you need to break. Most of them will not have walkthroughs, and the hints for them are often eclectic to make you think. There is a good selection of Windows and Linux, and lots of them require some brainpower to beat. If someone has sat and worked at the labs, and passed the exam, they should be semi competent on an infrastructure assement.  </p><p> 

 One minor tip, The exam is relatively cheap to re-take should you fail the first time around. So, take the exam at the end of your lab time even if you are not 100% sure if you will pass. it is good experience, gives you an idea what to expect in your 'real' exam attempt, and you never know, you may just pass first time around if you have put the work in.  

</p><br>   

<h3> The Bad </h3>  

 <p>  

 Although OSCP offers great labs and instructional videos the content could do with updating to better reflect more common findings. There seemed to be an over focus on some flaws with others being under represented and explained. Some of the boxes could do with examining as there appeared to be references to the old network which no longer worked in the new network when I did the labs. One example of this is is provided to, there is a Kali Image provided for use during the course, which used to be still based in Kali 1. This was long into the release cycle of Kali rolling! 

</p><p> 

The flag based approach with the ability to re-set the boxes can lead to the mindset of fire everything at the box to see what works. Should one kernel exploit hang the box just restart and try again, something which you would not want  to do on client systems. There is not a large enough focus on understanding the risk associated with running the exploits on the boxes. The use of flags and point awards for only the bug leading to code execution can lead to the impression that only issues which directly lead to exploitation are worth reporting. It would be good for there to be a focus on finding all flaws that are present and exploitable, with points being awarded for the full assessment of boxes. Rather than having just the two flags there should be  way for the student to account for all vulnerabilities present. 

</p><br><h2 id="Tiger"> <a> The TIGER Scheme   </a> </h2>  <p> 

The Tiger scheme is a slightly older examination board which is recognised like CREST. The examination format is similar to CREST in that the exams are a mix of long-form, multiple choice, and practical. It has two levels, qualified infering Check Team Member status and Certified which grants CHECK Team Leader status. I have not done these exams, nor come across any individuals who have gone through them so cannot comment on the quality of the scheme.  

</p></br><p> 

The syllabus for stage one, <a href="https://www.tigerscheme.org/pdf/Tiger-Security-Tester-Qualified-Security-Testing-Member.pdf">QTSM</a>, is pretty basic looking at network design and enumeration, common vulnerability detection, risk assessment and basic remediation. The standard is extremely vague and does not offer a good insight into what the examination board are looking for. On top of this the standard has not been updated since 2011, suggesting the scheme is mostly static without a focus on modern content. Both levels are valid for three years from the date taken. 

</p></br><p> 

The next stage is the <a href="https://www.tigerscheme.org/pdf/Senior-Security-Tester-Notes-to-Candidates-V-3.0.pdf">SST</a> is a five-part exam, a look at a previous report you have written, a multiple choice exam, long form questions, a practical, and a Viva of the practical. One huge red flag of this exam is that the syllabus states that exploitation is not required, just vulnerability identification! It is slightly more recent then the QTSM being updated in 2016. The width of content covered is shorter than what is looked for in CREST exams, and like CREST no training is provided but training courses are suggested. The concept of the examination board looking at a previous exam is an interesting one, on the surface it is a great idea, but as from what I can tell there is no suggested format or type of report that they are looking for which makes it much harder to provide the correct style of content for the assessors.  

</p> 

 

<h2 id="other"> <a> SANS - C|EH - CISSP </a> </h2>  

<p> 

There are a number of other exams and training courses which vary in content quality and price, and although I have only either had a quick look over them or had a small dabble they are still worth a mention.  

</p>  

<h3 id="sans"> SANS </h3>  

<p> 

 <a href="https://uk.sans.org/course/"> SANS </a> offer lots of courses for lots of money. They are based around a weeks intense classroom training with an instructor, and then you have the option of booking in an exam after. The exams are multiple choice and all the content in the exam is lifted directly from the exam guides. The content worth varies widely, and many of the courses are not always worth the money. That's not to say the courses are not good, it is more that for the price of what they cost you are probably better putting that $8000 towards a couple of months reading other content, doing the OSCP, and then another month polishing your new skills. It is hard pressed to ever recommend that a student take a sans course until you are ready to take the 6 or 7 series. Even if someone else is paying, think about if that money would be better spent doing something else, 8K is still 8K, heck that's 4 years trips to Defcon from the UK, arguably far better use of the money! 

</p> 

<h3 id="cissp"> ISC2 </h3>   

 <p> 

<a href="https://www.isc2.org/Certifications/CISSP"> ISC2 </a> offer a number of exams in the field which can be summed up as a mile wide, but an inch deep. Their exams do not offer a good path into the industry, but what they do offer is a slight insight into different areas you may have not come across or considered before. It's a proficiency exam covering 8 domains covering, risk assessment, asset security, identity management, security testing, security architecture, network security, security operations, and software development security. You can get callroom lead training of you wish, or self study using the <a href="https://amzn.to/2y1Sj4j"> Shon Harris</a> all in one exam guide and the <a href="https://amzn.to/2E7gnrR">11th hour</a> books. Rather than looking to obtain this straight away, it's one which is mainly used to get past HR so can be safely ignored if you are thinking about what exams you "need" to get.  

</p> 

<h3 id="ceh"> C|EH </h3>  

 <p> 

<a href="https://www.eccouncil.org/programs/certified-ethical-hacker-ceh/"> CEH </a> gets quite a lot of stick in industry, to the point where some places say that having it may be a detriment to applying there! It's considered pretty bad, and can be boiled down to reading the guide of marketing and tools provided to you, commit it to short term memory, and then brain dump during the relatively short multiple choice exam (Much like SANS ...). The exam is relatively cheap and despite it is name, only really be looked at if you or either totally new to the sector, or just want to get a slight view into what it's all about. Some UK universities have started to incorporate the syllabus of this into a second or third year module, which again shows you the letter el of training and competence you can expect from it  

<h3 id="cpa"> Comptia </h3>  

<p> 

As above, the <a href="https://certification.comptia.org/certifications/security"> Comptia </a> exams are along the lines of, review the provided material, sit the exam, get a certificate. They have a few different exam areas such as cloud, network, security and general computing. Also, just like CEH they don't offer much practical value unless you are totally new to the field. 

</p> 

<h3 id="iml"> Immersive Labs </h3>  

<p> 

<a href="https://immersivelabs.co.uk/"> Immersive Labs </a> is a starts up training provider with a bit of a unique twist. All the training is done through the browser, where you get a RDP session to a private set of boxes hosted in EC2. Each student has sole access to the box avoiding the annoyance of a random person resetting you half way through working through it. There are a couple of hundred boxes to complete, with content ranging from risk assessment to OSINT, and generic flaws and common vulnerabilities  to specific tools to get the job done. The platform is paid for, but if you have access to a AC.uk address it's free to sign up for and get started on. 

</P><p> 

Each of the Labs consist of one or more virtual machines or a collection of files, an information page which gives you background information on the topic and suggests pages to read and terms to Google, and finally a set of questions which you need to answer such as what parameter contains the vulnerability, what is the hash of X, or how do you do Y. I would describe it as if you were doing a university course, it's the lab work without any of the supporting theory. They make use of gamification giving users between 5 and 2000 points based on how hard the lab is, showing a leaderboard of who has completed what and how many points everyone has. 

 </P><p> 

The idea behind the platform is great, however the implementation leaves a bit to be desired; content is not persistent across different labs meaning any history or customisation is lost across each lab, and as you must use the web client which is god awful to interact with as you are unable to do keyboard shortcuts (CTRL-W ..) copy and paste will want to make you rip your hair out and hope that the format of your answer and way you work matches what they have done else again, you will be ripping your hair out when trying to complete the labs. 

</p> 

The quality of the labs also varies widely, but this can be forgiven a bit as the platform is only a year old. Some of the labs are a bit lacking in content not offering you much more than how to start a program up and run the help page, where as some of the other (non ninja) labs just seem currently broken duento either the from of words used for the question or things that appear to be missing on them. One more issue is that if you get stuck, there is no hint function at the moment, meaning once you get stuck there is little you can do. Moving forwards, if they work on the quality of the contents, work on some background theory sessions to assist with the learning, set up a slack to ask questions on and crack a persist Kali image for students to use, the platform could become quite a nice learning tool. As a free resource for students, it is definitely worth a go to see how you like it. 

</P> <h3 id="pa"> Project Ares </h3>  <p> 

<a href="https://www.circadence.com/project-ares/education-overview/"> Project Ares </a> is similar to immersive labs, in that it attempts to gamify learning by giving point to exercises. It is also accessed through a browser, using a flash interface to interact with the remote hosts. I only had a short use of the platform, but it seemed to have much less content than immersive labs, and much more fluff content which is not as much use such as flash cards with basic definitions on. 

</p> <h3 id="ptl">Pentester Labs </h3> <p> 

<a href="https://pentesterlab.com/"> Pen Tester Labs </a>Focuses on web application testing, it consists of a number of labs to complete and videos to watch. If you are on the Free tier labs are provided through ISO's which you can spin up, but there is also a paid tier at $20 per month with a slight discount for students. The free tier is restricted on how many labs you can do, but it is definitely worth a look into. I personally have not done the paid section, but have heard it is quite good if you work through the labs at a quick pace. 

</p> <h3 id="ctf">Vulnhub / HackTheBox</h3> <p>
 <a href="https://www.hackthebox.eu/"> Hack The Box </a> and <a href="https://www.vulnhub.com/"> VulnHub </a>are both based on the idea of an everlasting capture the flag. Vulnhub is a repository of community provided vulnerable virtual machines ready to download and spin up, whereas Hack the Box is a platform which gives an OSCP like experience where you are given a VPN to connect to a series of boxes to compromise.  Both are good solutions for continuous improvement after you reach a point where you are able to tackle the problems offered. 
 <a href="https://www.hackthebox.eu/"> Hack The Box </a> and <a href="https://www.vulnhub.com/"> VulnHub </a>are both based on the idea of an everlasting capture the flag. Vulnhub is a repository of community provided vulnerable virtual machines ready to download and spin up, whereas Hack the Box is a platform which gives an OSCP like experience where you are given a VPN to connect to a series of boxes to compromise.  Both are good solutions for continuous improvement after you reach a point where you are able to tackle the problems offered. 

</p> </div>  
