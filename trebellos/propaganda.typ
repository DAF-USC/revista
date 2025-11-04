#import "@preview/tiaoma:0.3.0"

#set text(font: "New Computer Modern Sans")
#set page(paper:"a4", margin:(x:1.5cm,y:1.5cm))
#set par( justify: true, first-line-indent: 0mm)

#let ruta_portada = "/.pdf/paxinas_" + sys.inputs.at("numero") + "_0.pdf"
#let correo = "revistafisicaUSC@gmail.com"
#let edicions = "https://www.usc.gal/gl/centro/facultade-fisica/revista-estudantil-momentum"

#let portada = rect(
    image( width : 56%, ruta_portada ),
)

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

#place(
    top + center,
    text(size:30pt, weight: "bold")[Xa está aquí a nova publicación]
)

#place(
    top + center,
    dy: 2cm,
    text(size:30pt, weight: "bold")[Momentum número #sys.inputs.at("numero") nas túas mans!]
)


#place(
    top,
    dy: 4cm,
    rect(
        text(size:20pt)[
            Divulgación, historia, filosofía, pasatempos e moito máis pode haber.
            Participa! Hoxe podes lela e mañá pode estar tu nome nun artigo
        ]
    )
)

#place(
    top,
    dy: 8cm,
    portada,
)

#place(
    top,
    dy: 8cm,
    dx: 12cm,
    grid(
        rows : 2,
        row-gutter: 2em,
        text(size: 20pt)[CORREO],
        QR1
    ),
)

#place(
    top,
    dy: 15cm,
    dx: 12cm,
    grid(
        rows : 2,
        row-gutter: 2em,
        text(size: 20pt)[EDICIÓNS \ ANTERIORES],
        QR2
    ),
)


#place(
    bottom + center,
    dy: -2cm,
    text(size: 32pt)[Ti tamén podes ser parte dela!]
)

#place(
    bottom,
    dy: -1cm,
    line(length: 100%, stroke: 1pt)
)
