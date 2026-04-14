#import("/estilo.typ"): *

#let participantes = (
    (nome: "Álvaro Pallas Otero"      , posto : "Dirección"     ),
    (nome: "Sebastián Táboas Pazo"    , posto : "Dirección"     ),
    (nome: "Celia Álvarez Álvarez"    , posto : "Dirección"     ),
    (nome: "Daniel Vázquez Lago"      , posto : "Dirección"     ),
    (nome: "David Cotelo Varela"      , posto : "Edición"       ),
    (nome: "Víctor Díaz Díaz"         , posto : "Edición"       ),
    (nome: "Daniel Vázquez Lago"      , posto : "Edición"       ),
    (nome: "Manuel Vázquez Carreira"  , posto : "Edición"       ),
    (nome: "Cristóbal Santos Sánchez" , posto : "Edición"       ),
    (nome: "Mauro Garrido Rodríguez"  , posto : "Edición"       ),
    (nome: "Ana Díaz Caride"          , posto : "Deseño de Logo"),
)

#let artigos = {
    include("/revistas/001/artigo_DECANATO.typ")
    include("/revistas/001/artigo_CARATHEODORY.typ")
    include("/revistas/001/artigo_ALMORZO.typ")
    include("/revistas/001/artigo_SKYRMIONS.typ")
    include("/revistas/001/artigo_ENTREVISTA.typ")
    include("/revistas/001/artigo_IRMAS.typ")
    include("/revistas/001/artigo_XEOCENTRISMO.typ")
}

#crear_revista(
    numero            : "001",
    comentario        : "1981: Primeira pedra da facultade de física",
    cor_resalte       : rgb("#ff0000"),
    cor_texto_resalte : rgb("#ffffff"),
    data              : datetime(day: 1, month: 12, year: 2025),
    participantes     : participantes,
    artigos           : artigos,
    mostrar_rede      : true
)
