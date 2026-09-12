# Varios comandos que nos poden ser útiles para os de edición

## Reducir tamaño e calidade dunha imaxe con ImageMagick
- https://imagemagick.org/command-line-options/#quality
- https://imagemagick.org/command-line-options/#resize
```bash
convert imaxe_orixinal.png -quality 72% -resize 60% imaxe_reducida.png
```

## Usar GhostScript para explorar/manipular un PDF
https://www.ghostscript.com/

CMYK ink coverage
- https://ghostscript.readthedocs.io/en/latest/Devices.html#ink-coverage-output
- https://stackoverflow.com/q/55675384
```bash
gs -o - -sDEVICE=inkcov .pdf/revista_001.pdf  # % of pixels with CMYK colourant
gs -o - -sDEVICE=ink_cov .pdf/revista_001.pdf # % of ink over entire page
```

Mostrar a 'bounding box' para cada páxina
```bash
gs -q -dSAFER -dNOPAUSE -dBATCH -sDEVICE=bbox .pdf/revista_001.pdf
```

Modificar a MediaBox dun PDF (p.e. a 900pt de ancho e 1000pt de alto)
```bash
gs -q -dBATCH -dNOPAUSE -sDEVICE=pdfwrite
-dFIXEDMEDIA -dDEVICEWIDTHPOINTS=900 -dDEVICEHEIGHTPOINTS=1000
-sOutputFile=out.pdf
-f .pdf/revista_001.pdf
```

Modificar un PDF con PostScript
```bash
gs
    # resto de parámetros de GS
    -c "cadea de PostScript"
```

## Usar exiftool para sacar info variada dun PDF
https://exiftool.org/

```bash
exiftool -g -ee -u -U .pdf/revista_001.pdf
```

## Usar pdfinfo para sacar info variada dun PDF
https://linux.die.net/man/1/pdfinfo

Mostrar todas as *Box
```bash
pdfinfo -box -l -1 .pdf/revista_001.pdf
```

Mostrar etiquetas do documento
```bash
pdfinfo -struct .pdf/revista_001.pdf
```

Mostrar etiquetas e texto do documento
```bash
pdfinfo -struct-text .pdf/revista_001.pdf
```

Mostrar URLs do documento
```bash
pdfinfo -url .pdf/revista_001.pdf
```

## Usar qpdf para sacar info variada dun PDF
https://github.com/qpdf/qpdf

Está o PDF encriptado?
```bash
qpdf --show-encryption .pdf/revista_001.pdf
```

Descomprimir os streams dun PDF, para poder visualizalo mellor como texto
```bash
qpdf --stream-data=uncompress .pdf/revista_001.pdf
```

Pasalo a formato QDF, inda máis facil de ler
https://qpdf.readthedocs.io/en/stable/qdf.html
```bash
qpdf --qdf .pdf/revista_001.pdf out_comodo.pdf
```

Ou incluso pasalo a JSON
https://qpdf.readthedocs.io/en/stable/json.html#qpdf-json
```
qpdf --decrypt --object-streams=disable .pdf/revista_001.pdf out.pdf
qpdf --json-output out.pdf out.json
```

Re-comprimir o PDF
```bash
qpdf --compression-level=9 --recompress-flate .pdf/revista_002.pdf .pdf/recomprimido.pdf
```

## Usar Tylax para pasar LaTeX <-> Typst
https://github.com/scipenai/tylax
```bash
t2l -d l2t --no-preamble doc.tex # pasar de latex a typst
t2l tikz --no-preamble doc.typ # pasar de TikZ a CetZ
```

Tamén pode usarse con STDIN, ousexa como filtro dende un editor
```bash
echo 'latex' | t2l -d l2t --no-preamble
```

## Usar Pandoc: para pasar LaTeX <-> Typst
https://pandoc.org/
```bash
pandoc -f latex -t typst doc.tex
```

No caso de non recoñecer algún macro de latex, p.e. `\meumacrochulo` e de estar
usando Pandoc como filtro de STDIN
```bash
echo 'texto en latex' | cat macros-latex.tex - | pandoc -f latex -t typst
```

onde `macros-latex.tex` contén
```latex
\newcommand{\MeuMacroChulo}[1]{bla bla bla #1 bla bla bla}
```

Explicación:
```
  STDIN
    |
    |  \begin{equation}
    |      \MeuMacroChulo{patata}
    |  \end{equation}
    |
    V
cat trebellos/macros-latex.tex -
    |
    | \newcommand{\MeuMacroChulo}[1]{bla bla #1 bla bla}
    | \begin{equation}
    |     \MeuMacroChulo{patata}
    | \end{equation}
    |
    V
pandoc -f latex -t typst
    |
    |  $
    |      MeuMacroChulo(patata)
    V  $

Chequeade `man cat` para ver por que fai falla o `-`
```

## Facer booklets
```
pdfbook2 .pdf/revista_001.pdf
pdfcpu out.pdf 2 .pdf/revista_001.pdf
pdfcpu booklet 'g:on, ma:10, bgcol:#beded9' booklet.pdf 2 pageSequence.pdf
```
