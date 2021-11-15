#!/bin/bash
copylist=$( ls $1)
bkdirlist=$(ls $2)

for item in $bkdirlist
do
rm -r $2/$item
echo $(date) delete $2/$item>>logfile
done

for  item in  $copylist
do
cp -r $1$item $2/$item
echo $(date) copy $1$item $2/$item >>logfile

done
