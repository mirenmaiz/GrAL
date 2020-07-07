
#!/bin/bash


echo "Stream exekutazen..."


#core_list_s0=(0 4 8 12 14 10 6 2 20 24 28 30 26 22 18)
#core_list_s1=(1 5 9 13 15 11 7 3 21 25 29 31 27 23 19)

core_list_s0=(32 36 40 44 46 42 38 34 48 52 56 60 62 58 54 50)
core_list_s1=(33 37 41 45 47 43 39 35 49 53 57 61 63 59 55 51)



length=`echo "var=2^27;var*=$1;var" | bc`

gcc -O -mcmodel=large -DSTREAM_ARRAY_SIZE=${length} ../stream.c -o ../stream.bin

sleep 10
../rapl_logger.sh /usr/bin/sleep 10 > baseline-s$1.log

sleep 2

for i in ${core_list_s0[@]}; do
	../rapl_logger.sh ../allocator $i ../stream.bin > coreka_stream-$i-s$1.log
	sleep 2
done


for i in ${core_list_s1[@]}; do
	../rapl_logger.sh ../allocator $i ../stream.bin > coreka_stream-$i-s$1.log
	sleep 2
done

echo "Stream amaitu da"
