
#!/bin/bash

cd /home/tfg01/GrAL

echo stream exekutazen

./rapl_logger.sh /usr/bin/sleep 10 > baseline.txt
sleep 2


./rapl_logger.sh ./allocator $1 ./stream.10 > CoreMStream10.txt
sleep 2

for i in {50..1000..50}; do
	echo $i
	./rapl_logger.sh ./allocator $1 ./stream.$i > CoreMStream$i.txt
	sleep 2
done


echo stream amaitu da
