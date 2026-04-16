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
// Defínense varias funcións xerais na revista
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
//     estilo_contraportada(...) -> Estilo da contraportada
//     estilo_corpo(...)         -> Estilo do corpo da revista (ousexa, os artigos).
//                                  Posición dos números da páxina, encabezados, marxes
//                                  xustificación do texto, e formatos menores
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
// 3) Función para activar o estilo concreto dun artigo
//
//     Titular(...) -> Crea o titular dun artigo (título, subtitulo,
//                     autoría,...), cas cores indicadas. Tamén cambia o estilo
//                     da páxina (encabezados), e vai gardando nun array a
//                     información dos artigos (título, autoría e posición) para
//                     logo poder usala no índice
//
// 4) Función que xunta todo
//
//     crear_revista(...) -> Xera a revista. Méteselle o contido dos artigos e
//                           a información específica dun número, como a Data,
//                           Número, Cor, etc.
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
//     --input formato=completa  -> tipo de revista: completa/impresa
//     --input rama=principal    -> rama de Git actual    | Estas 3 opcións collen a info
//     --input hash=9000e53      -> hash de Git actual    | automáticamente usando Git
//     --input dirt=*            -> estado do WorkingTree | na Makefile
//
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Unhas variables globais.
// https://typst.app/docs/reference/introspection/state/
//
// :FACER: hai alternativas a esto sen estados?
#let _cor_resalte = state("cor_resalte", "#FF0000")
#let _cor_texto_resalte = state("cor_texto_resalte", "#FF0000")

// Booleano para mostrar unha referencia visual dos 'grid' da revista
#let _mostrar_rede = state("mostrar_rede", false)

// Array que se encherá de dicionarios con info dos artigos, é dicir
//
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
// Úsase para xerar o índice
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
// volvense 'auto'. Esto son varios dicionario ca información das fontes, así é
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
#let normal     = eso => text( fallback: false, font: _norm.familia, weight: _norm.peso, style: _norm.estilo, stretch: _norm.estiramento,)[#eso]
#let mates      = eso => text( fallback: false, font: _mate.familia, weight: _mate.peso, style: _mate.estilo, stretch: _mate.estiramento,)[#eso]
#let sans       = eso => text( fallback: false, font: _sans.familia, weight: _sans.peso, style: _sans.estilo, stretch: _sans.estiramento,)[#eso]
#let condensada = eso => text( fallback: false, font: _cond.familia, weight: _cond.peso, style: _cond.estilo, stretch: _cond.estiramento,)[#eso]
#let semiCondensada = eso => text( fallback: false, font: _cond.familia, weight: _cond.peso, style: _cond.estilo, stretch: _cond.estiramento,)[#eso]
#let mono       = eso => text( fallback: false, font: _mono.familia, weight: _mono.peso, style: _mono.estilo, stretch: _mono.estiramento,)[#eso]
#let simbolos   = eso => text( fallback: false, font: _simb.familia, weight: _simb.peso, style: _simb.estilo, stretch: _simb.estiramento,)[#eso]

// Estilo xeral que aplica a TODA a revista. Fonte por defecto, algúns
// metadatos, data, etc.
#let estilo_xeral(
    participantes : none,
    data          : none,
    doc,
) = {
    set document(
        title       : "Revista Estudantil Momentum",
        author      : participantes.map(p => p.nome),
        description : "Revista de Física Estudantil e Compostelana",
        keywords    : ("física","divulgación","galego"),
        date        : data
    )
    set page(paper: "a4")
    set text(
        size      : 10pt,
        font      : _norm.familia,
        weight    : _norm.peso,
        lang      : "gl", // https://en.wikipedia.org/wiki/ISO_639
        fallback  : false,
        style     : "normal",
        features  : ( liga : 1, kern : 1, ), // https://en.wikipedia.org/wiki/List_of_typographic_features
        overhang  : true, // Protrusión. Manter un ollo en https://github.com/typst/typst/issues/261
        region    : "ES", // https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
        script    : "latn", // https://en.wikipedia.org/wiki/ISO_15924
        dir       : ltr,
    )
    show math.equation: set text(font: "New Computer Modern Math")
    show heading.where(level: 3): set text(font: _cond.familia, stretch: _cond.estiramento, size: 1.1em)
    doc
}

// Estilo para a portada.
#let estilo_portada(
    doc,
) = {
    set page( margin: (top: 5mm, left: 5mm, right: 5mm, bottom: 5mm) )
    doc
}

// :FACER:MIGRACION: tamaños correctos na portada
// Función para crear a portada
#let crear_portada(
    imaxe        : none,
    comentario   : none,
    data         : none,
    mostrar_rede : false,
) = grid(

    columns : 1fr,
    rows    : 4,
    align   : center,
    stroke  : if mostrar_rede { 0.5pt } else { none },

    // O titulo
    grid.cell(
        x:0,y:0,
        block(
            inset: 0.5cm,
            {
                context text( fill: _cor_resalte.get(), size: 70pt)[*$arrow("M")$*]
                text(size: 70pt)[*OMENTUM*]
            }
        )
    ),

    // Número e data
    grid.cell(
        x:0, y:1,
        context block(
            inset  : 11pt,
            stroke : 1pt,
            fill   : _cor_resalte.get(),
            text(
                fill : _cor_texto_resalte.get(),
                size : 15pt,
                // :FACER:MIGRACION: como facemos ca l10n ?
                mono[Número #sys.inputs.at("numero") #h(1fr) #data]
            )
        )
    ),

    // Imaxe portada
    grid.cell(
        x:0, y:2,
        block(
            inset : 0.5pt,
            stroke : 1pt,
            {
                // :FACER: cando https://github.com/typst/typst/pull/7556 se
                // xunte pode poñerse unha imaxe plana de exemplo cando
                // `portada.png` non exista
                image(width: 100%, imaxe)
                place(
                    left + bottom, dy: -0.4cm, dx:  0.4cm,
                    rect(
                        fill: rgb("#44444499"),
                        // :FACER:MIGRACION: imaxe de fondo transparente
                        stroke : 0.6pt + white.transparentize(70%),
                        text(fill : white, size : 11pt, sans(comentario))
                    )
                )
            }
        )
    ),

    // Logos
    // :FACER:MIGRACION: meter os logos
    grid.cell( x:0, y:3, v(1fr))

)

// Estilo para o índice de contidos
#let estilo_indice(
    doc,
) = {
    // Non usar sangría
    set par(first-line-indent: 0pt)
    set page(
        // O rectángulo de cor do lado dereito
        background : context place(
            right + top,
            rect(fill: _cor_resalte.get().lighten(35%), height: 100%, width: 8cm),
        ),
        margin: ( top : 20mm, left : 10mm, right : 10mm, bottom : 25mm ),
    )
    show grid.cell: eso => {
        if eso.x == 2 {
            context {
                set text( fill: _cor_texto_resalte.get())
                set par(spacing: 0pt)
                eso
            }
        } else { eso }
    }
    doc
}

// Función para crear o propio índice de contidos
// :FACER: simplificar na medida do posible todo o índice
#let crear_indice(
    participantes : none,
    correo        : none,
    instagram     : none,
    repositorio   : none,
    data          : none,
    mostrar_rede  : false
) = {
    grid(

        // Grid tamaño 4x3
        columns : (1fr, 1.5cm, 6.2cm),
        rows    : (2cm, 1fr, 5.1cm, 3.5cm),
        stroke  : if mostrar_rede { 0.5pt } else { none },

        // Índice de artigos
        grid.cell(
            x:0, y:0, rowspan: 4, // 4: A primeira columna completa
            {
                heading( level: 1, numbering: none, condensada[*Índice*])
                // ERRO (curioso) facer simplemente #_artigos.final() non vai, está bugueado
                // Iteramos polo array ca info dos artigos
                context for artigo in _artigos.final(){
                    // Mostramos os artigos como ligazóns
                    link(
                        // A onde nos vai levar a ligazón
                        artigo.localizacion,
                        // Que mostra a ligazón
                        {
                            text(
                                fill    : _cor_resalte.get().darken(20%),
                                font    : _semi.familia,
                                stretch : _semi.estiramento,
                                [
                                    #show "\n": " " // para eliminar as novas liñas dos títulos
                                    *#artigo.titulo*
                                ],
                            )
                            h(1fr)
                            [*#artigo.localizacion.page*]
                            linebreak()
                            artigo.autoria
                            v(1em)
                        }
                    )
                }
            }
        ),

        // Data e número
        grid.cell(
            x:2,y:0, align: center,
            sans(
                {
                    set text( size : 1.5em )
                    data.display("[day padding:none] de [month repr:long] do [year]")
                    linebreak()
                    [Número #sys.inputs.at("numero")]
                }
            )
        ),

        // Participantes
        grid.cell(
            x:2, y:1,
            align: left,
            grid(
                columns    : 1,
                rows       : 3,
                row-gutter : 1.4em,
                stroke     : if mostrar_rede { (dash: "dashed", thickness: 0.5pt) } else { none },

                // :FACER: simplificar esto cunha función?
                {
                    // :FACER: aclarar postos. Cales son?
                    show text: sans
                    text(size: 1.2em)[*Dirección*]
                    v(1em)
                    participantes // Array de dicionarios ( (nome:"aa", posto:"bb"), (nome:"cc", posto:"dd") )
                        .filter(p => p.posto == "Dirección") // Array so con participantes no posto 'Dirección'
                        .map(p => p.nome)                    // Devolvemos un array só cos nomes
                        .join("\n")                          // Xunstamos os nomes cun '\n'
                },
                {
                    show text: sans
                    text(size: 1.2em)[*Edición*]
                    v(1em)
                    participantes
                        .filter(p => p.posto == "Edición")
                        .map(p => p.nome)
                        .join("\n")
                },
                {
                    show text: sans
                    text(size: 1.2em)[*Deseño de Logo*]
                    v(1em)
                    participantes
                        .filter(p => p.posto == "Deseño de Logo")
                        .map(p => p.nome)
                        .join("\n")
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
                    stroke  : if mostrar_rede { (dash: "dashed", thickness: 0.5pt) } else { none },
                    // CORREO
                    grid(
                        columns:1, rows:2, row-gutter: 7pt,
                        stroke  : if mostrar_rede { (dash: "dotted", thickness: 0.5pt) } else { none },
                        text(size: 20pt, font: _simb.familia)[#h(3pt) ],
                        link("mailto:" + correo, sans[#correo])
                    ),
                    // INSTAGRAM
                    grid(
                        columns:1, rows:2, row-gutter: 7pt,
                        stroke  : if mostrar_rede { (dash: "dotted", thickness: 0.5pt) } else { none },
                        text(size: 20pt, font: _simb.familia)[#h(3pt) ],
                        link("https://www.instagram.com/" + instagram, sans[@#instagram])
                    ),
                    // INFO GIT
                    grid(
                        columns:1, rows:3, row-gutter: 7pt,
                        stroke  : if mostrar_rede { (dash: "dotted", thickness: 0.5pt) } else { none },
                        text(size: 20pt, font: _simb.familia)[#h(3pt) ],
                        link("https://github.com/" + repositorio, mono[#repositorio]),
                        {
                            simbolos[]
                            mono(sys.inputs.at("rama"))
                            [:]
                            mono(sys.inputs.at("hash"))
                            // h(5pt)
                            mono(sys.inputs.at("dirt"))
                        }
                    )
                )
            }
        ),

        // Logo USC
        grid.cell(
            x: 2, y:3,
            {
                rect(
                    stroke : if mostrar_rede { (dash: "dashed", thickness: 0.5pt) } else { none },
                    inset : 0pt,
                    image("/logos/usc-negativo-escuro.pdf"),
                )
            }
        )

    )
}

// Estilo para os artigos
#let estilo_corpo(
    mostrar_rede: false,
    doc,
) = {
    // Comezamos a contar páxinas
    counter(page).update(1)
    set page(
        margin: ( top : 20mm, left : 10mm, right : 10mm, bottom : 25mm ),
        footer : context {
            let p = counter(page).get().first()
            if calc.even(p) {
                // Pe de paxinas pares
                grid(
                    stroke  : if mostrar_rede { 0.5pt } else { none },
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
                    stroke: if mostrar_rede { 0.5pt } else { none },
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
        // :FACER:MIGRACION: patróns de galego en hypher 0.1.7, á espera de que se engadan
        hyphenate : true,
        costs     : ( hyphenation: 10% )
    )
    // :FACER: axustar espazos
    set par(
        justify              : true,        // Texto xustificado
        linebreaks           : "optimized", // Xustificación óptima
        first-line-indent    : 0mm,         // Sen sangría
        justification-limits : (            // Topes character kerning (tracking) e word spacing
            tracking : (min: -0.04em, max: 0.02em), // Entre caracteres
            spacing  : (min: 66.67% + 0pt, max: 150% + 0pt) // Entre palabras
        )
    )
    show raw: set text(
        font: _mono.familia,
        ligatures: true,
    )
    // :FACER: diferenciar Cita en modo bloque e en liña, usando funcións
    // diferentes
    show quote: set text(style: "italic")
    show quote.where(block:true): eso => if mostrar_rede {
        rect(
            inset: 0pt,
            stroke: 0.6pt,
            text(style:"italic", eso)
        )
    } else { eso }
    show figure.caption: eso => if mostrar_rede {
        set align(left)
        rect(
            inset: 0pt,
            stroke: 0.6pt,
            {
                set text(font:_sans.familia)
                context strong[#eso.supplement~#eso.counter.display() #eso.separator]
                eso.body
            }
        )
    } else {
        set align(left)
        set text(font:_sans.familia)
        context strong[#eso.supplement~#eso.counter.display() #eso.separator]
        eso.body
    }
    show image: eso => if mostrar_rede { rect(inset: 0pt, stroke:red, eso) } else { eso }
    show figure: eso => if mostrar_rede { rect(inset: 0pt, stroke:blue+2pt, eso) } else { eso }
    show math.equation.where(block: false): eso => { box(eso) }

    // :FACER: referencias a ecuacións, figuras, etc
    doc
}

// Estilo para a contraportada
// :FACER:MIGRACION: estilo da contraportada
#let estilo_contraportada(doc) = {
    doc
}

// Función para crear a contraportada
#let crear_contraportada(
    anteriores     : none,
    whatsapp       : none,
    agradecementos : none,
    despedida      : none,
    mostrar_rede   : false,
) = {

    import "@preview/tiaoma:0.3.0"

    // :FACER: esto debería estar no estilo da contraportada
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

    grid(
        columns    : 100%,
        rows       : (4fr, 0pt, 1fr),
        align      : center + horizon,
        row-gutter : 1em,
        stroke     : if mostrar_rede { 0.5pt } else { none },

        // Un Momentum...
        block(
            width : 70%,
            stroke : if mostrar_rede { (dash:"dashed", thickness:0.5pt) } else { none },
            {
                text(size: 2em, [Un Momentum...])
                // :FACER:MIGRACION: isto nunha variable externa
                text(
                    size: 1.5em,
                    {
                        set par(justify: true, leading:0.3em)
                        despedida
                    }
                )
                text(size: 2em, [Agradecementos])
                text(
                    size: 1.2em,
                    {
                        set par(justify: true, leading:0.3em)
                        agradecementos
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
            stroke: if mostrar_rede { (dash:"dashed", thickness:0.5pt) } else { none },

            // QR1
            grid.cell(x:0, y:0, [Edicións anteriores]),
            grid.cell(
                x: 0, y:1,
                // En caso de dúbidas, mirar o manual en https://zint.org.uk/
                tiaoma.barcode(
                    anteriores,
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
                tiaoma.barcode(whatsapp, "QRCode", options: (option-1: 4, option-2: 8, scale: 1.5))
            ),

            // Financiación
            // :FACER:MIGRACION: meter financiamento
            grid.cell(x:2, y:0, [Co financiamento de]),
            grid.cell(x:2, y:1, [Alguén])

        )

    )

}

// Función que xunta todo
#let crear_revista(
    data              : datetime.today(),
    cor_resalte       : rgb("ff0000"),
    cor_texto_resalte : rgb("ffffff"),
    imaxe             : "/revistas/" + sys.inputs.at("numero") + "/imaxes/portada.png" ,
    comentario        : "-- SEN COMENTARIO --",
    repositorio       : "fisicaUSC/revista",
    whatsapp          : "https://chat.whatsapp.com/E900g1Bq7QT5ZKeuiIpxTk",
    instagram         : "momentum.usc",
    anteriores        : "https://www.usc.gal/gl/centro/facultade-fisica/revista-estudantil-momentum",
    correo            : "revistafisicausc@gmail.com",
    participantes     : ((nome: "-- SEN PARTICIPANTES --"),),
    despedida         : "-- SEN DESPEDIDA --",
    agradecementos    : "-- SEN AGRADECEMENTOS --",
    artigos           : "-- SEN ARTIGOS --",
    formato           : sys.inputs.formato,
    mostrar_rede      : false
) = {

    // :FACER: comprobacións (tipos, lonxitudes..) e casos límite dos argumentos

    // Gardamos o novo valor das cores para poder usalo nos artigos
    _cor_resalte.update(c => cor_resalte)
    _cor_texto_resalte.update(c => cor_texto_resalte)

    // Pa mostrar ou no a estrutura das cousas
    _mostrar_rede.update(m => mostrar_rede)

    // Activamos o estilo xeral, que vai afectar a toda a revista
    show: estilo_xeral.with(
        participantes : participantes,
        data          : data,
    )

    // Para a revista completa mostramos todo
    if formato == "completa" {

        // Agora, activamos o estilo da portada e mostrámola
        {
            show: estilo_portada
            crear_portada(
                imaxe      : imaxe,
                comentario : comentario,
                data       : data.display("[month repr:long] [year]"),
                mostrar_rede : mostrar_rede
            )
        }

        // Activamos o estilo do índice e creámolo
        {
            show: estilo_indice
            crear_indice(
                participantes : participantes,
                correo        : correo,
                instagram     : instagram,
                repositorio   : repositorio,
                data          : data,
                mostrar_rede  : mostrar_rede
            )
        }

        // Activamos o estilo para os artigos (corpo) e mostrámolos
        {
            show: estilo_corpo.with( mostrar_rede: mostrar_rede )
            artigos
        }

        // Activamos o estilo para a contraportada e creámola
        {
            show: estilo_contraportada
            crear_contraportada(
                anteriores     : anteriores,
                whatsapp       : whatsapp,
                despedida      : despedida,
                agradecementos : agradecementos,
                mostrar_rede   : mostrar_rede
            )
        }

    }

    // Para a impresa mostramos todo, con algúns cambios
    // :FACER:MIGRACION: versión impresa
    else if formato == "impresa" {
        {
            show: estilo_portada
            crear_portada(
                imaxe      : imaxe,
                comentario : comentario,
                data       : data.display("[month repr:long] [year]")
            )
        }
        {
            show: estilo_indice
            crear_indice(
                participantes : participantes,
                correo        : correo,
                instagram     : instagram,
                repositorio   : repositorio,
                data          : data
            )
        }
        {
            show: estilo_corpo.with( mostrar_rede: mostrar_rede )
            artigos
        }
        {
            show: estilo_contraportada
            crear_contraportada(
                anteriores     : anteriores,
                whatsapp       : whatsapp,
                despedida      : despedida,
                agradecementos : agradecementos,
                mostrar_rede   : mostrar_rede
            )
        }
    }

    else { panic("Formato da revista non válido") }

}

// :FACER:MIGRACION: cargar bibliografía _per_ artigo. véxase https://github.com/typst/typst/pull/7277
#let Titular(                            /* TIPO      explicacion */
    titulo        : [-- SEN TÍTULO --],  // CONTENT Título do artigo
    autoria       : "-- SEN AUTORÍA --", // STRING  Quen fixo o artigo
    subtitulo     : none,                // CONTENT Subtítulo do artigo
    afiliacion    : none,                // STRING  Afiliación dos autores
    estilo        : "-- SEN ESTILO --",  // STRING  Estilo do artigo (divulgación, historia, etc.)
    mostrar_rede  : true,                // BOOL    Mostrar estrutura visual ou no
    artigo
) = {
    // :FACER: engadir comprobacións, p.e. assert(type(titulo) == "content")
    set page(
        header: context {
            grid(
                columns    : (1fr, 2.3cm, 1fr),
                rows       : (1em,1em,1em),
                row-gutter : 0pt,
                align      : (left+horizon, center+horizon, right+horizon ),
                stroke     : if _mostrar_rede.get() { 0.5pt } else { none },
                grid.cell(
                    x:0, y:0,
                    text(
                        fill   : _cor_resalte.get(),
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
                        fill   : _cor_resalte.get(),
                        radius : 1.4em,
                        text(
                            fill : _cor_texto_resalte.get(),
                            size : 22pt,
                            [$accent(m,arrow)$]
                        )
                    )
                )
            )
        }

    )

    // Contidos do Titular. Un array cos elementos. Ao final filtramos este
    // array pa quedarnos so cos contidos distintos de 'none'. Se non hai
    // afiliación ou o subtítulo o grid do Titular vaise adaptar acorde.
    let filas_titular = (
        // TITULO
        block(
            width : 100%,
            radius: (top-left: 3em, bottom-right: 3em),
            context {
                set par(leading: 0.4em)
                text(
                    size   : 25pt,
                    fill   : rgb(_cor_resalte.get()),
                    weight : "bold",
                    {
                        condensada(heading(titulo)) /* Mostrar o título */
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
                                ), // Esta coma fai que estemos concatenando un array
                            )
                        )
                    }
                )
            }
        ),

        // AUTORIA
        text(size: 14pt, autoria),

        // AFILIACION
        if (afiliacion != none) { text(size:1.1em, afiliacion) } else { none },

        // SUBTITULO
        if (subtitulo  != none) { emph(subtitulo) } else { none },

    ).filter(x => x != none) // Filtramos o array, pode que algún sexan 'none', e eliminámolos

    // O número de filas que ten o titular
    let numero_filas_titular = filas_titular.len()

    context grid(
        columns    : 1fr,
        rows       : numero_filas_titular,
        row-gutter : 1em,
        stroke     : if _mostrar_rede.get() { 0.5pt } else { none },
        align      : center,
        ..filas_titular
    )

    // :FACER: dúas columnas sempre?
    columns(2, gutter:5mm, artigo)

}

// Varios símbolos e tal

#let dbar = math.class( "normal", $\u{0111}$)
