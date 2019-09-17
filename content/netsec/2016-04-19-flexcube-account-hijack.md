+++
title = " CVE-2016-0699 - Robbing Banks the Easy Way - Go in over the phonelines"
categories = "netsec"
date = 2016-04-19T07:18:07Z
tags = ["authentication","oracle","vulnerabilities"]
+++

<div id="pagemenu">
<ol>
<li><a href="{{< perm >}}#Summary">Summary</a></li>
<li><a href="{{< perm >}}#Class">Classification / Timeline</a> </li>
<li><a href="{{< perm >}}#Tech">Details</a></li>
</ol>
</div>

<div id="pagesummary">
<h2 id="Summary"> <a>Summary </a> </h2>
<p>
Due to a logic flaw in Oracle's FlexCube Direct Banking application, it was possible to enumerate usernames, and then reset said user password, and transaction pin, granting full access to the victim user's account. <!--more--> </p><p>This would have (and probably has) allowed for a malicious attacker to drain any account that is behind the application. To make things worse, this is a shockingly simple vulnerability, which should have been picked up by simple bounds testing before application release.
</p>
<p>
This vulnerability has been patched in the April 2016 CPU, users of the banking application should update their sites as soon as possible. The developer was notified in January 2016. Non-authenticated, remote users can exploit this.
</p>
</div>

<h2 id="class"> <a> Classification / Timeline </a> </h2>
<div style="float:left;width:44%">
<p>Classification:</p> 
<table class="cvet">
    <tbody><tr>
      <td class="title">Type</td>
      <td>Authentication</td>
    </tr>
      <tr>
        <td class="title">OWASP Top 10</td>
        <td><a target="_blank" href="https://www.owasp.org/index.php/Top_10_2013-A2-Broken_Authentication_and_Session_Management">A2: Broken Authentication and Session Management</a></td>
      </tr>
      <tr>
        <td class="title">CWE</td>
        <td><a target="_blank" href="https://cwe.mitre.org/data/definitions/640.html">CWE-640</a></td>
      </tr>
      <tr>
        <td class="title">CVSS Score</td>
        <td><a target="_blank" href="https://nvd.nist.gov/cvss.cfm?calculator&version=2&vector=(AV:N/AC:L/Au:S/C:P/I:P/A:P)">9.1</a></td>
      </tr>
      <tr>
        <td class="title">CV/E-Number</td>
        <td> CVE-2016-0699 </td>
      </tr>
  </tbody></table>
</div>

<div style="float:right;width:44%">
<p>Timeline: </p>
  <table class="timet">
      <tbody><tr>
      <td class="title">Vendor Notified</td>
      <td>
         29-01-2016
      </td>
      </tr><tr>
      <td class="title">Vendor Patch</td>
      <td>
          19-04-2016
      </td>    </tr><tr>  
        <td class="title" title="The date the vulnerability was published publicly">Publicly Published</td>
        <td title="The date the vulnerability was published publicly">
          19-04-2016
        </td>
      </tr>
    <tr>
      <td class="title">Last Updated</td>
      <td>
          19-04-2016
      </td>
    </tr>
  </tbody></table>
</div>
</div>
<div class="clearfix"> </div>

<h2 id="Tech"> <a> Details </a> </h2>
<p>
The banking application allows for users to reset their account user password, and account transaction password, through answering secret questions, such as the user's favourite colour, mother's maiden name, or place of birth. The first step in this process is providing the username. Depending on the configuration of the FlexCube application, this action also allows for user enumeration. Should the user exist on the system, the "secret" questions are displayed to the end user, else, a page stating that a password has been sent to the mobile number registered with the account. It is assumed that this is dependant on the configuration of the application, and if mobile two-factor authentication is enabled for accounts.  
</p>

<p>
Assuming that you are able to guess an account name, the attacker can then answer the questions to gain access to the account. The quality of the default questions is quite low, which is one way of gaining access. Below is the request sent to the application attempting a password reset:
</p>
{{< highlight bash >}}
idsequence=mPY%3D&fldAns=123&fldQuesAns=What+is+your+Date+of+birth%3F%7ESECURITY_QUESTION11%7E123&fldAns=123&fldQuesAns=What+is+your+favourite+Colour%3F%7ESECURITY_QUESTION1%7E123&fldtxnauthref=&fldRequestId=RRSQV02&fldSessionId=&fldDataId=&fldorgrequestid=RRFPW05&fldSessionId=&fldSectionId=RRFPW05&fldServiceType=TIA&fldtxnreferenceno=213790223026860&fldrefno=720909562026861&fldidchanneluser=victim&fldDeviceId=01&fldLangId=&__form_name__=frmmain
{{< /highlight>}}

<p> 
However, due to the logic flaw, if an attacker intercepts this request and then submits this without the questions, like so:
</p>

{{< highlight bash >}}
idsequence=MmPY%3D&fldtxnauthref=&fldRequestId=RRSQV02&fldSessionId=&fldDataId=&fldorgrequestid=RRFPW05&fldSessionId=&fldSectionId=RRFPW05&fldServiceType=TIA&fldtxnreferenceno=213790223026860&fldrefno=720909562026861&fldidchanneluser=victim&fldDeviceId=01&fldLangId=&__form_name__=frmmain
{{< /highlight >}}

<p>
The application displays the password reset dialogue. At which point, the attacker can change the victim users account password, as well as the victims transaction password. Which is all you need to go around emptying all the accounts, from all the banks, which use Oracle Flexcube Direct Banking. 
</p>

<p>
The initial attempt at patching this was only a partial fix, the application now requested that two answers had to be provided. However, an attacker could specify the same answer twice, say, for example, a user's favourite colour (red anyone?), and this was accepted as the two required answers.
</p>

<p>
This sort of flaw is simple enough to test for, and should have been picked up with normal bounds testing before product release. It makes you wonder how many more of these simple logic flaws exist within an application that controls a few million of any given currency! 
</p>

<p>
As a footnote, if you don't get the title, shame on you. Watch SwordFish; it is an accurate depiction of how hacking and encryption works. (Or not).
</p>
