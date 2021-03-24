#!/bin/bash
i=1
value=1
while (( $value <= 22 ))
do
  echo "Probando con $i: " >> output-for.log
  echo "Probando con $i"
  echo "\n" >> output-for.log
  npx apipecker 1 $1 1 http://ec2-52-50-175-37.eu-west-1.compute.amazonaws.com/api/v1/stress/$i/1/1 >> output-for.log
  #echo "Acabando de probar con $i"
  i=$(echo "$i*10" | bc )
  value=$(echo $i | wc -c)
done

echo "Tiempo_Respuesta" > aws/test-$1/tiempos_respuesta.csv
cat output-for.log | grep '^  "mean": [0-9]' | cut -d ":" -f2|tr "." "," | sed 's/.$//' >> aws/test-$1/tiempos_respuesta.csv
