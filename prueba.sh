i=1
while (( $i <= 10000000000000000000000 ))
do
  echo $i
  i=$(echo "$i*10" | bc )
  echo $i
done
