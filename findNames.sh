#!/bin/bash

#----------------------------------
# Identificación de nombres propios
#----------------------------------

FILE=$1		
NOMBRE_PROPIO="^[A-Z]{1}[a-z]+$"	#Regex para formato de nombre propio: Una mayúscula + Al menos una minúscula

OPEN_FILE=$(cat $FILE)

[[ $OPEN_FILE =~ "" ]] && echo "No hay palabras en el texto" && exit 1

#Elimino caracteres indeseados e incorporo salto de linea.
ARREGLO=$(cat $FILE | tr -d '.,?!:' | tr ' ' '\n')

echo "Nombres propios encontrados en el archivo:"

for palabra in $ARREGLO
do
	#Comparo las palabras leidas con la regex para nombres propios y muestro en pantalla las coincidencias
	if [[ $palabra =~ $NOMBRE_PROPIO ]]
	then
		echo $palabra
	fi
done
