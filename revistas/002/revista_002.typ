#import("/estilo.typ"): *

#let participantes = (
    (nome : "Sebastián Táboas Pazo"    , posto: "Dirección"),
    (nome : "Álvaro Pallas Otero"      , posto: "Dirección"),
    (nome : "Celia Álvarez Álvarez"    , posto: "Dirección"),
    (nome : "Daniel Vázquez Lago"      , posto: "Dirección"),
    (nome : "David Cotelo Varela"      , posto: "Edición"),
    (nome : "Andrea Real Blanco"       , posto: "Edición"),
    (nome : "Cristóbal Santos Sánchez" , posto: "Edición"),
    (nome : "Manuel Galán Rodríguez"   , posto: "Edición"),
    (nome : "María Alonso Iglesias"    , posto: "Edición"),
    (nome : "Hugo Raíndo Lorenzo"      , posto: "Edición"),
    (nome : "Víctor Díaz Díaz"         , posto: "Edición"),
    (nome : "Ana Díaz Caride"          , posto: "Deseño de Logo"),
    (nome : "Elena López Miguélez"     , posto: "Deseño de Logo"),
)

#let despedida = [
    Aquí está a revista por e para estudantes da Facultade de Física USC!
    Cansos de que o momento lineal e angular guíen as nosas traxectorias?, imos
    escribir unha nova historia; entrevistas, divulgación, filosofía da ciencia
    e moitos artigos dispares cargamos coa inercia de formar unha nova fiestra
    para o alumnado. Tes nas túas mans esta oportunidade, deixa que o
    magnetismo te leve e participa, sé parte deste proxecto: escribe, le,
    comparte, suxire… A revista é real e as túas ideas poden ser máis que
    imaxinación, non dubides en deixar a túa pegada neste recuncho físico, onde
    hai física máis aló das aulas.
]

#let agradecementos = [
    Dende a dirección da revista, queriamos agradecervos a todos
    por achegarvos a este proxecto. Non hai revista sen lector! Mais, para facela,
    estivo moita xente implicada que non podemos pasar por alto.

    Grazas a todas esas persoas que recibiron acaloradamente a nosa primeira
    entrega e axudounos a mellorar coas súas suxestións. Especiais grazas ao
    estudantado que se esmerou na redacción, edición e corrección deste número en
    medio da recta final do cuadrimestre.
    Grazas a Ana Ulla, por participar nesta nova entrega dun proxecto que está
    apenas comezando, e a Gemma Ruiz, por permitirnos coñecer esta compañeira tan
    espectacular.

    Grazas a Carlos Merino por participar con toda a súa bondade esta vez
    escribindo un artigo e transmitíndonos toda a súa ilusión polo
    proxecto.

    E grazas finalmente tanto ao equipo decanal da nosa facultade como á
    vicerreitoría de estudantes e cultura polo seu apoio e colaboración en todo
    momento neste proxecto, cubrindo ademais esta última a financiación da edición
    impresa.
]

#let artigos = {
    include{"/revistas/002/artigo_ENTREVISTA_ANA.typ"}
    // include{"/revistas/002/artigo_SCHRODINGER.typ"}
    // include{"/revistas/002/artigo_LEEUWEN.typ"}
    // include{"/revistas/002/artigo_MATERIA_ESCURA.typ"}
    include{"/revistas/002/artigo_DARKO.typ"}
    include{"/revistas/002/artigo_DZHANIBEKOV.typ"}
    // include{"/revistas/002/artigo_MERINO.typ"}
    // include{"/revistas/002/artigo_VOYAGER.typ"}
    include{"/revistas/002/artigo_HOOKE.typ"}
    include{"/revistas/002/artigo_HeB.typ"}
    // include{"/revistas/002/artigo_PASATEMPOS.typ"}
}

#crear_revista(
    comentario        : "Lanzamento da sonda Voyager 1, NASA (1977).",
    cor_resalte       : rgb("#0f83d1"),
    cor_texto_resalte : rgb("#ffffff"),
    data              : datetime(day: 12, month:5 , year: 2025),
    participantes     : participantes,
    artigos           : artigos,
    despedida         : despedida,
    agradecementos    : agradecementos,
    // mostrar_rede      : true
)
