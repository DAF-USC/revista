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

- **Produción de contidos**: escribir artigos, entrevistas, pasatempos..., xa
  sexa como colaboración puntual ou de maneira máis continuada. As
  contribucións envíanse ao correo electrónico de contacto, en formato plano
  Typst ou LaTeX.

- **Comisión de Edición**: encárgase de implementar o deseño visual, garantir a
  reproducibilidade dos códigos e coidar que o formato final sexa limpo,
  coherente e profesional.

- **Comisión de Corrección**: vela pola calidade lingüística da revista a
  través da tradución e localización dos contidos, así como da corrección
  textual.

- **Comisión de Produción**: xestiona recursos, promove a revista, mantén o
  contacto con institucións e colaboradores externos e procura apoios para
  garantir a lonxevidade do proxecto.

- **Comisión de Dirección**: coordina o proxecto no seu conxunto, vela polo
  mantemento da identidade creativa da revista, coordina a sección de
  entrevistas e aproba os artigos enviados.

O proxecto funciona grazas á participación aberta: non importa se colaboras
unha vez ou varias, toda achega é valiosa. Se tes dúbidas ou ideas, podes
escribirnos ao correo ou preguntar nos grupos da DAF e da revista!

## :mag: Índice de contidos
1. [Estrutura do repositorio](#card_file_box-estrutura-do-repositorio)
2. [Estrutura das revistas](#newspaper-estrutura-das-revistas)
   - [Revistas](#revistas)
   - [Artigos](#artigos)
3. [Compilación](#toolbox-compilación)
   - [Dependencias](#dependencias)
   - [Como compilo isto?](#como-compilo-isto)
4. [Outros enlaces e documentos](#books-outros-enlaces-e-documentos)

## :card_file_box: Estrutura do repositorio

O repositorio contén:

- `estilo.typ` - Estilo de Typst para a revista.
- `momentum-citacions.csl` - Estilo de citas bibliográficas do Citation Style Language, variante do estilo APS
- `Makefile` - Configuración para compilar a revista.
- `CITATION.cff` - Para descargar a propia referencia bibliográfica da nosa revista ca información correcta.

Cartafoles principais:

- `revistas/` - Contén as edicións da revista, cada unha nun subcartafol numerado
    (`001`, `002`, ...). Cada edición inclúe o ficheiro principal `revista_001.typ`, os artigos
    correspondentes `.typ`, as bases de datos bibliográficas `.bib` e un cartafol `imaxes/`.
    ```
    .
    └── revistas/
       ├── 001/
       │  ├── revista_001.tex
       │  ├── bibliografia_VELNI_DD.bib
       │  ├── artigo_VELNI_DD.tex
       │  └── imaxes/
       │     ├── portada_001.png
       │     ├── VELNI_DD_tipos_nos.jpg
       │     └── VELNI_DD_skyrmions.jpg
       ├── 002
       │  └── ...
       └── ...
    ```
    A convención para nomear ficheiros é a seguinte: se o noso produtor de
    contido se chama _Velni Diz Diz_, o artigo será `artigo_VELNI_DD.tex`, as
    imaxes asociadas ao artigo comezaran por `VELNI_DD_*` (cun posible sufixo explicativo)
    e a bibliografía propia, no caso de tela, será `bibliografia_VELNI_DD.bib`.

    No tocante á imaxe da portada, cómpre que sexa *exactamente*
    cadrada para non ter problemas na compilación, isto pode facerse
    con programas como [Inkscape](https://inkscape.org/), [Gimp](https://www.gimp.org/)
    ou [ImageMagick](https://imagemagick.org/)
- `logos/` - Logos da universidade, facultade e institucións colaboradoras en PDF.
- `fontes/` - Tipos de letra empregados na revista.
- `trebellos/` - Recursos auxiliares e outros scripts da equipa de edición.
- `docs/` - Documentación sobre a revista e os procesos de edición.

<p align="right"><a href="#mag-índice-de-contidos">(voltar ao índice)</a></p>

## :newspaper: Estrutura das revistas
### Revistas

Os **ficheiros comúns** a todas as revistas, como o estilo da revista, `estilo.typ`,
e o estilo bibliográfico, `momentum-citacions.csl`, deben estar na raíz do proxecto.

Cada **número da revista** ten o seu propio cartafol en [`revistas/`](./revistas),
e dentro destes é onde se gardan os ficheiros específicos de cada revista, como
os artigos e as imaxes.

O **ficheiro principal** de cada revista noméase como, se é a revista número 001,
`revistas/001/revista_001.typ`. Este é o ficheiro principal a compilar, e o único
que fai é cargar o estilo da revista, aplicalo, e chamar a función que xera o contido.

```typst
// revistas/001/revista_001.typ
#import("/estilo.typ"): *

#crear_revista()
```

O **ficheiro de datos** de cada revista, ven sendo `revistas/001/datos_001.typ`,
onde se define a variable `informacion_revista` que é usada polo estilo para saber
que artigos meter dentro, que cores usar, que datas, imaxe da portada, etc. Estes datos
sobreescriben os que temos por defecto no ficheiro `estilo.typ`

```typst
// revistas/001/datos_001.typ
#let informacion_revista = (

    artigos : (
        "/revistas/001/artigo_MAR_BT.typ",
        "/revistas/001/artigo_SARA_NF.typ",
        // etc.
    ),

    cor_resalte: "#951ed6", // a cor de resalte de cada número
    cor_texto: "#ffffff",   // a cor do texto que esta escrito _sobre_ a cor de resalte

    data_dia: 24,       // Data de publicación
    data_numero_mes: 8, //
    data_mes: "agosto", //
    data_ano: 1998,     // (cumple de deivis)

    imaxe_portada: "/revistas/001/imaxes/portada.png",
    comentario_imaxe: "Comentario que acompaña a imaxe.",

    participantes: (
       "Dirección"  : ( "Andrea", "Lara"),             // Participantes. Os postos son arbitrarios
       "Edición"    : ( "Pu", "Sara", "Daniel"),       //
       "Corrección" : ( "Carlos", "Marta", "Geranio"), // (miñas amigas)
    ),

    despedida: [ Despedida moi bonita. ],
    agradecementos: [ Agradecementos emotivos a todas as miñas amigas! ]

)
```

Adicionalmente, tamén se poden incluir os datos `repositorio`,  `whatsapp`,
`instagram`, `anteriores` e `correo`, pero como son sempre os mesmos, non fai
falla repetilos en cada número. Máis información sobre a implementación e
particularidades no ficheiro de [estilo da revista](./estilo.typ).

<p align="right"><a href="#mag-índice-de-contidos">(voltar ao índice)</a></p>

### Artigos

Os artigos gárdanse no mesmo directorio que o `/revistas/001/revista_001.typ` correspondente
e inclúense na revista metendo o seu nome en `datos_001.typ`. Teñen a seguinte forma:

```typst
// revistas/001/artigo_MAR_BT.typ

// Á función `Artigo` pode pasárselle a info deste artigo concreto
#show: Artigo.with(
  titulo     /* OBRIGADO */ : [Prefires quedarte calvo, ou roubar Plutonio-239?],
  autoria    /* OPCIONAL */ : [Mar B. T.],
  subtitulo  /* OPCIONAL */ : [Relacións neurolóxicas entre a calvicie e os deportes de risco.],
  afiliacion /* OPCIONAL */ : [Faculdade de Psicoloxía]
  estilo     /* OPCIONAL */ : "Psicoloxía Nuclear",
)

#columns[ // mostrar 2 columnas

    == Introdución // As distintas partes sepáranse con encabezados de invel >= 2

    Bos días anduriños, neste artigo ensinareivos como facer fisión nuclear caseira
    cun barreño e unha fonte de Plutonio-239 nos baños do PDI da facultade.
    ...

    == Outra sección
    En primeiro lugar, denunciar á DAF polo desamparo económico e agradecer a
    tódolos marabillosos profesores que tiven ata o momento. Por suposto, agradecer
    tamén a [REDACTADO] por axudarme a sacar a fonte do laboratorio de nuclear.
    Vémonos na próxima!! @hector.pol // citar a Héctor Pol, noso querido profe do Lab. Nuclear

    #CrearBibliografia("/revistas/001/bibliografia_MAR_BT.bib")

] // fin das fúas columnas
```

A función `Artigo` é o centro de cada artigo: cambia as seccións da revista,
reinicia numeracións, dá formato aos encabezados, define nomes... Véxase
[a documentacion](./docs/proceso_edicion.md) pra máis info de como funcionan os artigos.

<p align="right"><a href="#mag-índice-de-contidos">(voltar ao índice)</a></p>

## :toolbox: Compilación

### Dependencias

Este proxecto usa [Typst](https://typst.app/) como linguaxe de programación; a
compilación manéxase con [make](https://www.gnu.org/software/make/); e as
versións do código con [Git](https://git-scm.com/). Fai falla ter o compilador
de Typst, GNU-Make e Git instalados e na `$PATH`. **non** se soporta a
compilación en liña en typst.app. En principio so se soporta Linux(es), pero
pode que Mac e Windows tamén funcionen.

- O recomendable é traballar en Linux e ter unha [instalación de rust](https://rustup.rs/),
  logo instalar a última versión de desenvolvemento de Typst usando
  [Cargo](https://doc.rust-lang.org/cargo/):
  ```bash
  cargo install --git https://github.com/typst/typst --locked typst-cli
  ```
- En windows, o recomendable sería instalar Typst usando [scoop](https://scoop.sh/),
  usando o cubo **nightly**. Para instalar Make, pode probarse tamén a instalalo con Scoop,
  senón, están as *toolchains* [MYSYS2](https://www.msys2.org/), [CYGWIN](https://cygwin.com/),
  [GIT BASH](https://gitforwindows.org/) ou pode que [WSL](https://github.com/microsoft/WSL).
  En calquera caso, **NON** nos esperamos que se use en Windows, enserio,
  cambiade de sistema operativo.
- Se ides facer **git clone** do repositorio precisaredes instalar tamén
  [git-lfs](https://git-lfs.com/), que é o que empregamos para evitar gardar
  copias completas de todos os ficheiros pesados (imaxes, PDFs, fontes) en cada
  versión. Usando LFS, descárganse só as versións actuais e mantéñense punteiros
  ás anteriores, o que reduce moito o tamaño do repo. Se clonades o repositorio
  sen telo instalado, en vez dos ficheiros reais, teredes eses punteiros de texto
  e o proxecto dará erros na compilación.

<p align="right"><a href="#mag-índice-de-contidos">(voltar ao índice)</a></p>

### Como compilo isto?

- Neste repositorio, premer o botón verde de *CODE* e descargar o ZIP.
  Alternativamente (o recomendado), clonar o proxecto con Git:
  ```bash
  git clone https://github.com/fisicaUSC/revista
  ```
- Todo o proceso de compilación se manexa con Make (véxase a [makefile](./Makefile)):
  ```bash
  make numero=001              # Compilar a revista número 001
  make numero=001 metodo=watch # compila a revista usando o método incremental de Typst
  make numero=001 propaganda   # Xerar as propagandas do número 001
  make numero=001 artigos      # compila a revista e os artigos individuais para os redactores.
  make todo                    # Compila todas as revistas, propagandas e artigos individuais
  make limpa                   # Limpar os ficheiros auxiliares
  ```
  Por defecto, coa configuración de `make` adxunta, ao compilar unha revista
  o PDF que se xere gárdase no directorio `.pdf/` e os ficheiros auxiliares
  en `.aux/`.

<p align="right"><a href="#mag-índice-de-contidos">(voltar ao índice)</a></p>

## :books: Outros enlaces e documentos

No cartafol [docs/](./docs/) inclúense ficheiros con ligazóns útiles, información
relevante da revista e sobre o proceso de edición.

<p align="right"><a href="#mag-índice-de-contidos">(voltar ao índice)</a></p>

## :scroll: Licenzas

Este proxecto utiliza recursos de terceiros suxeitos ás seguintes condicións de
licenza:

| Recurso | Función | Licenza |
| :--- | :--- | :--- |
| [**Latin Modern**](http://www.gust.org.pl/fonts/licenses/GUST-FONT-LICENSE.txt) | Tipografía de texto | GUST Font License (baseada en LPPL) |
| [**Roboto**](https://fonts.google.com/specimen/Roboto) | Tipografía de texto | SIL OFL |
| [**Nerd Fonts**](https://github.com/ryanoasis/nerd-fonts/blob/master/LICENSE) | Iconografía | MIT License |
