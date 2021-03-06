#!/bin/sh
# Getting the page to a file
loc="/var/www/html/mtt-test"
curl -o $loc/index-orig.html http://www.met.ie/latest/reports.asp

# Replacing text
sed -e "s_"/images/met.ie-logo.gif"_"http://www.met.ie/images/met.ie-logo.gif"_g" $loc/index-orig.html > $loc/index.html
rm -rf $loc/index-orig.html

# Commit the changes locally
cd $loc
git add .
git commit -m "Auto commit on `date`"

# Push to Github
# Account defined in ~/.netrc with 644 permission - this will auto update without prompting credentials
git push origin master
