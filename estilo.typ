//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//  _____ ____ _____ ___ _     ___  %
// | ____/ ___|_   _|_ _| |   / _ \ %
// |  _| \___ \ | |  | || |  | | | |%
// | |___ ___) || |  | || |__| |_| |%
// |_____|____/ |_| |___|_____\___/ %
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//
// Defínense:
//
// Funcións que aceptan contido como argumento e lle aplican un estilo:
//
//     estilo_xeral()
//     estilo_portada()
//     estilo_indice()
//     estilo_contraportada()
//     estilo_corpo()
//
// Funcións que crean dito contido
//
//     crear_portada()
//     crear_indice()
//     crear_contraportada()
//
// Función que xunta todo
//
//     crear_revista()

// Unhas variables globais
#let _cor_resalte = state("cor_resalte", "#FF0000")
#let _cor_texto_resalte = state("cor_texto_resalte", "#FF0000")

#let _norm = ( familia: "New Computer Modern"      , peso: 450 , estilo: "normal" , estiramento: 100% )
#let _mate = ( familia: "Libertinus Math"          , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _sans = ( familia: "Roboto"                   , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _cond = ( familia: "Roboto"                   , peso: 400 , estilo: "normal" , estiramento: 75%  )
#let _mono = ( familia: "New Computer Modern Mono" , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _simb = ( familia: "Symbols Nerd Font Mono"   , peso: 400 , estilo: "normal" , estiramento: 100% )

// Varias funcións para activar as distintas fontes directamente
#let normal     = eso => text( fallback: false, font: _norm.familia, weight: _norm.peso, style: _norm.estilo, stretch: _norm.estiramento,)[#eso]
#let mates      = eso => text( fallback: false, font: _mate.familia, weight: _mate.peso, style: _mate.estilo, stretch: _mate.estiramento,)[#eso]
#let sans       = eso => text( fallback: false, font: _sans.familia, weight: _sans.peso, style: _sans.estilo, stretch: _sans.estiramento,)[#eso]
#let condensada = eso => text( fallback: false, font: _cond.familia, weight: _cond.peso, style: _cond.estilo, stretch: _cond.estiramento,)[#eso]
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
    set page(
        paper   : "a4",
        // binding : left,
    )
    set text(
        size      : 10pt,
        font      : _norm.familia,
        weight    : _norm.peso,
        lang      : "gl",
        fallback  : false,
        style     : "normal",
        features  : ( liga : 1, kern : 1, ),
        overhang  : true,
        region    : "ES",
        script    : "latn",
        dir       : ltr,
        hyphenate : true,
        costs     :  ( hyphenation: 10% )
    )
    show math.equation: set text(font: "New Computer Modern Math")
    show heading.where(level: 3): set text(font: _cond.familia, stretch: _cond.estiramento, size: 1.1em)
    doc
}

// Estilo para a portada.
#let estilo_portada(
    doc,
) = {
    set page(
        margin: (
            top    : 5mm,
            left   : 5mm,
            right  : 5mm,
            bottom : 5mm,
        ),
    )
    doc
}

// :FACER: esto cun grid
// Función para crear a portada
#let crear_portada(
    numero     : none,
    imaxe      : none,
    comentario : none,
    data       : none,
    mostrar_rede : false,
) = {

    grid(
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
                    context { text( fill: _cor_resalte.get(), size: 70pt)[*$arrow("M")$*] }
                    text(size: 70pt)[*OMENTUM*]
                }
            )
        ),

        // Número e data
        grid.cell(
            x:0, y:1,
            context {
                block(
                    inset  : 11pt,
                    stroke : 1pt,
                    fill   : _cor_resalte.get(),
                        text(
                            fill : _cor_texto_resalte.get(),
                            size : 15pt,
                            sans[Número #numero #h(1fr) #data]
                        )
                )
            }
        ),

        // Imaxe portada
        grid.cell(
            x:0, y:2,
            block(
                inset : 0.5pt,
                stroke : 1pt,
                {
                    image(width: 100%, imaxe)
                    place(
                        left + bottom, dy: -0.4cm, dx:  0.4cm,
                        rect(
                            fill: rgb("#44444499"),
                            stroke : 0.6pt + white.transparentize(70%),
                            text(fill : white, size : 11pt, sans(comentario))
                        )
                    )
                }
            )
        ),

        // Logos
        grid.cell(
            x:0, y:3,
            v(1fr)
        )

    )

}

// Estilo para o índice de contidos
#let estilo_indice(
    doc,
) = {
    set par(first-line-indent: 0pt)
    set page(
        background : context {
            place(
                right + top,
                rect(
                    fill: _cor_resalte.get().lighten(35%),
                    height: 100%,
                    width: 8cm,
                ),
            )
        },
        margin: (
            top    : 20mm,
            left   : 10mm,
            right  : 10mm,
            bottom : 25mm
        ),
    )
    show grid.cell: eso => {
        if eso.x == 2 {
            context {
                set text( fill: _cor_texto_resalte.get())
                set par(spacing: 0pt)
                eso
            }
        } else {
            eso
        }
    }
    doc
}

// Función para crear o propio índice de contidos
#let crear_indice(
    numero        : none,
    participantes : none,
    correo        : none,
    instagram     : none,
    repositorio   : none,
    data          : none,
    mostrar_rede  : false
) = {
    grid(

        columns : (1fr, 1.5cm, 6.2cm),
        rows    : (2cm,   1fr,  5.1cm, 3.5cm),
        stroke  : if mostrar_rede { 0.5pt } else { none },

        grid.cell(
            x:0, y:0,
            rowspan: 4,
            {
                // Refacer o outline case de cero
                show outline.entry: eso => context {
                    link(
                        eso.element.location(),
                        box({
                            text(
                                fill: _cor_resalte.get().darken(20%),
                                font: _cond.familia,
                                stretch: _cond.estiramento,
                                [*#eso.element.supplement*],
                            )
                            set text(size: 0.5em)
                            mono[\ #repr(eso)]
                            h(1fr)
                            [*#eso.page()*]
                        })
                    )
                }
                heading(
                    level: 1,
                    numbering: none,
                    condensada[*Índice*],
                )
                v(1em)
                outline(
                    title: none,
                    depth: 1,
                    target: figure.where(kind: "Titular")
                )
            }
        ),

        grid.cell(
            x:2,y:0,
            align: center,
            sans(
                {
                    set text( size : 1.5em )
                    data.display("[day padding:none] de [month repr:long] do [year]")
                    linebreak()
                    [Número #numero]
                }
            )
        ),

        grid.cell(
            x:2, y:1,
            align: left,
            grid(
                columns    : 1,
                rows       : 3,
                row-gutter : 1.4em,
                stroke     : if mostrar_rede { (dash: "dashed", thickness: 0.5pt) } else { none },

                {
                    text(size: 1.2em, font: _sans.familia)[Dirección]
                    v(1em)
                    participantes // Array de dicionarios ( (nome:"aa", posto:"bb"), (nome:"cc", posto:"dd") )
                        .filter(p => p.posto == "Dirección") // array so con participantes no posto 'Dirección'
                        .map(p => p.nome) // Devolvemos un array só cos nomes
                        .join("\n")
                },
                {
                    text(size: 1.2em, font: _sans.familia)[Edición]
                    v(1em)
                    participantes
                        .filter(p => p.posto == "Edición")
                        .map(p => p.nome)
                        .join("\n")
                },
                {
                    text(size: 1.2em, font: _sans.familia)[Deseño de Logo]
                    v(1em)
                    participantes
                        .filter(p => p.posto == "Deseño de Logo")
                        .map(p => p.nome)
                        .join("\n")
                }
            )
        ),

        grid.cell(
            x: 2, y:2,
            {
                set par(spacing: 0pt)
                grid(
                    rows: 3,
                    row-gutter: 1em,
                    columns : (100%,),
                    stroke  : if mostrar_rede { (dash: "dashed", thickness: 0.5pt) } else { none },
                    grid(
                        columns:1, rows:2, row-gutter: 7pt,
                        stroke  : if mostrar_rede { (dash: "dotted", thickness: 0.5pt) } else { none },
                        text(size: 20pt, font: _simb.familia)[#h(3pt) ],
                        link("mailto:" + correo, sans[#correo])
                    ),
                    grid(
                        columns:1, rows:2, row-gutter: 7pt,
                        stroke  : if mostrar_rede { (dash: "dotted", thickness: 0.5pt) } else { none },
                        text(size: 20pt, font: _simb.familia)[#h(3pt) ],
                        link("https://www.instagram.com/" + instagram, sans[@#instagram])
                    ),
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

        grid.cell(
            x: 2, y:3,
            {
                // v(1fr)
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
#let estilo_corpo(doc) = {
    counter(page).update(1)
    set page(
        margin: (
            top    : 20mm,
            left   : 10mm,
            right  : 10mm,
            bottom : 25mm
        ),
        footer : context {
            let p = counter(page).get().first()
            [*#numbering("1",p)*]
        }
    )
    set par(
        justify           : true,
        linebreaks        : "optimized",
        first-line-indent : 0mm,
    )
    show raw: set text(
        font: _mono.familia,
        ligatures: true,
    )
    show quote: it => {
        set quote(block: true)
        set text(style:"italic")
        it
    }
    show figure.caption: it => {
        set align(left)
        set text(font:_sans.familia)
        { context strong[#it.supplement~#it.counter.display() #it.separator] }
        it.body
    }
    doc
}

// Estilo para a contraportada
#let estilo_contraportada(doc) = {
    doc
}

// Función para crear a contraportada
#let crear_contraportada(
    anteriores : none,
    whatsapp   : none,
    mostrar_rede : false,
) = {

    import "@preview/tiaoma:0.3.0"

    set page(
        margin: (
            top    : 5mm,
            left   : 5mm,
            right  : 5mm,
            bottom : 5mm,
        ),
        background: place(
            center,
            dy : 10em,
            circle(radius:7cm, stroke: luma(90%) + 9pt,[  ])
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
                text(size: 1.5em)[
                    #set par(justify: true, leading:0.3em)
                    Aquí está a revista por e para estudantes da Facultade de
                    Física USC! Cansos de que o momento lineal e angular guíen
                    as nosas traxectorias?, imos escribir unha nova historia;
                    entrevistas, divulgación, filosofía da ciencia e moitos
                    artigos dispares cargamos coa inercia de formar unha nova
                    fiestra para o alumnado. Tes nas túas mans esta
                    oportunidade, deixa que o magnetismo te leve e participa,
                    sé parte deste proxecto: escribe, le, comparte, suxire… A
                    revista é real e as túas ideas poden ser máis que
                    imaxinación, non dubides en deixar a túa pegada neste
                    recuncho físico, onde hai física máis aló das aulas
                ]
                text(size: 2em, [Agradecementos])
                text(size: 1.2em)[
                    #set par(justify: true, leading:0.3em)
                    Dende a dirección da revista, queriamos agradecervos a
                    todos por achegarvos a este proxecto. Non hai revista
                    sen lector! Mais, para facela, estivo moita xente
                    implicada que non podemos pasar por alto. Sentímonos
                    moi orgullosos de contar cun equipo tan esmerado que
                    roza a perfección no traballo, grazas aos nosos
                    editores e correctores unha vez máis. Tamén a todas
                    aquelas persoas en calidade de redactoras que crearon o
                    contido para este novo número. Sen eles non sería
                    posible continuar con este proxecto.

                    Agradecemos a eses docentes constantes que apoian a
                    revista, a Ana Peón pola súa ilusión de escribir, a
                    Gabriel Rodríguez que leva a revista até Dresden.
                    Ademais, grazas a Manuel Rey por abrirnos a porta para
                    colaborar co IGFAE.


                    Finalmente, grazas tanto ao equipo decanal da nosa
                    facultade como á vicerreitoría de estudantes e cultura.

                    Esperamos que recibades con entusiasmo este novo número
                    na meseta deste segundo cuadrimestre e sexa un pequeno
                    alivio no asfixiante día nesta facultade.
                ]
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

            grid.cell(x:0, y:0, [Edicións anteriores]),
            grid.cell(
                x: 0, y:1,
                tiaoma.barcode(
                    anteriores,
                    "QRCode",
                    options: (
                        option-1: 4, // error correction 1-4
                        option-2: 8, // detalle 1-40
                        scale: 1.5,
                    ),
                )
            ),

            grid.cell(x:1, y:0, [Participa! (WhatsApp)]),
            grid.cell(
                x: 1, y:1,
                tiaoma.barcode(
                    whatsapp,
                    "QRCode",
                    options: (
                        option-1: 4,
                        option-2: 8,
                        scale: 1.5,
                    ),
                )
            ),

            grid.cell(x:2, y:0, [Co financiamento de]),
            grid.cell(
                x:2, y:1,
                [Alguén]
            )

        )

    )

}

#let crear_revista(
    numero            : "-- SEN NÚMERO --",
    data              : datetime.today(),
    cor_resalte       : rgb("ff0000"),
    cor_texto_resalte : rgb("ffffff"),
    imaxe             : "negro.png",
    comentario        : "-- SEN COMENTARIO --",
    repositorio       : "fisicaUSC/revista",
    whatsapp          : "https://chat.whatsapp.com/E900g1Bq7QT5ZKeuiIpxTk",
    instagram         : "momentum.usc",
    anteriores        : "https://www.usc.gal/gl/centro/facultade-fisica/revista-estudantil-momentum",
    correo            : "revistafisicausc@gmail.com",
    participantes     : ((nome: "-- SEN PARTICIPANTES --"),),
    despedida         : "-- SEN DESPEDIDA --",
    agradecementos    : "-- SEN AGRADECEMENTO --",
    artigos           : "-- SEN ARTIGOS --",
    formato           : sys.inputs.formato,
    mostrar_rede      : false
) = {

    // Gardamos o novo valor das cores para poder usalo nos artigos
    _cor_resalte.update(c => cor_resalte)
    _cor_texto_resalte.update(c => cor_texto_resalte)

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
                numero     : numero,
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
                numero        : numero,
                correo        : correo,
                instagram     : instagram,
                repositorio   : repositorio,
                data          : data,
                mostrar_rede  : mostrar_rede
            )
        }

        // Activamos o estilo para os artigos (corpo) e mostrámolos
        {
            show: estilo_corpo
            artigos
        }

        // Activamos o estilo para a contraportada e creámola
        {
            show: estilo_contraportada
            crear_contraportada(
                anteriores : anteriores,
                whatsapp   : whatsapp,
                mostrar_rede : mostrar_rede
            )
        }

    }

    // Para a versión simple mostramos so os artigos
    else if formato == "simple" {

        // Activamos o estilo para os artigos (corpo) e mostrámolos
        {
            show: estilo_corpo
            artigos
        }

    }

    // Para a impresa mostramos todo, con algúns cambios
    else if formato == "impresa" {
        {
            show: estilo_portada
            crear_portada(
                numero     : numero,
                imaxe      : imaxe,
                comentario : comentario,
                data       : data.display("[month repr:long] [year]")
            )
        }
        {
            show: estilo_indice
            crear_indice(
                participantes : participantes,
                numero        : numero,
                correo        : correo,
                instagram     : instagram,
                repositorio   : repositorio,
                data          : data
            )
        }
        {
            show: estilo_corpo
            artigos
        }
        {
            show: estilo_contraportada
            crear_contraportada(
                correo   : correo,
                whatsapp : whatsapp,
                mostrar_rede : mostrar_rede
            )
        }
    }

    else { panic("Formato da revista non válido") }

}


#let Titular(
    titulo    : "-- SEN TÍTULO --",
    subtitulo : "-- SEN SUBTITULO --",
    autoria   : "-- SEN AUTORÍA --",
    estilo    : "-- SEN ESTILO --",
    mostrar_rede : false,
    artigo
) = {
    set page(
        header: grid(
            columns    : (1fr, 2.3cm, 1fr),
            rows       : (1em,1em,1em),
            row-gutter : 0pt,
            align      : (left+horizon, center+horizon, right+horizon ),
            stroke  : if mostrar_rede { 0.5pt } else { none },
            grid.cell(
                x:0, y:0,
                context {
                    set text(
                        fill   : _cor_resalte.get(),
                        font   : _cond.familia,
                        stretch: _cond.estiramento,
                        weight : "bold",
                    )
                    estilo
                }
            ),
            grid.cell(x:0, y:1, line(length:100%, stroke:0.2pt)),
            grid.cell(x:2, y:1, line(length:100%, stroke:0.2pt)),
            grid.cell(
                x:1,
                rowspan:3,
                context {
                    circle(
                        fill   : _cor_resalte.get(),
                        radius : 1.4em,
                        text(
                            fill : _cor_texto_resalte.get(),
                            size : 22pt,
                            [$accent(m,arrow)$]
                        )
                    )
                }
            )
        )
    )

    // :FACER: delicado
    // _artigos.update( eu => eu + ( str(titulo) : autoria ) )

    grid(
        columns : 1fr, rows:3, row-gutter: 1em,
        stroke  : if mostrar_rede { 0.5pt } else { none },
        align   : center,

        // // TITULO
        // context {
        //     block(
        //         width : 100%,
        //         inset : (y:2em, x:2em ),
        //         radius: (top-left: 3em, bottom-right: 3em),
        //         fill : rgb(_cor_resalte.get()).lighten(50%),
        //             text(
        //                 size   : 20pt,
        //                 fill   : rgb(_cor_texto_resalte.get()),
        //                 weight : "bold",
        //                 condensada([ #heading(titulo) ])
        //             )
        //     )
        // },

        context {
            figure(
                kind: "Titular",
                supplement : titulo,
                block(
                    width : 100%,
                    inset : (y:2em, x:2em ),
                    radius: (top-left: 3em, bottom-right: 3em),
                    fill : rgb(_cor_resalte.get()).lighten(50%),
                        text(
                            size   : 20pt,
                            fill   : rgb(_cor_texto_resalte.get()),
                            weight : "bold",
                            condensada([ #heading(titulo) ])
                        )
                )
            )
        },


        // AUTORÍA
        text(size: 14pt, [#autoria]),

        // SUBTITULO
        emph(subtitulo)

    )

    columns(2, gutter:5mm, artigo)

}

