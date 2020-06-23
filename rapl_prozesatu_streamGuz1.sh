
#!/bin/bash

echo stream exekutazen

p1=`cat baseline.txt | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
p0=`cat baseline.txt | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
m1=`cat baseline.txt | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
m0=`cat baseline.txt | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`
echo $p0":"$p1":"$m0":"$m1 >> StreamCoreGuz1.txt
	
echo "pak1" >> StreamCoreGuz1.txt
for i in $(seq 0 63); do
	p1=`cat CoreGuzStream$i.txt | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
	echo $p1 >> StreamCoreGuz1.txt
done

echo "pak0" >> StreamCoreGuz1.txt
for i in $(seq 0 63); do
	p0=`cat CoreGuzStream$i.txt | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
	echo $p0 >> StreamCoreGuz1.txt
done

echo "dram1" >> StreamCoreGuz1.txt
for i in $(seq 0 63); do
	m1=`cat CoreGuzStream$i.txt | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
	echo $m1 >> StreamCoreGuz1.txt
done

echo "dram0" >> StreamCoreGuz1.txt
for i in $(seq 0 63); do
	m0=`cat CoreGuzStream$i.txt | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`
	echo $m0 >> StreamCoreGuz1.txt
done

echo amaitu da
