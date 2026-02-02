# Documentación variada de LaTeX

O proxecto da revista é bastante elaborado e require de certa familiaridade con
LaTeX. Se queredes iniciarvos, meu mellor consello é que aprendades LaTeX
*realmente*, como fariades con calquera outra linguaxe de programación. Non vos
conformedes con titoriais de 20 minutos de YouTube máis algún curso
introdutorio. Aprendede como funciona o proceso de compilación, a sintaxe en
detalle, o proceso de tokenización, etc. Copiar e pegar macros apenas sirve para
facer unhas memorias de laboratorio. LaTeX é bastante
[complexo](https://tex.stackexchange.com/questions/222500/why-is-latex-so-complicated)

Isto que tendes diante non é un titorial, senón unha lista de variedade de recursos útiles para consultar cando faga falla.

### Páxinas oficiais principais

- Proxecto de LaTeX principal: https://www.latex-project.org/
- Arquivo principal con paquetes, documentos e ferramentas: https://www.ctan.org/

### Documentacións e repositorios principais

#### LaTeX2e
- Documentos (e arquivos) base oficiais (inclúe **luatex** en ltluatex.pdf): https://ctan.org/tex-archive/macros/latex/base
- Documentos (e arquivos) base oficiais **(PRE-PUBLICACIÓN)**: https://ctan.org/tex-archive/macros/latex-dev/base
- Repositorio: https://github.com/latex3/latex2e

#### LaTeX3 (expl3)
- Documentos (e arquivos) de LaTeX3: https://ctan.org/tex-archive/macros/latex/required/l3kernel
- Documentos (e arquivos) de LaTeX3 **(PRE-PUBLICACIÓN)**: https://ctan.org/tex-archive/macros/latex-dev/required/l3kernel
- Repositorio (expl3): https://github.com/latex3/latex3

#### Experimetal
- LaTeX Laboratory, cousas máis novidosas e en desenvolvemento, e.g. o `\DocumentMetadata`: https://ctan.org/tex-archive/macros/latex/required/latex-lab
- LaTeX Laboratory **(PRE-PUBLICACION)**: https://ctan.org/tex-archive/macros/latex-dev/required/latex-lab
- Un montón de docs que están aparte (e.g. l3pdfmeta): https://ctan.org/tex-archive/macros/latex/contrib/pdfmanagement-testphase

#### Docs principais de Luatex
- LuaTex: https://www.luatex.org/
- Paquete en CTAN: https://ctan.org/pkg/luatex
- Funcións de Lua (potentes): https://ctan.org/tex-archive/macros/luatex/latex e https://ctan.org/tex-archive/macros/luatex/generic

### Documentacións útiles

- PDF con todos os cambios na historia de LaTeX: https://www.ctan.org/pkg/ltnews
- Preguntas e Respostas máis importantes: https://tex.stackexchange.com/
- Overleaf Docs: https://www.overleaf.com/learn
- LaTeX Wikibook (algo desactualizado pero ten cousas da base de La/TeX moi útiles): https://en.wikibooks.org/wiki/LaTeX
- Varias referencias: https://latexref.xyz/
- Preguntas comúns: https://texfaq.org/

### Símbolos e tipografías

- Mega lista de fontes: https://tug.org/FontCatalogue/
- Mega lista de símbolos: https://www.ctan.org/pkg/comprehensive

### Tagging project

- Proxecto (non de LaTeX): https://taggedpdf.com/
- Introdución ao uso do proxecto: https://latex3.github.io/tagging-project/documentation/prototype-usage-instructions
- Compatibilidade de varios paquetes e clases co proxecto: https://latex3.github.io/tagging-project/tagging-status/
- Proxecto en CTAN, coa documentación oficial: https://www.ctan.org/pkg/tagpdf
- Repositorio de `tagpdf`: https://github.com/latex3/tagpdf

### Outros

- Novas de latex (dende Xuño do 1994): https://ctan.fisiquimicamente.com/macros/latex/base/ltnews.pdf
- Lista con moitas cousas LaTeXeras: https://github.com/egeerardyn/awesome-LaTeX
- Logotipia de LaTeX: https://github.com/latex3/branding
- Como escribir co estilo de Cthulhu? https://tex.stackexchange.com/questions/29402/how-do-i-make-my-document-look-like-it-was-written-by-a-cthulhu-worshipping-madm

## Preguntas frecuentes e explicacións

#### Tokens, macros e comandos

- [What is a "TeX token"?](https://www.overleaf.com/learn/latex/Articles/What_is_a_%22TeX_token%22%3F)
- [What is a TeX token list](https://www.overleaf.com/learn/latex/Articles/What_is_a_TeX_token_list)
- [How does \expandafter work: An introduction to TeX tokens](https://www.overleaf.com/learn/latex/Articles/How_does_%5Cexpandafter_work%3A_An_introduction_to_TeX_tokens)
- [https://www.overleaf.com/learn/latex/A_six-part_series%3A_How_do_TeX_macros_actually_work%3F](https://www.overleaf.com/learn/latex/A_six-part_series%3A_How_do_TeX_macros_actually_work%3F)
- [What do \makeatletter and \makeatother do](https://tex.stackexchange.com/questions/8351/what-do-makeatletter-and-makeatother-do)
- [What's the difference between \newcommand and \newcommand*?](https://tex.stackexchange.com/questions/1050/whats-the-difference-between-newcommand-and-newcommand)
- [What is the difference between \let and \def?](https://tex.stackexchange.com/questions/258/what-is-the-difference-between-let-and-def)
- [Always use \NewDocumentCommand instead of \newcommand?](https://tex.stackexchange.com/questions/98152/always-use-newdocumentcommand-instead-of-newcommand)
- [What is the use of percent signs (%) at the end of lines? (Why is my macro creating extra space?)](https://tex.stackexchange.com/questions/7453/what-is-the-use-of-percent-signs-at-the-end-of-lines-why-is-my-macro-creat)
- [What is the difference between \def and \newcommand?](https://tex.stackexchange.com/questions/655/what-is-the-difference-between-def-and-newcommand)
- [What is the difference between Fragile and Robust commands? When and why do we need \protect?](https://tex.stackexchange.com/questions/4736/what-is-the-difference-between-fragile-and-robust-commands-when-and-why-do-we-n)

### Espazados e posicionamento

- [How to globally change the spacing around equations?](https://tex.stackexchange.com/questions/69662/how-to-globally-change-the-spacing-around-equations)
- [How to decrease space above and below displayed equations?](https://tex.stackexchange.com/questions/224987/how-to-decrease-space-above-and-below-displayed-equations)
- [What commands are there for horizontal spacing?](https://tex.stackexchange.com/questions/74353/what-commands-are-there-for-horizontal-spacing)
- [How to influence the position of float environments like figure and table in LaTeX?](https://tex.stackexchange.com/questions/39017/how-to-influence-the-position-of-float-environments-like-figure-and-table-in-lat)
- [Difference between \textwidth, \linewidth and \hsize](https://tex.stackexchange.com/questions/16942/difference-between-textwidth-linewidth-and-hsize)
- [Lengths and when to use them](https://tex.stackexchange.com/questions/41476/lengths-and-when-to-use-them)

### Entornos

- [What is the difference between split, multline, align, breqn for breaking an equation into multiple lines?](https://tex.stackexchange.com/questions/239252/what-is-the-difference-between-split-multline-align-breqn-for-breaking-an-equ)

### Sistema

- [When should I use \input vs. \include?](https://tex.stackexchange.com/questions/246/when-should-i-use-input-vs-include)
- [Why is \[ ... \] preferable to $$ ... $$?](https://tex.stackexchange.com/questions/503/why-is-preferable-to)
- [Are \( and \) preferable to dollar signs for math mode?](https://tex.stackexchange.com/questions/510/are-and-preferable-to-dollar-signs-for-math-mode)
- [Where do I place my own .sty or .cls files, to make them available to all my .tex files?](https://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te)
- [What are the available "documentclass" types and their uses?](https://tex.stackexchange.com/questions/782/what-are-the-available-documentclass-types-and-their-uses)
- [Differences between LuaTeX, ConTeXt and XeTeX](https://tex.stackexchange.com/questions/36/differences-between-luatex-context-and-xetex)
- [LaTeX3: Programming in LaTeX with Ease](https://www.alanshawn.com/latex3-tutorial/)
- [From \newcommand to \NewDocumentCommand](https://www.texdev.net/2010/05/23/from-newcommand-to-newdocumentcommand/)

### Fontes e seus estilos

- [What are all the font styles I can use in math mode?](https://tex.stackexchange.com/questions/58098/what-are-all-the-font-styles-i-can-use-in-math-mode)
- ["Correct" way to bold/italicize text?](https://tex.stackexchange.com/questions/41681/correct-way-to-bold-italicize-text)
