# auto-API-analisis
## EXPLICACIÓN DE PROCESO DE EXTRACCIÓN DE INFORMACIÓN

1- npm start > ../automate-analisis/output.log

2- automated.sh: Ejecuta en un bucle el apipecker incrementando el valor de la variable * 10 >> salida a output-for.log 

Conclusión: obtenemos el tiempo de respuesta medio por llamada del apipecker y el tiempo de ejecución total de la API

EJECUCIÓN DE EJEMPLO:

1- npm start > ../automate-analisis/output.log & -> en segundo plano y te da el proceso para matarlo después
2- tiempos_respuesta.sh <n-clientes>
3- tiempos_ejecucion.sh <n-clientes>
4- paste valores.csv tiempos_respuesta.csv tiempos_ejecucion.csv | awk '{print $1";"$2";"$3}' > final.csv
