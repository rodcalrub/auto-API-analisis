#!/bin/sh

rm output-for.log
echo "" > output-for.log
rm tiempos_*.csv
rm final.csv
echo "Borrados todos los output y csvs"
echo "Inserte el número de clientes a utilizar: "
read nClientes
mkdir aws
mkdir aws/test-$nClientes
bash tiempos_respuesta_aws.sh $nClientes
echo "Ahora ejecutamos tiempos ejecucion"
bash tiempos_ejecucion_aws.sh $nClientes
paste valores.csv aws/test-$nClientes/tiempos_respuesta.csv aws/test-$nClientes/tiempos_ejecucion.csv | awk '{print $1";"$2";"$3}' > aws/test-$nClientes/aws-$nClientes.csv


echo "Done"

