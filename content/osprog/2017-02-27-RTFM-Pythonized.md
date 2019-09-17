+++
title = "rtfm.py : Read The Friggin Manual"
categories = "osprog"
date = 2017-02-27T22:53:09Z
tags = ["tools"]
+++

<div id="pagemenu">
<ol>
<li><a href="{{< perm >}}#Summary">Summary</a></li>
<li><a href="{{< perm >}}#idea">The Idea</a></li>
<li><a href="{{< perm >}}#thanks">The Thanks</a></li>
<li><a href="{{< perm >}}#program">The Program</a></li>
<li><a href="{{< perm >}}#helping">Adding to it</a></li>
<li><a href="{{< perm >}}#todo"> The TODO list</a></li>
</ol>
</div>

<div id="pagesummary">
<h2 id="Summary"> <a>Summary </a> </h2>
<p>
A simple Python program which aims to give you a database of helpfull commands, references, cheatsheets and tips in an indexed, easy to search format. You can search using one or more of; The command, Tags, URL references, author, date added, or, Comments to get the information you need. It also comes with an Updater, and multiple output formats to make it as handy as possible! <!--more-->
</p>
</div>

<div id="maincontent">
<h2 id="idea"> <a> The Idea </a> </h2>
<p>
RTFM is a great and useful book, BUT a bit pointless when you have to transcribe it, so this little program will aim to be the spiritual successor to it. Internally we had loads of text files which we would search with grep, but it was a bit of a pain picking out specific thing, or keeping a record of what came from where. Which is why i decided to write a small 'simple' (if not badly coded) cheat sheet application to keep all of the masses of reference information contained. 
<br>
<br>
I would recommend picking up a copy of the book from amazon, it is pretty handy to have! If you like this awesome sauce, if you dont, then er I can change honest :D! Let me know what needs fixing up, and I can look into it, Im expecting a few bugs in the code, and a few typo's in the database. If you really like it, transfer 1 bitcoin to me, you know you want to ... .
</p>

<h2 id="thanks"> <a> The Thanks </a> </h2>
<p>
There is nothing too special about this program, as at the end of the day its only acting as a central 'cheat sheet' and everything it does can be found allready in man pages. It just aims to be a bit quicker to look up common items. It should also be said that the real thanks goes to the people that spend the time to write documentation in the first place. I have tried to reference as many of the commands as possible to where they came from, but, as quite a few have been dragged from my bash history, it may not be perfect. Special thanks to people like <a href="https://www.coresecurity.com/corelabs-research/open-source-tools/impacket">CoreSecurity </a> for the impacket suite, Ben Clark for the RTFM and BTFM books, <a href="https://harmj0y.net/blog/">HarmJ0y</a> for the awsome blog and cheatsheets, <a href="http://pentestmonkey.net/category/blog">PenTestMonkey</a> again for the cheatsheets and <a href="https://highon.coffee/">HighOnCoffe</a> for the er cheatsheets! (See the theme there?) 
</p>

<p>
If you dont have a copy of RTFM, I would recomend picking it up, sometimes its nicer to have a paper copy of someting!
<br>
<br><a rel="nofollow" href="https://www.amazon.co.uk/gp/product/1494295504/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=1494295504&linkCode=as2&tag=necuritycouk-21">Rtfm: Red Team Field Manual</a><img src="http://ir-uk.amazon-adsystem.com/e/ir?t=necuritycouk-21&l=as2&o=2&a=1494295504" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></a> 
<br><a rel="nofollow" href="https://www.amazon.co.uk/gp/product/154101636X/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=154101636X&linkCode=as2&tag=necuritycouk-21">Blue Team Field Manual (BTFM) (RTFM)</a><img src="http://ir-uk.amazon-adsystem.com/e/ir?t=necuritycouk-21&l=as2&o=2&a=154101636X" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> </a>
<br>
The author also has a new book, the BTFM which is the same for the blue team. 
</p>
<h2 id="program"> <a> The Program </a> </h2>
<p>
The program itself is a simple <!-- Badly Written *cough* --> python program with SQLite DB, put what you want and it may spit out an answer. Aims to be quite simple to use. Grab it from <a href="https://github.com/leostat/rtfm">Github</a>!

{{< highlight bash >}}
 git clone https://github.com/leostat/rtfm.git /opt/rtfm/;  chmod +x /opt/rtfm/rtfm.py; /opt/rtfm/rtfm.py -u;
{{< /highlight >}}

So without further ado, here we go: 
{{< highlight bash >}}
19:26:root:snips: ./rtfm.py -h
Usage: rtfm.py [OPTIONS]

For when you just cant remember the syntax,  you should just RTFM

Options:
  --version             show program's version number and exit
  -h, --help            show this help message and exit
  --delete=DELETE       Delete specified ID
  -t TAG, --tag=TAG     Specify one or more tags to look for (a, b, c)
  -c CMD, --cmd=CMD     Specify a command to search (ls)
  -R REMARK, --remark=REMARK
                        Search the comments field
  -r REFER, --reference=REFER
                        Search for the reference [reference]
  -a AUTHOR, --author=AUTHOR
                        Search for author
  -A DATE, --added-on=DATE
                        Search by date, useful for when you want to commit
                        back!
  -p PRINTER, --print=PRINTER
                        Print Types : P(retty) p(astable) w(iki) h(tml) d(ump)
  -i INSERT, --insert=INSERT
                        Insert c(ommand) | t(ags) | r(eferances) |
                        E(verything)
  -D DUMP, --dump=DUMP  Just Dump information about
                        t(ags)|c(commands)|r(eferances)a(ll)
  -d, --debug           Display verbose processing details (default: False)
  -u, --update          Check for updates (default: false)
  -v                    Shows the current version number and the current DB
                        hash and exits

Example: rtfm.py -c rtfm -t linux -R help -r git -pP -d

21:58:root:snips: ./rtfm.py -v
rtfm: v0.9.8 (See References: They are the real writers! Program by Alex Innes : 2017) 
DB updates installed (Hash:URL) :
 ('773d3c7f79603e2ac499cdb1fbd59b923b07c050', 'https://raw.githubusercontent.com/leostat/rtfm/master/updates/1.txt')
 ('6afcf00bd49e063e0cffe442b7b636af29dd5b0b', 'https://raw.githubusercontent.com/leostat/rtfm/master/updates/2.txt')
 ('416ea2b52e3e142760a6ee6440e02f87faa2681f', 'https://raw.githubusercontent.com/leostat/rtfm/master/updates/3.txt')
 ('939f5573951de0644b6bb29b0219df8cd88f609b', 'https://raw.githubusercontent.com/leostat/rtfm/master/updates/4.txt')
 ('7c1bcfddc6096f64b97a658dd4dd495b961322b9', 'https://raw.githubusercontent.com/leostat/rtfm/master/updates/e1.txt')
 ('8a7589fcbb82e22adc16064a4390547d0c546db1', 'https://raw.githubusercontent.com/leostat/rtfm/master/updates/e2.txt')


{{< /highlight >}}
Its pretty much a simple search program, nothing too fancy, but then again, what else would you want? Examples include:

Search for the command rtfm
{{< highlight bash >}}
./rtfm.py -c rtfm

++++++++++++++++++++++++++++++
Command ID : 0
Command    : RTFM

Comment    : helpception
Tags       : Linux
Date Added : 2017-01-30
++++++++++++++++++++++++++++++
{{< /highlight >}}
Show us all windows commands with the term psexec
{{< highlight bash >}}./rtfm.py -t windows -c psexec{{< /highlight >}}

Show us all the current tags
{{< highlight bash >}}./rtfm.py -D t{{< /highlight >}}

Pull Updates to the DB
{{< highlight bash >}}./rtfm.py -u{{< /highlight >}}
 * Note: Seems to be buggy on NFS shares or VMWare shared folders. I may need to add a sleep to slow things down.

The updates are 'safe' in the form they won't write over your DB, git pull is not a safe update. You can move the DB to /etc/rtfm if you want to make sure you dont over-write the file!

Add a tag to the CMD
{{< highlight bash >}}./rtfm.py -i t{{< /highlight >}}

Insert commands into the db
{{< highlight bash >}}./rtfm.py -i E{{< /highlight >}}

On all of these, I have tried to add 'debug' calls '-d', just in case I screw up and break something.

There are also a number of output options, such as one which is nice for copy any paste : p, or a pretty table format : P. I am planning on adding a HTML output format to it also, as you never know someone may find it usefull. To use these, set the -p or --printer options when invoking the program. 'Pretty print' requires terminal tables:
{{< highlight bash>}}
23:15:root:snips: ./rtfm.py -c rtfm -p p
++++++++++++++++++++++++++++++
RTFM

helpception
++++++++++++++++++++++++++++++

23:15:root:snips: ./rtfm.py -c rtfm -p P
+-------------+-------------+
| Command ID  | 0           |
+-------------+-------------+
| Command     | RTFM        |
|             |             |
| Comment     | helpception |
| Tags        | Linux       |
| Date added  | 2017-01-30  |
+-------------+-------------+

23:15:root:snips: ./rtfm.py -c rtfm -pd
rtfm.py -c [command] -t [tag],[tag] -C [comment] -p P
Helpception, search for a command with two tags and a comment
Innes
EOC
linux
EOT
https://github.com/leostat/rtfm
https://necuity.co.uk/osprog/2017-02-27-RTFM-Pythonized/index.html
EOR

{{< /highlight >}}

As a little handy tip, I would recommend using something like this in your bashRC to make it even handier:
{{< highlight bash >}}
rtfm() {
   /opt/rtfm/rtfm.py -pP "$@"
   }

{{< /highlight >}}

Just makes a simple function so you can just do `rtfm -c psexec -t windows` without having to add the full command. Lazy but useful. 
</p>

<p>
There are a number of ways to search the DB, hopefully allowing you to quickly, and efficently find what you are looking for: 
{{< highlight bash >}}
 -c command
 -R comment
 -r reference
 -a author
 -A date (yyyy-mm-dd) or today/now
{{< /highlight >}}
All of these can be chained together, so you can look for a command added two weeks ago, by Innes, referencing the NSA, with a comment of code exection and  a command containing 'eternalblue' should you wish!
</p>

<p>
Should you wish to delete from the database, all you have to do is all --delete with the ID you want to remove. Simple
</p>
<h2 id="helping"> <a> Adding to it </a> </h2>
<p> 
Like all good cheatsheets it is possible to add your own content to the database. This is managed through the -i segment of the program. When adding commands you must add them with comments, references, and tags. Else at the moment, they will not be returned from the DB. Minor bug really. There are two main methods of adding commands to the database, Either in three steps adding all the commands you wish, Tag these commands up, then insert references. Or in one step (E), adding all commands, along with their tags and references. For the first method, call RTFM with '-i c', using an empty response to stop processing commands:
{{< highlight bash>}}
$ rtfm.py -i c
Enter your command    : Your Command
Enter you comment     : Your Comment 
Enter Author          : Your Name 
Enter your command    : Command Two 
Enter you comment     : Comment Two 
Enter Author          : Your Name 
Enter your command    : 
Enter you comment     : 
Enter Author          : 
[OK]: Added Rows : 2
[OK]: New Top ID : 491 | Number of CMD's Added : 2


{{< /highlight >}}
Next, add the required tags into the inserted with either '-i t', which adds tags to a single command, or '-i ta' which adds tags to all commands missing tags:
{{< highlight bash>}}
$ rtfm.py -i t
What CMD are we adding tags too? : 491
Enter a tag (blank for none) : Test
Enter a tag (blank for none) : Second Tag
Enter a tag (blank for none) : 
[OK]: Added tags
[OK]: Added a new tag and a tagmap
{{< /highlight >}}

Similarly , you now have to add referances to the commands you have just added, '-i r',
{{< highlight bash>}}
$ rtfm.py -i r
What CmdID are we adding refs to? : 491
Enter a reference (blank for non) : http://bing.com 
Enter a reference (blank for non) : 
[OK]: Added a new Ref and a refmap
{{< /highlight >}}

There is also a '-i ta' which adds tags to all commands which are missing them, this was used for the DB seeding more than anything!
{{< highlight bash>}}
$ rtfm: ./rtfm.py -i ta
[OK]: This tags everything without tags,  mainly for DB init
[OK]: Enter blank line to commit changes
[WARNING]: Number left :22
[OK]: Command ID : 467
[OK]:         Command    : Test Command
[OK]:         Comment    : My comment
[OK]: v These are known tags
 | linux |  | bash |  | text manipulation |  | cisco |  | networking |  | loop |  | pivoting |  | files |  | passwords |  | enumeration |  | user information |  | interesting |  | scanning |  | hp |  | brute |  | http |  | web application |  | XSS |  | cookies |  | metasploit |  | certificates |  | stealth |  | smb |  | MitM |  | dns |  | package management |  | reverse shells |  | Windows |  | perl |  | python |  | php |  | ruby |  | sql injection |  | mysql |  | shell |  | mssql |  | Oracle |  | users |  | wireless |  | wifi |  | configuration |  | av evasion |  | powershell |  | memory |  | impacket |  | filesystem |  | IIS |  | process management |  | privilege escalation |  | remote command shell |  | hashes |  | recon |  | cracking |  | nessus |  | subnets |  | packet capture |  | reference |  | web address |  | java |  | solaris |  | forensics |  | ldap |  | Anti Virus |  | GIT |  | interesting  |  | Cloud |  | RDP |  | shells |  | encyption |  | Test |  | Second Tag | 
 == == ONE TAG A LINE == == 

Enter a tag (blank for non) : 

{{< /highlight >}}

The second option is adding all things at once, this is done by using '-i  E', Insert everything, just work through the form and add a new command to your database.
{{< highlight bash>}}
$ rtfm.py -i E
Enter your command    : Command One
Enter you comment     : Comment One
Enter Author          : Author
Enter a tag (blank for end) : Tag
Enter a tag (blank for end) : 
Enter a reference (blank for end) : Reference
Enter a reference (blank for end) : 
[OK]: Added Rows :1
[OK]: Added a new tag and a tagmap
[OK]: Added a new Ref and a refmap
Enter your command    : ^C
{{< /highlight >}}

Once you are done, search for your command, and use the dump printer format to make it simple for me to place in an updates file. After this open a Git Pull! The program's quality is based on community submissions, and "hopefully" people will submit content back to the DB which can be pushed out to everyone.
</p>


<h2 id="update"> <a> Update Syntax </a> </h2>
At the moment there are two files which control updates, errata and updates. The errata syntax is as follows:
{{< highlight bash >}}
table we are fixing
column we are fixing
EOA (A delimiter)
the new content
column we are matching on
what we are matching on
column we are matching on
what we are matching on 
etc
{{< /highlight >}}

Updates take the form:
{{< highlight bash >}}
command
comment
author
EOC
Tags
For
The
Command
EOT
References
For
The
Command
EOR
{{< /highlight >}}



<h2 id="todo"> <a> Whats next </a> </h2>
<p> Lots really, program is still a work in progress!</p>
{{< highlight bash >}}
# The TODO  list
 * The 'important' functionality is present, but still lots of work to do

## Fixes:
 * Probably should use prepared statements everywhere, there are still some not using it: local so don't care really.
 * Check and warn the user on dupe tags
 * Re-jig the updater and the inserter

## Pipeline:
 * Create a HTML page                   : H
 * Template engine(autofill [vars])    : -A user=innes,pass=password,attacker=1.1.1.1,victim=2.2.2.2
 * Make code more sane and betterize the layout
## The far future
 * Fix typos, at somepoint
{{< /highlight >}}

So, let me know what you think! 
</div>
