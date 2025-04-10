# Isto é pa que as cousas xeradas se garden en carpetas aparte e así non encher
# o diretorio actual con 5234 ficheiros auxiliares.
$aux_dir = '.aux'; # para os auxiliares (.log, .aux, .toc, .fls ...)
$out_dir = '.pdf'; # para o pdf

# Con qué compilar o documento. 1:pdflatex, 4:lualatex, 5:xelatex. O resto son
# inutiles. Usamos LuaLaTeX polos beneficios para as tipografías, a
# posibilidade de usar \directlua, e para traballar con utf-8 por defecto (non
# necesitamos parafernalias de inputec nin fontenc)
$pdf_mode = 4;

# xera arquivo .fls para manter o fio dos arquivos usados na compilacion
$recorder = 1;

# O comando específico de lualatex
$lualatex = "lualatex --file-line-error --interaction=nonstopmode --shell-escape %O %S";
