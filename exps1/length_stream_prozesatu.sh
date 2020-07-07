
#!/bin/bash

core_list_s0=(0 4 8 12 14 10 6 2 16 20 24 28 30 26 22 18)
core_list_s1=(1 5 9 13 15 11 7 3 17 21 25 29 31 27 23 19)

p1=`cat baseline.log | grep "Domain intel-rapl:0" | grep "package-1" | grep "energy" | cut -d ":" -f 3`
p0=`cat baseline.log | grep "Domain intel-rapl:1" | grep "package-0" | grep "energy" | cut -d ":" -f 3`
m1=`cat baseline.log | grep "Domain intel-rapl:0" | grep "dram" | grep "energy" | cut -d ":" -f 5`
m0=`cat baseline.log | grep "Domain intel-rapl:1" | grep "dram" | grep "energy" | cut -d ":" -f 5`
echo $p0":"$p1":"$m0":"$m1


for l in 1 2 3 4 5 6 7 8; do
for i in 0; do
	p1=`cat coreka_stream-$i-l$l.log | grep "Domain intel-rapl:0" | grep "package-1" | grep "energy" | cut -d ":" -f 3`
	p0=`cat coreka_stream-$i-l$l.log | grep "Domain intel-rapl:1" | grep "package-0" | grep "energy" | cut -d ":" -f 3`
	m1=`cat coreka_stream-$i-l$l.log | grep "Domain intel-rapl:0" | grep "dram" | grep "energy" | cut -d ":" -f 5`
	m0=`cat coreka_stream-$i-l$l.log | grep "Domain intel-rapl:1" | grep "dram" | grep "energy" | cut -d ":" -f 5`
	echo $p0":"$p1":"$m0":"$m1
done

for i in 1; do
	p1=`cat coreka_stream-$i-l$l.log | grep "Domain intel-rapl:0" | grep "package-1" | grep "energy" | cut -d ":" -f 3`
	p0=`cat coreka_stream-$i-l$l.log | grep "Domain intel-rapl:1" | grep "package-0" | grep "energy" | cut -d ":" -f 3`
	m1=`cat coreka_stream-$i-l$l.log | grep "Domain intel-rapl:0" | grep "dram" | grep "energy" | cut -d ":" -f 5`
	m0=`cat coreka_stream-$i-l$l.log | grep "Domain intel-rapl:1" | grep "dram" | grep "energy" | cut -d ":" -f 5`
	echo $p0":"$p1":"$m0":"$m1
done
done
