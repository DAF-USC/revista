<div align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/user-attachments/assets/8ff1b3cd-2f69-4787-96ac-2d010aca5228" />
    <source media="(prefers-color-scheme: light)" srcset="https://github.com/user-attachments/assets/2e5b6e60-a45c-4bcc-989a-217080c9db41" />
    <img alt="logo-momentum" src="https://github.com/user-attachments/assets/2e5b6e60-a45c-4bcc-989a-217080c9db41" />
  </picture> <h1></h1>
</div>

*Momentum*, de carácter científico, busca ser un medio de comunicación tanto
dentro coma fóra da Facultade de Física, coa finalidade de fomentar e cultivar
o interese e a curiosidade pola física e a ciencia. Por medio de artigos de
divulgación, novas científicas, entrevistas a personalidades, achegas sobre a
historia e filosofía da ciencia, e mesmo algún que outro artigo de corte
popular, a revista pretende ofrecer unha visión ampla e accesíbel.

Este proxecto, impulsado polo estudantado de Física da USC, naceu no ano 2025
co obxectivo de crear un recuncho de expresión que vaia máis aló do
estritamente académico, aberto ás xeracións actuais, pasadas e vindeiras.

A equipa de *Momentum* agradece profundamente calquera suxestión. Non dubidedes
en deixar a vosa pegada!

Exemplares anteriores: [Revista Estudantil Momentum](https://www.usc.gal/gl/centro/facultade-fisica/revista-estudantil-momentum)

Contacto: [revistafisicaUSC@gmail.com](mailto:revistafisicaUSC@gmail.com)

## :memo: Como participar na revista?

Hai varias formas de participar, segundo os intereses e inquedanzas de cada persoa:

- **Produción de contidos**: escribir artigos, entrevistas, pasatempos...,
xa sexa como colaboración puntual ou de maneira máis continuada. As contribucións
envíanse a [revistafisicaUSC@gmail.com](mailto:revistafisicaUSC@gmail.com), en
formato plano ou LaTeX.

- **Comisión de Edición**: encárgase de implementar o deseño visual, garantir a
reproducibilidade dos códigos e coidar que o formato final sexa limpo, coherente
e profesional.

- **Comisión de Corrección**: vela pola calidade lingüística da revista a través da
tradución e localización dos contidos, así como da corrección textual.

- **Comisión de Produción**: xestiona recursos, promove a revista, mantén o contacto
con institucións e colaboradores externos e procura apoios para garantir a
lonxevidade do proxecto.

- **Comisión de Dirección**: coordina o proxecto no seu conxunto, vela polo
mantemento da identidade creativa da revista, coordina a sección de entrevistas
e aproba os artigos enviados.

O proxecto funciona grazas á participación aberta: non importa se colaboras unha
vez ou varias, toda achega é valiosa. Se tes dúbidas ou ideas, podes escribirnos
ao correo ou preguntar nos grupos da DAF e da revista!

## :mag: Índice de contidos
1. [Estrutura do repositorio](#card_file_box-estrutura-do-repositorio)
2. [Estrutura das revistas](#newspaper-estrutura-das-revistas)
   - [Revistas](#revistas)
   - [Artigos](#artigos)
3. [Artigo simplificado](#page_facing_up-artigo-simplificado)
4. [Compilación](#toolbox-compilación)
   - [Dependencias](#dependencias)
   - [Como compilo isto?](#como-compilo-isto)
5. [Outros enlaces e documentos](#books-outros-enlaces-e-documentos)

## :card_file_box: Estrutura do repositorio

O repositorio contén:

- `revista.cls` - Clase de LaTeX para a revista.
- `momentum-citacions.csl` - Estilo de citas bibliográficas do Citation Style Language.
- `funcions.lua` - Códigos feitos en lua relacionados coa compilación e o control de versións.
- `latexmkrc` e `Makefile` - Axudas para compilar a revista.

Cartafoles principais:

- `revistas/` - Contén as edicións da revista, cada unha nun subcartafol numerado
(`001`, `002`, ...). Cada edición inclúe o ficheiro principal `.tex`, os artigos
correspondentes `.tex`, a base de datos bibliográfica `.bib` e un cartafol `imaxes/`.
```
.
└── revistas/
   ├── 001/
   │  ├── revista_001.tex
   │  ├── bibliografia_001.bib
   │  ├── artigo_TITULO.tex
   │  └── imaxes/
   │     ├── portada_001.png
   │     └── unha_imaxe.jpg
   ├── 002
   │  └── ...
   └── ...
```
- `logos/` - Logos da universidade, facultade e institucións colaboradoras en PDF.
- `fontes/` - Tipos de letra empregados na revista.
- `modelo/` - Cartafol co exemplo de artigo simplificado e as súas dependencias.
- `trebellos/` - Recursos auxiliares e outros scripts da equipa de edición.

<p align="right"><a href="#mag-índice-de-contidos">(voltar ao índice)</a></p>

## :newspaper: Estrutura das revistas
### Revistas

Os **arquivos comúns** a todas as revistas, como o estilo da revista, `revista.cls`,
e o estilo bibliográfico, `momentum-citacions.csl`,
deben estar na raíz do proxecto.

Cada **número da revista** ten o seu propio cartafol en [`revistas/`](./revistas),
e dentro destes é onde se gardan os arquivos específicos de cada revista, como
os artigos e as imaxes.

O **arquivo principal** de cada revista noméase como, se é a revista número 001,
`revistas/001/revista_001.tex`. Este é o arquivo principal a compilar, e ten a
forma seguinte (aproximada):

```latex
% Opcións: simple (só artigos) ou completa (portada, índice e contraportada)
\documentclass[completa]{revista}

% Comandos para definir a información de cada revista
\Numero{001}
\Data{Xaneiro do 1900}
\ImaxePortada{./revistas/001/imaxes/pedra.jpg} % Imaxe que aparecerá na portada
\ComentarioImaxePortada{Comentario que acompaña a imaxe.}
\Bibliografia{revistas/001/bibliografia_001.bib}
\CorResalte{ff0000} % Cor específico da revista, en HTML HEX
\CorTextoEnResalte{000000} % Cor do texto na portada e índice
\Participantes{
    {\Large \textbf{Dirección:}}     \\[0.5cm]
        Carl Sagan                   \\[0.2cm]
    {\Large \textbf{Edición}}        \\[0.5cm]
        Albert Einstein              \\[0.2cm]
    {\Large \textbf{Diseño de Logo}} \\[0.5cm]
        Dirac                        \\[0.2cm]
}
\Despedida{Adeus!}
\Agradecementos{Grazas a Todos!}

\begin{document}

\input{./revistas/001/artigo_HISTORIA_DA_CIENCIA.tex}
\input{./revistas/001/artigo_SALSEO_NA_FACULTADE.tex}

\end{document}
```

Os comandos `\Numero`, `\Data`, `\ImaxePortada`, `\ComentarioImaxePortada`,
`\CorResalte`, `\CorTextoEnResalte`, `\Participantes`, `\Despedida` e `\Agradecementos`,
deben estar presentes en cada revista xa que conteñen información específica
de cada número. No tocante a imaxe da portada, cómpre que sexa *exactamente*
cadrada para non ter problemas na compilación, isto pode facerse
con programas como [Inkscape](https://inkscape.org/), [Gimp](https://www.gimp.org/)
ou [ImageMagick](https://imagemagick.org/)

Adicionalmente, tamén se definen os macros `\LinkRepositorio`, `\Correo`,
`\Drive`, `\WhatsApp` inda que, nun principio, conteñen información
que non se vai cambiar entre números. Para mostrar calquera destes valores só
hai que prefixar o macro con imprime, e.g. `\imprimeCorreo` ou `\imprimeNumero`.

Máis información sobre a implementación e particularidades na [clase da revista](./revista.cls).

<p align="right"><a href="#mag-índice-de-contidos">(voltar ao índice)</a></p>

### Artigos

Os artigos gárdanse no mesmo directorio que o `revista_001.tex` correspondente
e inclúense no arquivo principal usando `\input{artigo.tex}`. Teñen
a seguinte forma:

```LaTeX
% O comando \Titular permite definir a información concreta de cada artigo

\Titular*          % O asterisco fai que apareza unha sección nova no Índice
{divulgacion}      % (Obrigatorio) Estilo  Máis abaixo pódense atopar os estilos
                   %                       dispoñíbeis.
{Título do artigo} % (Obrigatorio) Título
{Axl Rose}         % (Opcional)    Autoría
{Subtítulo}        % (opcional)    Preferíbelmente non moi longo para que colla ben ^_^

\begin{multicols}{2} % Para ter varias columnas

\subsection*{Introdución} % As distintas partes sepáranse con 'subsections' SEMPRE

Bos días anduriños, neste artigo ensinareivos como facer fisión nuclear caseira
cun barreño e unha fonte de Plutonio-239 nos baños do PDI da facultade.

...

\subsection*{Agradecementos}
No primeiro lugar, denunciar á DAF polo desamparo económico e agradecer a
tódolos marabillosos profesores que tiven ata o momento. Por suposto, agradecer
tamén a [REDACTADO] por axudarme a sacar a fonte do laboratorio de nuclear.
Vémonos na próxima!!

\printbibliography
\end{multicols}
```
O macro `\Titular` é o centro de cada artigo: cambia as seccións da revista,
reinicia numeracións, dá formato aos encabezados, define nomes...

Algunhas cousas a ter en conta:

- Os encabezados que se poden usar son `divulgacion`, `historia`,
  `actualidadeFacultade`, `actualidadeCientifica`, `filosofia`, `profesorado`,
  `entrevistas`, `programacion`, `pasatempos`, `anuncios`, `opinion`,
  `miscelanea` e `reportaxes`. Podemos engadir máis baixo demanda.
- Se queremos engadir unha nova sección ao índice, debemos usar o comando
  `\Titular*`, co asterisco.
- O macro do `\Titular` ten catro opcións (estilo, título, autor e subtítulo),
  das cales só as dúas primeiras son obrigatorias, as outras dúas poden quedar
  en branco.

<p align="right"><a href="#mag-índice-de-contidos">(voltar ao índice)</a></p>

## :page_facing_up: Artigo simplificado

Existe un modelo de artigo simplificado para a xente que queira utilizalo
no proceso de creación de contido ou que queira fedellar coa clase da revista.
O artigo simplificado non require preocuparse pola estrutura do proxecto nin pola
inicialización dos macros, polo que debería ser máis rápido de compilar.
Tamén inclúe numerosos comentarios sobre as formas preferidas para engadir
imaxes, citas e referencias.

Podedes encontralo nos [*releases*](https://github.com/DAF-USC/revista/releases) da revista.

<p align="right"><a href="#mag-índice-de-contidos">(voltar ao índice)</a></p>

## :toolbox: Compilación

### Dependencias

Este proxecto usa [LuaLaTeX](https://www.luatex.org/) para o proceso de
compilación, xa que nos dá vantaxes no uso de distintas tipografías, dá
acceso a `\directlua`, opcións de depurado usando o paquete
[lua-visual-debug](https://www.ctan.org/search?phrase=lua-visual-debug), e máis
facilidades á hora de crear documentos accesíbeis.
As tipografías usadas están incluídas no directorio `fontes/`,
polo que non é necesario instalalas.

Dependendo de onde se vaia compilar o proxecto hai dúas rutas:

- Instalación local:
  - Para os paquetes, é recomendábel unha **instalación completa de TeX Live 2025**,
xa que é a única versión que aseguramos que funcione e está dispoñíbel en tódolos
sistemas operativos.
  - En Windows e macOS, MiKTeX descarga a última versión dos paquetes segundo
sexan necesarios dende o repositorio oficial, CTAN, polo que tamén debería
funcionar.
  - Se ides facer **git clone** do repositorio precisaredes instalar tamén `git-lfs`,
  que é o que empregamos para evitar gardar copias completas de todos os ficheiros
  pesados (imaxes, PDFs, fontes) en cada versión. Usando LFS, descárganse só as
  versións actuais e mantéñense punteiros ás anteriores, o que reduce moito o
  tamaño do repo. Se clonades o repositorio sen telo instalado, en vez dos
  ficheiros reais, teredes eses punteiros de texto e o proxecto dará erros na
  compilación.
- Execución en liña (Overleaf):
  - No Overleaf ides a `Menu -> Settings` e cambiades `Compiler: LuaLaTeX` e
  `TeX Live version: 2024`.
  - **Ollo!** Coa última actualización reduciuse o tempo de compilación, co que é
  posíbel que non poidades compilar o proxecto enteiro, só artigos individuais
  ou, en ocasións, nin iso.

Solución de erros:

- (Só TeX Live) Usamos o paquete `citation-style-language` para a bibliografía.
Recentemente, actualizouse para solucionar un erro relacionado coa bibliografía
dependente da sección (cortesía do noso [@deivisCode](https://github.com/deivisCode)),
e esta versión aínda non está en TeX Live. Polo que, para que funcione
correctamente, teredes que instalar o paquete manualmente no voso *texmf tree*.
Para iso, descargade o [paquete do CTAN](https://ctan.org/pkg/citation-style-language)
e descomprimídeo no seguinte directorio (previamente creado):
    - Linux: `$HOME/texmf/tex/latex/csl`
    - Windows: `C:\Users\<o-voso-usuario>\texmf\tex\latex\csl`
    - macOS: `~/Library/texmf/tex/latex/csl`


<p align="right"><a href="#mag-índice-de-contidos">(voltar ao índice)</a></p>

### Como compilo isto?

A forma máis sinxela de descargar e compilar o proxecto é

1. Neste repositorio, premer o botón verde de *CODE* e descargar o ZIP.
2. Compilalo:
   - (Local) Tras descomprimilo, abrir o proxecto no voso editor de confianza
   e compilar o ficheiro da revista, por exemplo `revistas/001/revista_001.tex`.
   - (Overleaf) Importar o ZIP e no panel esquerdo seleccionar o ficheiro
   principal, por exemplo `revistas/001/revista_001.tex`.

Alternativamente, se tedes preferencias máis minimalistas, podedes compilar as
revistas no terminal co `latexmk`:

```bash
latexmk ./revistas/001/revista_001.tex
```
Tamén deixamos un `Makefile` moi conveniente para os que usen Linux e similares,
co que é posíbel facer:

```bash
make numero=001 # Compilar a revista número 001
make limpa      # Limpar os arquivos auxiliares
make modelo     # Obter un ZIP cos arquivos para o artigo simplificado
```

Por defecto, ca configuración de `latexmk` adxunta, ao compilar unha revista
o PDF que se xere gárdase no directorio `.pdf/` e os arquivos auxiliares
en `.aux/`.

<p align="right"><a href="#mag-índice-de-contidos">(voltar ao índice)</a></p>

## :books: Outros enlaces e documentos
O repositorio ten unha [Wiki](https://github.com/DAF-USC/revista/wiki) na que
se inclúen ligazóns útiles e documentos relevantes da revista.

<p align="right"><a href="#mag-índice-de-contidos">(voltar ao índice)</a></p>

## Licenzas

Tipos de letra: 
- [Latin Modern](http://www.gust.org.pl/fonts/licenses/GUST-FONT-LICENSE.txt) Licenza GUST (baseada en LPPL) 
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/blob/master/LICENSE) Licenza MIT 
