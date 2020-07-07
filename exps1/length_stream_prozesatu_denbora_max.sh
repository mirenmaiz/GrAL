
#!/bin/bash

core_list_s0=(0 4 8 12 14 10 6 2 16 20 24 28 30 26 22 18)
core_list_s1=(1 5 9 13 15 11 7 3 17 21 25 29 31 27 23 19)

m0=`cat baseline.log | grep "Recorded wall time" | cut -d ":" -f 2`
echo $m0


for l in 1 2 3 4 5 6 7 8; do
for i in 0; do
	p1=`cat coreka_stream-$i-l$l.log | grep "Recorded wall time" | cut -d ":" -f 2`
	echo $p1
done

for i in 1; do
	p1=`cat coreka_stream-$i-l$l.log | grep "Recorded wall time" | cut -d ":" -f 2`
	echo $p1
done
done
