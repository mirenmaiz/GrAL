#!/bin/bash


cd /home/tfg01/GrAL

echo Avx2 ezabatzen

rm baseline.txt

for i in $(seq 0 63); do
	rm Coreka_Avx2_$i.txt
done
