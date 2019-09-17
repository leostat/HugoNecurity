---
title: "Authenticated SQL Injection In Users Ultra"
categories: "netsec"
tags: ["SQLI","Wordpress-Plugins","Vulnerabilities"]
date: "2015-04-18T10:00:00-05:00"
draft: false
---

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
A SQL Injection was discovered In the Users Ultra Wordpress Plugin (Upto version 1.4.95), in the user gallery section. <!--more-->
</p>
<p>
This vulnerability was patched in 1.4.96, users of users ultra should update there sites as soon as possible. The developer was notified on the 15/04/2015 and it was patched on the 16/04/2015. This can be exploited by non privileged but authenticated users. The gal_id parameter of the photos-files module was vulnerable.
</p>
</div>
<div id="maincontent">
<h2 id="Class"> <a> Classification / Timeline</a> </h2>
<p>
Classification: 
<table>
    <tbody><tr>
      <td class="title">Type</td>
      <td>SQLI</td>
    </tr>
      <tr>
        <td class="title">OWASP Top 10</td>
        <td><a target="_blank" href="https://www.owasp.org/index.php/Top_10_2013-A1-Injection">A1: Injection</a></td>
      </tr>
      <tr>
        <td class="title">CWE</td>
        <td><a target="_blank" href="https://cwe.mitre.org/data/definitions/89.html">CWE-89</a></td>
      </tr>
	  <tr>
        <td class="title">CVSS Score</td>
        <td><a target="_blank" href="https://nvd.nist.gov/cvss.cfm?calculator&version=2&vector=(AV:N/AC:L/Au:S/C:P/I:P/A:P)">6.5 Base, 5.4 Temporal</a></td>
      </tr>
	  <tr>
        <td class="title">CV/E-Number</td>
        <td>Non Assigned :( </td>
      </tr>
  </tbody></table>
  
Timeline:
  <table>
      <tbody><tr>
      <td class="title">Vendor Notified</td>
      <td>
         15-04-2015
      </td>
      <td class="title">Vendor Patch</td>
      <td>
          16-04-2015
      </td>	  
        <td class="title" title="The date the vulnerability was published publicly">Publicly Published</td>
        <td title="The date the vulnerability was published publicly">
          18-04-2015
        </td>
      </tr>
    <tr>
      <td class="title">Last Updated</td>
      <td>
          18-04-2015
      </td>
    </tr>
  </tbody></table>
</p>

<h2 id="Tech"> <a> Details </a> </h2>
<p>
The gal_id allowed users to supply excess SQL commands to affect the query to the back end datababse. There were two instances of this in the PHP file xoo.userultra.photos.php, the varible $user_id could also be injectable.		
{{< highlight php >}}

File : xooclasses/xoo.userultra.photos.php
        public function get_gallery ($gal_id) - 
            $photos = $wpdb->get_results( 'SELECT *  FROM ' . $wpdb->prefix . 'usersultra_galleries WHERE `gallery_id` = ' . $gal_id . ' ' );

        public function get_gallery_public ($gal_id, $user_id)
            $photos = $wpdb->get_results( 'SELECT *  FROM ' . $wpdb->prefix . 'usersultra_galleries WHERE `gallery_id` = ' . $gal_id . '  AND  `gallery_user_id` = ' . $user_id . '  ' );
{{< /highlight >}}

</p>
</div>
