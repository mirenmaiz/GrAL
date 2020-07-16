
#!/bin/bash


echo "Stream exekutazen..."


core_list_s0=(0 1 2 3 4 5 6 7 8 9)
core_list_s1=(10 11 12 13 14 15 16 17 18 19)



../rapl_logger.sh /bin/sleep 10 > baseline.log

sleep 2

#for l in 1 4 8 12 16 20 24 28 32 36 40 44 48 52; do
for l in 44 48 52; do

	length=`echo "var=2^27;var*=$l;var" | bc`

	gcc -O -mcmodel=large -DSTREAM_ARRAY_SIZE=${length} ../stream.c -o ../stream.bin

	sleep 2

	for i in 0; do
		../rapl_logger.sh ../allocator $i ../stream.bin > coreka_stream-$i-l$l.log
		sleep 2
	done


	for i in 10; do
		../rapl_logger.sh ../allocator $i ../stream.bin > coreka_stream-$i-l$l.log
		sleep 2
	done
done

echo "Stream amaitu da"
