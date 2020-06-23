
#!/bin/bash


echo stream exekutazen

./rapl_logger.sh /usr/bin/sleep 10 > baseline.txt
sleep 2

for i in $(seq 0 63); do
	./rapl_logger.sh ./allocator $i ./stream.100M > CorekaStream$i.txt
	sleep 2
done

echo stream amaitu da
