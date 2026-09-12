# Proceso de edición

A edición refírese a obter un artigo escrito por un redactor e adaptalo para
que poida ser usado na revista. Esto inclúe pasar texto sen formato a Typst,
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

## 2. Decisións editoriais
- Cada artigo comeza con:
  ```typst
  #show Artigo.with(
      titulo: [Título to wapo],            // obrigatorio
      autoria: [Quen o escribiu?]          // opcional
      subtitulo: [Unha breve explicación], // opcional,
      estilo: "PROGRAMACIÓN e HISTORIA"    // obrigatorio
  )
  ```

- Os artigos van a dúas columnas. Pode facerse con
  ```typst
  #columns[
      Contido do artigo, bla bla bla
  ]
  ```
  ou dunha tacada, para TODO o artigo de golpe
  ```typst
  #show: columns
  Contido do artigo, bla bla bla
  ```

- Para poñer algo _fora_ das dúas columnas, podemos pechar a función `columns`
  ```typst
  #columns[
      Contido do artigo, bla bla bla
  ]
  ISTO ESTÁ FORA DAS DÚAS COLUMNAS
  #columns[
      Contido do artigo, bla bla bla
  ]
  ```
  ou usar `place(top, float: true, scope: "parent")`:
  ```typst
  #columns[
      Contido do artigo, bla bla bla
      #place(
          top, float: true, scope: parent,
          figure(image("miña/imaxe/bonita.png")) // Aparece afora das columnas
      )
  ]
  ```
  ou, usando `show`
  ```typst
  #show: columns
  #place(
      top, float: true, scope: parent,
      figure(image("miña/imaxe/bonita.png")) // Aparece afora das columnas
  )
  ```
  No caso de usar `place(...)`, estamos limitados a que as figuras floten arriba ou abaixo de todo da páxina

- As imaxes, polo xeral, deberían ocupar o ancho completo da columna, con `width: 100%`, as figuras deberían ter pés con `caption`, e se queremos referencialas despois, poñémoslle unha áncora con `<fig:figura_bonita>`.
  ```typst
  #figure(
      image(width: 100%, "miña/imaxe/bonita.png"),
      caption: [Pe da figura],
  ) <fig:figura_bonita>
  ```

- As matemáticas na liña escríbense con `$...$`, (sen espazos despois do primeiro `$` nin antes do último `$`), e son irrompibles (non se parten entre liñas)
  ```typst
  sabemos que se $a not.eq 0$ entón $exists a^(-1)$...
  ```
  As matemáticas en modo bloque escríbense deixando espazos cos `$`'s, e poden referenciarse despois se lle poñemos unha áncora
  ```typst
  Seguindo a definición seguinte
  $ T^p_q in Gamma (cal(M), V^(times.o q) times.o (V^*)^(times.o p)) $ <ec:verdade>
  sabemos que un tensor é un vector
  ```
  Polo xeral, se unha ecuación ocupa máis do 50% do ancho dunha liña, debe poñerse en modo bloque, así evítase ter unha ecuación moi longa e irrompible nunha liña, o que se vería mal.

- Para referenciar cousas pode usarse `@` para referenciar calquera cousa
  ```typst
  tal e como vimos no libro @libro, a ecuación @ec:verdade é correcta
  ```
  Pode mostrarse un suplemento (un _locator_) con `@nome[suplemento]`. Se o nome que se quere referenciar ten algún caracter raro, pode usarse `#cite()`
  ```typst
  isto é unha cita rara #cite(label("nome/raro"))
  ```
  Neste caso, o suplemento ponse con `#cite(<label>, supplement: [abcd])`
- As citas textuais na liña escribense con
  ```typst
  tal e como dicía unha amiga miña, #quote[preto do monte Pío hai un conxunto de auga]
  ```
  e para que estén en modo bloque, simplemente
  ```typst
  tal e como dicía unha amiga miña, #quote(block: true, [preto do monte Pío hai un conxunto de auga])
  ```
  En calquera caso, pode engadirse o argumento `attribution: [Marea]` para engadir _quen_ fixo a cita.
- As comiñas en galego son `«..»` e dentro desas, `"..."`. Polo xeral, as comiñas úsanse para as citas (punto anterior) e xa se engaden automáticamente se usamos a función `#quote`. Se queremos usar comiñas en calquera outra situación, debería, no código, usarse literalmente `"..."` e logo `'...'`. Véxase a documentación das [[smarquotes](https://typst.app/docs/reference/text/smartquote/)]
