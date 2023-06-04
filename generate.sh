#!/usr/bin/env bash

rm -f *.svg *.html

cat << EOT > index.html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Bookmark Separator</title>
        <link rel="icon" href="$1.svg" type="image/svg+xml">
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

cat << EOT > $i.html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>$i</title>
        <link rel="icon" href="$i.svg" type="image/svg+xml">
    </head>
    <body>
        <a href="index.html">Bookmark Separator</a>
    </body>
</html>
EOT

cat << EOT >> index.html
        <a href="$i.html">
            <img src="$i.svg" alt="" width="75" height="75">
        </a>
EOT

done

cat << EOT >> index.html
    </body>
</html>
EOT
