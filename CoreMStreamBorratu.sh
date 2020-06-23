#!/bin/bash


cd /home/tfg01/GrAL

echo stream emaitzak ezabatzen

rm baseline.txt

rm CoreMStream10.txt

for i in {50..1000..50}; do
	rm CoreMStream$i.txt
done

echo amaituta
