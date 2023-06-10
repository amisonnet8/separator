#!/usr/bin/env bash

rm -f *.svg *.html

cat << EOT > base.html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Bookmark Separator</title>
        <link rel="icon" href="__color__.svg" type="image/svg+xml">
        <link rel="stylesheet" type="text/css" href="style.css">
    <head>
    <body>
EOT

for i in "${@}"; do

cat << EOT > $i.svg
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
    <line x1="8" x2="8" y1="0" y2="16" style="stroke: $i"/>
</svg>
EOT

cat << EOT >> base.html
        <a href="$i.html">
            <img src="$i.svg" alt="" width="75" height="75">
        </a>
EOT

done

cat << EOT >> base.html
    </body>
</html>
EOT

for i in "${@}"; do
    sed "s/__color__/$i/g" base.html > $i.html
done

cp $1.html index.html
rm base.html
