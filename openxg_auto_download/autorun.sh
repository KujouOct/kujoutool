#!/bin/bash
jobtodo=(8      20      17      15      2       7       4       10      5       8       15      5       2       7       8       12      10      8       10      5       11      14      9       14      8       14      4       10      12      5       4       7       8       15      5       14      8       7       8       18      7       16      10      7       12      10      9       11      8       18      10      13      14      6       15      13      7       11      6       14      9       13      10      11      8       8       9       19      13      12      12      19      11      12      7       9       5       12      7       15      13      9       8       4       13      13      9       18      12      12      10      13      7       9       6       5       2       16      1       19)


today=$(date +%Y-%m-%d)
echo "Start running at $today"
echo "Gonna work for ${#jobtodo[*]} days..."
jobCount=0
daysPassed=0
while :
do
	now=$(date +%Y-%m-%d)
	echo "Today is $now"
	if [ $now == $today ]; then
		if [ $jobCount -lt ${jobtodo[$daysPassed]} ]; then 
			echo "Still have job to do bro, $jobCount / ${jobtodo[$daysPassed]}"
			sleep 1s
			./runme
			jobCount=$[$jobCount+1]
			sleep $[$RANDOM%10+20]m	
		else 
			echo "Today's job, done!"
			sleep 30m
		fi
	else 
		today=$now
		jobCount=0
		daysPassed=$[$daysPassed+1]
		echo "New day bro, gonna sleep to 8a.m. and then work, $daysPassed days have passed."
		sleep 480m		

	fi

done

