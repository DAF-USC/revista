#import "@preview/tiaoma:0.3.0"

#set text(
    font: "Latin Modern Roman",
    tracking : -0.04em,
    weight: "medium"
)
#set page(
    paper:"a4",
    margin:(
        left   : 2cm,
        right  : 2cm,
        top    : 1cm,
        bottom : 0cm,
    ),
)
#set par( justify: true, first-line-indent: 0mm, leading : 0.4em)

#let ruta_portada = "/.pdf/paxinas_" + sys.inputs.at("numero") + "_0.pdf"
#let correo = "revistafisicaUSC@gmail.com"
#let edicions = "https://www.usc.gal/gl/centro/facultade-fisica/revista-estudantil-momentum"

#let QR1 = tiaoma.barcode(
    "mailto:" + correo,
    "QRCode",
    options: (option-1: 4, option-2: 8, scale: 2.0),
)

#let QR2 = tiaoma.barcode(
    edicions,
    "QRCode",
    options: (option-1: 4, option-2: 8, scale: 2.0),
)

// %%%%%%%%%%%%%%%%%%%%%%

#set align(center)

#block(
    width : 100% + 2cm,
    text( size:35pt, weight: "bold", fill : rgb(sys.inputs.at("cor")) )[
        Xa está aquí a nova publicación \
        Momentum nº#float(sys.inputs.at("numero")), nas túas mans!
    ]
)

#v(3em)

#grid(

    rows : (3.6cm,7cm,7cm),
    columns : (5.5cm,1fr,1fr),
    row-gutter : 1cm,
    column-gutter : 1cm,
    // stroke: 1pt,
    align : (center, center, center),

    grid.cell(
        x:0,
        colspan:3,
        stroke:1pt,
        inset:2em,
        text(
            size:20pt,
        )[
            Divulgación, historia, filosofía, pasatempos e moito\
            máis pode haber. Participa! Hoxe podes lela, mais\
            pode o teu nome estar no seguinte número
        ],
    ),

    grid.cell(
        x:0, y:1,
        colspan : 2,
        rowspan : 2,
        rect(stroke: 3pt, inset:0.1em, image(height: 15cm, ruta_portada )),
    ),

    grid.cell(
        x:2,y:1,
        grid(
            rows : 2,
            // stroke:1pt,
            inset: 1em,
            text(size: 24pt, font: "Latin Modern Sans", weight: "bold")[Edicións\ da Revista],
            QR1
        )
    ),

    grid.cell(
        x:2,y:2,
        grid(
            rows : 2,
            // stroke:1pt,
            inset: 1em,
            text(size: 24pt, font: "Latin Modern Sans", weight: "bold")[Participa,\ Whatsapp],
            QR1
        ),
    )

)

#v(-2.5em)
#text(size: 35pt)[Ti tamén podes ser parte dela!]

#v(-2.5em)
#line(length: 110%, stroke: 1pt)

#grid(
    columns : (1fr,3cm,1fr),
    rows : (2em,2em),
    // stroke : 1pt,
    row-gutter: 1.1em,
    align : (center , center, center),

    grid.cell(
        x:0,
        y:0,
        link("mailto:revistafisicausc@gmail.con")[
            #text(
                font : "Symbols Nerd Font Mono",
                size : 20pt,
                box[󰊫]
            )
            #h(1em)
            #text(
                baseline : -0.2em,
                size : 12pt,
                [revistafisicausc\@gmail.con]
            )
        ]
    ),

    grid.cell(
        x:0,
        y:1,
        link("https://www.instagram.com/momentum.usc/")[
            #text(
                font : "Symbols Nerd Font Mono",
                size : 20pt,
                box[]
            )
            #h(1em)
            #text(
                baseline : -0.1em,
                size : 12pt,
                [\@momentum.usc]
            )
        ],
    ),

    grid.cell(
        x: 1,
        y: 0,
        rowspan : 2,
        image( height : 100%, "/logos/botafumeiro.png")
    ),

    grid.cell(
        x:2,
        y:0,
        link("mailto:revistafisicausc@gmail.con")[
            #text(
                baseline : -0.2em,
                size : 12pt,
                [revistafisicausc\@gmail.con]
            )
            #h(1em)
            #text(
                font : "Symbols Nerd Font Mono",
                size : 20pt,
                box[󰊫]
            )
        ]
    ),

    grid.cell(
        x:2,
        y:1,
        link("https://www.instagram.com/momentum.usc/")[
            #text(
                baseline : -0.1em,
                size : 12pt,
                [\@momentum.usc]
            )
            #h(1em)
            #text(
                font : "Symbols Nerd Font Mono",
                size : 20pt,
                box[]
            )
        ],
    ),

)
