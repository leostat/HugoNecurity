#!/bin/bash
###
# Add Post Script - As im lazy!
# Author : Alexander Innes
###
while true; do
echo "What blog?"
read blog
if [[ ! -d ./content/$blog ]]; then
  echo "Blog not found - Make sure the folder exists"
  else
  break
  fi
done

while true; do 
echo "enter title"
read pre
if [[ $pre == "" ]]; then
   echo "Please enter a title"
   else
   break
   fi
done 


if [ "${#pre}" -gt 25 ] 
   then
   echo "Too long, Chose a Post Loc"
   read pre1
fi

if [[ "$pre1" == "" ]]; then
    sane=`echo "$pre" | sed s/" "/"-"/g`
    post=`date -u +"%Y-%m-%d"`-$sane.md
else
    sane=`echo "$pre1" | sed s/" "/"-"/g`
    post=`date -u +"%Y-%m-%d"`-$sane.md
fi

echo "Making post $post in blog $blog"

echo "Sure you want to? (y to continue)"
read choice
if [ "$choice" != 'y' ]; then 
   echo "Abort Abort : User Decline";
   exit 1
   fi

touch ./content/$blog/$post
cat <<EOF >> ./content/$blog/$post 
+++
title = "$title"
categories = "$blog"
date = `date -u +"%Y-%m-%dT%H:%M:%SZ"`
EOF

echo "Enter any tags below \"in\",\"this\",\"format\""
read tags
if [[ "$tags" != '' ]]; then
   cat <<EOF >>  ./content/$blog/$post
tags = [$tags]
EOF
fi

echo "Please enter a summary for this post (Leave blank for no summary)"
read summary


echo "Do you want to live this new post? (y)"
read live
if [ "$live" == 'y' ]; then
   echo "Post will be live"
   else # drop it into the drafts
   touch _in_progress
   echo "content/$blog/$post" >> ./_in_progress
   cat <<EOF >>  content/$blog/$post
draft=true
EOF
   fi

cat <<EOF >>  content/$blog/$post
+++

EOF

cat <<EOF>> content/$blog/$post
<div id="pagemenu">
<ol>
<li><a href="#Summary">Summary</a></li>
<li><a href="#"></a> </li>
<li><a href="#"></a></li>
<li><a href="#"></a></li>
<li><a href="#"></a></li>
<li><a href="#"></a> </li>
<li><a href="#"></a> </li>
</ol>
</div>

<div id="pagesummary">
<h2 id="Summary"> <a>Summary </a> </h2>
<p>
$summary <!--more-->
</p>
<p>
<!-- Continue the page summary-->
</p>
</div>
<div id="maincontent">
<h2 id=""> <a>   </a> </h2>
<p>
</p>
</div>
EOF

echo "Awsome - Opening for editing in 2"
sleep 2
vim content/$blog/$post +

echo "doneded - finish up the post!"
