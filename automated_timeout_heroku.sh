#!/bin/sh
#../DO1819
echo "Inserte el valor de numero de clientes: "
read nClientes
echo "Tiempo_Respuesta" >> heroku/test-$nClientes/tiempos_respuesta.csv
cat output-for.log | grep '^  "mean": [0-9]' | cut -d ":" -f2|tr "." "," | sed 's/.$//'    >> heroku/test-$nClientes/tiempos_respuesta.csv

bash tiempos_ejecucion_heroku.sh $nClientes
paste valores.csv heroku/test-$nClientes/tiempos_respuesta.csv heroku/test-$nClientes/tiempos_ejecucion.csv | awk '{print $1";"$2";"$3}' > heroku/test-$nClientes/heroku-$nClientes.csv
