
#!/bin/bash


echo stream exekutazen

p1=`cat baseline.txt | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
p0=`cat baseline.txt | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
m1=`cat baseline.txt | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
m0=`cat baseline.txt | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`
echo $p0":"$p1":"$m0":"$m1 >> CoreMStream1.txt

 p1=`cat CoreMStream10.txt | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
 p0=`cat CoreMStream10.txt | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
 m1=`cat CoreMStream10.txt | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
 m0=`cat CoreMStream10.txt | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`

echo $p0":"$p1":"$m0":"$m1 >> CoreMStream1.txt

echo "pack1" >> CoreMStream1.txt
for i in {50..1000..50}; do
	p1=`cat CoreMStream$i.txt | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
	echo $p1 >> CoreMStream1.txt
done

echo "pack0" >> CoreMStream1.txt
for i in {50..1000..50}; do
	p0=`cat CoreMStream$i.txt | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
	echo $p0 >> CoreMStream1.txt
done

echo "DRAM 1" >> CoreMStream1.txt
for i in {50..1000..50}; do
	m1=`cat CoreMStream$i.txt | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
	echo $m1 >> CoreMStream1.txt
done

echo "DRAM 0" >> CoreMStream1.txt
for i in {50..1000..50}; do
	m0=`cat CoreMStream$i.txt | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`
	echo $m0 >> CoreMStream1.txt
done

echo "amaitu da"
