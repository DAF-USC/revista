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

# https://www.gnu.org/software/make/manual/html_node/Special-Targets.html
.PRECIOUS: .pdf/revista_$(numero).pdf

# qué accion se vai executar por defecto
.DEFAULT_GOAL := .pdf/revista_$(numero).pdf

# esta accion mira se existe o arquivo revista/001/revista_001.tex e en caso
# afirmativo, executa 'latexmk' con dito arquivo
.pdf/revista_$(numero).pdf: revistas/$(numero)/revista_$(numero).tex revista.cls momentum-citacions.csl logos/* fontes/NerdFonts/* fontes/LatinModern/* revistas/$(numero)/* revistas/$(numero)/imaxes/*
	latexmk revistas/$(numero)/revista_$(numero).tex

# regra para xerar a versión impresa da revista
impresa: .pdf/revista_$(numero).pdf
	# A maior parte desto son parámetros de GS que podedes ler en
	# https://ghostscript.readthedocs.io/en/gs10.02.1/
	# O relevante é 'trebellos/impresa.ps', que é un script de PostScript. Nese
	# ficheiro están as instruccións para manipular o PDF
	#
	# Algúns datos:
	#
	# Tamaño A4: 595pts × 842pts (210mm × 297mm)
	# 1cm = 28pts
	# -dDEVICEHEIGHTPOINTS=842 (alto dun A4)
	# -dDEVICEWIDTHPOINTS=623 (=595+28, i.e. ancho A4 máis marxe adicional)
	gs \
		-q \
		-dNOPAUSE \
		-dBATCH \
		-dSAFER \
		-sDEVICE=pdfwrite \
		-sOutputFile=.pdf/revista_$(numero)_IMPRESA.pdf \
		-dPDFSETTINGS="/printer" \
		-dCompatibilityLevel="1.7" \
		-dUseCropBox \
		-dFIXEDMEDIA \
		-dDEVICEHEIGHTPOINTS=842 \
		-dDEVICEWIDTHPOINTS=623 \
		trebellos/impresa.ps \
		-f .pdf/revista_$(numero).pdf

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
# Usase como 'make propaganda numero=004 cor=89fa3c'
propaganda: .pdf/portada_$(numero).pdf
	typst compile \
		--diagnostic-format=short \
		--root=. \
		--ignore-embedded-fonts \
		--ignore-system-fonts \
		--font-path=fontes \
		--input numero=$(numero) \
		--input cor=$(cor) \
		trebellos/propaganda.typ .pdf/propaganda_$(numero).pdf

.PHONY: limpa modelo propaganda
