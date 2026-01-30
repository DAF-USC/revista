#import "@preview/tiaoma:0.3.0"

#let ruta_portada = "/.pdf/portada_" + sys.inputs.at("numero") + ".pdf"
#let correo       = "revistafisicaUSC@gmail.com"
#let edicions     = "https://www.usc.gal/gl/centro/facultade-fisica/revista-estudantil-momentum"
#let cor          = rgb(sys.inputs.at("cor"))
#let cortexto     = rgb(sys.inputs.at("cortexto"))

#set text(
    font     : "Latin Modern Sans",
    tracking : -0.04em,
    weight   : "medium",
)
#set page(
    paper  : "a4",
    margin : (left: 1cm, right: 1cm, top: 1cm, bottom: 1cm),
)
#set par(
    justify           : true,
    first-line-indent : 0mm,
    leading           : 0.4em,
)

#let QR = tiaoma.barcode(
    "https://chat.whatsapp.com/E900g1Bq7QT5ZKeuiIpxTk",
    "QRCode",
    options : (
        option-1 : 4,
        option-2 : 8,
        scale    : 3.0,
    ),
)

#let propaganda(
    estilo : none,
) = {
    if (estilo != "claro") and (estilo != "cor" ) { panic("As opcións para a propaganda son 'claro' ou 'cor'") }
    set align(center)

    // Cor do fondo da propaganda
    set page(
        fill: if estilo == "cor" { cor } else { cortexto }
    )

    // Cor do texto, depende do estilo da propaganda
    set text(
        fill: if estilo == "cor" { cortexto } else { cor }
    )

    grid(
        rows: 2,
        row-gutter: 1em,
        text(
            size   : 25pt,
            weight : "bold",
            fill   : cor.darken(70%)
        )[_Revista estudantil_],
        text(size: 75pt, weight: "bold")[Momentum],
    )

    v(0.5em)
    set text(fill: if estilo == "cor" { cortexto } else { cor.darken(80%) })

    block(
        inset  : 1em,
        width  : 100%,
        fill   : cor.lighten(25%),
        radius : 1em,
        stroke : cor.darken(50%) + 3pt,
        text(
            size : 20pt,
            font : "Latin Modern Sans",
        )[
            Divulgación, historia, filosofía, pasatempos,\
            programación, vida na facultade e moito máis.\
            Calquera pode participar, anímate!
        ],
    )

    v(0.5em)

    // O tamaño da primeira páxina da revista
    let alto  = 16cm
    let ancho = alto*(1/calc.sqrt(2)) // proporción A4
    block(
        width  : ancho,
        height : alto,
        rect(
            stroke : 3pt,
            fill   : white,
            image(width: ancho, ruta_portada),
        ),
    )

    v(0.5em)
    set text(weight: "bold")

    block(
        width  : 100%,
        inset  : 1em,
        fill   : cor.lighten(25%),
        stroke : cor.darken(50%) + 3pt,
        radius : 1em,
        grid(
            columns : (60%, 40%),
            rows    : 1,
            align   : (center + horizon, center + horizon),
            grid(
                columns       : (auto, auto, auto),
                rows          : (2em, 2em, 2em),
                column-gutter : 1.1em,
                row-gutter    : 1em,
                align         : (right + horizon, center + horizon, left + horizon),

                grid.cell(x:0, y:0, text(size: 12pt, [Explora o proxecto])),
                grid.cell(x:1, y:0, text(font: "Symbols Nerd Font Mono", size: 20pt, box[])),
                grid.cell(x:2, y:0, link("https://www.github.com/fisicaUSC/revista")[ #text(size: 12pt, font: "Latin Modern Mono", [fisicaUSC/revista]) ],),

                grid.cell(x:0, y:1, text(size: 12pt, [Síguenos en redes])),
                grid.cell(x:1, y:1, text(font: "Symbols Nerd Font Mono", size: 20pt, box[])),
                grid.cell(x:2, y:1, link("https://www.instagram.com/momentum.usc/")[#text(size: 12pt, [\@momentum.usc])]),

                grid.cell(x:0, y:2, text(size: 12pt, [Manda teu artigo])),
                grid.cell(x:1, y:2, text(font: "Symbols Nerd Font Mono", size: 20pt, box[󰊫])),
                grid.cell(x:2, y:2, link("mailto:revistafisicausc@gmail.con")[#text(size: 12pt, [revistafisicausc\@gmail.con])]),
            ),
            grid(
                columns : 2,
                rows    : 1,
                grid.cell(x:0, y:0, block(stroke: 1pt, width: 80%, inset: 7pt, fill: white, QR)),
                grid.cell(x:1, y:0, rotate(-40deg, text(size:1.6em)[WhatsApp ]))
            )
        )
    )

}

#propaganda( estilo : "cor" )
#propaganda( estilo : "claro" )
