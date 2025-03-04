# Usar con make=numero da revista
# exemplo:
# make numero=001

SHELL := bash
.DEFAULT_GOAL := rula

rula: revistas/$(numero)/revista_$(numero).tex
	latexmk revistas/$(numero)/revista_$(numero).tex

limpa:
	rm -rf .pdf/* .aux/*

.PHONY: rula limpa
