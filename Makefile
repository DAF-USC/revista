# Esto é un arquivo con 'instrucions' para compilar unha revista. 'make' é un
# programa que permite rular _outros_ programas en certa orde, baixo certas
# regras. Úsase principalmente con programas compilados (e non interpretados)
# porque pode ser tedioso escribir de cada vez comandos máis e máis longos.
# Tamén se pode usar neste caso máis simple.
#
# Para compilar unha revista, escribir 'make numero=001', ou poñer o número que
# proceda.
#
# Para limpar os arquivos auxiliares, escribir 'make limpa'

# shell por defecto
SHELL := bash

# Regras de tipo 'phony'
# https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: limpa propaganda

# que acción se vai executar por defecto
.DEFAULT_GOAL := .pdf/revista_$(numero).pdf

# Formato por defecto
ifeq ($(formato),)
	formato := completa
endif

# :FACER:MIGRACION: PDF UA-1 (precisa alt-text en todo, e non soporta incluir PDFs) https://github.com/typst/typst/issues/7665
#
OPCIONS_TYPST := \
	--format pdf              \
	--root .                  \
	--pdf-standard 2.0        \
	--diagnostic-format short \
	--ignore-system-fonts     \
	--ignore-embedded-fonts   \
	--font-path=fontes        \
	--timings=.aux/perf.json  \
	--deps=.aux/deps.json     \
	--deps-format=json        \
	--input numero=$(numero)  \
	--input formato=$(formato)\

DEPENDENCIAS := \
	revistas/$(numero)/revista_$(numero).typ \
	revistas/$(numero)/*        \
	revistas/$(numero)/imaxes/* \
	estilo.typ                  \
	momentum-citacions.csl      \
	logos/*                     \
	fontes/NerdFonts/*          \
	fontes/NewComputerModern/*  \
	fontes/Roboto/*

INFO_GIT := \
	--input rama=$(shell git rev-parse --abbrev-ref HEAD) \
	--input hash=$(shell git rev-parse --short HEAD) \
	--input dirt=$(shell test -z "$$(git status --porcelain)" && echo "" || echo "*") \
	--input quen=$(shell git log -1 --format="%an")

# esta acción mira se existe o arquivo revista/001/revista_001.typ e en caso
# afirmativo, executa 'typst compile' con dito arquivo
#
.pdf/revista_$(numero).pdf: $(DEPENDENCIAS)

	# Hai que asegurarse de que existen o directorios .pdf e .aux
	$(shell if [ ! -d ".pdf" ]; then mkdir .pdf; fi)
	$(shell if [ ! -d ".aux" ]; then mkdir .aux; fi)

	# :FACER:MIGRACION: posibilidade de usar 'typst watch' ..?
	typst compile \
		$(OPCIONS_TYPST) \
		$(INFO_GIT) \
		revistas/$(numero)/revista_$(numero).typ \
		.pdf/revista_$(numero).pdf

# acción para limpar os ficheiros xerados
# USO: make limpa
limpa:
	rm -f .pdf/* .aux/*

propaganda:
	echo "Inda é moi pronto..."
