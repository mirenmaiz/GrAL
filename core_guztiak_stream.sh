
#!/bin/bash


echo stream exekutazen

./rapl_logger.sh /usr/bin/sleep 10 > baseline.txt
sleep 2

for i in {0..62..2}; do
	prog="./stream.10M "
	cmd="./rapl_logger.sh ./allocator "
	j=0
	let z=$i+1
	while [ $j -lt $z ]; do
		cmd+="$j $prog"
		let j=j+2
	done
	$cmd > CoreGuzStream$i.txt
	sleep 2
done
for i in {1..63..2}; do
	prog="./stream.10M "
	cmd="./rapl_logger.sh ./allocator "
	for j in {0..62..2}; do
		cmd+="$j $prog"
	done
	let y=$i+1
	u=1
	while [ $u -lt $y ]; do
		cmd+="$u $prog"
		let u=u+2
	done
	$cmd > CoreGuzStream$i.txt
	sleep 2
done

echo stream amaitu da
