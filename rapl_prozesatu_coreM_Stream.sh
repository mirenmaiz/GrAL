
#!/bin/bash


echo stream exekutazen

p1=`cat baseline.txt | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
p0=`cat baseline.txt | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
m1=`cat baseline.txt | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
m0=`cat baseline.txt | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`
echo $p0":"$p1":"$m0":"$m1 >> CoreMStream.txt

 p1=`cat CoreMStream10.txt | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
 p0=`cat CoreMStream10.txt | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
 m1=`cat CoreMStream10.txt | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
 m0=`cat CoreMStream10.txt | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`

echo $p0":"$p1":"$m0":"$m1 >> CoreMStream.txt

for i in {50..1000..50}; do
	p1=`cat CoreMStream$i.txt | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
	p0=`cat CoreMStream$i.txt | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
	m1=`cat CoreMStream$i.txt | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
	m0=`cat CoreMStream$i.txt | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`
	echo $p0":"$p1":"$m0":"$m1 >> CoreMStream.txt
done

