
#!/bin/bash


echo "Stream exekutazen..."


core_list_s0=(0 4 8 12 14 10 6 2 16 20 24 28 30 26 22 18)
core_list_s1=(1 5 9 13 15 11 7 3 17 21 25 29 31 27 23 19)



../rapl_logger.sh /usr/bin/sleep 10 > baseline.log

sleep 2

for l in 1 2 3 4 5 6 7 8; do

	length=`echo "var=2^27;var*=$l;var" | bc`

	gcc -O -mcmodel=large -DSTREAM_ARRAY_SIZE=${length} ../stream.c -o ../stream.bin

	sleep 2

	for i in 0; do
		../rapl_logger.sh ../allocator $i ../stream.bin > coreka_stream-$i-l$l.log
		sleep 2
	done


	for i in 1; do
		../rapl_logger.sh ../allocator $i ../stream.bin > coreka_stream-$i-l$l.log
		sleep 2
	done
done

echo "Stream amaitu da"
