#!/bin/sh
echo "Inserte el valor de numero de clientes: "
read nClientes
echo "Tiempo_Respuesta" >> localhost/test-$nClientes/tiempos_respuesta.csv
cat output-for.log | grep '^  "mean": [0-9]' | cut -d ":" -f2|tr "." "," | sed 's/.$//'    >> localhost/test-$nClientes/tiempos_respuesta.csv

bash tiempos_ejecucion.sh $nClientes
paste valores.csv localhost/test-$nClientes/tiempos_respuesta.csv localhost/test-$nClientes/tiempos_ejecucion.csv | awk '{print $1";"$2";"$3}' > localhost/test-$nClientes/localhost-$nClientes.csv
