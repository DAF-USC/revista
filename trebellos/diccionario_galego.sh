#!/usr/bin/bash

# Este é un pequeno programa para xerar arquivos *.dic e *.aff dende o proxecto
# trasno. Os comandos son sacados do repositorio oficial de transo:
# https://gitlab.com/trasno/hunspell-gl , con mínimas modificacións e comentarios

# Primeiro creamos un directorio temporal onde clonar o proxecto completo
mkdir hunspell_temp

# E metémonos nel
cd hunspell_temp || exit

# Clonamos o repositorio
git clone https://gitlab.com/trasno/hunspell-gl

# Metémonos no repositorio
cd husnpell-gl || exit

# E comezamos a montar o proxecto. Fai falta usar python para xerar os arquivos
# *.dic e *.aff, creando un entorno virtual e instalando os paquetes 'wheel',
# 'PyICU' e 'SCons'
python3 -m venv venv && source venv/bin/activate && pip install wheel PyICU SCons

# Esta variable é pa escoller que fontes usar para os dicionarios
TODO=$(ls src | grep -v / | xargs echo | sed 's/ /,/g')

# Usase o programa Scons para construír todo (análogo a unha Makefile)
scons -c && scons metadata=strip aff=$TODO dic=$TODO rep=$TODO

# desactivamos o entorno virtual
deactivate

# No directorio 'build' deberíamos ter un arquivo *.dic e *.aff
cd build || exit
