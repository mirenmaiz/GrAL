
#!/bin/bash


echo "Stream exekutazen..."

s=1

core_list_s0=(0 1 2 3 4 5 6 7 8 9)
core_list_s1=(10 11 12 13 14 15 16 17 18 19)


length=`echo "var=2^27;var*=$s;var" | bc`

gcc -O -mcmodel=large -DSTREAM_ARRAY_SIZE=${length} ../../stream.c -o ../../stream.bin

sleep 10
../../rapl_logger.sh /bin/sleep 10 > baseline-s$s.log

sleep 2

#for i in ${core_list_s0[@]}; do
for i in `seq 0 9`; do 
	let j=($i+1)%10

	../../rapl_logger.sh ../../allocator ${core_list_s0[$i]} ../../stream.bin ${core_list_s0[$j]} ../../stream.bin > coreka_stream-${core_list_s0[$i]}-${core_list_s0[$j]}-s$s-p1.log
	sleep 2
done

for i in `seq 0 9`; do 
	let j=($i+1)%10
	../../rapl_logger.sh ../../allocator ${core_list_s1[$i]} ../../stream.bin ${core_list_s1[$j]} ../../stream.bin > coreka_stream-${core_list_s1[$i]}-${core_list_s1[$j]}-s$s-p1.log
	sleep 2
done


echo "Stream amaitu da"
