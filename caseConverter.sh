#!/bin/bash

#--------------------------------------------------------------------
# Invertir minúsculas a mayúsculas y viceversa, de todas las palabras.
#--------------------------------------------------------------------

FILE=$1
FILE_CONT=$(cat $FILE)		#Guardo el contenido del archivo
FILE_INV="${FILE_CONT~~}"	#Invierto el case de los caracteres

OPEN_FILE=$(cat $FILE)

[[ $OPEN_FILE =~ "" ]] && echo "No hay palabras en el texto" && exit 1

echo "Texto original:"
echo "---------------"
echo "$FILE_CONT"
echo " "

echo "Texto invertido:"
echo "----------------"
echo "$FILE_INV"

exit 0

