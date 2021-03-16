## EXPLICACIÓN DE PROCESO DE EXTRACCIÓN DE INFORMACIÓN

1- bucle-for-sh.sh: Ejecuta en un bucle el apipecker incrementando el valor de la variable * 10 >> salida a output-for.log 

2- media_de_ejecucion_nBins.sh: Con la salida de la API (npm start >> output.log), se ejecuta un bucle para obtener la suma de los tiempos de ejecución

3- cat output-loop.log | grep -e 'Probando' -e mean: cogemos únicamente el tiempo medio de cada prueba con diferentes valores de la variable 

Conclusión: obtenemos el tiempo de respuesta medio por llamada del apipecker y el tiempo de ejecución total de la API

EJECUCIÓN DE EJEMPLO:

1- npm start > ../automate-analisis/output.log & -> en segundo plano y te da el proceso para matarlo después
2- tiempos_respuesta.sh <n-clientes>
3- tiempos_ejecucion.sh <n-clientes>
4- paste valores.csv tiempos_respuesta.csv tiempos_ejecucion.csv | awk '{print $1";"$2";"$3}' > final.csv
