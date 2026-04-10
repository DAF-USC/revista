# Lista de erros típicos ao compilar a revista

### As fontes non están

Este proxecto usa o sistema [Git LFS](https://git-lfs.com/) para manexar os
arquivos binarios, e entre eles as fontes. Asegurádevos de ter instalado Git
LFS.

Pode ocorrer que Git LFS dea un erro do tipo `smudge error`. Neste caso
desactivade os hooks de LFS con `git lfs uninstall`, e volvede activalos con
`git lfs install --skip-smudge`. Agora, cada vez que creedes un punteiro novo a
unha certa contribución teredes que facer `git lfs pull`.
