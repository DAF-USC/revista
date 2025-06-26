## Ferramentas de utilidade varia

Aquí pretendemos gardar pequenos programas, scripts, ferramentas, etc. que nos poden facer a vida algo máis fácil.

`instalador_texlive.sh` é un programiña para descargar a distribución de TeXLive completa. Son só os comandos de https://tug.org/texlive/quickinstall.html copiados e pouco máis. TeXLive é a única distribución de La/TeX usada oficialmente polo grupo de edición da revista.

`diccionario_galego.sh` permite xerar uns arquivos `.dic` e `.aff` a partir do repositorio do proxecto trasno https://gitlab.com/trasno/hunspell-gl Ditos arquivos poden usarse con correctores ortográficos (en concreto, Hunspell) para corrixir a ortografía. É posible que no futuro se automatice (polo menos parcialmente) a corrección ortográfica (inda que non prometemos nada). Polo de agora non lle damos uso a esto

`descomenta.sh` elimina os comentarios innecesarios dos modelos do *artigo_simplificado* que nos mandan. O artigo simplificado cento e pico comentarios que usamos a modo de 'auto documentación'. A xente, usa dito modelo de artigo e mete ahí seu texto. Ao final, para engadir o artigo á revista, temos que quitar ese *cento e pico* comentarios, ademáis dos `\begin{document}` e algun macro máis. Este script faino de golpe
