#!/bin/bash
for (( i=1; $i<=1000000000000000000000; i=i*10 ))
do
  echo "Probando con $i: " >> output-for.log
  echo "\n" >> output-for.log
  npx apipecker 1 $1 1 http://localhost:8080/api/v1/stress/1/$i/1 >> output-for.log 
done

echo "Tiempo_Respuesta" >> tiempos_respuesta.csv
cat output-for.log | grep '^  "mean": [0-9]' | cut -d ":" -f2|tr "." "," | sed 's/.$//' >> tiempos_respuesta.csv
