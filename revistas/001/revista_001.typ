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

#let despedida = [
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

#let agradecementos = [
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

#crear_revista(
    comentario        : "1981: Primeira pedra da facultade de física",
    cor_resalte       : rgb("#ff0000"),
    cor_texto_resalte : rgb("#ffffff"),
    data              : datetime(day: 1, month: 12, year: 2025),
    participantes     : participantes,
    artigos           : artigos,
    despedida         : despedida,
    agradecementos    : agradecementos,
    // mostrar_rede      : true
)
