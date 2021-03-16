#!/bin/sh

#EJECUCIÓN
output=$(curl -s http://localhost:8080/api/v1/stress/$1/1/1 -w '\nTotal: %{time_total} \n')
exe=$(echo $output | grep -o '"total":*.*' | grep -o '"duration":*.*'| cut -d , -f 1 | cut -d : -f2)

#LLAMADA
call=$(echo $output | egrep -o 'Total: [0-9],[0-9]{6}' | cut -d " " -f2)

#OUTPUT
echo "Timepo de respuesta en secs: $call"
echo "Tiempo de ejecución: $(echo "$exe  * 1000" | bc | tr "." ",")"
echo "Tiempo de respuesta: $(echo "$( echo $call | tr "," ".") * 1000" | bc | tr "." ",")"

echo "\n$output"
