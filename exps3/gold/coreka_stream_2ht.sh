
#!/bin/bash


echo "Stream exekutazen..."


core_list_s0=(0 4 8 12 14 10 6 2 16 20 24 28 30 26 22 18)
core_list_s1=(1 5 9 13 15 11 7 3 17 21 25 29 31 27 23 19)



length=`echo "var=2^27;var*=$1;var" | bc`

gcc -O -mcmodel=large -DSTREAM_ARRAY_SIZE=${length} ../stream.c -o ../stream.bin

sleep 10
../rapl_logger.sh /usr/bin/sleep 10 > baseline-s$1.log

sleep 2

for i in ${core_list_s0[@]}; do
	let j=$i+32
	../rapl_logger.sh ../allocator $i ../stream.bin $j ../stream.bin > coreka_stream-$i-$j-s$1.log
	sleep 2
done


for i in ${core_list_s1[@]}; do
	let j=$i+32
	../rapl_logger.sh ../allocator $i ../stream.bin $j ../stream.bin > coreka_stream-$i-$j-s$1.log
	sleep 2
done

echo "Stream amaitu da"
