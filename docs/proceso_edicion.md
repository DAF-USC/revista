# Proceso de edición

A edición refírese a obter un artigo escrito por un redactor e adaptalo para
que poida ser usado na revista. Esto inclúe pasar texto sen formato a LaTeX,
comprobar rutas de arquivos, arranxar espazados e asegurar unha longura
correcta, etc.

## 0. Descargar o proxecto completo da revista

O primeiro paso é conseguir unha copia completa do proxecto da revista. Hai
dous modos principais de facelo:

+ Podedes ir á [páxina de GitHub](https://github.com/fisicaUSC/revista) da
  revista e premer o botón verde que pon `CODE`, e logo na ventá desdobrada
  en `Download ZIP`. Así poderedes descargar o contido completo do proxecto en
  formato ZIP, que se pode extraer con calquera ferramenta de descompresión como
  [[7z](https://www.7-zip.org/)]. Gardade os contidos nun directorio limpo ao que
  teñades acceso cómodo.

+ (**RECOMENDADO**) Usando [[Git](https://git-scm.com/)] dende o terminal. Fai
  falla instalar a extensión de Git [[LFS](https://git-lfs.com/)], sen ela non
  poderedes descargar arquivos binarios como as imaxes ou as fontes. Con Git e
  Git LFS instalados, só hai que facer `git clone
  https://github.com/fisicaUSC/revista` o cal vai crear unha carpeta chamada
  `revista` e clonar todos os contidos dentro.

## 1. Recibir os artigos

Agora que temos o proxecto da revista descargado, fai falla obter os contidos
dos novos artigos.

Dito contido está mediado pola comisión de dirección. Os artigos para un certo
número recíbense no correo da directiva e estes están encargados de poñelos a
man do resto do equipo nunha carpeta aberta na rede, concretamente en Drive.
Cada artigo á súa vez está nunha carpeta individual con todo o contido que
compartiron os redactores. É necesario descargar dita carpeta específica e
gardala para traballar localmente.

É típico que a carpeta do artigo que se comparte teña información que é
totalmente irrelevante, como ficheiros auxiliares (p.e. `.log`, `.aux`),
arquivos de configuración propietarios (p.e. `.DS_Store`), arquivos duplicados,
subcarpetas estrañas, ... Persoalmente comezo eliminando toda esta borralla
que non sirve de nada.

## 2. Engadir o contido á revista

Neste punto temos dúas cousas:

+ O proxecto da revista descargado
+ O contido dun novo artigo descargado

O seguinte punto é engadir o artigo á revista.

Algúns redactores usan o modelo simplificado da revista, outros mandan un
`.tex` simple, algúns escriben a Writer ou semellantes. A nosa revista está
escrita en LaTeX e fai falla engadir o que mandan os redactores ao proxecto.

- **ARQUIVO PRINCIPAL**: Sempre imos ter un arquivo *principal* co texto do
  artigo. Quen usan o modelo simplificado ás veces non lle cambian o nome
  polo que se sigue a chamar `artigo_simplificado.tex`. Outros usuarios de LaTeX
  simplemente lle poñen `documento.tex` ou tal vez o propio título do artigo. No
  caso de ques escriben en Writer, haberá un só documento `.odt` ou tal vez
  `.docx`. En calquera caso, é necesario engadir os contidos do arquivo
  principal no sitio correcto do proxecto da revista. Se dito arquivo se chama
  `documento.tex` e estamos a editar a revista `006`, entón debemos copiar os
  contidos de `documento.tex` a un novo ficheiro no proxecto da revista na ruta
  exacta `revistas/006/artigo_NOMEAUTOR_INICIAISAPELIDOS.tex`. IMPORTANTE: A dito artigo hai que
  quitarlle o `\begin{document}...\end{document}`, e hai que engadirlle o macro
  \Titular ao comezo, por exemplo

  ```latex
  \Titular*% O asterisco fai que apareza ---------- estilo ---------- no índice
  {divulgacion}% ESTILO
  {Por que o bosón de Higgs non é moi <<natural>>}% TÍTULO
  {Víctor Díaz Díaz}% AUTORÍA
  {Breve explicación da relación entre o problema da xerarquía e a
  supersimetría.}% SUBTÍTULO
  ```

  Podedes ver unha explicación máis detallada de como funciona o macro
  `\Titular` na clase da revista.

- **IMAXES**: As distintas imaxes que envían deben copiarse ao proxecto da
  revista. Se estamos a editar a número `006` entón deberán gardarse en
  `revistas/006/imaxes/`. É moi importante revisar o arquivo de texto principal e
  asegurarse de que as rutas das imaxes son correctas.

- **BIBLIOGRAFÍA**: En xeral deberían mandar información bibliográfica nun
  ficheiro con extensión `.bib` que debería conter texto co seguinte formato
  aproximado

  ```bib
  @Article{caratheodory_1909,
    Title         = {Untersuchungen über die Grundlagen der Thermodynamik},
    Volume        = 67,
    ISSN          = {0025-5831, 1432-1807},
    DOI           = {10.1007/BF01450409},
    Number        = 3,
    Journal       = {Mathematische Annalen},
    Author        = {Carathéodory, C.},
    Year          = 1909,
    Month         = {September},
    Pages         = {355–386},
    Language      = {de}
  }
  ```

  O contido do `.bib` debe copiarse e engadirse ao no arquivo
  `revistas/006/bibliografia_006.bib` (ou o número que corresponda). Hai que
  ser cauto ca clave de cada referencia (no exemplo, caratheodory_1909) e evitar
  que estea repetida noutra entrada anterior.

  Ás veces a xente _non_ manda a bibliografía en dito formato senón que a
  escriben literal no propio documento, por exemplo `\noident\textit{Titulo};
  \textbf{ed. 9}; Autoría (1900)`. En tal caso, hai que pasar a información ao
  formato .bib.

## 4. Tentar compilar o novo artigo

O ficheiro principal a compilar para a revista cun certo número é (p.e. para a
004) [`revistas/004/revista_004.tex`](../revistas/004/revista_004.tex). Se dito
ficheiro inda non existe entón fai falla crealo. En xeral adoita facerse logo de
rematar un número para comezar xa a preparar o seguinte. Hai que asegurarse que
se definen os valores dos macros relevantes, inda que sexa con valores
temporais, se non a revista non se poderá compilar. Usade un número anterior
como exemplo.

En dito arquivo deben cargarse os ficheiros individuais de cada artigo, facendo
simplemente `\input{revistas/004/artigo_DIRAC.tex}`.

No terminal, estando no directorio raíz do proxecto, compílase a revista co
programa
[[latexmk](https://ctan.fisiquimicamente.com/support/latexmk/latexmk.pdf)]. Só
hai que executar

```bash
latexmk revistas/004/revista_004.tex
```

Para usuarios de Linux ofrécese unha [Makefile](../Makefile) e pode escribirse
simplemente `make numero=004`.

Neste punto, o típico é ter que arranxar os erros de compilación que poden
aparecer. Véxase [unha lista de erros típicos](erros_tipicos.md)

## 5. Unha primeira edición

- Os títulos non deben ser demasiado longos para que colla no índice. Unha
  primeira referencia son uns 60 caracteres máximo.
- Os subtítulos dos titulares deben rematar en punto.
- Non se debe abusar de certos recursos estilísticos. A énfase dunha palabra
  móstrase con `\emph{}` (itálica). Non é bo ter moitos `\textbf{}`. En xeral,
  cambialos por énfase normal.
- Cambiar todos os `\it`, `\bf`, etc. por `\textit{}`, `\textbf{}`.
- Os cambios de parágrafo créanse cunha liña en branco ou só con `\\`. Non se
  debe usar unha `\\` seguido dunha liña en branco.
- Hai que cambiar todos os `$$ ... $$` por `\[ ... \]` ou
  ```latex
  \begin{equation}
    ...
  \end{equation}
  ```
  [[tex stackexchange](https://tex.stackexchange.com/questions/503/why-is-preferable-to)]
  [[ltnews](https://ctan.javinator9889.com/macros/latex/base/ltnews.pdf)]
- As ecuacións en modo `displaymath` seguen formando parte do texto, polo que
  non se preceden con `:` e poden rematar con `.` ou `,` dependendo do caso.
- Os artigos deben ocupar un número enteiro de páxinas.
- Hai que reducir a calidade e peso das imaxes para que non ocupen demasiado.
  Unha primeira referencia é que pesen menos de 1MB, pero idealmente debería
  ser menos. Podedes usar [[GIMP](https://www.gimp.org/)] para as imaxes
  rasterizadas ou [[Inkscape](https://inkscape.org/)] para as vectoriais, ambas
  ferramentas gráficas e cunha interface da liña de comandos. Tamén se pode usar
  [[Imagemagick](https://imagemagick.org/)] dende o terminal con comandos coma
  `magick ORIXINAL.png -resize 60% -quality 72 REDUCIDA.jpg`
- En xeral, as imaxes quedan mellor se ocupan o ancho completo da columna, o
  cal se consigue con `\includegraphics[width=\linewidth]{foto.png}`. Pode ser
  necesario recortala para darlle unha forma correcta e que encaixe.

- A ser posible hai que dobrar as liñas a (aprox) 79 caracteres.
- En xeral, hai que intentar que o código sexa lexible.


## 6. Entregar un primeiro modelo aos redactores

Unha vez poidamos compilar un PDF, podemos recompilar o documento coa opción
`simple` facendo

```latex
\documentclass[simple]{revista}
```

Isto xera unha versión simplificada sen portada, índice nin contraportada. Dita
versión debe entregarse aos redactores para que dean a súa opinión.