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
.DEFAULT_GOAL := .pdf/revista_$(numero).pdf

# esta accion mira se existe o arquivo revista/001/revista_001.tex e en caso
# afirmativo, executa 'latexmk' con dito arquivo
.pdf/revista_$(numero).pdf: revistas/$(numero)/revista_$(numero).tex revista.cls momentum-citacions.csl logos/* fontes/NerdFonts/* fontes/LatinModern/* revistas/$(numero)/* revistas/$(numero)/imaxes/*
	latexmk revistas/$(numero)/revista_$(numero).tex

# accion para limpar os arquivos auxiliares
limpa:
	rm -rf .pdf/* .aux/* # pra limpar os diretorios

# accion para empaquetar os arquivos necesarios para o artigo simplificado
modelo:
	zip -r modelo_$(shell date +'%Y%m%d').zip modelo/

# Para facer os carteis propagandísticos

# Por defecto, a cor do titulo da propaganda é vermello puro
ifeq ($(cor),)
cor := FF0000
endif

# O mesmo pero ca cor do texto en resalte
ifeq ($(cortexto),)
cortexto := FFFFFF
endif

# Extrae a portada da revista
# https://www.ghostscript.com/documentation/index.html
.pdf/portada_$(numero).pdf: .pdf/revista_$(numero).pdf
	gs \
		-q \
		-dBATCH \
		-dNOPAUSE \
		-dSAFER \
		-sOutputFile=.pdf/portada_$(numero).pdf \
		-sDEVICE=pdfwrite \
		-dFirstPage=1 \
		-dLastPage=1 \
		-f .pdf/revista_$(numero).pdf

# Xerar a propaganda. Esto usa Typst https://typst.app/ en lugar de LaTeX
# Usase como 'make propaganda numero=004 cor=89fa3c cortexto=ffffff'
.pdf/propaganda_$(numero).pdf: .pdf/portada_$(numero).pdf
	typst compile \
		--diagnostic-format=short \
		--root=. \
		--ignore-embedded-fonts \
		--ignore-system-fonts \
		--font-path=fontes \
		--input numero=$(numero) \
		--input cor=$(cor) \
		--input cortexto=$(cortexto) \
		trebellos/propaganda.typ .pdf/propaganda_$(numero).pdf

propaganda: .pdf/propaganda_$(numero).pdf
	gs \
		-q \
		-dBATCH \
		-dNOPAUSE \
		-dSAFER \
		-sPageList=1,2 \
		-sOutputFile=.pdf/propaganda_$(numero)_%d.pdf \
		-sDEVICE=pdfwrite \
		-f .pdf/propaganda_$(numero).pdf
	rm .pdf/propaganda_$(numero).pdf

.PHONY: limpa modelo propaganda
