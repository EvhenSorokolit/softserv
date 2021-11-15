#!/bin/bash
if [ $# -eq 1 ] ;
then
	echo "===================Most reques ip==============================="
	cat $1  | awk '{print $1}' |sort | uniq -c |sort -rnk1 | head -1

	echo "===================Most reques page============================="
	cat $1 | awk '{print $7}' | sort | uniq -c | sort -rn | head -1

	echo "===========How many requests were there from each ip?==========="

	cat $1  | awk '{print $1}' |sort | uniq -c |sort -rnk1 

	echo "========What non-existent pages were clients referred to?======="

	cat $1 | awk '{print $9,$7 }' | grep  -e '^302$' -e '^404$'

	echo "===========What time did site get the most requests?============"	

	cat $1 | awk -F: '{print  $2,$3'} |sort | uniq -c | sort -rnk1 |head -1 | awk '{print $2":"$3}'


	echo "=======What search bots have accessed the site? (UA + IP)======="
	cat $1 | grep  -i bot |awk  '{print $(NF-1),$1}'|sort| uniq
else
	echo "You must transfer the file as an arguement: ./script_b.sh somefile"
fi



