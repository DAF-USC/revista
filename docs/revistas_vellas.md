# Como compilar unha revista vella?

O modelo e estilo da revista van cambiando pouco a pouco con cada novo número
o cal leva consigo cambios no funcionamento internos de diferentes macros de
LaTeX e da propia estrutura do proxecto. Hai varios arquivos, como a
[clase](../revista.cls), que é común a todas as revistas a pesar de que se
cambia moi a miúdo. Esto significa que se intentades compilar agora mesma a
revista 001 vaise ver cos cambios actuais e _non_ como se vía orixinalmente.
Aquí comentámosvos varias maneiras de obter a versión orixinal.

- Clonade o proxecto do repositorio oficial de GitHub, en fisicaUSC/revista
- Na terminal podedes ver o historial do proxecto con `git log --all`
- Deberiades ver nalgures punteiros co nome `tag: 004` ou o número que sexa.
  Son [[tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging)], que non
  son máis que punteiros de git típicos pero con nome e, opcionalmente,
  mensaxes e información adicional.
- Podedes desprazarvos á contribución correspondente facendo `git switch
  --detach 003` se queredes usar o número da revista, ou `git switch --detach
  d6e0707` se queredes usar o hash da contribución correspondente.
- Este proxecto usa [Git LFS](https://git-lfs.com/). Ao momento de cambiar á
  contribución indicada, deberíanse descargar automaticamente os arquivos
  binarios que falten. Se o proceso da erro, botádelle un ollo a lista de [erros
  típicos](erros_tipicos.md).
- IMPORTANTE: a función de Lua `gitInfo()` definida en
  [funcions.lua](../funcions.lua) non é compatible con ter HEAD no estado
  _dettached_, polo que debedes ir a [clase](../revista.cls) e comentar a liña
  que carga `gitInfo()`.
- En principio, xa poderiades compilar a revista _tal e como se fixo
  orixinalmente_. A única diferenza poden ser as versións dos paquetes que
  teñades instalados, pero aparte diso é a versión honesta do proxecto.
