#!/bin/bash
#for (( i=1; $i<=10000000000000000000000; i=$(echo "$i*10" | bc )))
#do
#  echo $(echo $i | bc)
#  echo $i
#  echo "Probando con $i: " >> output-for.log
#  echo "\n" >> output-for.log
#  npx apipecker 1 $1 1 http://localhost:8080/api/v1/stress/1/$i/1 >> output-for.log 
#done
i=1
while (( $i <= 10000000000000000000000 ))
do
  echo "Probando con $i: " >> output-for.log
  echo "\n" >> output-for.log
  npx apipecker 1 $1 1 http://localhost:8080/api/v1/stress/1/$i/1 >> output-for.log
  i=$(echo "$i*10" | bc )
done

echo "Tiempo_Respuesta" >> localhost/test-$1/tiempos_respuesta.csv
cat output-for.log | grep '^  "mean": [0-9]' | cut -d ":" -f2|tr "." "," | sed 's/.$//' >> localhost/test-$1/tiempos_respuesta.csv
