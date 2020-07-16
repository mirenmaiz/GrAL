
#!/bin/bash

core_list_s0=(0 1 2 3 4 5 6 7 8 9)
core_list_s1=(10 11 12 13 14 15 16 17 18 19)


p0=`cat baseline-s$1.log | grep "Domain intel-rapl:0" | grep "package-0" | grep "energy" | cut -d ":" -f 3`
p1=`cat baseline-s$1.log | grep "Domain intel-rapl:1" | grep "package-1" | grep "energy" | cut -d ":" -f 3`
m0=`cat baseline-s$1.log | grep "Domain intel-rapl:0" | grep "dram" | grep "energy" | cut -d ":" -f 5`
m1=`cat baseline-s$1.log | grep "Domain intel-rapl:1" | grep "dram" | grep "energy" | cut -d ":" -f 5`
echo $p0":"$p1":"$m0":"$m1

for i in `seq 0 9`; do
        let j=($i+1)%10

	p0=`cat coreka_stream-${core_list_s0[$i]}-${core_list_s0[$j]}-s$1-p0.log | grep "Domain intel-rapl:0" | grep "package-0" | grep "energy" | cut -d ":" -f 3`
	p1=`cat coreka_stream-${core_list_s0[$i]}-${core_list_s0[$j]}-s$1-p0.log | grep "Domain intel-rapl:1" | grep "package-1" | grep "energy" | cut -d ":" -f 3`
	m0=`cat coreka_stream-${core_list_s0[$i]}-${core_list_s0[$j]}-s$1-p0.log | grep "Domain intel-rapl:0" | grep "dram" | grep "energy" | cut -d ":" -f 5`
	m1=`cat coreka_stream-${core_list_s0[$i]}-${core_list_s0[$j]}-s$1-p0.log | grep "Domain intel-rapl:1" | grep "dram" | grep "energy" | cut -d ":" -f 5`
	echo $p0":"$p1":"$m0":"$m1
done

echo ''

for i in `seq 0 9`; do
        let j=($i+1)%10

	p0=`cat coreka_stream-${core_list_s1[$i]}-${core_list_s1[$j]}-s$1-p0.log | grep "Domain intel-rapl:0" | grep "package-0" | grep "energy" | cut -d ":" -f 3`
	p1=`cat coreka_stream-${core_list_s1[$i]}-${core_list_s1[$j]}-s$1-p0.log | grep "Domain intel-rapl:1" | grep "package-1" | grep "energy" | cut -d ":" -f 3`
	m0=`cat coreka_stream-${core_list_s1[$i]}-${core_list_s1[$j]}-s$1-p0.log | grep "Domain intel-rapl:0" | grep "dram" | grep "energy" | cut -d ":" -f 5`
	m1=`cat coreka_stream-${core_list_s1[$i]}-${core_list_s1[$j]}-s$1-p0.log | grep "Domain intel-rapl:1" | grep "dram" | grep "energy" | cut -d ":" -f 5`
	echo $p0":"$p1":"$m0":"$m1
done


