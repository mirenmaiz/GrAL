
#!/bin/bash

echo stream exekutazen

p1=`cat baseline.txt | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
p0=`cat baseline.txt | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
m1=`cat baseline.txt | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
m0=`cat baseline.txt | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`
echo $p0":"$p1":"$m0":"$m1 >> StreamCoreGuz.txt
	
for i in $(seq 0 63); do
	p1=`cat CoreGuzStream$i.txt | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
	p0=`cat CoreGuzStream$i.txt | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
	m1=`cat CoreGuzStream$i.txt | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
	m0=`cat CoreGuzStream$i.txt | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`
	echo $p0":"$p1":"$m0":"$m1 >> StreamCoreGuz.txt
done

echo amaitu da
