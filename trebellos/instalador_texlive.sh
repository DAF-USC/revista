#!/usr/bin/bash

# Pequeno programa para instalar a versión completa de TeXLive en Linux. Todos
# os comandos veñen de https://tug.org/texlive/quickinstall.html só cun par de
# pequenas modificacións e comentarios. Lede ven o que fai antes de usalo. Pode
# levar varias horas rematar.
#
# Executar con:
# source instalador_texlive.sh

# Creamos un directorio temporal. Máis adiante poderemos borralo sen problema
mkdir texlive_temp

# Metémonos en dito directorio
cd texlive_temp

# Descargamos a ultima versión de TeXLive. Necesario ter instalado 'wget'. Esto
# descarga o arquivo install-tl-unx.tar.gz no directorio actual (o temporal).
# Esto é un arquivo comprimido cun script de Perl que é o propio instalador
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

# Descomprimimos o arquivo
zcat < install-tl-unx.tar.gz | tar xf - # Importante o '-' final

# Borramos o arquivo comprimido, xa non fai falta
rm install-tl-unx.tar.gz

# Logo de descomprimir, metemonos no novo directorio
cd install-tl-* || echo "algo foi mal"

# Executamos o script de Perl. Esto pode levar horas. Uso 'sudo' para ter
# privilexios, pero dependendo do sistema pode non facer falta. Instala as
# cousas por defecto en /usr/local/texlive/20**/  Importante engadir a ruta
# /usr/local/texlive/20**/bin/plataforma á variable de entorno $PATH (podedes
# facelo na vosa .bashrc)
sudo perl ./install-tl --no-interaction
