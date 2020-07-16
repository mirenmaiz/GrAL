
#!/bin/bash


echo "Stream exekutazen..."


core_list_s0=(0 1 2 3 4 5 6 7 8 9)
core_list_s1=(10 11 12 13 14 15 16 17 18 19)


length=`echo "var=2^27;var*=$1;var" | bc`

gcc -O -mcmodel=large -DSTREAM_ARRAY_SIZE=${length} ../../stream.c -o ../../stream.bin

sleep 10
../../rapl_logger.sh /bin/sleep 10 > baseline-s$1.log

sleep 2

for i in ${core_list_s0[@]}; do
	let j=$i+10
	../../rapl_logger.sh ../../allocator $i ../../stream.bin $j ../../stream.bin > coreka_stream-$i-$j-s$1.log
	sleep 2
done


#for i in ${core_list_s1[@]}; do
#	let j=$i+32
#	../rapl_logger.sh ../allocator $i ../stream.bin $j ../stream.bin > coreka_stream-$i-$j-s$1.log
#	sleep 2
#done

echo "Stream amaitu da"
