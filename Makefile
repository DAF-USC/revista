# Esto é un arquivo con 'instrucions' para compilar unha revista. 'make' é un
# programa que permite rular _outros_ programas en certa orde, baixo certas
# regras. Úsase principalmente con programas compilados (e non iterpretados)
# porque pode ser tedioso escribir de cada vez comandos máis e máis longos.
# Tamén se pode usar neste caso máis simple.
#
# Para compilar unha revista, escribir 'make numero=001', ou poñer o numero que
# proceda.
#
# Para limpiar os arquivos auxiliares, escribir 'make limpa'

# shell por defecto
SHELL := bash

# qué accion se vai executar por defecto
.DEFAULT_GOAL := rula

# esta accion mira se existe o arquivo revista/001/revista_001.tex e en caso
# afirmativo, executa 'latexmk' con dito arquivo
rula: revistas/$(numero)/revista_$(numero).tex
	latexmk revistas/$(numero)/revista_$(numero).tex

# accion para limpar os arquivos auxiliares
limpa:
	rm -rf .pdf/* .aux/* # pra limpar os diretorios

.PHONY: rula limpa
