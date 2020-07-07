
#!/bin/bash

#core_list_s0=(0 4 8 12 14 10 6 2 20 24 28 30 26 22 18)
#core_list_s1=(1 5 9 13 15 11 7 3 21 25 29 31 27 23 19)

core_list_s0=(32 36 40 44 46 42 38 34 48 52 56 60 62 58 54 50)
core_list_s1=(33 37 41 45 47 43 39 35 49 53 57 61 63 59 55 51)

p1=`cat baseline-s$1.log | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
p0=`cat baseline-s$1.log | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
m1=`cat baseline-s$1.log | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
m0=`cat baseline-s$1.log | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`
echo $p0":"$p1":"$m0":"$m1

for i in ${core_list_s0[@]}; do
	p1=`cat coreka_stream-$i-s$1.log | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
	p0=`cat coreka_stream-$i-s$1.log | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
	m1=`cat coreka_stream-$i-s$1.log | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
	m0=`cat coreka_stream-$i-s$1.log | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`
	echo $p0":"$p1":"$m0":"$m1
done

echo ''

for i in ${core_list_s1[@]}; do
	p1=`cat coreka_stream-$i-s$1.log | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
	p0=`cat coreka_stream-$i-s$1.log | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
	m1=`cat coreka_stream-$i-s$1.log | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
	m0=`cat coreka_stream-$i-s$1.log | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`
	echo $p0":"$p1":"$m0":"$m1
done

