
#!/bin/bash

# Lista de géneros válidos
valid_genres=("rock" "jazz" "metal" "alternative & punk" "rock and roll" "blues" "latin" "reggae" "pop" "soundtrack" "bossa nova" "easy listening" "heavy metal" "world" "classical")

# Función para comprobar si un género está en la lista válida
is_valid_genre() {
	local genre_to_check="$1"
	for valid in "${valid_genres[@]}"; do
		if [[ "$genre_to_check" == "$valid" ]]; then
			return 0
		fi
	done
return 1
}

# Leemos línea por línea del archivo data.txt

while IFS=',' read -r title album genre; do
#Eliminamos espacios al principio y final
title=$(echo "$title" | sed 's/^ *//;s/ *$//')
album=$(echo "$album" | sed 's/^ *//;s/ *$//')
genre=$(echo "$genre" | sed 's/^ *//;s/ *$//')

# Convertir "," por "|"

line="$title|$album|$genre"

# Usamos el nombre del género como nombre de archivo

filename="$genre"

# Comprobamos si el género es válido
if is_valid_genre "$genre"; then

	# Guardar la línea en el fichero correspondiente

	echo "$line" >> "$filename.txt"
fi

done < data.txt

echo "Archivos generados:"
ls *.txt grupos.sh
#token personal almacenado en token.txt
