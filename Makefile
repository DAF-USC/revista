# Esto é un arquivo con 'instrucions' para compilar unha revista. 'make' é un
# programa que permite rular _outros_ programas en certa orde, baixo certas
# regras. Úsase principalmente con programas compilados (e non interpretados)
# porque pode ser tedioso escribir de cada vez comandos máis e máis longos.
# Véxase: https://www.gnu.org/software/make/manual/make.html
#
##############################################################################
# Como se usa:
#
# make limpa                           -> elimina os ficheiros xerados
# make todo                            -> compila todo, revistas e propagandas
# make numero=001                      -> compila a revista 001
# make numero=001 metodo=watch         -> compila a revista 001 de maneira continuada
# make numero=001 propaganda           -> compila a revista 001 e xera a propaganda
#
# OLLO:
#
# A opción 'metodo=watch' está feita para editar no momento, pero pode dar
# problemas se se combina 'todo' ou 'propaganda'
##############################################################################


# Shell por defecto. Todes deberíades usar Linux
SHELL := bash

# Regras de tipo 'phony'
# Véxase: https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: limpa propaganda todo

# Que acción se vai executar por defecto
.DEFAULT_GOAL := .pdf/revista_$(numero).pdf

# Norma para evitar que se borre o PDF da revista se saímos de Make (p.e. con
# CTRL-C ao usar a compilación continuada de typst)
# Véxase: https://www.gnu.org/software/make/manual/html_node/Special-Targets.html
.PRECIOUS: .pdf/revista_$(numero).pdf

# método de compilación por defecto
# `compile` -> compilación única
# `watch`   -> compilación continuada
metodo := compile

# Opcións para compilar usando Typst
# :FACER:MIGRACION: PDF UA-1 (precisa alt-text en todo, e non soporta incluir PDFs) https://github.com/typst/typst/issues/7665
# :FACER: hai algunha maneira de meter o de --timings=... aqui?
OPCIONS_TYPST := \
	--format pdf              \
	--root .                  \
	--pdf-standard 2.0        \
	--diagnostic-format short \
	--ignore-system-fonts     \
	--ignore-embedded-fonts   \
	--font-path=fontes        \
	--deps-format=json        \
	--input numero=$(numero)

# Información de Git que aparece no índice. Son parámetros que tamén lle
# pasamos a typst
INFO_GIT := \
	--input rama=$(shell git rev-parse --abbrev-ref HEAD) \
	--input hash=$(shell git rev-parse --short HEAD) \
	--input dirt=$(shell test -z "$$(git status --porcelain)" && echo "" || echo "*") \
	--input quen="$(shell git log -1 --format="%an")"

# Dependencias dun número.
DEPENDENCIAS := \
	revistas/$(numero)/revista_$(numero).typ \
	revistas/$(numero)/datos_$(numero).typ \
	revistas/$(numero)/*        \
	revistas/$(numero)/imaxes/* \
	estilo.typ                  \
	momentum-citacions.csl      \
	logos/*                     \
	fontes/NerdFonts/*          \
	fontes/NewComputerModern/*  \
	fontes/Roboto/*

# Esta variable é o nome dos PDF cas páxinas que imos poñer na propaganda.
# Gardo os nomes aquí por comodidade. 1 (portada) 2 (central) 3 (dereita)
PAXINAS_PROPAGANDA := \
	.pdf/paxinas_propaganda_$(numero)_1.pdf \
	.pdf/paxinas_propaganda_$(numero)_2.pdf \
	.pdf/paxinas_propaganda_$(numero)_3.pdf

# Números para os que hai revistas.
# Véxase:
# https://www.gnu.org/software/make/manual/html_node/Text-Functions.html
# https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html
NUMEROS := $(patsubst revista_%.typ, %, $(notdir $(wildcard revistas/*/revista_*.typ)))


# Limpar os ficheiros xerados
limpa:
	rm -f .pdf/* .aux/*


# Compilar todo. Isto simplemente re-chama a make varias veces
todo:
	@for N in $(NUMEROS); do echo -e ""; make numero=$${N} propaganda; done


# Xeramos o PDF correspondente co número pedido, dependendo de se algunha
# dependencia cambiou ou non
.pdf/revista_$(numero).pdf: $(DEPENDENCIAS)

	@# Hai que asegurarse de que existen o directorios .pdf e .aux
	$(shell if [ ! -d ".pdf" ]; then mkdir .pdf; fi)
	$(shell if [ ! -d ".aux" ]; then mkdir .aux; fi)

	@echo -e "======================================"
	@echo -e "\033[1;32mREVISTA $${numero}\033[0m\n"
	typst \
		$(metodo) \
		$(OPCIONS_TYPST) \
		$(INFO_GIT) \
		--timings=.aux/perf_{n}_revista_$(numero).json \
		--deps=.aux/deps_revista_$(numero).json \
		revistas/$(numero)/revista_$(numero).typ \
		.pdf/revista_$(numero).pdf


# Extrae a portada da revista e outras páxinas
$(PAXINAS_PROPAGANDA): .pdf/revista_$(numero).pdf
	@# https://www.ghostscript.com/documentation/index.html
	gs \
		-q -dBATCH -dNOPAUSE -dSAFER -sDEVICE=pdfwrite \
		-sOutputFile=.pdf/paxinas_propaganda_$(numero)_%d.pdf \
		-sPageList=1,2,3 \
		-f .pdf/revista_$(numero).pdf

# Xera as propagandas:
# V_C   Vertical Cor
# V_B   Vertical Branca
# H_C   Horizontal Cor
# H_B   Horizontal Branca
propaganda: \
	.pdf/propaganda_$(numero)_V_C.pdf \
	.pdf/propaganda_$(numero)_V_B.pdf \
	.pdf/propaganda_$(numero)_H_C.pdf \
	.pdf/propaganda_$(numero)_H_B.pdf


# Xera a propaganda VERTICAL A4 de COR
.pdf/propaganda_$(numero)_V_C.pdf: $(PAXINAS_PROPAGANDA) trebellos/propaganda_vertical.typ
	typst compile \
		$(OPCIONS_TYPST) \
		--input version=cor \
		--timings=.aux/perf_propaganda_V_C_$(numero).json \
		--deps=.aux/deps_propaganda_V_C_$(numero).json \
		trebellos/propaganda_vertical.typ .pdf/propaganda_$(numero)_V_C.pdf

# Xera a propaganda VERTICAL A4 BRANCA
.pdf/propaganda_$(numero)_V_B.pdf: $(PAXINAS_PROPAGANDA) trebellos/propaganda_vertical.typ
	typst compile \
		$(OPCIONS_TYPST) \
		--input version=branca \
		--timings=.aux/perf_propaganda_V_B_$(numero).json \
		--deps=.aux/deps_propaganda_V_B_$(numero).json \
		trebellos/propaganda_vertical.typ .pdf/propaganda_$(numero)_V_B.pdf

# Xera a propaganda HORIZONTAL 19:6 de COR
.pdf/propaganda_$(numero)_H_C.pdf: $(PAXINAS_PROPAGANDA) trebellos/propaganda_horizontal.typ
	typst compile \
		$(OPCIONS_TYPST) \
		--input version=cor \
		--timings=.aux/perf_propaganda_H_C_$(numero).json \
		--deps=.aux/deps_propaganda_H_C_$(numero).json \
		trebellos/propaganda_horizontal.typ .pdf/propaganda_$(numero)_H_C.pdf

# Xera a propaganda HORIZONTAL 19:6 BRANCA
.pdf/propaganda_$(numero)_H_B.pdf: $(PAXINAS_PROPAGANDA) trebellos/propaganda_horizontal.typ
	typst compile \
		$(OPCIONS_TYPST) \
		--input version=branca \
		--timings=.aux/perf_propaganda_H_B_$(numero).json \
		--deps=.aux/deps_propaganda_H_B_$(numero).json \
		trebellos/propaganda_horizontal.typ .pdf/propaganda_$(numero)_H_B.pdf
