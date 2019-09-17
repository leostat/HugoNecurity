+++
title = "Mounting this, that and everything else in Kali"
categories = "osprog"
date = 2016-04-09T09:26:46Z
tags = ["virtualisation","tools"]
+++

<div id="pagemenu">
<ol>
<li><a href="{{< perm >}}#Summary">Summary</a></li>
<li><a href="{{< perm >}}#xva">Mounting Xen .xva archive</a></li>
<li><a href="{{< perm >}}#vdi">Mounting Virtualbox .vdi files</a></li>
<li><a href="{{< perm >}}#lvm">Mounting drives with LVM partition tables</a></li>
<li><a href="{{< perm >}}#efs">Mounting Ubuntu encrypted home folders EcryptFS</a></li>
</ol>
</div>

<div id="pagesummary">
<h2 id="Summary"> <a>Summary </a> </h2>
<p>
I always come across contain files such as VHD's, OVA's, XVA's and IMG's during tests, and I always forget the exact procedure for converting, and then mounting them in Nix. I will update this over time with mounting different file types encountered. This post will be updated over time whenever I need to mount something new.<!--more-->
</p>
</div>

<div id="maincontent">

<h2 id="xva"> <a> Mounting Xen .xva archive  </a> </h2>
<p>
Xen XVA files are tar archives consisting of an XML file which describes the disk and a "Ref_XX" folder, which contains 1MB chunks of the disk. The process is; extract the archive, convert the archive to an img (smoosh the ref), list the partitions, mount the partitions.
{{< highlight bash >}}
wget https://necurity.co.uk/scripts/xenmigrate.py
python xenmigrate.py -c ./Ref_7 image.img
file image.img 
fdisk -l image.img 
{{< /highlight >}}
</p>

<h2 id="vdi"><a> Mounting Virtualbox .vdi files </a></h2>
<p>
This is done through a kernel module, NBD (net block device?), and qemu. After this either mount the parts from fdisk, or mount the LVM. 
{{< highlight bash >}}
$ modprobe nbd  max_part=16
$ qemu-nbd -c /dev/nbd0
$ fdisk -l /dev/nbd0 
{{< /highlight >}}
</p>

<!--
<h2 id=""><a>   </a></h2>
<p>
</p>
-->

<h2 id="lvm"><a> Mounting Drives with LVM partition tables</a></h2>
<p>
LVM is not an image, before any of you start, but to mount them, set up a loop interface, map the partitions in the LVM, scan for groups, mount said groups, unmount *ALL* LVM groups, teardown the loop.
{{< highlight bash >}}
# Mount the stuff
$ losetup /dev/loop0 image.img 
$ kpartx -a /dev/loop0
$ vgscan
$ vgchange -ay changethishostname-vg
$ mount /dev/changethishostname-vg/root mnt/

# Unmount the stuff
$ dmsetup remove_all
$ losetup -d /dev/loop0
{{< /highlight >}}
</p>

<h2 id="efs"> <a> Mounting Ubuntu encrypted home folders : EcryptFS  </a> </h2>
<p>
EcryptFS is Ubuntu's way of protecting user home directories. However, the strength of this (I understand) is solely based on the user's local login password. This is due to the pass-phrase being stored in an encrypted format, which the key to decrypt this is the user login password. As the users home directory is the *ONLY* thing that is encrypted if the user has not selected full disk encryption during install, an attacker can read /etc/shadow, break the users password, read the passphrase, and then mount the system.

{{< highlight bash >}}
$ cd mnt/home/.ecryptfs/victim/.ecryptfs/
$ for i in a c e; do printf "%s" $i | ecryptfs-unwrap-passphrase .ecryptfs/victim/.ecryptfs/wrapped-passphrase -; done
  # snip
  Error: Unwrapping passphrase failed [-5]
  Info: Check the system log for more information from libecryptfs
  64597a9539b644185e42bbbc9e9fe26b
$ ecryptfs-add-passphrase --fnek 
  Passphrase: 64597a9539b644185e42bbbc9e9fe26b 
  Inserted auth tok with sig [e42bbd5a189d90ea] into the user session keyring
  Inserted auth tok with sig [faa749e796daea5e] into the user session keyring
$ mount -t ecryptfs .ecryptfs/victim/.Private/ test/
  Select key type to use for newly created files: 
   1) tspi
   2) passphrase
  Selection: 2
  Passphrase: 
  Select cipher: 
   1) aes: blocksize = 16; min keysize = 16; max keysize = 32
   2) blowfish: blocksize = 8; min keysize = 16; max keysize = 56
   3) des3_ede: blocksize = 8; min keysize = 24; max keysize = 24
   4) twofish: blocksize = 16; min keysize = 16; max keysize = 32
   5) cast6: blocksize = 16; min keysize = 16; max keysize = 32
   6) cast5: blocksize = 8; min keysize = 5; max keysize = 16
  Selection [aes]: 
  Select key bytes: 
   1) 16
   2) 32
   3) 24
  Selection [16]: 
  Enable plaintext passthrough (y/n) [n]:  
  Enable filename encryption (y/n) [n]: y
  Filename Encryption Key (FNEK) Signature [e42bbd5a189d90ea]: faa749e796daea5e
  Attempting to mount with the following options:
    ecryptfs_unlink_sigs
    ecryptfs_fnek_sig=faa749e796daea5e
    ecryptfs_key_bytes=16
    ecryptfs_cipher=aes
    ecryptfs_sig=e42bbd5a189d90ea
  Mounted eCryptfs
$ ls -la test/
  total 72
  drwx------ 2 user inetsim 4096 Apr  9 19:46 .
  drwxr-xr-x 5 root root    4096 Apr  9 20:16 ..
  -rw-r--r-- 1 user inetsim  220 Apr  9 19:46 .bash_logout
  -rw-r--r-- 1 user inetsim 3637 Apr  9 19:46 .bashrc
  lrwxrwxrwx 1 user inetsim   32 Apr  9 19:46 .ecryptfs -> /home/.ecryptfs/victim/.ecryptfs
  -rw-r--r-- 1 user inetsim 8980 Apr  9 19:46 examples.desktop
  lrwxrwxrwx 1 user inetsim   31 Apr  9 19:46 .Private -> /home/.ecryptfs/victim/.Private
  -rw-r--r-- 1 user inetsim  675 Apr  9 19:46 .profile
{{< /highlight >}}
</p>
</div>
