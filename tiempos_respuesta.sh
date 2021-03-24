#!/bin/bash
i=1
value=1
while (( $value <= 22 ))
do
  echo "Probando con $i: " >> output-for.log
  echo "Probando con $i"
  echo "\n" >> output-for.log
  npx apipecker 1 $1 1 http://ec2-34-248-34-10.eu-west-1.compute.amazonaws.com/api/v1/stress/1/1/$i >> output-for.log
  #echo "Acabando de probar con $i"
  i=$(echo "$i*10" | bc )
  value=$(echo $i | wc -c)
done

echo "Tiempo_Respuesta" > heroku/test-$1/tiempos_respuesta.csv
cat output-for.log | grep '^  "mean": [0-9]' | cut -d ":" -f2|tr "." "," | sed 's/.$//' >> heroku/test-$1/tiempos_respuesta.csv
