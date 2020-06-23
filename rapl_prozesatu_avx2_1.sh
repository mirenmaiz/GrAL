
#!/bin/bash


echo avx2 exekutazen

p1=`cat baseline.txt | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
p0=`cat baseline.txt | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
m1=`cat baseline.txt | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
m0=`cat baseline.txt | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`
echo $p0":"$p1":"$m0":"$m1 >> Avx2Coreka1.txt
	
echo "pack-1 " >> Avx2Coreka1.txt
for i in $(seq 0 63); do
	p1=`cat Coreka_Avx2_$i.txt | grep "Domain intel-rapl:0" | grep "package-1" | grep "power" | cut -d ":" -f 3`
	echo $p1 >> Avx2Coreka1.txt
done

echo "pack-0 " >>Avx2Coreka1.txt
for i in $(seq 0 63); do
	p0=`cat Coreka_Avx2_$i.txt | grep "Domain intel-rapl:1" | grep "package-0" | grep "power" | cut -d ":" -f 3`
	echo $p0 >> Avx2Coreka1.txt
done

echo "dram-1" >> Avx2Coreka1.txt
for i in $(seq 0 63); do
	m1=`cat Coreka_Avx2_$i.txt | grep "Domain intel-rapl:0" | grep "dram" | grep "power" | cut -d ":" -f 5`
	echo $m1 >> Avx2Coreka1.txt
done

echo "dram-0" >>Avx2Coreka1.txt
for i in $(seq 0 63); do
	m0=`cat Coreka_Avx2_$i.txt | grep "Domain intel-rapl:1" | grep "dram" | grep "power" | cut -d ":" -f 5`
	echo $m0 >> Avx2Coreka1.txt
done

echo Amaitu da

