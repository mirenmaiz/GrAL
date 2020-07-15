
#!/bin/bash

core_list_s0=(0 4 8 12 14 10 6 2 20 24 28 30 26 22 18)
core_list_s1=(1 5 9 13 15 11 7 3 21 25 29 31 27 23 19)


for i in ${core_list_s0[@]}; do
	f0=`cat coreka_stream-$i-s$1.log | grep "Copy:" | cut -d ":" -f 2 | tr -s ' ' | cut -d " " -f 2`
	f1=`cat coreka_stream-$i-s$1.log | grep "Scale:" | cut -d ":" -f 2 | tr -s ' ' | cut -d " " -f 2`
	f2=`cat coreka_stream-$i-s$1.log | grep "Add:" | cut -d ":" -f 2 | tr -s ' ' | cut -d " " -f 2`
	f3=`cat coreka_stream-$i-s$1.log | grep "Triad:" | cut -d ":" -f 2 | tr -s ' ' | cut -d " " -f 2`
	echo $f0" "$f1" "$f2" "$f3
done

echo ''
for i in ${core_list_s1[@]}; do
	f0=`cat coreka_stream-$i-s$1.log | grep "Copy:" | cut -d ":" -f 2 | tr -s ' ' | cut -d " " -f 2`
	f1=`cat coreka_stream-$i-s$1.log | grep "Scale:" | cut -d ":" -f 2 | tr -s ' ' | cut -d " " -f 2`
	f2=`cat coreka_stream-$i-s$1.log | grep "Add:" | cut -d ":" -f 2 | tr -s ' ' | cut -d " " -f 2`
	f3=`cat coreka_stream-$i-s$1.log | grep "Triad:" | cut -d ":" -f 2 | tr -s ' ' | cut -d " " -f 2`
	echo $f0" "$f1" "$f2" "$f3
done



