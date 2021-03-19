#!/bin/sh

#Problema: no se consigue acanzar el valor completo, por lo que se realiza la suma en base al index

count=0
suma=0
countParam=1
echo $countParam | wc -c
echo "Tiempo_Ejecucion" > heroku/test-$1/tiempos_ejecucion.csv
for line in $( cat output.log | grep 'Tiempo' | cut -d " " -f9)
do
  index=$(echo $countParam | tr -c -d 0-9 | wc -c)
  echo "Valor de $countParam: $line, con index: $index" 
  echo "Count vale $count, y tiene que llegar a $1"
  suma=$(echo "$suma + $line" | bc )
  count=$[$count +1]
  if [ $count -eq $(echo "$1 - 1" | bc) ]
  then
    #suma=$(echo "$suma + $line" | bc )
    echo "Suma de tiempos de ejecución para $countParam parametros: $suma\n" 
    echo  $suma | tr "." "," >> heroku/test-$1/tiempos_ejecucion.csv
    countParam=$(echo "$countParam * 10" | bc)
    count=0
    suma=0
  fi
  #count=$[$count +1]
done
