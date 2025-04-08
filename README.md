# Revista MOMENTUM

Este é repositorio oficial da revista **MOMENTUM**, creada de 0 por
estudantes de grao, máster e doutorado de Física na USC.

# Contidos
1. [¿Como contribuír á revista?](#como-contribuír-á-revista)
2. [Estrutura do repositorio](#estrutura-do-repositorio)
3. [Estrutura das revistas](#estrutura-das-revistas)
   - [Revistas](#revistas)
   - [Artigos](#artigos)
   - [Imaxes](#imaxes)
   - [Portada](#portada)
4. [Compilación](#compilación)
   - [Algunhas dependencias](#algunhas-dependencias)
   - [¿Pero como compilo isto?](#pero-como-compilo-isto)

## ¿Como contribuír á revista?

A mellor maneira de contribuír é enviándonos artigos para publicar ao correo
revistafisicaUSC@gmail.com As contribucións en forma de código aquí en github
están limitadas a temas de formato, estilos e similares. Os artigos sempre
deben pasar polo correo para ser sometidos a triaxe. En xeral, as contribucións
son abertas a todo o mundo. Encargámonos de dar prioridade aos artigos enviados
antes, ou aos que necesitan urxencia, pero non queremos preferenciar a ninguén.
Queremos que todas as persoas poidan participar neste proxecto. Se tendes
dúbidas, podedes preguntar polo grupo de whatsapp da DAF, ou mellor, polo da
revista.

## Estrutura do repositorio

```
.
├── revista.cls
├── portada.tex
├── contraportada.tex
│
├── artigo_simplificado.tex
│
├── bibliografia.bib
├── latexmkrc
├── Makefile
├── README.md
├── .gitignore
│
├── logos/
│  ├── logo1.eps
│  └── logo2.pdf
│
├── fontes/
│  └── comic_sans/
│
└── revistas/
   ├── 001/
   │  ├── revista_001.tex
   │  ├── nome_apelidos_HISTORIA_DA_CIENCIA.tex
   │  └── imaxes/
   │     ├── portada_001.png
   │     └── unha_imaxe.jpg
   ├── 002
   │  └── ...
   ├── 003
   │  └── ...
   ├── 004
   │  └── ...
   └── 005
      └── ...
```
## Estrutura das revistas
### Revistas

Os arquivos comúns a todas as revistas, como o estilo xeral da
[portada](./portada.tex), [contraportada](./contraportada.tex), ou o estilo
xeral da [revista](./revista.cls) están na raíz do proxecto.

Cada revista *individual* está dentro do seu propio cartafol. Cada un destes
directorios está dentro de [`revistas/`](./revistas), ousexa temos cartafoles
como `revistas/001/`, `revistas/002/`, etc. Dentro destes é onde se gardan os
arquivos específicos, como os propios artigos formateados, e as imaxes, de cada
revista.

O arquivo principal de cada revista noméase como
`revistas/001/revista_001.tex`. Este é o arquivo principal a compilar, e ten a
forma seguinte (aproximada)

```latex
\documentclass{revista}

% comandos para definir a informacion de cada revista
\Numero{001}
\Data{Xaneiro do 1900}
\ImaxePortada{./revistas/001/imaxes/cern.png}
\definecolor{Resalte}{HTML}{ff0000} % cores especificos de cada revista
\definecolor{TextoEnResalte}{HTML}{000000}
\Participantes{
    {\Large \textbf{Dirección:}}     \\[0.5cm]
        Carl Sagan                   \\[0.2cm]
        ...                          \\[0.2cm]
    {\Large \textbf{Edición}}        \\[0.5cm]
        Albert Einstein              \\[0.2cm]
    {\Large \textbf{Diseño de Logo}} \\[0.5cm]
        Dirac                        \\[0.2cm]
} }
\begin{document}
\input{portada.tex}
\input{indice.tex}

\input{./revistas/001/nome_apelido_HISTORIA_DA_CIENCIA.tex}
\input{./revistas/001/nome_apelido_SALSEO_NA_FACULTADE.tex}

\input{contraportada.tex}
\end{document}
```
Os comandos `\Numero, \Data, \ImaxePortada, \Participantes`, e os
`\definecolor` deben usarse en cada revista e están explicados na [clase da
revista](./revista.cls)

### Artigos

Gárdanse no mesmo directorio que o `revista_001.tex` correspondente,
simplemente se inclúen no arquivo principal usando `\input{artigo.tex}`. Teñen
a forma seguinte

```latex
\Titular*% este comando permite definir a información concreta de cada artigo.
{Nome do artigo}
{Axl Rose}
{divulgacion}
{
Pequeno subtítulo para o artigo. Preferiblemente, non moi longo para que non
lle coma moito espazo ao artigo en sí.
}

\begin{refsection}   % para que a bibliografía aplique solo a este artigo
\begin{multicols}{2} % para ter varias columnas

% as distintas partes sepáranse con 'subsections' SEMPRE
\subsection*{Introdución}

bla blah blah

\subsection*{Outra sección}
....
....

\printbibliography
\end{multicols}
\end{refsection}
```
O macro `titular` é o centro de cada artigo, o cal cambia cada sección,
numeracións, formatos dos encabezados, define nomes... Está definido na clase
da revista. Importante botarlle un ollo ás definicións dos encabezados que se
poden usar (divulgacion, historia, etc.).

Se queremos engadir unha nova sección ao índice, debemos usar o comando
`\Titular*`, co asterisco

### Imaxes

Cada revista ten as imaxes gardadas nun subcartafol ao lado do documento
correspondente. Nos artigos editados só hai que facer:
```latex
\includegraphics{./revistas/001/imaxes/imaxebonita.png}
```
Neste proxecto usamos o sistema [GIT-LFS](https://git-lfs.com/) para manexar
arquivos binarios, entre os cales están as imaxes. Inda así, é recomendable que
non sexan demasiado grandes. Podedes usar [Gimp](https://www.gimp.org/) ou,
como fago eu, [convert](https://imagemagick.org/), para reducirlles algo o
tamaño.

### Portada

Esperamos poder crear unha portada distinta para cada número. A imaxe correspondente
defínese en cada revista_123.tex no comando `\ImaxePortada`. A imaxe da portada
debe ter forma cadrada *exactamente*

## COMPILACIÓN

### Algunhas dependencias

Este proxecto usa [LuaLaTeX](https://www.luatex.org/) para o proceso de
compilación, xa que nos da vantaxes no uso de distintas tipografías, danos
acceso a `\directlua`, e danos máis opcións de depurado usando
[lua-visual-debug](https://www.ctan.org/search?phrase=lua-visual-debug)

As tipografías usadas están incluídas no directorio [`fontes`](./fontes/),
polo que non é necesario instalalas.

Para os paquetes e resto de dependencias, é recomendable unha instalación
completa de TeXLive, inda que seguramente MiKTeX tamén funcione. Na clase da
revista inclúese un `\listfiles` polo que cada vez que se compila un documento
deberían aparecer listados todos os ficheiros `*.sty` e similares que se están
usando dentro da logfile.

Para o logo da USC é necesario ter `epstopdf`.

### ¿Pero como compilo isto?

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
Tamén se adxunta unha Makefile para os que usen Linux e similares. É posible facer

```bash
make numero=001 # compilar a revista numero 001
make limpa      # limpar os arquivos auxiliares
```

Por defecto, ca configuración de latexmk adxunta, ao compilar unha revista
o PDF que se xere gárdase no directorio `./pdf/` e os arquivos auxiliares
en `./aux/`.
