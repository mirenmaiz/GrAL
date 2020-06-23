#!/bin/bash

cd /home/tfg01/GrAL

echo basic_add_avx512 exekutazen

for i in $(seq 0 63); do
	./rapl_logger.sh ./allocator $i ./basic_add_avx512.out >> Coreka_Avx512$i.txt
done

echo amaitu da
