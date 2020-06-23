#!/bin/bash

cd /home/tfg01/GrAL

echo basic_add_avx2 exekutazen

./rapl_logger.sh /usr/bin/sleep 10 > baseline.txt
sleep 2

for i in $(seq 0 63); do
	./rapl_logger.sh ./allocator $i ./basic_add_avx2.out >> Coreka_Avx2_$i.txt
	sleep 2 
done

echo amaitu da
