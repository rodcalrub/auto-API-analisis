#!/bin/sh

rm output-for.log
echo "" > output-for.log
rm tiempos_*.csv
rm final.csv
echo "Borrados todos los output y csvs"
echo "Inserte el número de clientes a utilizar: "
read nClientes
mkdir heroku/test-$nClientes
bash tiempos_respuesta.sh $nClientes
echo "Ahora ejecutamos tiempos ejecucion"
bash tiempos_ejecucion.sh $nClientes
paste valores.csv heroku/test-$nClientes/tiempos_respuesta.csv heroku/test-$nClientes/tiempos_ejecucion.csv | awk '{print $1";"$2";"$3}' > heroku/test-$nClientes/localhost-$nClientes.csv


echo "Done"

