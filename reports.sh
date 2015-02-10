#!/bin/sh
# Getting the page to a file
curl -o /var/www/html/mtt-test/index-orig.html http://www.met.ie/latest/reports.asp

# Replacing text
sed -e "s_"/images/met.ie-logo.gif"_"http://www.met.ie/images/met.ie-logo.gif"_g" index-orig.html > index.html
rm -rf /var/www/html/mtt-test/index-orig.html
