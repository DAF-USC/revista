## Ferramentas de utilidade varia

Aquí pretendemos gardar pequenos programas, scripts, ferramentas, etc. que nos poden facer a vida algo máis fácil.

- `instalador_texlive.sh` é un programiña para descargar a distribución de TeXLive completa. Son só os comandos de https://tug.org/texlive/quickinstall.html copiados e pouco máis. TeXLive é a única distribución de La/TeX usada oficialmente polo grupo de edición da revista.

- `diccionario_galego.sh` permite xerar uns arquivos `.dic` e `.aff` a partir do repositorio do proxecto trasno https://gitlab.com/trasno/hunspell-gl Ditos arquivos poden usarse con correctores ortográficos (en concreto, Hunspell) para corrixir a ortografía. É posible que no futuro se automatice (polo menos parcialmente) a corrección ortográfica (inda que non prometemos nada). Polo de agora non lle damos uso a esto.

- `descomenta.sh` elimina os comentarios innecesarios dos modelos do *artigo_simplificado* que nos mandan. O artigo simplificado ten cento e pico comentarios que usamos a modo de 'auto documentación'. A xente usa dito modelo de artigo e mete aí seu texto. Ao final, para engadir o artigo á revista, temos que quitar eses *cento e pico* comentarios, ademais dos `\begin{document}` e algún macro máis. Este script faino de golpe.

- `commit-msg.sh` é un hook de git que lanza un erro cando se insire un commit que non segue o formato dos [Convetional Commits](https://github.com/iuricode/padroes-de-commits). Para empregalo: renomease o ficheiro para eliminar a extensión `commit-msg.sh -> commit-msg` e movémolo ao cartafol `.git/hooks/` do repositorio no que queiramos utilizalo.

### Patróns de commits

Os *conventional commits* son un conxunto de regras para estandarizar as mensaxes de commit co obxectivo facilitar o seguimento e rastrexabilidade dos cambios. O que pode ser útil para automatizar procesos ou, simplemente, facer o historial máis comprensible.

Segundo as necesidades do proxecto, utilízanse uns ou outros tipos de commits. Para a revista decidimos empregar os habituais, mais modificando lixeiramente as definicións para adaptalas ás nosas necesidades.

Un **commit xenérico** terá a seguinte estrutura:
```
<tipo>(<contexto opcional>): <descrición>
```
E defínense os seguintes **tipos**:
```
  novo:   Engadir unha nova funcionalidade ou artigo.
  apaño:  Corrección dun bug ou errata.
  docs:   Cambios na documentación (README, comentarios, etc.).
  estilo: Cambios de estilo no código (formato, espazos, punto e coma, etc.).
  orde:   Reestruturación do código sen engadir funcionalidades nin corrixir bugs.
  rend:   Melloras no rendemento.
  comp:   Cambios que afectan o sistema de compilación ou dependencias externas.
  tarefa: Tarefas de mantemento que non afectan ao código principal (scripts, hooks, .gitignore, etc.).
  tornar: Reverter un commit anterior.
```
Ademais, cómpre ter en conta que
- O **contexto** é *opcional*, e pode indicar a revista ou ficheiro afectado.
- Os commits que introduzan **cambios críticos** deben ser indicados cun ! antes do :.
- Co fin de facer o proceso máis intuitivo, e un pouco por desprezo á lingua franca tamén, traducíronse os tipos de Conventional Commits. A equivalencia coa terminoloxía habitual é `novo -> feat`, `apaño -> fix`, `estilo -> style`, ` orde -> refactor`, `rend -> perf`, `comp -> build`, `tarefa -> chore` e `tornar -> revert`.

Por último, deixamos algúns **exemplos de uso**:
```
 novo(002): engadir artigo DARKO
 apaño(003): corrixir erratas varios artigos
 apaño(revista)!: definición imaxe portada
 docs(readme): actualizar instrucións de instalación
```
Para máis referencias, tamén podedes botarlle unha ollada a proxectos semellantes. Por exemplo, o historial de commits de [An Infinitely Large Napkin](https://github.com/vEnhance/napkin/commits/).
