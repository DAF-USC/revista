//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//  _____ ____ _____ ___ _     ___  %
// | ____/ ___|_   _|_ _| |   / _ \ %
// |  _| \___ \ | |  | || |  | | | |%
// | |___ ___) || |  | || |__| |_| |%
// |_____|____/ |_| |___|_____\___/ %
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//
// Este é o formato da revista. Se buscas por que tal ou cal cousa se ve como
// se ve, deberías mirar aquí. Intentei que esto estivese comentado na medida do
// posible, para facilitar o uso e modificación desto no futuro. Todo esto foi
// escrito de 0 por varios estudantes da facultade de física da universidade de
// Santiago de Compostela. Se queres saber como contribuír, botádelle un ollo ao
// arquivo README.md. Este é un proxecto libre, de uso e de responsabilidade. En
// ningún momento nos imos facer responsables se compilas esto e se che queima a
// CPU (dudo que pase).
//
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//
// Defínense varias funcións xerais na revista. En principio intentei usar a
// filosofía fundamental (pero inacabada) de Typst, onde unhas funcións
// devolven contido (texto, cadros, táboas, etc.) e outras funcións que cambian
// o estilos dese contido. Por desgraza, a día de hoxe non existe unha
// diferencia clara nos elementos fundamentais que se poden customizar, asique
// a separación que fago eu non é perfecta. Véxase:
//
// https://github.com/typst/typst/issues/147
// https://laurmaedje.github.io/posts/types-and-context/
//
// 1) Funcións que aceptan contido como argumento e lle aplican un estilo:
//
//
//     estilo_xeral(...)         -> Estilo xeral. Fonte principal, metadatos do
//                                  documento, tamaño de páxina, e algúns tamaños.
//     estilo_portada(...)       -> Estilo da portada. Marxes diferentes.
//     estilo_indice(...)        -> Estilo para a páxina do índice. Este estilo
//                                  cambia as cores da columna dereita, e pon un
//                                  rectangulo de cor na páxina.
//     estilo_artigos(...)       -> Estilo do corpo da revista (ousexa, os artigos).
//                                  Posición dos números da páxina, encabezados, marxes
//                                  xustificación do texto, e formatos menores
//     estilo_contraportada(...) -> Estilo da contraportada
//
// 2) Funcións que crean dito contido
//
//     crear_portada(...)       -> Contido da portada. Un grid de 4x1.
//                                 - Título
//                                 - Encabezado, con data e número
//                                 - Imaxe e comentario da imaxe
//                                 - Logos
//     crear_indice(...)        -> Contido do índice. Un grid de 4x3. A primeira
//                                 columna está toda xunta e ten o índice. A
//                                 segunda columna é estrutural, permite espazar
//                                 ben as cousas. A 3ªcolumna ten:
//                                 - Data e número
//                                 - Participantes
//                                 - Contactos
//                                 - Logo USC
//     crear_contraportada(...) -> Un grid de 3x1.
//                                 - Un bloque con despedida e agradecementos
//                                 - Un espazo
//                                 - Outro grid, para colocar ben os QRs
//
// 3) Función para activar o estilo concreto dun artigo, moi importante.
//
//     Artigo(...) -> Crea o titular dun artigo (título, subtitulo,
//                     autoría,...), cas cores indicadas. Tamén cambia o estilo
//                     da páxina (encabezados), e vai gardando nun array a
//                     información dos artigos (título, autoría e posición) para
//                     logo poder usala no índice
//
// 4) Función que xunta todo
//
//     crear_revista(...) -> Xera a revista.
//
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//
// A revista debe compilarse cas seguintes opcións (úsanse automáticamente ca
// Makefile):
// typst compile
//     --format pdf              -> formato
//     --root .                  -> diretorio 'raíz'
//     --pdf-standard 2.0        -> versión do PDF
//     --diagnostic-format short -> erros en versión corta
//     --ignore-system-fonts     -> non usar fontes do sistema
//     --ignore-embedded-fonts   -> non usar fontes de typst
//     --font-path=fontes        -> usar fontes do diretorio 'fontes'
//     --timings=.aux/perf.json  -> gardar datos da compilación
//     --input numero=001        -> número da revista
//     --input rama=principal    -> rama de Git actual    | Estas 4 opcións collen a info
//     --input hash=9000e53      -> hash de Git actual    | automáticamente usando Git
//     --input dirt=*            -> estado do WorkingTree | na Makefile
//     --input quen=davis        -> quen está a compilar  |
//
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Número da revista. Sae de '--input numero=001'
#let numero = sys.inputs.at("numero", default: "001")

// Información específica dun número.
#import("/revistas/" + numero + "/datos_" + numero + ".typ"): informacion_revista

// Información por defecto da revista. Esta información logo sobreescríbese ca
// info específica de cada número
#let informacion_por_defecto = (
    artigos           : (),
    cor_resalte       : "ff0000",
    cor_texto         : "ffffff",
    depuracion_visual : false,
    data_dia          : 24,       // Cumple de deivis
    data_numero_mes   : 8,        //
    data_mes          : "agosto", //
    data_ano          : 1998,     //
    imaxe_portada     : none,
    comentario_imaxe  : "-- SEN COMENTARIO --",
    repositorio       : "fisicaUSC/revista",
    whatsapp          : "https://chat.whatsapp.com/E900g1Bq7QT5ZKeuiIpxTk",
    instagram         : "momentum.usc",
    anteriores        : "https://www.usc.gal/gl/centro/facultade-fisica/revista-estudantil-momentum",
    correo            : "revistafisicausc@gmail.com",
    participantes     : ( "-- SEN POSTOS -- ": ("-- SEN PARTICIPANTES --",),),
    despedida         : "-- SEN DESPEDIDA --",
    agradecementos    : "-- SEN AGRADECEMENTOS --",
)

// Combinamos a información por defecto ca información específica da revista. O
// que pasa é que os valores por defecto se sobreescriben cos específicos dun
// número. Os que non sobreescribamos mantéñense por defecto.
#let datos = informacion_por_defecto + informacion_revista

// Unha variable global.
// https://typst.app/docs/reference/introspection/state/
//
// Array que se encherá de dicionarios con info dos artigos, co seu título,
// autoría e localización. Úsase para xerar o índice, por defecto está baleiro.
// Ten esta forma:
// (
//     (
//         titulo: "Benvida a Momentum",
//         autoria: "Equipo Decanal",
//         localizacion: (page: 3, x: 28.35pt, y: 56.69pt),
//     ),
//     (
//         titulo: "Carathéodory e a axiomatización da termodinámica",
//         autoria: "Sebastián Táboas Pazo",
//         localizacion: (page: 5, x: 28.35pt, y: 56.69pt),
//     ),
//     ...
// )
#let _artigos = state("artigos", ())

// Fontes.
//
// As fontes OTF especifícanse por
// - Familia (nome) -> STRING  nome da fonte
// - Peso.          -> INT     número que especifica o groso da fonte
// - Estilo         -> STRING  italic, regular
// - Estiramento    -> RATIO   versións máis ou menos comprimidas.
//
// Ditos 4 valores especifican unha fonte concreta. Valores non especificados
// volvense 'auto'. Esto son varios dicionarios ca información das fontes, así é
// máis sinxelo cambialas.
#let _norm = ( familia: "New Computer Modern"      , peso: 450 , estilo: "normal" , estiramento: 100% )
#let _mate = ( familia: "Libertinus Math"          , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _sans = ( familia: "New Computer Modern Sans" , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _cond = ( familia: "Roboto"                   , peso: 400 , estilo: "normal" , estiramento: 75%  )
#let _semi = ( familia: "Roboto"                   , peso: 400 , estilo: "normal" , estiramento: 87.5%  )
#let _mono = ( familia: "New Computer Modern Mono" , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _simb = ( familia: "Symbols Nerd Font Mono"   , peso: 400 , estilo: "normal" , estiramento: 100% )

// Varias funcións para activar as distintas fontes directamente, usando a
// información do dicionario anterior
#let normal         = eso => text( size: 1em   , fallback: false, font: _norm.familia, weight: _norm.peso, style: _norm.estilo, stretch: _norm.estiramento,)[#eso]
#let mates          = eso => text( size: 1em   , fallback: false, font: _mate.familia, weight: _mate.peso, style: _mate.estilo, stretch: _mate.estiramento,)[#eso]
#let sans           = eso => text( size: 1em   , fallback: false, font: _sans.familia, weight: _sans.peso, style: _sans.estilo, stretch: _sans.estiramento,)[#eso]
#let condensada     = eso => text( size: 1em   , fallback: false, font: _cond.familia, weight: _cond.peso, style: _cond.estilo, stretch: _cond.estiramento,)[#eso]
#let semiCondensada = eso => text( size: 1em   , fallback: false, font: _cond.familia, weight: _cond.peso, style: _cond.estilo, stretch: _cond.estiramento,)[#eso]
#let mono           = eso => text( size: 1.2em , fallback: false, font: _mono.familia, weight: _mono.peso, style: _mono.estilo, stretch: _mono.estiramento,)[#eso]
#let simbolos       = eso => text( size: 1em   , fallback: false, font: _simb.familia, weight: _simb.peso, style: _simb.estilo, stretch: _simb.estiramento,)[#eso]

// Estilo xeral que aplica a TODA a revista. Fonte por defecto, algúns
// metadatos, data, etc.
#let estilo_xeral(
    doc
) = {
    set document(
        title       : "Revista Estudantil Momentum",
        author      : datos.participantes.values().flatten(),
        description : "Revista de Física Estudantil e Compostelana",
        keywords    : ("física","divulgación","galego"),
        date        : datetime.today()
    )
    set page(paper: "a4")
    set text(
        size      : 11pt,
        font      : _norm.familia,
        weight    : _norm.peso,
        lang      : "gl", // https://en.wikipedia.org/wiki/ISO_639
        fallback  : false,
        style     : "normal",
        features  : ( liga : 1, kern : 1, ), // https://en.wikipedia.org/wiki/List_of_typographic_features
        region    : "ES", // https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
        script    : "latn", // https://en.wikipedia.org/wiki/ISO_15924
        dir       : ltr, // dirección do texto, de esquerda a dereita (Left To Right)
    )
    show math.equation: set text(font: "New Computer Modern Math")

    // Mostrar bordos de varias cousas. IMPORTANTE: isto modifica a aliñación
    // dalgunhas cousas (links pasan a ser bloques, todos os parágrafos perden
    // a sangría, entre outros). Sirve so como referencia.
    if datos.depuracion_visual {
        show par: eso          => block(stroke: 0.6pt, inset: 0pt, breakable: true, eso)
        show heading: eso      => block(stroke: 0pt, fill: orange.transparentize(50%), inset: 0pt, breakable: true, eso)
        show bibliography: eso => block(stroke: 0pt, fill: green.transparentize(80%), inset: 0pt, breakable: true, eso)
        show link: eso         => block(stroke: 0pt, fill: blue.transparentize(80%), inset: 0pt, breakable: true, eso)
        show ref: eso          => box(stroke: 0pt, fill: blue.transparentize(80%), inset: 0pt, eso)
        show image: eso        => block(stroke: 2pt + red, inset: 0pt, breakable: true, eso)
        show figure: eso       => block(stroke: 2pt + green, inset: 0pt, breakable: true, eso)
        show grid:                set grid(stroke: (thickness: 0.6pt, dash: "densely-dotted"))
        show math.equation.where(block: true):  eso => block(stroke: 0pt, fill: purple.transparentize(70%), inset: 0pt, breakable: true, eso)
        show math.equation.where(block: false): eso => box(stroke: 0pt, fill: purple.transparentize(70%), inset: 0pt, eso)
        doc
    } else {
        doc
    }
}

// Estilo para a portada.
#let estilo_portada(
    doc
) = {
    // Simplemente cambiamos as marxes un pouco
    set page( margin: (top: 5mm, left: 5mm, right: 5mm, bottom: 5mm) )
    doc
}

// Función para crear a portada
#let crear_portada() = grid(

    align   : (bottom + center),
    columns : 1fr,
    rows    : (
        2.75cm,            // Titulo
        1.12cm,            // Subtitulo
        2.1cm,             // Número e data
        210mm - (2 * 5mm), // Imaxe, alto exacto ao ancho da páxina menos as marxes
        297mm - (2 * 5mm) - 2.75cm - 1.12cm - 2.1cm - (210mm - (2 * 5mm)), // Logos
    ),

    // O titulo
    grid.cell(
        x:0,y:0,
        block(
            {
                text( fill: rgb(datos.cor_resalte), size: 70pt)[*$arrow("M")$*]
                text(size: 70pt)[*OMENTUM*]
            }
        )
    ),

    // O subtítulo
    grid.cell(
        x:0, y:1,
        block(
            {
                set text(size: 18pt)
                sans[A revista estudantil da Facultade de Física da USC]
            }
        )
    ),

    // Número e data
    grid.cell(
        x:0, y:2,
        block(
            inset  : 13pt,
            stroke : 2pt,
            fill   : rgb(datos.cor_resalte),
            text(
                fill : rgb(datos.cor_texto),
                size : 17pt,
                mono[Núm.#sys.inputs.at("numero") #h(1fr) #datos.data_mes #datos.data_ano]
            )
        )
    ),

    // Imaxe portada
    grid.cell(
        x:0, y:3,
        block(
            inset : 1pt,
            stroke : 2pt,
            {
                // Se pasamos o nome da portada, usamos esa
                if datos.imaxe_portada != none {
                    image(width: 100%, datos.imaxe_portada)
                // Se non, poñemos un fondo por defecto
                } else {
                    // Un rectángulo
                    rect(
                        width  : 100%,
                        height : 100%,
                        stroke : red + 2pt,
                        fill   : tiling( // cheo dun patrón de liñas
                            size: (30pt, 30pt),
                            {
                                place(line(start: (0%, 0%)  , end: (100%, 100%), stroke: (paint: gray, dash: "dashed")))
                                place(line(start: (0%, 100%), end: (100%,   0%), stroke: (paint: gray, dash: "dashed")))
                            }
                        ),
                        {
                            // E metemos no centro un aviso
                            set align(center + horizon)
                            set text(size: 3em)
                            rect(
                                fill   : white,
                                stroke : red + 3pt,
                                inset  : 1em,
                                mono[SEN IMAXE DE PORTADA]
                            )
                        }
                    )
                }
                // O comentario da imaxe da portada
                place(
                    left + bottom, dy: -0.4cm, dx:  0.4cm,
                    rect(
                        fill   : rgb("#44444499"),
                        stroke : 0.6pt + white.transparentize(70%),
                        text(fill: white, size : 11pt, sans(datos.comentario_imaxe))
                    )
                )
            }
        )
    ),

    // Logos
    // :FACER: meter info dos logos en datos_xxx.typ?
    grid.cell(
        x:0, y:4,
        grid(
            columns : (1fr, 1fr),
            rows    : 100%,
            align   : (left+horizon, right+horizon),
            grid.cell(
                x:0,y:0,
                image(
                    width: 12cm,
                    "logos/vicerreitoria-branco-negro.pdf",
                )
            ),
            grid.cell(
                x:1,y:0,
                image(
                    width: 5cm,
                    "logos/IGFAE_acronimo_escuro.pdf",
                )
            )
        )
    )

)

// Estilo para o índice de contidos
#let estilo_indice(
    doc
) = {
    // Non usar sangría
    set par(first-line-indent: 0pt)
    set page(
        // O rectángulo de cor do lado dereito
        background : place(
            right + top,
            rect(fill: rgb(datos.cor_resalte).lighten(35%), height: 100%, width: 8cm),
        ),
        margin: ( top : 20mm, left : 10mm, right : 10mm, bottom : 25mm ),
    )
    // O índice é un grid de 4x3, onde a columna dereita (índice 2) ten
    // participantes, ligazóns, etc.
    show grid.cell: eso => {
        if eso.x == 2 {
            set text( fill: rgb(datos.cor_texto))
            set par(spacing: 0pt)
            eso
        } else { eso }
    }
    doc
}

// Función para crear o propio índice de contidos
// :FACER: simplificar na medida do posible todo o índice
#let crear_indice() = grid(

    // Grid tamaño 4x3
    rows    : (2cm, 1fr  , 5.5cm, 3.5cm),
    columns : (1fr, 1.5cm, 6.2cm       ),

    // Índice de artigos
    grid.cell(
        x:0, y:0, rowspan: 4, // 4: A primeira columna completa
        {
            block(
                width : 100%,
                inset : (bottom: 1em),
                heading(
                    level: 1,
                    numbering: none,
                    text(
                        size: 2em,
                        condensada[*Índice*]
                    )
                )
            )
            // ERRO (curioso) facer simplemente #_artigos.final() non vai, está bugueado.
            //
            // Iteramos polo array ca info dos artigos.
            context for artigo in _artigos.final() {
                // Mostramos os artigos como ligazóns
                link(
                    // A onde nos vai levar a ligazón
                    artigo.localizacion,
                    // Que mostra a ligazón
                    {
                        text(
                            fill    : rgb(datos.cor_resalte).darken(20%),
                            font    : _semi.familia,
                            stretch : _semi.estiramento,
                            [
                                #show "\n": " " // Un truco para eliminar as novas liñas "\n" dos títulos
                                *#artigo.titulo* // TITULO
                            ],
                        )
                        h(1fr)
                        [*#artigo.localizacion.page*] // PÁXINA
                        linebreak()
                        artigo.autoria // AUTORIA
                        v(1em)
                    }
                )
            }
        }
    ),

    // Data e número
    grid.cell(
        x:2,y:0,
        align: center,
        text(
            size   : 1.5em,
            font   : _sans.familia,
            weight : "black",
            [#datos.data_dia de #datos.data_mes do #datos.data_ano#v(1em) Núm.#sys.inputs.at("numero")]
        )
    ),

    // Participantes
    grid.cell(
        x:2, y:1,
        align: left,
        grid(
            columns    : 1,
            rows       : 1,
            row-gutter : 1.4em,

            {
                show text: sans
                for posto in datos.participantes.keys() {
                    v(1em)
                    text( size:1.2em, [*#posto*\ ],)
                    v(1em)
                    for persoa in datos.participantes.at(posto) {
                        [#persoa\ ]
                    }
                }
            }

        )
    ),

    // Contactos
    // É un pouco lioso porque é un grid, con outros grids dentro, con máis grid dentro...
    grid.cell(
        x: 2, y:2,
        {
            set par(spacing: 0pt)
            grid(
                rows: 3,
                row-gutter: 1em,
                columns : (100%,),
                // CORREO
                grid(
                    columns:1, rows:2, row-gutter: 7pt,
                    text(size: 20pt, font: _simb.familia)[#h(3pt) ],
                    link("mailto:" + datos.correo, sans[#datos.correo])
                ),
                // INSTAGRAM
                grid(
                    columns:1, rows:2, row-gutter: 7pt,
                    text(size: 20pt, font: _simb.familia)[#h(3pt) ],
                    link("https://www.instagram.com/" + datos.instagram, sans[@#datos.instagram])
                ),
                // INFO GIT
                grid(
                    columns:1, rows:4, row-gutter: 7pt,
                    text(size: 20pt, font: _simb.familia)[#h(3pt) ],
                    link("https://github.com/" + datos.repositorio, mono[#datos.repositorio]),
                    {
                        simbolos[]
                        mono(sys.inputs.at("rama", default: "sen rama"))
                        [:]
                        mono(sys.inputs.at("hash", default: "sen hash"))
                        mono(sys.inputs.at("dirt", default: "sen dirt"))
                    },
                    // :FACER: quitar isto? ou movelo
                    mono[Compilado por: #sys.inputs.at("quen", default: "sen quen")]
                )
            )
        }
    ),

    // Logo USC
    grid.cell(
        x: 2, y:3,
        {
            v(1fr)
            image("/logos/usc-negativo-escuro.pdf")
        }
    )

)

// Estilo para os artigos
#let estilo_artigos(
    estilo: "-- SEN ESTILO --",
    doc
) = {
    // Re-usamos o estilo xeral, así, se compilamos os artigos individualmente,
    // estes tamén terán este estilo
    show: estilo_xeral

    set page(
        margin: (
            top    : 25mm,
            left   : 10mm,
            right  : 10mm,
            bottom : 25mm,
        ),
        header-ascent : 15pt,
        header: {
            grid(
                columns    : (1fr, 2.3cm, 1fr),
                rows       : (1em,1em,1em),
                row-gutter : 0pt,
                align      : (left+horizon, center+horizon, right+horizon ),
                grid.cell(
                    x:0, y:0,
                    text(
                        fill   : rgb(datos.cor_resalte),
                        size   : 1.2em,
                        font   : _cond.familia,
                        stretch: _cond.estiramento,
                        weight : "bold",
                        estilo
                    )
                ),
                grid.cell(x:0, y:1, line(length:100%, stroke:0.2pt)),
                grid.cell(x:2, y:1, line(length:100%, stroke:0.2pt)),
                grid.cell(
                    x:1,
                    rowspan:3,
                    circle(
                        fill   : rgb(datos.cor_resalte),
                        radius : 1.4em,
                        text(
                            fill : rgb(datos.cor_texto),
                            size : 22pt,
                            [$accent(m,arrow)$]
                        )
                    )
                )
            )
        },
        footer : context {
            let p = counter(page).get().first()
            if calc.even(p) {
                // Pe de paxinas pares
                grid(
                    columns : 1fr,
                    rows    : 1fr,
                    align   : (left + top),
                    {
                        let p = counter(page).get().first()
                        [*#numbering("1",p)*]
                    }
                )
            } else {
                // Pe de paxinas impares
                grid(
                    columns : 1fr,
                    rows    : 1fr,
                    align   : (right + top),
                    {
                        let p = counter(page).get().first()
                        [*#numbering("1",p)*]
                    }
                )
            }
        }
    )
    set text(
        hyphenate : true,
        overhang  : true, // Protrusión. Manter un ollo en https://github.com/typst/typst/issues/261
        costs     : ( hyphenation: 10% ),
    )
    set par(
        leading              : 6pt,         // espazo entre liñas
        spacing              : 6pt,         // espazo entre parágrafos
        justify              : true,        // Texto xustificado
        linebreaks           : "optimized", // Xustificación óptima
        first-line-indent    : 1em,         // Sangría
        justification-limits : (            // Topes character kerning (tracking) e word spacing
            tracking : (min: -0.04em, max: 0.02em), // Entre caracteres
            spacing  : (min: 66.67% + 0pt, max: 150% + 0pt) // Entre palabras
        )
    )
    show raw: mono
    show quote.where(block: true): set block(breakable: false, inset: (top: 9pt))
    show figure: set block(width: 100%, inset: (top: 0.5em, bottom:0.5em))
    show figure.caption: set align(left)
    show figure.caption: set par(leading: 5pt, justify: false)
    show figure.caption: set text(font:_sans.familia)
    show figure.caption: eso => {
        context strong[#eso.supplement~#eso.counter.display() #eso.separator]
        eso.body
    }
    show math.equation.where(block: false): eso => { box(eso) }
    show math.equation.where(block: true): set block(inset: (top: 0.5em, bottom: 0.5em))
    show heading.where(level: 2): set text(font: _cond.familia, stretch: _cond.estiramento, size: 1.1em)
    set math.equation(numbering: "(1)")
    show divider: set line(length: 90%, stroke: (paint: rgb(datos.cor_resalte)))
    show enum: set block(inset: (top: 0.5em, bottom:0.5em))
    show list: set block(inset: (top: 0.5em, bottom:0.5em))
    set enum(indent: 1em)
    set list(indent: 1em)
    set columns(2, gutter: 5mm, balanced: true)
    show link: set text(fill: rgb("#0000EE"), font: _mono.familia, tracking: -0.5pt)

    // :FACER: referencias a ecuacións, figuras, etc
    doc
}

// Estilo para a contraportada
// :FACER:MIGRACION: estilo da contraportada
#let estilo_contraportada(doc) = {
    set page(
        margin     : ( top : 5mm, left : 5mm, right : 5mm, bottom : 5mm, ),
        background : place(
            center,
            dy : 10em,
            circle(radius:7cm, stroke: luma(90%) + 9pt,[  ])
            // :FACER:MIGRACION: meter o péndulo da contraportada contransparencia
            // image("imaxes/fondo_contraportada.png")
        )
    )
    doc
}

// Función para crear a contraportada
#let crear_contraportada() = {

    import "@preview/tiaoma:0.3.0"

    grid(
        columns    : 100%,
        rows       : (4fr, 0pt, 1fr),
        align      : center + horizon,
        row-gutter : 1em,

        // Un Momentum...
        block(
            width : 70%,
            {
                text(size: 2em, [Un Momentum...])
                text(
                    size: 1.5em,
                    {
                        set par(justify: true, leading:0.3em)
                        datos.despedida
                    }
                )
                text(size: 2em, [Agradecementos])
                text(
                    size: 1.2em,
                    {
                        set par(justify: true, leading:0.3em)
                        datos.agradecementos
                    }
                )
            }
        ),

        line(length: 100%, stroke: 0.6pt),

        // QRs, logos
        grid(
            columns       : 3,
            rows          : 2,
            column-gutter : 1em,
            row-gutter    : 1em,

            // :FACER: QRs clicables, como links
            // QR1
            grid.cell(x:0, y:0, [Edicións anteriores]),
            grid.cell(
                x: 0, y:1,
                // En caso de dúbidas, mirar o manual en https://zint.org.uk/
                tiaoma.barcode(
                    datos.anteriores,
                    "QRCode",
                    options: (
                        option-1 : 4,   // corrección de erros, 1-4
                        option-2 : 8,   // detalle, 1-40
                        scale    : 1.5,
                    ),
                )
            ),

            // QR2
            grid.cell(x:1, y:0, [Participa! (WhatsApp)]),
            grid.cell(
                x: 1, y:1,
                tiaoma.barcode(datos.whatsapp, "QRCode", options: (option-1: 4, option-2: 8, scale: 1.5))
            ),

            // Financiación
            // :FACER:MIGRACION: meter financiamento
            grid.cell(x:2, y:0, [Co financiamento de]),
            grid.cell(x:2, y:1, [Alguén])

        )

    )

}

// Función que xunta todo
// :FACER:MIGRACION: versión impresa
#let crear_revista() = {

    // Activamos o estilo xeral, que vai afectar a toda a revista
    show: estilo_xeral

    // Agora, activamos o estilo da portada e mostrámola
    {
        show: estilo_portada
        crear_portada()
    }

    // Activamos o estilo do índice e creámolo
    {
        show: estilo_indice
        crear_indice()
    }

    // Comezamos a contar páxinas
    counter(page).update(1)

    // Activamos o estilo para os artigos (corpo) e mostrámolos
    {
        for artigo in datos.artigos { include(artigo) }
    }

    // Activamos o estilo para a contraportada e creámola
    {
        show: estilo_contraportada
        crear_contraportada()
    }

}

#let Artigo(                             /* TIPO      explicacion */
    titulo        : [-- SEN TÍTULO --],  // CONTENT Título do artigo
    autoria       : none,                // STRING  Quen fixo o artigo
    subtitulo     : none,                // CONTENT Subtítulo do artigo
    afiliacion    : none,                // STRING  Afiliación dos autores
    // :FACER: realmente fai falla esto? Engadimos combrobacións?
    estilo        : "-- SEN ESTILO --",  // STRING  Estilo do artigo (divulgación, historia, etc.)
    artigo
) = {
    // :FACER: engadir comprobacións, p.e. assert(type(titulo) == "content")

    show: estilo_artigos.with(estilo: estilo)

    // Contidos do Titular. Un array cos elementos. Ao final filtramos este
    // array pa quedarnos so cos contidos distintos de 'none'. Se non hai
    // afiliación ou o subtítulo o grid do Titular vaise adaptar acorde.
    let filas_titular = (
        // TITULO
        block(
            width : 100%,
            {
                set par(leading: 0.4em)
                text(
                    size   : 25pt,
                    fill   : rgb(datos.cor_resalte),
                    weight : "bold",
                    context {
                        condensada(heading(depth: 1, titulo)) /* Mostrar o título */
                        let posicion = here().position() /* Variable ca posición actual */
                        // Agora actualizamos a lista de artigos engadindo un
                        // dicionario con titulo, autoría e posición Este
                        // dicionario é o que se usa no índice para sacar a
                        // info dos artigos
                        _artigos.update(
                            // 'x' é o array actual. Engadímoslle (ousexa,
                            // concatenamoslle) outro array que contén un
                            // dicionario cas claves 'titulo','autoria' e
                            // 'localizacion'.
                            x => x + (
                                (
                                    titulo : titulo, autoria : autoria, localizacion : posicion,
                                ), // IMPORTANTE: Esta coma fai que estemos concatenando un array, non a quitedes
                            )
                        )
                    }
                )
            }
        ),

        // AUTORIA
        if (autoria != none) { text(size: 14pt, autoria) } else { none },

        // AFILIACION
        if (afiliacion != none) { text(size:1.1em, afiliacion) } else { none },

        // SUBTITULO
        if (subtitulo  != none) { emph(subtitulo) } else { none },

    ).filter(x => x != none) // Filtramos o array, pode que algún sexan 'none', e eliminámolos

    // O número de filas que ten o titular
    let numero_filas_titular = filas_titular.len()

    grid(
        columns    : 1fr,
        rows       : numero_filas_titular,
        row-gutter : 1em,
        align      : center,
        ..filas_titular
    )

    counter(figure.where(kind: image)).update(0)

    v(1em)
    artigo

}

// Citas que aparecen na bibliografía pero non no texo, análogo a `\nocite` en
// LaTeX
#let SenCita(cita) = {
    place(hide(cite(label(cita))))
}

#let CrearBibliografia(bib) = {
    // Nota: as traduccións de CSL están incluídas xa en hayagriva: https://github.com/typst/hayagriva/blob/main/archive/locales/gl-ES.cbor
    // :FACER:MIGRACION: usar o nome do ficheiro automaticamente
    heading(depth: 2, condensada[*Bibliografía*])
    bibliography(
        bib,
        style: "/momentum-citacions.csl",
        group: none,
        title: none
    )
}

// Función para crear unha pregunta nunha entrevista
#let Pregunta(
    corpo
) = {
    v(0.6em)
    strong(sans(corpo))
    v(0.6em)
}

// Función para os títulos dos pequenos textos de miscelánea que poden conter variedade de cousas
// :FACER: igual podemos unificar opinion e pasatempos? algo como minititular..?
#let Opinion(
    titulo: none,
    autoria: none
) = {
    heading(
        level: 2,
        text(fill: rgb(datos.cor_resalte), titulo)
    )
    text(size: 1.2em, autoria)
    v(1em)
}

// Función para o título dun pasatempo
#let Pasatempo(
    titulo: none,
    autoria: none,
    extra: none
) = {
    heading(
        level: 2,
        text( fill: rgb(datos.cor_resalte), titulo)
    )
    if autoria != none { text( weight: "regular", autoria) }
    if extra != none { [#h(1fr) #extra] }
    v(1em)
}

// Varios símbolos e tal
// :FACER: varphi, varepsilon, etc.

#let dbar = math.class( "normal", $\u{0111}$)
