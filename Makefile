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

# que acción se vai executar por defecto
.DEFAULT_GOAL := .pdf/revista_$(numero).pdf

# esta acción mira se existe o arquivo revista/001/revista_001.tex e en caso
# afirmativo, executa 'latexmk' con dito arquivo
.pdf/revista_$(numero).pdf: revistas/$(numero)/revista_$(numero).tex revista.cls momentum-citacions.csl logos/* fontes/NerdFonts/* fontes/LatinModern/* revistas/$(numero)/* revistas/$(numero)/imaxes/*
	latexmk revistas/$(numero)/revista_$(numero).tex

# acción para limpar os arquivos auxiliares
limpa:
	rm -rf .pdf/* .aux/* # pra limpar os directorios

# acción para empaquetar os arquivos necesarios para o artigo simplificado
modelo:
	zip -r modelo_$(shell date +'%Y%m%d').zip modelo/

# acción para xerar a versión impresa da revista
impresa: .pdf/revista_$(numero).pdf
	python3 trebellos/crear_version_impresa.py .pdf/revista_$(numero).pdf .pdf/revista_$(numero)_impresa.pdf

# Para facer os carteis propagandísticos

# Por defecto, a cor do titulo da propaganda é vermello puro
ifeq ($(cor),)
cor := FF0000
endif

# O mesmo pero ca cor do texto en resalte
ifeq ($(cortexto),)
cortexto := FFFFFF
endif

# Número da páxina central, por defecto poñemos a segunda páxina
ifeq ($(paxina_central_numero),)
paxina_central_numero := 2
endif

# Número da páxina dereita, por defecto poñemos a terceira páxina
ifeq ($(paxina_dereita_numero),)
paxina_dereita_numero := 3
endif
# ollo, por defecto non poden ser todas 1 porque GS non deixaría facer -sPageList=1,1,1

# Os PDFs cas páxinas que imos poñer na propaganda
# 1 (portada)
# 2 (central)
# 3 (dereita)
paxinas_propaganda := \
	.pdf/paxinas_propaganda_$(numero)_1.pdf \
	.pdf/paxinas_propaganda_$(numero)_2.pdf \
	.pdf/paxinas_propaganda_$(numero)_3.pdf

# Extrae a portada da revista e outras páxinas
$(paxinas_propaganda): .pdf/revista_$(numero).pdf
	@# https://www.ghostscript.com/documentation/index.html
	gs \
		-q -dBATCH -dNOPAUSE -dSAFER -sDEVICE=pdfwrite \
		-sOutputFile=.pdf/paxinas_propaganda_$(numero)_%d.pdf \
		-sPageList=1,$(paxina_central_numero),$(paxina_dereita_numero) \
		-f .pdf/revista_$(numero).pdf

# Xerar a propaganda. Esto usa Typst https://typst.app/ en lugar de LaTeX
# Úsase como 'make propaganda numero=004 cor=89fa3c cortexto=ffffff'
# Esto xera un PDF con dúas páxinas, cos dous estilos distintos

opcions_typst := \
	--diagnostic-format=short \
	--root=. \
	--ignore-embedded-fonts \
	--ignore-system-fonts \
	--font-path=fontes \
	--no-pdf-tags \
	--input numero=$(numero) \
	--input cor=$(cor) \
	--input cortexto=$(cortexto) \

# Xera a propaganda de COR
.pdf/propaganda_$(numero)_cor.pdf: $(paxinas_propaganda) trebellos/propaganda.typ
	typst compile \
		$(opcions_typst) \
		--input version=cor \
		trebellos/propaganda.typ .pdf/propaganda_$(numero)_cor.pdf

# Xera a propaganda BRANCA
.pdf/propaganda_$(numero)_branca.pdf: $(paxinas_propaganda) trebellos/propaganda.typ
	typst compile \
		$(opcions_typst) \
		--input version=branca \
		trebellos/propaganda.typ .pdf/propaganda_$(numero)_branca.pdf

propaganda: .pdf/propaganda_$(numero)_cor.pdf .pdf/propaganda_$(numero)_branca.pdf

.PHONY: limpa modelo propaganda impresa
