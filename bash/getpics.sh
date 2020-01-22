#!/bin/bash
#
# this script puts some picture files into a Pictures directory in our home directory
# it does some error testing
# it summarizes the Pictures directory when it is done
#

# Task 1: Improve this script to also retrieve and install the files kept in the https://zonzorp.net/pics.tgz tarfile
#   - use the same kind of testing that is already in the script to only download the tarfile if you don't already have it and  to make sure the download and extraction commands work, then delete the local copy of the tarfile if the extraction was successful

###########################################################
# Make sure we have a picture directory.
#########################################################
# make a Pictures directory if we don't have one - assumes we have a home directory

test -d ~/Pictures || mkdir ~/Pictures

#####################################################
# Handle the Zip folder
###################################################

# download a zipfile of pictures to our Pictures directory if it isn't already there - assumes you are online
test -f ~/Pictures/pics.zip || wget -q -O ~/Pictures/pics.zip http://zonzorp.net/pics.zip

# unpack the downloaded zipfile if it is there, then delete the local copy of the zipfile
test -f ~/Pictures/pics.zip && cd ~/Pictures && unzip -q pics.zip -d ~/Pictures && rm ~/Pictures/pics.zip

##########################################################
# Handle the tarfile
########################################################
# download a tarfile of pictures to our Pictures directory if it isn't already there - assumes you are online
test -f ~/Pictures/pics.tgz || wget -q -O ~/Pictures/pics.tgz http://zonzorp.net/pics.tgz

# unpack the downloaded tarfile if it is there, then delete the local copy of the tarfile
test -f ~/Pictures/pics.tgz && cd ~/Pictures && tar -xzf pics.tgz && rm ~/Pictures/pics.tgz
# Make a report on what we have in the Pictures directory

test -d ~/Pictures && cat <<EOF
Found $(find ~/Pictures -type f|wc -l) files in the Pictures directory.
The Pictures directory uses $(du -sh ~/Pictures|awk '{print $1}') space on the disk.
EOF
