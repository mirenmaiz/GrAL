
#!/bin/bash

core_list_s0=(0 1 2 3 4 5 6 7 8 9)
core_list_s1=(10 11 12 13 14 15 16 17 18 19)

m0=`cat baseline-s$1.log | grep "Recorded wall time" | cut -d ":" -f 2`
echo $m0


for i in `seq 0 9`; do
        let j=($i+1)%10
	p1=`cat coreka_stream-${core_list_s0[$i]}-${core_list_s0[$j]}-s$1-pinter.log | grep "Recorded wall time" | cut -d ":" -f 2`
	echo $p1
done

for i in `seq 0 9`; do
        let j=($i+1)%10
	p1=`cat coreka_stream-${core_list_s1[$i]}-${core_list_s1[$j]}-s$1-pinter.log | grep "Recorded wall time" | cut -d ":" -f 2`
	echo $p1
done
