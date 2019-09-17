+++
title = "Bsides London PreCon Challenge : Cracking the vault"
categories = "netsec"
date = 2019-06-05T07:08:13Z
draft =  false
tags = ["Conference","CTF","Web Application"]
+++

<div id="pagemenu">
<ol>
<li><a href="https://necurity.co.uk/netsec/2019-06-05-bsidesldnvault/#Summary">Summary</a></li>
<li><a href="https://necurity.co.uk/netsec/2019-06-05-bsidesldnvault/#TL;DR">TL;DR</a>  </li>
<li><a href="https://necurity.co.uk/netsec/2019-06-05-bsidesldnvault/#Stage1">Stage One</a> </li>
<li><a href="https://necurity.co.uk/netsec/2019-06-05-bsidesldnvault/#Stage2">Stage Two</a> </li>
<li><a href="https://necurity.co.uk/netsec/2019-06-05-bsidesldnvault/#Stage3">Stage Three</a> </li>
</ol>
</div>

 <div id="pagesummary">  

<h2 id="Summary"> <a>Summary </a> </h2>  

 <p>  
This year I decided to do some of the pre besides challenges chance to get a ticket to go to the event as I wasn't lucky enough to get a ticket in the presale. Remembering challenges are available to get tickets I got stuck into the "Palisade bank” challenge. This appeared to be the web application challenge, claiming to need basic OSINT, enumeration, and application testing. The challenge took around 12 hours to complete and was quite fun, so thanks to Daniel card from <a href=”https://www.xservus.com/”>XServus</a> for submitting the challenge. <!--more--> 
</p> 
<p>
In this write up I wanted to cover both how correctly solve the challenges, but also some of the mistakes I made to show more of the thought process around how I was taking on the challenge. <!--more-->
</p>

</div>
<div id="maincontent">


<h2 id="Stage2"> <a>  Stage Two  </a> </h2>
<p>
Spoilers ahead of course so if you want to have a go stop reading now, so without further ado let's look at how I tackled breaking the vault. This challenge was broken up into four main steps with each step granting access to either a flag all information on how to proceed with the challenge. Kicking off the challenge, a string of Morse is given out to decode.
</p>
<pre>
.... - - .--. ---... -..-. -..-. ... - .- --. . .---- .-.-.- -... ... .. -.. . ... .-.-.- .-.. --- -. -.. --- -. .-.-.- ..--- ----- .---- ----. .-.-.- .--. .-- -. -.. . ..-. . -. -.. .-.-.- -.-. --- -- -..-.
</pre>
<p>
Once decoded, it links to the main web application hosted at ‘stage1.bsides.london.2019.pwndefend.com’. As this is a web application, start by kicking off a couple of quick scans to carry out reconnaissance of the site; a nmap scan to see what ports are open, DirBuster to see if there's anything hiding in plain sight, a cursory check of robots.txt and humans.txt to see if there are any hints of directories or back end technology in use, and finally just clicking through the application reading and checking what functionality is available to the user. This last step is extremely important in web application testing, unless you know what functionality there is on the application, building your understanding on the normal operation how are you meant to know what there is to attack! After a few minutes the results of scans were in, only port 80 open, nothing in robots, humans or even killer-robots text files, and nothing of interest from the Dirbuster. At the same time, we had a peak to see if stage2 and stage3 were valid domains which they are, so that’s a bit of information for when needed at least.
</p>
<img src="/images/bsides19/welcome.png">
<p>
Moving back to the stage1 web application, it appears to be a basic CMS, with very limited functionality. There are a couple of articles about the bank, a mini hash cracking CTF, a registration page which seems to be disabled, Client and Admin login, and finally a send message box on some of the pages. Deciding to start with the send message function, common injection techniques were tried to see if anything of interest pops out of the other side. 
</p>
<img src="">
<p>
After some poking and prodding it didn't seem to do much with no email sent out in response, no ‘wiggles’ when fuzzing for SQL injection, and no call-ins for blind XSS checks. With nothing showing from this form, some quick injection checks are carried out on the two login pages, but as expected nothing is showing. Checking burp to see what is going on behind the scenes, comments can be found which hint at checking the source code of pages.
</p>
<pre>
&gt!-- Remember to clear code of commments, you never know what developers might write in here... --&lt
</pre>
<p>
If you are using BurpSuitePro, the Engagement Tools can quickly scan the site for all comments, however you don't need this for the challenge as the size of the application allows you to just click through and read the pages. By doing this, some interesting looking comments can be seen scattered across the site. References to non-linked pages, a large block of text from “do androids dream of electric sheep”, and hints about where the login for stage three is. We are not able to do anything with the large block of text, so we just keep a note of its presence, one of the non-linked pages does not exist, and we are not at stage three yet, so that leaves one last thing to have a look at, the unlinked page “apply.html”. 
</p>

<p>
At first look this page is pretty much blank, so we refer to the source where we can see some JavaScript which doesn't appear to do anything on the page. Opening the dev console we can use the inbuilt prettify function to make it any easier to read. In this, we can see two functions are exposed, apply() and reject(). 
</p>
<pre>
        <script type="text/javascript">
            console.log("Palisade Security Application");

            var _0x533a = ['OIiOrDWU2Y3&jaTGeQNH1', 'Generate a flag!', 'This is not the way to do it!', 'log', 'Unique Encrypted Customer Code:', '                  _________-----_____', '       _____------           __      \x5c---_', '___----             ___------              \x5c ', '   ----________        ----                 \x5c ', '               -----__    |             _____)', '        _______-----    ___--          \x5c    /)\x5c ', '  ------_______      ---____            \x5c__/  / ', '               -----__     --    _          / ', '                              ----|   /          |', '                                  |  |___________|', '                                  |  | ((_(_)| )_)', '                                  |  _((_(_)|/(_)', '                                   _____________)', '-------------------------------------------------------', '------------         LULZ ROT IS 1337      ------------'];
            (function(_0xdd6399, _0x49cdb6) {
                var _0x268527 = function(_0x57cfe4) {
                    while (--_0x57cfe4) {
                        _0xdd6399['push'](_0xdd6399['shift']());
                    }
                };
                _0x268527(++_0x49cdb6);
            }(_0x533a, 0x107));
            var _0x36a8 = function(_0x442c1a, _0x435994) {
                _0x442c1a = _0x442c1a - 0x0;
                var _0x5a04ec = _0x533a[_0x442c1a];
                return _0x5a04ec;
            };
            function apply() {
                console[_0x36a8('0x0')](_0x36a8('0x1'));
                console[_0x36a8('0x0')](_0x36a8('0x2'));
                console[_0x36a8('0x0')](_0x36a8('0x3'));
                console[_0x36a8('0x0')](_0x36a8('0x4'));
                console[_0x36a8('0x0')](_0x36a8('0x5'));
                console[_0x36a8('0x0')](_0x36a8('0x6'));
                console[_0x36a8('0x0')]('                    __-                /     \x5c ');
                console['log'](_0x36a8('0x7'));
                console[_0x36a8('0x0')](_0x36a8('0x8'));
                console[_0x36a8('0x0')](_0x36a8('0x9'));
                console['log']('                      --__--__     _____/   _/\x5c ');
                console[_0x36a8('0x0')](_0x36a8('0xa'));
                console[_0x36a8('0x0')](_0x36a8('0xb'));
                console[_0x36a8('0x0')](_0x36a8('0xc'));
                console[_0x36a8('0x0')](_0x36a8('0xd'));
                console[_0x36a8('0x0')]('                                               (');
                console[_0x36a8('0x0')](_0x36a8('0xe'));
                console['log'](_0x36a8('0xf'));
                console[_0x36a8('0x0')](_0x36a8('0x10'));
                console[_0x36a8('0x0')](_0x36a8('0xf'));
                console[_0x36a8('0x0')](_0x36a8('0x11'));
            }
            function reject() {
                console['log'](_0x36a8('0x12'));
                console[_0x36a8('0x0')](_0x36a8('0x13'));
            }
        </script>

</pre>
<p>
After spending some time reading  the JS, I realised that there was no ‘hidden’ meaning, and all it was, was js obfuscation. _0x36a8 acting as a shim which calls values from the _0x533a array. So “console[_0x36a8('0x0')]” is just calling console.log. As such we can just run apply() function and see the output:
</p>
<pre>
apply()
apply.html:formatted:22 Unique Encrypted Customer Code:
apply.html:formatted:23                   _________-----_____
apply.html:formatted:24        _____------           __      \---_
apply.html:formatted:25 ___----             ___------              \ 
apply.html:formatted:26    ----________        ----                 \ 
apply.html:formatted:27                -----__    |             _____)
apply.html:formatted:28                     __-                /     \ 
apply.html:formatted:29         _______-----    ___--          \    /)\ 
apply.html:formatted:30   ------_______      ---____            \__/  / 
apply.html:formatted:31                -----__     --    _          / 
apply.html:formatted:32                       --__--__     _____/   _/\ 
apply.html:formatted:33                               ----|   /          |
apply.html:formatted:34                                   |  |___________|
apply.html:formatted:35                                   |  | ((_(_)| )_)
apply.html:formatted:36                                   |  _((_(_)|/(_)
apply.html:formatted:37                                                (
apply.html:formatted:38                                    _____________)
apply.html:formatted:39 -------------------------------------------------------
apply.html:formatted:40 ------------         LULZ ROT IS 1337      ------------
apply.html:formatted:41 -------------------------------------------------------
apply.html:formatted:42 OIiOrDWU2Y3&jaTGeQNH1

</pre>
<p>
Now we have a code and the hint “LULZ ROT IS 1337”, I guessed this is what we needed to log into the client portal, so throwing the output into <a href=” https://gchq.github.io/CyberChef/”>CyberChef</a> , which if you haven't seen this before it is described as a Swiss army knife of common computer operations. It is a pretty powerful tool being able to carry out encoding and decoding data, file format analysis, generate hashes, analyse crypto, crack the enigma code, or even “Magic”. If you have not used it before, I really would recommend doing a bit of reading about how to use it and some of its capabilities. After Throwing the code into CyberChef with Rot13, head back to the Client log in page with a random username and password to see what happens.
</p>
<pre>
Welcome
Error. Entity Registraton Process Failure
Unable to connect to ftp services: NDAuNjguMjQ5LjIx 
FLAG{2943eb55-aea0-438e-9c1b-38186dfc5775} 

</pre>
<p>
Stage one complete! We are presented with a bit of fluff about an FTP server saying unable to log in, and some Base64 (which decodes to an IP address) and most importantly, the first flag.  As we have this, I guess that we were done with stage one, and jumped to the stage two address.
</p>
<h2 id="Stage2"> <a> Stage Two   </a> </h2>
<p>
Visiting the stage two URL the server shows a small directory listing, of which there are only a small number of files and folders. Looking in the readme file, it has “I've moved this content to our GitHub server.” The link to this was found during the reconnaissance of the web application in stage one. 
</p>
<p>
In their repository, there is one encrypted access database and a readme with very little information about what that file is used for. One thing which stands out as odd in this repo is  that there are four commits into this repository. In the commit history we can see that the readme has changed, and clicking into this shows that it used to contain “The password for the remote access database is the bracketed flag value from stage 1 of the CTF e.g. {xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx}”. Trying this against the database works, revealing a small database with 3 users and their corresponding passwords, assumedly for the FTP server highlighted from stage one.
</p>
<img src="/images/bsides19/GitHub.PNG">
<img src="/images/bsides19/history.PNG">
<p>
The first two users fail to log into the server but the third, filetransfer, successfully logs in. All seems well until the “list” command is ran. It appears that it was intentionally misconfigured to return its internal address rather than its external when entering passive mode.
</p>
<img src="/images/bsides19/ftpfail.PNG">
<p>
After a quick swap to using FileZilla, which has an option to always use the external address rather than the internal provided address, logging in, listing, and downloading files from the server is possible. Looking through the files there are several empty folders, some cute cat pictures, a couple of archives, a PowerPoint document, a packet capture, an ‘urgent email’ and a PDF document. The next logical step is quite easy, just looking through these files to see what they contain. Looking through them shows that the  zips and PowerPoint are password protected, the passwords.txt is as it says, a list of passwords, and the message discloses some username:password pairings and a note about how Bob just ‘increases the number on the end’ whenever they need to change their password. As there are an increasing number of usernames and passwords being found, a password list is started to keep track of them. As a base, the passwords.txt file, also included are, the flag value and variants, the usernames from the home folders, passwords found in previous stages and some logical leaps about passwords such as Summer2019! and Pa55w0rd0 to Pa55w0rd9.
</p>
<p>
Turning attention to the PDF, it appears to have been “redacted”, but not very well text can be copied out from underneath the mark giving another password to add to the list. As the PDF is talking about security policy, it was assumed to be something do with the PowerPoint which turned out to be true.
</p>
<img src="/images/bsides19/password_policy.PNG">


<p>
There are several ways information can be hidden in a PowerPoint, white text, steg within images, objects behind images, objects set to 0 height and width, messing with macros, and embedding documents within the PowerPoint are just some of the methods. Working though these, there are no macros set, but hitting control-a on both sides shows that there is a hidden object inside the Excel image. I think this was meant to open excel, but it didn't seem to work on my box. Guessing that there is an embedded file, save off the PPTX without a password, rename it to a zip and extract it. Modern document formats are just zipped up XML files, with all binary objects such as images attached as files within the archive. Navigating to the attachment shows a suspicious intentionally blank screen. With a similar number of tricks to hide text in an excel file, opening the file in a hex editor allows for quick skimming of extra content. Doing this shows us that there is more to the file than that white space, with what looks like a second tab being present.
</p>
<img src="/images/bsides19/hex.PNG">


<p>
Flicking back to the main spreadsheet, right clicking on the tabs at the bottom of the page the unhide tabs button is present which when pressed shows the password audit sheet. This hidden sheet contains some username:password, and some username:hash pairings. The hashes looked like MD5, so to save time throwing them into one of the many MD5 reversing tools that are available on the internet retrieves the plains for all submitted hashes.  
</p>

<p>
Given that more passwords have been recovered, it makes sense to move onto the 7Z files which need passwords to access. Passwords could be entered one by one, which is pretty inefficient, much better would be to extract the hashes to run through OCL or John to crack, or “lazier” and quicker, wrap the unzip in a bash one liner: 
</p>

<pre> 
export IFS=$'\n'; for i in `cat passwords.txt`; do 7z e network_capture001.7z -p $i; echo $i; done; 
export IFS=$'\n'; for i in `cat passwords.txt`; do 7z e sslkeys.7z -p $i; echo $i; done

</pre>

<p>
After doing this we are able to get into the ssl_keys.7z file, in which there are some pre-master secrets for TLS, which as we have a packet capture, can be loaded into Wireshark decrypting any TLS traffic. Pre-Master Secrets are the primitives used by your browser when setting up an encrypted tunnel to a website, and if you have them, you are able to decrypt the traffic. If you have not come across them before I would recommend reading about them at the  <a href=” https://wiki.wireshark.org/SSL#Complete_SSL_decryption_walk_through”> Wireshark Wiki</a>
</p>
<pre> 
RSA 09a546973b2e7e0e 030178e118e813fff5a45f27aced4c8717ac8b3101bce0982545aeabbdaa95b6b5981b1002b952a38473bfc67308ea47
CLIENT_RANDOM 5cb984fb075da1fb2c758d32547c233a84a926b54c541c4befc21a284466070e 26f1e5570c12f66783ef6c26e9adb26993b8e604b29fe402d63c7e43740ae063bfb347eb22fd5a1c0687b9e7ace9c3a4

</pre>

<p>
Given TLS secrets have been obtained and a capture file is in the file listing, network_cap1 was looked at next. The first thing to do when identifying traffic within a PCAP is to identify what conversations take place, what services are used, and how many different devices are used. Taking this approach allows quick assessment of how much traffic there is potentially to attack, which in this case only a handful of devices talking your standard web protocols. Dissecting the websites being accessed, it didn’t suggest any action points and none of the traffic really stands out as interesting. Moving onto the SSL traffic in the capture file, none appears to have been decrypted. Checking the logs, none of the keys have been applied to any of the traffic within the capture file successfully suggesting this may not be the correct capture. After some time of looking at the PCAP. Hex dumping the file and grepping through for any of the keys showed that non of the SSL keys were present. Remembering the cat pictures, it occurred to me after some time that this PCAP may just be a timesink, and have nothing of use or interest in. 
</p>
<img src="/images/bsides19/wireshark.PNG">


<p>
Turning our attention to the last zip file, the one-liner failed to get in, so we have to attack this properly by <a href=”” >extracting the hash of the archive</a>, and cracking it with Hashcat. One mistake I made which wasted many, many, many hours is that I used the wrong password list with rules to attack the archive. 7Zip passwords are massively slow to attack, with my laptop managing around a few thousand million MD5 passwords a second (Laptop RTX2060), in comparison it only managed under 1500 a second on the GPU, and another 100 a second on the CPU/iGPU combo. Given this speed, I started with the top-100 passwords from <a href=””>SecLists</a> using the standard rules which come with hashcat. After this failed, swapping to the top 1000 list, and finally after this, starting a brute force attack  using the highlighted password mask from the email:
</p>
<pre>
“Over 8 characters, must contain alpa, numertic and a special”
.\hashcat64.exe --force --opencl-device-type 1,2,3 '$7z$0$18$0$1122$16$423ae8d8f7a75d99bd11c57822f2456e$159521110$176$162$13cc28f69672a42ebc329cf08cb675c4e420ae0cfdbf9aeb701d3c4517b391ba4fb028f9e490a13adf61e37d34dc99a6e8d80216326e5b60548513196f8e37ac98db94195df855fe4098ab9177b1ec00c6dd2f57dcc39de6967f6c2b3c6ede9fad8a0fd5bfad9a8611e64dc0a27fe3c13762eb7e887e47460653da3557dd3fc27a01170b90a626a9bab3d4a46b279f70a83523d400f7cc21e92a7e48b9f1f6acf5fccddb693f24d4c5998e27b5e15c68' -m 11600 -O -w3 -a3 ?u?l?l?l?l?l?l?l?d?s 
Time.Estimated...: Fri Jun 05 20:57:13 2567 (548 years, 0 days) !

</pre>
<p>
After leaving this for a few hours chugging away in the background with no joy I reached out to the discord associated with the challenge to ask if there are any more stage two hints. Of which there were two,  tools don't always work and read the guides provided if stuck. Reading through their guides, they have a Perl script to get the hash rather than the python one I used. Trying this yielded the same hash as previously, but  the second bit of information in their guide is to use the RockYou list when doing password cracking as it is such a good sample of how people choose passwords.
</p>

<p>
RockYou managed to retrieve a password in under an hour, Gold540. Trying this against the archive did not work, so assuming that there was a blip in the GPU, I removed it from the pot and re-ran the cracking with the same result, quite infuriating indeed. Going back to the hints from the Discord there was a bit about changing the inputs, and as there isn’t much to change on the Hashcar command line which would cause it to get the wrong password (apart from maybe using the CPU/iGPU), I changed up the password list by just removing the offending password from the list to allow it to reach the end. After doing this and re-running the hash cracking, we obtain another password, gordiesneaky93, which when tried against the archive extracts the PCAP within. Without the hints given in the discord channel, I would have been totally stuck. A good lesson to be more patient!  I'll be looking into it to why the wrong password is cracked, but  I have a feeling it's something to do with how the hash of the 7Z is computed.
</p>

<p>
Extracting the 7Z archive, loading the capture, and taking the same approach as before conversations to internal address can be seen, potentially a lot more interesting than the previous capture. This traffic is also under TLS, which this time Wireshark has been able to successfully decrypt. When we follow the HTTP stream, we find that we can see some log in’s to a development portal, and the thing we want to see, the flag for stage two. Took much longer than I wanted but that’s sometimes the nature of these things.
</p>
<img src="/images/bsides19/plain_http.png">


<h2 id="Stage3"> <a> Stage Three </a> </h2>
<p>
The first check is trying to jump straight to the stage three URL, but the portal only shows an access denied message. This is no problem however as from the reconnaissance done in stage one, we know that we access the stage three admin panel through the admin page on stage one. It requires a username, and a password. Noticing that it looks like there is a typo in the password entered in the PCAP, ‘RisOfTheMachines’ the first username:password combination tried was admin and ‘RiseOfTheMachines’ as the password. This works  to an extend, providing us with an account disabled response. Trying the mis-typed password shows a Access Denied messages, giving an easy way of telling what account:password pairings are correct. Using BurpSuite to quickly test all the passwords against all the usernames (rather than assuming that the previous username:password pairings are correct), shows a nice ‘wiggle’ in the response size. After leaving to finish, sort by response size and see that there are three main groupings of responses. First; an access denied message, pretty boring, second,  an account disabled message, better but still not what we want, and finally, an access granted message, sadly no stage three flag though.
</p>
<img src="/images/bsides19/admin_login.PNG">

<p>
Returned is a plain text page, it sets a cookie called authorized, and a comment suggesting that the forward to a hash value is broken. Reversing this hash shows the word admin, so I assumed that it was a non-linked file or folder on the server. Using a quick bash one-liner to quickly test a word list for the potential url endpoints that the admin panel could be located, comprised of previously seen folders and files, commonly seen admin locations and words related to the challenge. After a while of getting nowhere, taking a step back and looking at the login response to see if there was anything of interest. One of the things which stands out is that the cookies ‘path’ value was not set for just the stage3 domain, but anything underneath the main ctf domain. Trying the same brute force against the other domains, nothing was returned agasin.  After a little break, it hit me, this CTF had been split across multiple subdomains, who says that it's just the stage one, two and three domains to look at. After a few seconds of another quick bash for loop, success, two domains found at ‘vault’ and 21232f297a57a5a743894a0e4a801fc3. 
</p>

<p>
Going straight to the ‘21’ domain show a message ‘bad Paramater’. Remembering that the previous stage set a cookie ‘authorized’ with the value of > md5(‘no’), we replay the request to the server with a ‘authorized’ cookie with the value of > md5(‘yes’), and with that we are greeted with the final flag, well a base 64 encoded final flag:
</p>
<img src="/images/bsides19/win.PNG">
<p>
Having already found the vault domain, we plug in the three previous flags and we are presented with our prize. The final flag which went sent into the lovey BSides admins gets a Ticket! In the end, I guess the stage one article content and large sections of commented text, the cat pictures from stage two, and second PCAP  are just distractions to try to derail the user from continuing on with the challenge and slow people down.
</p>
<p>
Overall this challenge was not too hard and not too easy, although I will admit that getting past extracting the PCAP from the 7Z took a bit longer than planned, and would have had me totally FooBar’d if it was not for the Dsicord  channel. Quite a fun little challenge really! Thanks again to Xeverus for hosting the challenge, and Bsides London for providing the reward for completing it. 
</p>

<!--

<h2 id=""> <a>   </a> </h2>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<img src="">
<pre> 
</pre>

<p>
</p>
<img src="">
<pre> 
</pre>

<p>
</p>
<img src="">
<pre> 
</pre>

<p>
</p>
<img src="">
<pre> 
</pre>

<p>
</p>
<img src="">
<pre> 
</pre> -->


<h2 id="TL;DR"> <a>  TL;DR </a> </h2>
<p>
If you are not interested in the waffle, and only want to know how to get over one step without spoilers for the rest. 
<ol>
<li>Decode the morse code to get to stage one</li>
<li>Enumerate the stage one site by crawling and looking into the source to find the admin page</li>
<li>Understand the JS presented, run the apply function to get the application code, then ROT13 to get the real code.</li>
<li>Find the stage two domain, Enumerate to find the comment about swapping to GitHub</li>
<li>Find the organisations git hub account. Linked from the stage one site.</li>
<li>Download the database. Look at the git commit history to get the password.</li>
<li>Use the credentials from the database to log into the FTP server using a client which ignores the broken internal address. Download all the files from the server.</li>
<li>Use the password in the “” file to get access to the PPTX</li>
<li>Extract / Open the XLS file. Unhide the Password Audit Tab. Use these passwords to get access to the SSL keys 7Z.</li>
<li>Extract the hash from the other 7Z and wash against the RockYou List. Remove the offending password from the list and re-run to get the real password</li>
<li>Apply the SSL keys to the extracted PCAP to get the access code, and a sample username and password for the stage three access portal.</li>
<li>Figure out the responses that the system can respond with by attempting to log in. Carry out a brute force on the admin panel to get the correct user:password combination.</li>
<li>Locate the admin portal at ‘’. Change the ‘authorised’ cookie from <pre>md5(‘no’)</pre> to <pre>md5(‘yes’)</pre>. </li>
<li>Visit the admin panel to get the stage three flag.</li>
<li>Locate the vault URL, submit all three flags to the vault. Retrieve your final flag!</li> 
<li>Write up how you did it 😉 </li>
<ol>
</p>


</div>
