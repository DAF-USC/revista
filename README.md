<div align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/user-attachments/assets/8ff1b3cd-2f69-4787-96ac-2d010aca5228" />
    <source media="(prefers-color-scheme: light)" srcset="https://github.com/user-attachments/assets/2e5b6e60-a45c-4bcc-989a-217080c9db41" />
    <img alt="logo-momentum" src="https://github.com/user-attachments/assets/2e5b6e60-a45c-4bcc-989a-217080c9db41" />
  </picture> <h1></h1>
</div>

*Momentum*, de carácter científico, procura ser un medio de comunicación tanto dentro
coma fóra da Facultade de Física, coa finalidade de fomentar e cultivar o interese
e a curiosidade pola física e pola ciencia. Por medio de artigos de divulgación, novas
científicas, entrevistas a personalidades, achegas sobre a historia e filosofía da ciencia,
e mesmo algún que outro artigo de corte popular, a revista pretende ofrecer unha visión ampla
e accesíbel.

Este proxecto, impulsado polo estudantado de Física da USC, naceu no ano 2025
co obxectivo de crear un recuncho de expresión que vaia máis aló do estritamente
académico, aberto ás xeracións actuais e tamén ás vindeiras.

A equipa de *Momentum* está aberta a calquera suxestión. Non dubidedes en deixar
a vosa pegada!

Os exemplares anteriores pódense consultar aquí: [Revista Estudantil Momentum](https://www.usc.gal/gl/centro/facultade-fisica/revista-estudantil-momentum)

Contacto: [revistafisicaUSC@gmail.com](mailto:revistafisicaUSC@gmail.com)

## Como participar na revista?

Hai varias formas de participar en *Momentum*:
- **Produción de contidos**: escribir artigos, entrevistas, textos de divulgación...,
xa sexa como colaboración puntual ou de maneira máis continuada.   As contribucións
envíanse a [revistafisicaUSC@gmail.com](mailto:revistafisicaUSC@gmail.com), en
formato plano ou en `.tex`.

- **Comisión de Edición**: encárgase do deseño visual, da corrección lingüística e
do formato final da revista.

- **Comisión de Produción**: busca recursos, promove a revista e mantén o contacto
con institucións e colaboradores externos.

- **Comisión de Dirección**: coordinar o proxecto no seu conxunto, velar polo
mantemento da esencia creativa da revista, coordinar a sección de entrevistas
e aprobar os artigos enviados.

O proxecto funciona grazas á participación aberta: non importa se colaboras unha
vez ou varias, toda achega é valiosa. Se tes dúbidas ou ideas, podes escribirnos
ao correo ou preguntar nos grupos da DAF e da revista!

## Índice de contidos
1. [Estrutura do repositorio](#estrutura-do-repositorio)
2. [Estrutura das revistas](#estrutura-das-revistas)
   - [Revistas](#revistas)
   - [Artigos](#artigos)
   - [Portada](#portada)
   - [Imaxes](#imaxes)
3. [Compilación](#compilación)
   - [Algunhas dependencias](#algunhas-dependencias)
   - [Pero, como compilo isto?](#pero-como-compilo-isto)

## Estrutura do repositorio

O repositorio contén:

- `revista.cls` - Clase de LaTeX para a revista.
- `american-physics-society.csl` - Estilo de citas bibliográficas do Citation Style Language.
- `funcions.lua` - Funcións feitas en lua relacionadas coa compilación e o control de versións.
- `bibliografia.bib` - Base de datos bibliográfica.
- `latexmkrc` e `Makefile` - Axudas para compilar a revista.

Cartafoles principais:

- `revistas/` - Contén as edicións da revista, cada unha nunha subcarpeta numerada
(`001`, `002`, ...). Cada edición inclúe o ficheiro principal `.tex`, os artigos
correspondentes `.tex` e unha carpeta `imaxes/`.
```
.
└── revistas/
   ├── 001/
   │  ├── revista_001.tex
   │  ├── artigo_TITULO.tex
   │  └── imaxes/
   │     ├── portada_001.png
   │     └── unha_imaxe.jpg
   ├── 002
   │  └── ...
   └── ...
```
- `logos/` - Logos da universidade, facultade e institucións colaboradoras en `.pdf`.
- `modelo/` - Cartafol co exemplo de artigo simplificado e as súas dependencias.
- `trebellos/` - Recursos auxiliares e outros scripts da equipa de edición.

<p align="right"><a href="#índice-de-contidos">(voltar ao índice)</a></p>

## Estrutura das revistas
### Revistas

Os arquivos comúns a todas as revistas, como o estilo da [revista](./revista.cls)
e o estilo bibliográfico [American Physics Society](./american-physica-society.csl),
están na raíz do proxecto.

Cada número da revista ten o seu propio cartafol en [`revistas/`](./revistas), 
e dentro destes é onde se gardan os arquivos específicos de cada revista, como 
os artigos e as imaxes.

O arquivo principal de cada revista noméase como, se é a revista *001*,
`revistas/001/revista_001.tex`. Este é o arquivo principal a compilar, e ten a
forma seguinte (aproximada):

```latex
\documentclass[completa]{revista}
% Opcións: simple (só artigos) ou completa (portada, índice e contraportada)

% Comandos para definir a informacion de cada revista
\Numero{001}
\Data{Xaneiro do 1900}
\ImaxePortada{./revistas/001/imaxes/cern.png} % Imaxe que aparecerá na portada
\ComentarioImaxePortada{ Comentario que acompaña a imaxe. }
\CorResalte{ff0000} % Cor específico da revista, en HTML HEX
\CorTextoEnResalte{000000} % Cor texto na portada e índice
\Participantes{
    {\Large \textbf{Dirección:}}     \\[0.5cm]
        Carl Sagan                   \\[0.2cm]
    {\Large \textbf{Edición}}        \\[0.5cm]
        Albert Einstein              \\[0.2cm]
    {\Large \textbf{Diseño de Logo}} \\[0.5cm]
        Dirac                        \\[0.2cm]
}
\Despedida{ Adeus! }
\Agradecementos{ Grazas a Todos! }

\begin{document}

\input{./revistas/001/artigo_HISTORIA_DA_CIENCIA.tex}
\input{./revistas/001/artigo_apelido_SALSEO_NA_FACULTADE.tex}

\end{document}
```

Os comandos `\Numero`, `\Data`, `\ImaxePortada`, `\ComentarioImaxePortada`,
`\CorResalte`, `\CorTextoEnResalte`, `\Participantes`, `\Despedida` e `\Agradecementos`,
deben usarse en cada revista xa que conteñen información específica para cada
número. Máis información na [clase da revista](./revista.cls).

Adicionalmente, tamén se definen os macros `\LinkRepositorio`, `\Correo`, `\Drive`, `\WhatsApp` inda que, nun principio, conteñen información
que non tería sentido cambiar entre os números.

Para mostrar calquera deses valores só hai que prefixar o macro con imprime,
e.g. `\imprimeCorreo` ou `\imprimeNumero`.

<p align="right"><a href="#índice-de-contidos">(voltar ao índice)</a></p>

### Artigos

Gárdanse no mesmo directorio que o `revista_001.tex` correspondente,
simplemente inclúense no arquivo principal usando `\input{artigo.tex}`. Teñen
a forma seguinte:

```latex
% O comando \Titular permite definir a información concreta de cada artigo

\Titular*          % O asterisco fai que apareza unha sección nova no Índice
{divulgacion}      % Estilo. Opcións: divulgacion, historia, actualidadeFacultade,
                   %                 actualidadeCientifica, filosofia, profesorado,
                   %                 entrevistas, programacion, pasatempos, anuncios
{Título do artigo} % (Obligatorio) Título
{Axl Rose}         % (Opcional) Autor
{Subtítulo}        % (opcional) Preferíbelmente non moi longo para que colla ben ^_^

\begin{multicols}{2} % Para ter varias columnas

% As distintas partes sepáranse con 'subsections' SEMPRE
\subsection*{Introdución}

Bos días anduriños, neste artigo ensinareivos como facer fisión nuclear caseira
cun barreño e unha fonte de Plutonio-239 nos baños do PDI da facultade.

...

\subsection*{Agradecementos}
No primeiro lugar, agradecer á DAF pola axuda económica e a tódolos marabillosos
profesores que tiven ata o momento. Por suposto, agradecer tamén a [REDACTADO]
por axudarme a sacar a fonte do laboratorio de nuclear. Vémonos na próxima!!

\printbibliography
\end{multicols}
```
O macro `\Titular` é o centro de cada artigo, o cal cambia cada sección,
numeracións, formatos dos encabezados, define nomes... Máis información na clase
da revista.

Algunhas cousas a ter en conta:
- Os encabezados que se poden usar son `divulgacion`, `historia`, `actualidadeFacultade`,
`actualidadeCientifica`, `filosofia`, `profesorado`, `entrevistas`, `programacion`,
`pasatempos` e `anuncios`. Podemos engadir máis baixo demanda!
-  Se queremos engadir unha nova sección ao índice, debemos usar o comando
`\Titular*`, co asterisco.
- O macro do `\Titular` ten catro opcións (estilo, título, autor e subtítulo),
das cales só as dous primeiras son obrigatorias, as outras dúas poden quedar
en branco.

<p align="right"><a href="#índice-de-contidos">(voltar ao índice)</a></p>

<!--
### Portada

Cada número ten unha portada distinta. A imaxe correspondente
defínese en cada `revista_001.tex` no comando `\ImaxePortada`. Cómpre que a imaxe
sexa *exactamente* cadrada para non ter problemas na compilación, isto pode facerse
con programas como [Inkscape](https://inkscape.org/) ou [Gimp](https://www.gimp.org/).

### Imaxes

Cada revista ten as imaxes gardadas nun subcartafol ao lado do documento
correspondente. Para engadir imaxes usamos:
```latex
\begin{figure}[H]
    \centering
    \includegraphics[width=0.65\linewidth]{imaxe_bonita.jpeg}
    \caption{Texto a pe de paxina, interesante...}
    \label{im:exemplo}
\end{figure}
```
Neste proxecto usamos o sistema [GIT-LFS](https://git-lfs.com/) para manexar
arquivos binarios, entre os cales están as imaxes. Inda así, é recomendábel que
non sexan demasiado grandes. Podedes usar [Gimp](https://www.gimp.org/) ou,
como fago eu, [convert](https://imagemagick.org/), para reducirlles algo o
tamaño.

-->
## Compilación

### Algunhas dependencias

Este proxecto usa [LuaLaTeX](https://www.luatex.org/) para o proceso de
compilación, xa que nos da vantaxes no uso de distintas tipografías, danos
acceso a `\directlua`, opcións de depurado usando
[lua-visual-debug](https://www.ctan.org/search?phrase=lua-visual-debug), e máis
facilidades á hora de crear documentos accesíbeis.

As tipografías usadas están incluídas no directorio [`fontes`](./fontes/),
polo que non é necesario instalalas.

Para os paquetes e resto de dependencias, é recomendábel unha instalación
completa de TeXLive, inda que seguramente MiKTeX tamén funcione. Na clase da
revista inclúese un `\listfiles` polo que cada vez que se compila un documento
deberían aparecer listados todos os ficheiros `*.sty` e similares que se están
usando dentro da logfile.

<p align="right"><a href="#índice-de-contidos">(voltar ao índice)</a></p>

### Pero como compilo isto?

Quen use sistemas online como Overleaf, poden simplemente descargar o proxecto
completo premendo no botón grande e verde na páxina principal que pon **CODE**,
e descargando un `.zip`. Este pode importarse normalmente a overleaf.
Recordade seleccionar no panel esquerdo o arquivo principal, que será,
por exemplo, `revistas/001/revista_001.tex`

Dado que o proxecto non está moi optimizado, fixen un arquivo simplificado
chamado [`artigo_simplificado.tex`](./artigo_simplificado.tex) o cal se pode
compilar sen portada nin contraportada. Debería ser máis sinxelo de usar porque
non hai que preocuparse pola estrutura deste proxecto, nin pola inicialización
dos macros; e debería ser algo máis rápido de compilar por ser máis simple. O
propio arquivo está documentado asique quen sexa curioso que o abra e o lea.

Por outro lado, para as persoas sen medo a usar un ordenador só hai que
escribir na termianl, en Linux

```bash
latexmk ./revistas/001/revista_001.tex
```
Esto debería funcionar tamén en windows con Powershell 5 ou 7 (creo)
Tamén se adxunta unha Makefile para os que usen Linux e similares. É posíbel facer

```bash
make numero=001 # compilar a revista numero 001
make limpa      # limpar os arquivos auxiliares
```

Por defecto, ca configuración de latexmk adxunta, ao compilar unha revista
o PDF que se xere gárdase no directorio `./pdf/` e os arquivos auxiliares
en `./aux/`.

<p align="right"><a href="#índice-de-contidos">(voltar ao índice)</a></p>
