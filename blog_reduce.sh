#!/bin/bash
echo "This will resize all jpg images in the current directory to 30% of the original size with a quality of 50%."

for i in *.[jJ][pP][gG]; 
do 
  convert "$i" -resize 70% -quality 70 "${i%%.jpg*}_small.jpg"; 
  echo "resized image for $i created." ;
done

for i in *.[pP][nN][gG]; 
do 
  convert "$i" -resize 70% -quality 70 "${i%%.png*}_small.png"; 
  echo "resized image for $i created." ;
done
