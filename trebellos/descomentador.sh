cat artigo_simplificado.tex | \
    sed '/^\%\%\%\:/d'                 | \
    sed '/^\\documentclass{revista}/d' | \
    sed '/^\\begin{document}/d'        | \
    sed '/^\\end{document}/d'          | \
    sed '/^\\begin{refsection}/d'      | \
    sed '/^\\end{refsection}/d'        > \
    artigo_descomentado.tex
