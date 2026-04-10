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
