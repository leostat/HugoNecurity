+++
title = "Studying for and taking the CREST CCT-ACE Exam "
categories = "netsec"
date = 2018-03-21T11:43:39Z
tags = ["CREST","Exams"]
+++

<div id="pagemenu">
<ol>
<li><a href="{{< perm >}}#Summary">Summary</a></li>
<li><a href="{{< perm >}}#whatsit"> What is the CCT Exam? </a> </li>
<li><a href="{{< perm >}}#tech"> A Look at the technical Syllabus</a> </li>
<li><a href="{{< perm >}}#attacks"> A deeper look at the Syllabus</a> </li>
<li><a href="{{< perm >}}#reading"> Reading List </a> </li>
<li><a href="{{< perm >}}#tips"> Generic exam tips and tricks </a></li>
</ol>
</div>

<div id="pagesummary">
<h2 id="Summary"> <a> Summary </a> </h2>
<p>
I Have recently studied for the CREST CCT-ACE Exam, I thought I would share some thoughts and my Pre-Exam revision Notes to help other people, as when looked I could not find much about it, much like the CPSA! <!--more-->
</p>
<p>
Just like the CPSA, the CCT-ACE is under both the <a href="https://www.crest-approved.org/wp-content/uploads/2016/05/Code-of-Conduct_Individual.pdf"> Code of Ethics </a> , and has an NDA which covers the specific content, questions present, and the overall structure of the exam. As such, this post is NOT about the actual content or structure<!-- cheating is bad -->. It is merely my experience with the examination process, and the Technical syllabus. A copy of the notes for candidates covering the exam type, question examples and such is available from <a href="https://www.crest-approved.org/wp-content/uploads/crest-notes-for-candidates-CRT-v2.0.pdf"> here</a> and the technical syllabus is available <a href="https://www.crest-approved.org/wp-content/uploads/crest-cct-technical-syllabus-v2.2.pdf"> here</a>. These two documents should be the starting point for any study towards the certification. 
</p>

<p>
Please check the <a href="http://www.crest-approved.org/examination/certified-web-application-tester/index.html"> CCT-ACE Page </a> on the crest website for the most up to date version of the notes for candidates and the Technical Syllabus. If anything on this page is deemed against the Code of Ethics or the Non Disclosure agreement or section 1.2 of the notes for candidates then please contact me and so we can discuss what needs removing. 
</p>
<hr>
<p>
 -  TL;DR: An intense exam covering all the technical syllabus, extremely tight on time (even after the changes to how the exam is done!), but with a good selection of questions in both difficulty and tech know-how.  
</p>
</div>

<div id="maincontent">
<h2 id="whatsit"> <a> What is the CCT Exam?  </a> </h2>
<p>
So what is the CCT and who should take it? The CREST Certified Tester exams sits third in line in the exam path, aiming to confirm a mid to high level of technical ability when assessing client web applications, and client infrastructure. It sits above the CRT exam and takes a more specialist approach to your chosen exam path. The Infrastructure path is aimed at common client configurations, whereas the ACE exam looks at a whole host of web application flaws. CREST recommend that you should have 5 years testing experience before attempting the exams, and although you do not need the CPSA/CRT to take these exams, given the cost of the CCT, I would recommend starting out with them to act as a form of orientation to the examination method so you do not get hit by any nasty surprises. The exams also grant CHECK Team Leader status, a requirement for the CHECK testing scheme for HMG and Public Sector networks. <!-- yay IT Health Checks -->
</p>
<br>
<p>
The exam is now split into two sections. First, a multiple choice exam which takes place at a Pearson Vue Centre, and second, the practical examination. The new format means that there is more time in the second half of the exam, and if you are able to pass the multi-choice section of the exam, you are able to have three attempts at the practical, saving a bit of money (Although you should be looking to pass the first time around!). The first section is only 150 questions and is closed book. Not much to say about this as you will either know the topics as highlighted in the syllabus, or you won't. The second section consists of a number of questions, as well as one "Scenario Question", previously known as the dreaded long-form answer. The notes for candidates and the technical syllabi highlight the areas that will be examined.
</p>
<br>
<p>
I have a personal preference for testing Web Applications and find that there is a much wider availability of training, write-ups, and logic around them. Starting off, I grabbed a copy of the syllabus, stated working notes on the areas to which I believe the questions and the machines would focus on. Done on a <a href='https://remarkable.com/'> ReMarkable E-Ink Tablet</a>, I have no problem plugging it as it was a huge help during my studies! Its an A4 sized e-reader with a 'pen', allowing you to annotate documents. Easy and simple to use, great battery life, and, handles large PDFs and tech books with ease. Even better, the remarkable exposes the ability to gain root access over SSH, making it super customisable. 
</p>
<!-- These notes are currently available <a href="/static/docs/cct_ace_annotated.pdf"> here</a>.
</p> -->


<h2 id="tech"> <a> A Look at the Technical Syllabus  </a> </h2>
<p>
CREST sticks with the syllabus style for the CCT exams, and it works pretty well. The exams work as proficiency and skills tests, and as such, no training is provided through CREST. Accredited training courses are available, but I have not attended any so can not comment on the quality of them. The syllabus has 10 sections, and just as other exams, there is a cross-over between this, CISSP and OSCE, so if you have done any of those before then you may have an upper hand in this exam.
</p>

<br>
<table>
<tr>
<td>
Soft Skills and Assessment Management
</td>

<td>
This first section tests you on all the 'aside' things that you may not deal with every day. Looking at laws and compliance, risk, project structure and also reporting. As this does not really differ from normal report writing, and sections of the CPSA and CRT, there should not be much to revise in this section.
</td>

<td>
Looking at your record keeping, make sure you can make coherent notes and can follow the instructions on the exam paper.
</td>
</tr>

<tr>
<td>
Core Technical Skills
</td>

<td>
This again should come simply to any tester, can you use your scanner of choice effectively, interpret and understand the output, and use this information to make informed decisions about the security of a system.
</td>

<td>
This section has two areas flagged for assessment, target mapping was assumed to mean banner grabbing, and OS fingerprinting. For cryptography, looking at common encryption methods, password hashing, crypt weaknesses, and padding oracle attacks were revised.
</td>
</tr>

<tr>
<td>
Background Information Gathering & Open Source
</td>

<td>
Effectively looking at some basic OSINT, most of the items in this section simply cannot be tested on the exam as there is no network connection.
</td>

<td>
One area flagged for testing in this section, Customer Site Analysis. This was taken to mean, searching for comments within the page source, generating word lists based on the site, and, inferring information and logic based on what is displayed. As such, not much to revise for this section either if you are familiar with burp suite!
</td>
</tr>

<tr>
<td>
Networking Equipment
</td>

<td>
Looking at common client LAN networks, mostly common networking knowledge, with a few things you may not come across as often such as 802.1X, routing, and switching protocols.
</td>

<td>
This is all paper revision for the ACE exam. 
</td>
</tr>

<tr>
<td>
Microsoft Windows
</td>

<td>
Looking to the Windows ecosystem, common exploits, weakness, and knowledge of how domains work. Technet is your friend for this section if you have not acted as a Sysadmin on a Domain before. Most points on this section are aimed at the Infra exam.
</td>

<td>
One row is highlighted, passwords. I guessed this would be either post exploitation hashdump and crack, or methods of eliciting a NetNTLM hash such as; use of XP_DIRTREE and alike. forcing the mount of a remote share, and embed UNC path in a web page.
</td>
</tr>


<tr>
<td>
Unix Security
</td>

<td>
Another Section aimed at the CCT Infra, do you know headline vulnerabilities, password storage ($1$2$5$6), common Unix server software, user enumeration and remote management? If you have done OSCP, you should be OK here.
</td>

<td>
Not a single P in this section suggests that Unix boxes will not even appear in the exam. A bit odd given how prevalent they are.
</td>
</tr>

<tr>
<td>
Web Technologies
</td>


<td>
A look at the underlying infrastructure of web applications and the platforms that they are hosted on.
</td>

<td>
A number of tools will be needed for this section but nothing your normal testing laptop should not have, an up-to-date ExploitDB, MSF, SOAPUI, 32+64 bit Wine, lots of random git projects, and write up of high severity named vulnerabilities.
</td>
</tr>


<tr>
<td>
Web Testing Methodologies
</td>

<td>
Looking at the theory and cause of vulnerabilities. Auditing and pulling information from pages, logical issues and the write-ups associated with issues found.
</td>

<td>
Mainly looking at the audit of applications, some pre-prepared write-ups may help here. Better however, would be to have a good understanding of all the OWASP top findings.
</td>
</tr>

<tr>
<td>
Web Testing Techniques
</td>

<td>
The main section of the exam, can you test web applications, do you know OWASP like the back of your hand, have you absorbed every bit of information from the Hackers Handbook Series, and have you played at a few CTF's? If so that is a good start.
</td>

<td>
Tools to help you work effectively are important here, working quickly and accurately is very important for the exam, and you do not want to be trying to remember what flags do what. Also, remember you do not have to use tools to do everything, sometimes doing things by hand is quicker and easier.
</td>
</tr>

<tr>
<td>
Databases
</td>

<td>
The backbone of any good application, knowing how to exploit and shell them is a vital skill. Knowlege of exploiting SQL injections, database security testing, and the methods by which you will be able to execute code on the remote server. 
</td>

<td>
SqlMap is a basic requirement, much better to have an understanding of SQL, the variances between the languages (sleep, wait, pg_sleep), and what functions can be used on the server.
</td>
</tr>
</table>


<h2 id="attacks"> <a> A Deeper Look </a> </h2>

<h3 id="Technologies"> Web Technologies </h3>
<p>
The first dedicated web section assesses the technologies and frameworks which support web applications. Sections 2 and 8 are looking at off the shelf servers such as IIS and Apache, and as such it was assumed that off the shelf vulnerabilities would be tested under these questions. Things such as overflows present in the software stack itself and weaknesses in their configuration. For these, I assumed the requirement for a vulnerability scanner, and up to date copies of Metasploit and the local Exploit DataBase by Offensive Security.
</p>
<p>
Section 4 covers web protocols, methods and headers. For SOAP, one option is using <a href="https://www.soapui.org/"> SoapUI </a> to generate valid test cases, and highlight data input, and then use BurpSuite to fuzz and attack the service. SoapUI requires the service description which can usually be discovered by checking out the WSDL (example.com/soap.svc?wsdl or sometimes example.com/soap.svc?singlewsdl) or by using the discovery URL which usually points to the WSDL (example.com/soap.svc?disco). It is interesting how REST is not mentioned for testing. Web methods could be the enumeration and use of the PUT method. First, issue a OPTIONS request and see what you can do.
</p>

<p>
Section 4 covers web protocols, methods and headers. For SOAP, one option is using <a href="https://www.soapui.org/"> SoapUI </a> to generate valid test cases and highlight data input, and then use BurpSuite to fuzz and attack the service. SoapUI requires the service description which can usually be discovered by checking out the WSDL (example.com/soap.svc?wsdl or sometimes example.com/soap.svc?singlewsdl) or by using the discovery URL which usually points to the WSDL (example.com/soap.svc?disco). It is interesting how REST is not mentioned for testing. Web methods could be the enumeration and use of the PUT method. First, issue a OPTIONS request and see what you can do.
</p>

<h3 id="Methodology"> Web Testing Methodology</h3>
<p>
Next up, we have web testing methodologies. Sections 3 and 12 gathering information from mark up and source code is relatively straightforward. Word lists can be created using CEWL, and the page can be examined for anything which is not displayed to the user such as comments, hidden fields, or static values which are passed with forms. Included CSS and JS pages should also be checked for includes from other servers or 'private' directories or API endpoints, and anything which looks like a 'standard' web library such as jquery should be checked for any added functions. It also looks at source code analysis which could mean gaining access to the source of an application through an LFI to gain access to the source and then find another vulnerability within it.
</p>
<p>
Sections 4 and 5 looks at Authentication and Authorisation. Both reference 'common pitfalls', so it is assumed that it will be nothing more than IDOR, weak passwords, or exposed authentication tokens. It could be either through SQL injection, or weaknesses in session handling such as guessable session tokens, weak use of <a href="https://franklinta.com/2014/08/31/predicting-the-next-math-random-in-java/"> random </a> number generation, <a href="http://www.netmux.com/blog/purple-rain-attack"> weaknesses in password resets</a>, or padding oracle attacks on session tokens. Session Fixation attacks could also be required which would chain with the XSS questions present on the Syllabus, helping cover of I4 and I11, using an injected page through a proxy to serve up a known session.
</p>
<p>
H6 and H7 cover just basic fuzzing and validation, such as bypassing a client-side control, expected to be most likely in support of either XSS, SQLi or RCE, which would then cover off 9 and 10. Here I do not see anything more than just standard BurpSuite usage, while also covering I5 and I6. A local instance of Burp Collaborator was also configured to use the advanced blind and host interaction tests.
</p>

<h3 id="Techniques"> Web Testing Techniques</h3>
<p>
The main chunk of the exam, looking at finding and exploiting web application flaws. Skipping over I1 which was covered above, I2 Cross Site Scripting. Having pre-made templates to steal the user's session token, auto-submit a form on behalf of the user, and read the page were prepared. The SET and BEEF frameworks were also installed to act as a 'cheaty' way to carry out enumeration and exploitation on a hooked client. Copies of the <a href="https://www.owasp.org/index.php/XSS_Filter_Evasion_Cheat_Sheet"> OWASP XSS Cheatsheet </a> and a <a href="https://github.com/foospidy/payloads"> libray of payloads </a> were grabbed before the exam. 
</p>

<p>
For I3, SQLMap with its collection of automated analysis and tamper is the obvious choice, and <a href="http://pentestmonkey.net/category/cheat-sheet/sql-injection"> pentestmonkey's </a> collection of cheatsheets was downloaded. If you are unfamiliar with doing SQL injection manually you should also go away and practise this, in some instances SQLMap will not be able to exploit your injection point<!-- such as an Insert, of which the value must return 1 or 0) -->, and you will have to do this manually. Revision of shelling a database through SQLi is also required, and the usage of xp_cmdshell, xp_dirtree, library uploads, uploads to the webroot, or just database exploits was revised. One last thing for this section - always starts with VALID DATA! If its a SELECT it should SELECT a subset of data, not everything, and if its an INSERT, check to make sure there are no UNIQ constraints on what you are injecting into.
</p>
<p>
I7 covers SSL configuration, SSL Labs has write-ups of common misconfigurations and good practice guides. Write-ups of commonly seen flaws and all the 'named' bugs were created. SSLScan is a good tool for this, just confirm it is working as expected first. There are also some summary write ups <a href="http://pentestdiary.blogspot.co.uk/2017/09/tlsssl-vulnerabilities.html"> available</a>.
</p>


<p>
I8 and I9 cover directory traversal, dotdotpwn is an option for an automated tool, but doing these manually is usually easier. Keep in mind ways of jumping from LFI to Shell, and have some quick simple web-shells ready for use. Don't forget to check for any blacklisted functions when trying to shell the server. If you have done the OSCP, these two should be a breeze!
</p>
<p>
Code injection is easy enough, also covered in the OSCP. To make this easier and roll in shellshock, Commix is a tool which can be used.
</p>
<p>
Downloading commonly used documentation and cheat sheets, and the pre-write up of common flaws acts as a 'good known', as the last thing you want to do is be tripped by a typo in your exam, and when testing for things such as SQLi and RCE, do the simple tests first as they may just save you a bucket full of time. I also worked on a python <a href="https://necurity.co.uk/osprog/2017-02-27-RTFM-Pythonized/"> RTFM</a>, adding a new flag and new content getting ready for the exam.
</p>

<h2 id="reading"> <a> A Reading list </a> </h2>
CREST recommend a number of books to study from the exam, some of these are absolute musts, others not so much. During my revision I used the following books: 

<table>
<tr>
<td>
<a target="_blank" href="https://www.amazon.co.uk/gp/product/1512214566/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=1512214566&linkCode=as2&tag=necuritycouk-21&linkId=855eb9a3426c1192b47aefc755fdbd30">The Hacker Playbook 2: Practical Guide To Penetration Testing</a><img src="//ir-uk.amazon-adsystem.com/e/ir?t=necuritycouk-21&l=am2&o=2&a=1512214566" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
</td>

<td>
A must for the exam, covering your standard web application flaws. Read it, then re-read it, then make sure you have absorbed all the information within it. If ou dont have it, check it out online at : https://archive.org/details/TheWebApplicationHackersHandbook2ndEdition
</td>
</tr>

<tr>
<td>
<a target="_blank" href="https://www.amazon.co.uk/gp/product/1118662091/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=1118662091&linkCode=as2&tag=necuritycouk-21&linkId=67e8771b0fe64435fadd9a21327f1e37">The Browser Hacker's Handbook</a><img src="//ir-uk.amazon-adsystem.com/e/ir?t=necuritycouk-21&l=am2&o=2&a=1118662091" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
</td>
<td>
The companion book to the WAHH, also a must read covering more client-side attacks.
</td>
</tr>

<tr>

<td>
<a target="_blank" href="https://www.amazon.co.uk/gp/product/1984201573/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=1984201573&linkCode=as2&tag=necuritycouk-21&linkId=f3c33c633095fcc766863853324a0855">Open Source Intelligence Techniques: Resources for Searching and Analyzing Online Information</a><img src="//ir-uk.amazon-adsystem.com/e/ir?t=necuritycouk-21&l=am2&o=2&a=1984201573" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
</td>

<td>
Covering off the OSINT, if you have never done anything formal in the area this is a great place to start.
</td>
</tr>

<tr>
<td>
<a target="_blank" href="https://www.amazon.co.uk/gp/product/1597499633/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=1597499633&linkCode=as2&tag=necuritycouk-21&linkId=e16052e0412157e0e2a8002a7d1f7560">SQL Injection Attacks and Defense</a><img src="//ir-uk.amazon-adsystem.com/e/ir?t=necuritycouk-21&l=am2&o=2&a=1597499633" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
</td>
<td>
Taking a more in-depth look at SQLi, a good read for more than just the usual OR 3=3.
</td>
</tr>
</table>

<br>

<p>
If you are not planning on taking the exam anytime soon, and you are working from online resources, check out https://www.humblebundle.com/, they occasionally have infosec book sales where you can pick up great books at low prices while donating to charity!
</p>
<p>
There are some free training sites available, and most testers at this point have heard of https://www.vulnhub.com/, and https://www.hackthebox.eu/, but there are a few others which you may find useful. <a href="https://pentesterlab.com/"> penTesterLabs</a> looks at a large collection of off the shelf web application flaws, and more 'complicated' platform issues and CVE's. This one will set you back $20 a month, so it is quite cheap to have a look and see what you can learn.
</p>
<p>
If you are a UK based University Student, you may have access to <a href="https://www.immersivelabs.com/"> Immersive Labs</a>. A pretty good resource which utilises a series of virtual machines to teach a wide variety of concepts. Sadly, the second two are a bit expensive if you are studying on your own money. Priced at over $1000, Unless your organisation is signed up, it is quite expensive. Before launch, there was talk of a totally free access through "The Digital Cyber Academy® (DCA)", where all you needed was an .ac.uk adress, however this is no longer advertised so it may have been silenty dropped.
</p>
<p>
A few other people have done write-ups on the CCT exam, and their write-ups can also help, http://pentestdiary.blogspot.co.uk/2017/08/crest-cct-application-exam.html covers a large dump of tools which you may wish to use, http://pwndizzle.blogspot.co.uk/2014/12/crest-crt-exam-preparation.html covers a few common commands, HighOnCoffee has some high-quality cheatsheets, and RTFM contains quick snippets and links to more information.
</p> 

<h2 id="tips"> <a> Generic Exam Tips and Tricks  </a> </h2>
<p>
The second section of the exam is open book, don't be afraid to take in your condensed revision notes or relevant reading material (An indexed up Web Application Hackers Handbook!). Although its open book time is very tight so you won't want to be having to look through pages and pages of notes and a few books so only take in things that you will really need. Have snippets of information available at your fingertips. Going into the exam make sure that your laptop is set up how you use it every day. The laptop gets wiped at the end of the exam (make sure you can take the drive out!) so it may be tempting to just stick something like Kali on there and be done with it, but, consider that you will not have external network access, so make sure all programs, plugins and compatibility fixes are in place. 
</p>

<p>
Sanity check your build before going into the exam, with the rise of HTML 5 and the fall of NAPI, some things you may take for granted as working may not out the box. Flash, Java, ActiveX, and, SilverLight are all highlighted in the exam syllabus, but none are available when inserting a Kali Sana ISO. To deal with this, I have rolled up my testing laptop with all tools I need into a liveboot ISO. If you do testing as a day job a highly recommend following the <a href="https://docs.kali.org/development/live-build-a-custom-kali-iso"> walkthrough </a> so that should the worse happen and your drive does not work in the exam, you have something to fall back on! 
</p>

<p>
Keep an eye on your time in the exam, Your timings work out at around one mark per minute if you go for 100%, so read the paper at the start of the exam, and go for the section for which you believe will be the easiest. You don't need to tackle the exam in order, and you do not need to answer all sections of the questions.
</p>
<br>
<p>
And finally, in the words of  Douglas Adams'
</p>
<b> <a href="https://youtu.be/ikdFUcWluyU?t=43">DONT PANIC! </a></b> <!-- Having a Hitchikers guide may also help -->
</p>
<br>
If you have studied, absorbed the reading list, had a stab at vulnhub, done some web app testing (Go check out BugCrowd if you want more!), and have memorised the syllabus you will be fine. At the end of the day, its just web application testing!
</p>
<br><br>

</div>
