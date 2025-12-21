# Lista de erros típicos ao compilar a revista

### Que fago se non me compila a revista?

O proceso típico para arranxar un erro é explorar o arquivo
`.aux/revista_<numero>.log`. As mensaxes de erro en dito arquivo non son moi
*«humanas»*, pero é o mellor que hai. No voso editor de confianza, buscade
palabras clave como `error`, `undefined` ou `traceback` e lede as zonas do
texto próximas.

### As fontes non están

Este proxecto usa o sistema [Git LFS](https://git-lfs.com/) pra manexar os
arquivos binarios, e entre eles as fontes. Asegurádevos de ter instalado Git
LFS.

Pode ocorrer que Git LFS dea un erro do tipo `smudge error`. Neste caso
desactivade os hooks de LFS con `git lfs uninstall`, e volvede activalos con
`git lfs install --skip-smudge`. Agora, cada vez que creedes un punteiro novo a
unha certa contribución teredes que facer `git lfs pull`.
