#import "@preview/tiaoma:0.3.0"

#let ruta_paxina_1 = "/.pdf/paxinas_propaganda_" + sys.inputs.at("numero") + "_1.pdf"
#let ruta_paxina_2 = "/.pdf/paxinas_propaganda_" + sys.inputs.at("numero") + "_2.pdf"
#let ruta_paxina_3 = "/.pdf/paxinas_propaganda_" + sys.inputs.at("numero") + "_3.pdf"
#let correo        = "revistafisicaUSC@gmail.com"
#let edicions      = "https://www.usc.gal/gl/centro/facultade-fisica/revista-estudantil-momentum"
#let cor           = rgb(sys.inputs.at("cor"))
#let cortexto      = rgb(sys.inputs.at("cortexto"))
#let version       = sys.inputs.at("version")

#set text(
    font     : "New Computer Modern Sans",
    tracking : -0.04em,
    weight   : "medium",
)
#set page(
    paper  : "presentation-16-9",
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

//////////////////////////////////////////////////////////////////////

#let propaganda(
    estilo : none
) = {

    if (estilo != "branca") and (estilo != "cor" ) { panic("As opcións para a propaganda son 'branca' ou 'cor'") }

    // Cor do fondo da propaganda
    set page(
        fill: if estilo == "cor" { cor } else { cortexto }
    )

    // Cor do texto, depende do estilo da propaganda
    set text(
        fill: if estilo == "cor" { cortexto } else { cor }
    )

    grid(
        columns:(73%, 27%),
        rows: 1,
        column-gutter: 0.5cm,
        // stroke: cortexto + 1pt,

        grid(
            columns:1, rows:2,

            grid.cell(
                x:0,y:0,
                grid(
                    columns: (auto, 1fr),
                    align: (bottom + left, bottom + left),
                    text(
                        size   : 25pt,
                        weight : "bold",
                        fill   : cor.darken(70%)
                    )[Revista\ estudantil],
                    text(size: 75pt, weight: "bold")[Momentum],
                )
            ),

            grid.cell(
                x:0, y:1,
                    block(
                    width  : 100%,
                    height : 1fr,
                    {
                        let alto  = 10cm
                        let ancho = alto*(1/calc.sqrt(2)) // proporción A4
                        // Imaxe na dereita
                        place(
                            right + horizon,
                            // dx: 4cm,
                            rect(
                                stroke : 2pt,
                                fill   : white,
                                image(width: ancho, ruta_paxina_3),
                            )
                        )
                        // Imaxe no centro
                        place(
                            center + horizon,
                            dx: -0.5cm,
                            rotate(
                                8deg,
                                rect(
                                    stroke : 2pt,
                                    fill   : white,
                                    image(width: ancho, ruta_paxina_2),
                                )
                            )
                        )
                        // Imaxe na esquerda
                        place(
                            left + horizon,
                            rect(
                                stroke : 2pt,
                                fill   : white,
                                image(width: ancho, ruta_paxina_1),
                            )
                        )
                    }
                )
            ),
        ),

        grid.cell(
            x:1,y:0,
            {
                set align(center + horizon)
                set text(size: 1.4em)
                set text(fill: if estilo == "cor" { cortexto } else { cor.darken(80%) })
                block(
                    width  : 90%,
                    height : 90%,
                    inset  : 0.7em,
                    fill   : cor.lighten(25%),
                    stroke : cor.darken(50%) + 3pt,
                    radius : 1em,
                    grid(
                        rows: (1fr,1fr),
                        columns:1,
                        grid(
                            columns : 1,
                            rows    : 2,
                            row-gutter: 1em,
                            // stroke: 1pt,
                            grid.cell(x:0, y:0, text(size:1.2em)[*WhatsApp* ]),
                            grid.cell(x:0, y:1, block(stroke: 1pt, width: 90%, inset: 7pt, fill: white, QR)),
                        ),
                    grid(
                        rows: (1fr,1fr,1fr),
                        columns : (100%,),
                        grid(
                            columns:1, rows:2, row-gutter: 7pt,
                            text(size: 20pt, font: "Symbols Nerd Font Mono")[#h(3pt) ],
                            link("mailto:" + correo, [#correo])
                        ),
                        grid(
                            columns:1, rows:2, row-gutter: 7pt,
                            text(size: 20pt,  font: "Symbols Nerd Font Mono")[#h(3pt) ],
                            link("https://www.instagram.com/momentum.usc/", [\@momentum.usc])
                        ),
                        grid(
                            columns:1, rows:2, row-gutter: 7pt,
                            text(size: 20pt, font: "Symbols Nerd Font Mono")[#h(3pt) ],
                            link("https://github.com/fisicaUSC/revista", [fisicaUSC/revista]),
                        )
                    )

                    )

                )
            }
        )

    )

}

#if version == "cor" {
    propaganda( estilo : "cor" )
} else if version == "branca" {
    propaganda( estilo : "branca" )
} else {
    panic("A propaganda ou é 'cor' ou 'branca'")
}
