#import "@preview/tiaoma:0.3.0"

#let numero = sys.inputs.at("numero")
#let version = sys.inputs.at("version")
#import("/estilo.typ"): datos

#set text(
    font     : "New Computer Modern Sans",
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
    datos.whatsapp,
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
    if (estilo != "branca") and (estilo != "cor" ) { panic("As opcións para a propaganda son 'branca' ou 'cor'") }
    set align(center)

    // Cor do fondo da propaganda
    set page(
        fill: if estilo == "cor" { rgb(datos.cores.resalte) } else { rgb(datos.cores.texto) }
    )

    // Cor do texto, depende do estilo da propaganda
    set text(
        fill: if estilo == "cor" { rgb(datos.cores.texto) } else { rgb(datos.cores.resalte) }
    )

    grid(
        rows: 2,
        row-gutter: 1em,
        text(
            size   : 25pt,
            weight : "bold",
            fill   : rgb(datos.cores.resalte).darken(70%)
        )[_Revista estudantil_],
        text(size: 75pt, weight: "bold")[Momentum],
    )

    v(0.5em)
    set text(fill: if estilo == "cor" { rgb(datos.cores.texto) } else { rgb(datos.cores.resalte).darken(80%) })

    block(
        inset  : 1em,
        width  : 100%,
        fill   : rgb(datos.cores.resalte).lighten(25%),
        radius : 1em,
        stroke : rgb(datos.cores.resalte).darken(50%) + 3pt,
        text(
            size : 20pt,
            font : "New Computer Modern Sans",
        )[
            Divulgación, historia, filosofía, pasatempos,\
            programación, vida na facultade e moito máis.\
            Calquera pode participar, anímate!
        ],
    )

    v(0.5em)

    // O tamaño da primeira páxina da revista
    let alto  = 10cm
    let ancho = alto*(1/calc.sqrt(2)) // proporción A4
    block(
        width  : 100%,
        height : 16cm,
        // stroke : 1pt,
        {
            // Imaxe na dereita
            place(
                center + horizon,
                dx: 4cm,
                rotate(
                    20deg,
                    rect(
                        stroke : 3pt,
                        fill   : white,
                        image(width: ancho, page: 3, "/.pdf/revista_" + numero + ".pdf"),
                    )
                )
            )
            // Imaxe no centro
            place(
                center + horizon,
                dy: -0.5cm,
                rect(
                    stroke : 3pt,
                    fill   : white,
                    image(width: ancho, page: 2, "/.pdf/revista_" + numero + ".pdf"),
                )
            )
            // Imaxe na esquerda
            place(
                center + horizon,
                dx: -4cm,
                rotate(
                    -20deg,
                    rect(
                        stroke : 3pt,
                        fill   : white,
                        image(width: ancho, page: 1, "/.pdf/revista_" + numero + ".pdf"),
                    )
                )
            )
        }
    )

    v(0.5em)
    set text(weight: "bold")

    block(
        width  : 100%,
        inset  : 1em,
        fill   : rgb(datos.cores.resalte).lighten(25%),
        stroke : rgb(datos.cores.resalte).darken(50%) + 3pt,
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
                grid.cell(x:2, y:0, link("https://github.com/" + datos.repositorio)[ #text(size: 12pt, font: "New Computer Modern Mono", [#datos.repositorio]) ],),

                grid.cell(x:0, y:1, text(size: 12pt, [Síguenos en redes])),
                grid.cell(x:1, y:1, text(font: "Symbols Nerd Font Mono", size: 20pt, box[])),
                grid.cell(x:2, y:1, link("https://www.instagram.com/" + datos.instagram)[#text(size: 12pt, [\@#datos.instagram])]),

                grid.cell(x:0, y:2, text(size: 12pt, [Manda teu artigo])),
                grid.cell(x:1, y:2, text(font: "Symbols Nerd Font Mono", size: 20pt, box[󰊫])),
                grid.cell(x:2, y:2, link("mailto:" + datos.correo)[#text(size: 12pt, [#datos.correo])]),
            ),
            grid(
                columns : 2,
                rows    : 1,
                grid.cell(x:0, y:0, block(stroke: 1pt, width: 80%, inset: 7pt, fill: white, QR)),
                grid.cell(
                    x:1, y:0,
                    rotate(
                        -40deg,
                        {
                            text(size:1.5em, [WhatsApp ])
                            text(font: "Symbols Nerd Font Mono", fallback: false, size:1.6em)[]
                        }
                    ),
                )
            )
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
