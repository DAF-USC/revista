#!/bin/bash

# Podemos usar o script con varios arquivos á vez. Metemos a funcionalidade nun
# bucle para iterar por todos os ficheiros
for ficheiro in "$@"; do

    # Collemos a extensión do ficheiro. Véxase 'Parameter Expansion' no manual
    # de Bash, concretamente 'Remove matching prefix pattern'
    extension="${ficheiro##*.}"

    # Usamos 'basename' para coller o nome solo.
    nome_ficheiro="$(basename "$ficheiro" .$extension)"

    # E facemos un nome para o ficheiro de saida
    saida="${nome_ficheiro}_descomentado.${extension}"

    # A parte crítica. Imos filtrar o ficheiro pasandoo varias veces polo
    # programa 'sed'. En cada pasada quitamos cousas
    cat "$ficheiro" | \
        sed '/^%%%:/d'                     |
        sed '/^\\documentclass{revista}/d' |
        sed '/^\\begin{document}/d'        |
        sed '/^\\end{document}/d'          > \
        "$saida"

done
