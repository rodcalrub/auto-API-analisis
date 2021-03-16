#!/bin/sh
count=1
suma=0
countParam=1
echo "Tiempo_Ejecucion" >> localhost/test-$1/tiempos_ejecucion.csv

for line in $(cat output.log | grep 'Tiempo' | cut -d " " -f7)
do
  #echo "Count vale $count, y tiene que llegar a $1"
  if [ $count -eq $1 ]
  then
    echo "Suma de tiempos de ejecución para $countParam parametros: $suma\n"
    echo  $suma | tr "." "," >> localhost/test-$1/tiempos_ejecucion.csv
    #echo "" >> tiempos.csv
    countParam=$(echo "$countParam * 10" | bc)
    count=0
    suma=0
  fi
  count=$[$count +1]
  suma=$(echo "$suma + $line" | bc )
 # echo "CountParam: $countParam"
  #if [ $countParam -eq -8446744073709551616 ]
  #then
  #  sumaUltima=$(echo "$sumaUltima + $line" | bc )
  #  echo $sumaUltima
  #fi
done
#echo  $sumaUltima | tr "." "," >> localhost/test-$1/tiempos_ejecucion.csv
