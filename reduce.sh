#!/bin/bash
echo "This will resize all jpg images in the current directory to 30% of the original size with a quality of 50%."

mkdir -p small

for i in *.[jJ][pP][gG]; 
do 
  convert "$i" -resize 30% -quality 50 "small/${i%%.jpg*}_small.jpg"; 
  echo "resized image for $i created." ;
done
