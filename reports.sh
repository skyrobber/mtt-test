#!/bin/sh
# Getting the page to a file
curl -o /var/www/html/mtt-test/index-orig.html http://www.met.ie/latest/reports.asp

# Replacing text
sed -e "s_"/images/met.ie-logo.gif"_"http://www.met.ie/images/met.ie-logo.gif"_g" index-orig.html > index.html
rm -rf /var/www/html/mtt-test/index-orig.html

# Commit the changes locally
loc="/var/www/html/mtt-test"
cd $loc
git add .
git commit -m "Auto Update on `date`"

# Push the changes to github
git push origin master

