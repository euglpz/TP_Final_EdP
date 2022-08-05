#!/bin/bash

#-----------------------------------------
# Indicador estadistico de uso de palabras
#-----------------------------------------

FILE=$1
OPEN_FILE=$(cat $FILE)

[[ $OPEN_FILE =~ "" ]] && echo "No hay palabras en el texto" && exit 1
			
# tr -d '.,?![0-9]' 		--> Elimino caracteres indeseados
# tr '[:upper:]' '[:lower:]' 	--> Transformo todo a minusculas
# tr ' ' '\n' 			--> Indico saltos de linea
# awk 'length > 3' 		--> Filtro palabras de mas de 3 letras.
# sort 				--> Agrupo palabras iguales
# uniq -c 			--> Me quedo con una de cada palabra repetida y cuento apariciones
# sort -g -r 			--> Agrupo nuevamente en forma descendente según formato numérico
# head -n 10			--> Indico salida de las 10 palabras con mayor aparicion

cat $FILE | tr -d '.,?![0-9]' | tr '[:upper:]' '[:lower:]' | tr ' ' '\n' | awk 'length > 3' | sort | uniq -c | sort -g -r | head -n 10 > list.txt 
	
echo "Palabras más usadas en el texto (Aparición|Palabra):"

cat list.txt

rm list.txt

exit 0

