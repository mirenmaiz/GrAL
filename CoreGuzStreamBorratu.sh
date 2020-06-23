#!/bin/bash


cd /home/tfg01/GrAL

echo stream emaitzak ezabatzen

for i in $(seq 0 63); do
	rm CoreGuzStream$i.txt
done

rm baseline.txt

echo amaituta
