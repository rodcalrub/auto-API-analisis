#!/bin/bash
i=1
value=1
while (( $value <= 22 ))
do
  echo "Probando con $i: " >> output-for.log
  echo "\n" >> output-for.log
  npx apipecker 1 $1 1 http://localhost:8080/api/v1/stress/1/$i/1 >> output-for.log
  #echo $i | wc -c
  i=$(echo "$i*10" | bc )
  value=$(echo $i | wc -c)
done

echo "Tiempo_Respuesta" >> localhost/test-$1/tiempos_respuesta.csv
cat output-for.log | grep '^  "mean": [0-9]' | cut -d ":" -f2|tr "." "," | sed 's/.$//' >> localhost/test-$1/tiempos_respuesta.csv
