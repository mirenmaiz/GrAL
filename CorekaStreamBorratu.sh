#!/bin/bash


cd /home/tfg01/GrAL

echo stream emaitzak ezabatzen

rm baseline.txt

for i in $(seq 0 63); do
	rm CorekaStream$i.txt
done

echo amaituta
