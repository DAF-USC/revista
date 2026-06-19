# Esto é un arquivo con 'instrucions' para compilar unha revista. 'make' é un
# programa que permite rular _outros_ programas en certa orde, baixo certas
# regras. Úsase principalmente con programas compilados (e non interpretados)
# porque pode ser tedioso escribir de cada vez comandos máis e máis longos.
# Tamén se pode usar neste caso máis simple.
#
# REGRAS RELEVANTES:
# .pdf/revista_$(numero).pdf -> por defecto, executase sempre
# limpa                      -> limpar os directorios auxiliares, .aux/ e .pdf/
# propaganda                 -> xera os carteis propagandísticos, os verticais
#                               (A4) e os horizontais (16:9)

# shell por defecto
SHELL := bash

# Regras de tipo 'phony'
# https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: limpa propaganda

# que acción se vai executar por defecto
.DEFAULT_GOAL := .pdf/revista_$(numero).pdf

# norma para evitar que se borre o PDF da revista se saímos de Make (p.e. con CTRL-C)
.PRECIOUS: .pdf/revista_$(numero).pdf

# método de compilación por defecto
# `compile` -> compilación única
# `watch`   -> compilación continuada
metodo := compile

# :FACER:MIGRACION: PDF UA-1 (precisa alt-text en todo, e non soporta incluir PDFs) https://github.com/typst/typst/issues/7665
OPCIONS_TYPST := \
	--format pdf              \
	--root .                  \
	--pdf-standard 2.0        \
	--diagnostic-format short \
	--ignore-system-fonts     \
	--ignore-embedded-fonts   \
	--font-path=fontes        \
	--timings=.aux/perf_{n}.json  \
	--deps=.aux/deps.json     \
	--deps-format=json        \
	--input numero=$(numero)

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

	typst \
		$(metodo) \
		$(OPCIONS_TYPST) \
		$(INFO_GIT) \
		revistas/$(numero)/revista_$(numero).typ \
		.pdf/revista_$(numero).pdf

# acción para limpar os ficheiros xerados
# USO: make limpa
limpa:
	rm -f .pdf/* .aux/*

################################################################
#  ____  ____   ___  ____   _    ____    _    _   _ ____    _
# |  _ \|  _ \ / _ \|  _ \ / \  / ___|  / \  | \ | |  _ \  / \
# | |_) | |_) | | | | |_) / _ \| |  _  / _ \ |  \| | | | |/ _ \
# |  __/|  _ <| |_| |  __/ ___ \ |_| |/ ___ \| |\  | |_| / ___ \
# |_|   |_| \_\\___/|_| /_/   \_\____/_/   \_\_| \_|____/_/   \_\
################################################################

ifeq ($(cor),)
cor := FF0000
endif

ifeq ($(cortexto),)
cortexto := FFFFFF
endif

ifeq ($(paxina_central_numero),)
paxina_central_numero := 2
endif

ifeq ($(paxina_dereita_numero),)
paxina_dereita_numero := 3
endif

# Esta variable é o nome dos PDF cas páxinas que imos poñer na propaganda.
# Gardo os nomes aquí por comodidade. 1 (portada) 2 (central) 3 (dereita)
PAXINAS_PROPAGANDA := \
	.pdf/paxinas_propaganda_$(numero)_1.pdf \
	.pdf/paxinas_propaganda_$(numero)_2.pdf \
	.pdf/paxinas_propaganda_$(numero)_3.pdf

# Extrae a portada da revista e outras páxinas
$(PAXINAS_PROPAGANDA): .pdf/revista_$(numero).pdf
	@# https://www.ghostscript.com/documentation/index.html
	gs \
		-q -dBATCH -dNOPAUSE -dSAFER -sDEVICE=pdfwrite \
		-sOutputFile=.pdf/paxinas_propaganda_$(numero)_%d.pdf \
		-sPageList=1,$(paxina_central_numero),$(paxina_dereita_numero) \
		-f .pdf/revista_$(numero).pdf

propaganda: \
	.pdf/propaganda_$(numero)_vertical_cor.pdf \
	.pdf/propaganda_$(numero)_vertical_branca.pdf \
	.pdf/propaganda_$(numero)_horizontal_cor.pdf \
	.pdf/propaganda_$(numero)_horizontal_branca.pdf

# Xera a propaganda VERTICAL A4 de COR
.pdf/propaganda_$(numero)_vertical_cor.pdf: $(PAXINAS_PROPAGANDA) trebellos/propaganda_vertical.typ
	typst compile \
		$(OPCIONS_TYPST) \
		--input version=cor \
		trebellos/propaganda_vertical.typ .pdf/propaganda_$(numero)_vertical_cor.pdf

# Xera a propaganda VERTICAL A4 BRANCA
.pdf/propaganda_$(numero)_vertical_branca.pdf: $(PAXINAS_PROPAGANDA) trebellos/propaganda_vertical.typ
	typst compile \
		$(OPCIONS_TYPST) \
		--input version=branca \
		trebellos/propaganda_vertical.typ .pdf/propaganda_$(numero)_vertical_branca.pdf

# Xera a propaganda HORIZONTAL 19:6 de COR
.pdf/propaganda_$(numero)_horizontal_cor.pdf: $(PAXINAS_PROPAGANDA) trebellos/propaganda_horizontal.typ
	typst compile \
		$(OPCIONS_TYPST) \
		--input version=cor \
		trebellos/propaganda_horizontal.typ .pdf/propaganda_$(numero)_horizontal_cor.pdf

# Xera a propaganda HORIZONTAL 19:6 BRANCA
.pdf/propaganda_$(numero)_horizontal_branca.pdf: $(PAXINAS_PROPAGANDA) trebellos/propaganda_horizontal.typ
	typst compile \
		$(OPCIONS_TYPST) \
		--input version=branca \
		trebellos/propaganda_horizontal.typ .pdf/propaganda_$(numero)_horizontal_branca.pdf
