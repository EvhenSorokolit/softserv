#!/bin/bash
copylist=$( ls $1)
bkdirlist=$(ls $2)

for item in $bkdirlist
do
rm -r $2/$item
echo $(date) Delete files from $2/$item>>/var/log/script.log
done

for  item in  $copylist
do
cp -r $1$item $2/$item
echo $(date) Copy $1$item to $2/$item >>/var/log/script.log

done
