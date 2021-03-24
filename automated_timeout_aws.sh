#!/bin/sh
echo "Inserte el valor de numero de clientes: "
read nClientes
echo "Tiempo_Respuesta" >> aws/test-$nClientes/tiempos_respuesta.csv
cat output-for.log | grep '^  "mean": [0-9]' | cut -d ":" -f2|tr "." "," | sed 's/.$//' >> aws/test-$nClientes/tiempos_respuesta.csv

bash tiempos_ejecucion_aws.sh $nClientes
paste valores.csv aws/test-$nClientes/tiempos_respuesta.csv aws/test-$nClientes/tiempos_ejecucion.csv | awk '{print $1";"$2";"$3}' > aws/test-$nClientes/aws-$nClientes.csv
