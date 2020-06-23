#!/bin/bash


cd /home/tfg01/GrAL

echo Asm ezabatzen

rm baseline.txt
for i in $(seq 0 63); do
	rm Coreka_Asm$i.txt
done
