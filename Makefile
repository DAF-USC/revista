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

# Separar o PDF da revista en páxinas numeradas como .pdf/revista_001_3.pdf
.pdf/paxinas_$(numero)_0.pdf: .pdf/revista_$(numero).pdf
	magick .pdf/revista_$(numero).pdf .pdf/paxinas_$(numero)_%d.pdf
	rm .pdf/paxinas_$(numero)_[0-9]?.pdf
	rm .pdf/paxinas_$(numero)_[^0].pdf

# Xerar a propaganda. Esto usa Typst https://typst.app/ en lugar de LaTeX
# Usase como 'make propaganda numero=004 cor=89fa3c'
propaganda: .pdf/paxinas_$(numero)_0.pdf
	typst compile \
		--diagnostic-format=short \
		--root=. \
		--ignore-embedded-fonts \
		--ignore-system-fonts \
		--font-path=fontes \
		--input numero=$(numero) \
		--input cor=$(cor) \
		trebellos/propaganda.typ .pdf/propaganda.pdf

.PHONY: limpa modelo propaganda
