#import("/estilo.typ"): *

#show: Artigo.with(
  estilo    : "MISCELÁNEA",
  titulo    : [Frases célebres],
  autoria   : [Manuel Galán Rodríguez],
  subtitulo : [],
)

Inicio esta sección na revista Momentum achegando todas as frases que poida
entre a anterior edición da revista e a seguinte. Evidentemente, sempre se
admiten colaboracións para futuras edicións. Espero que vos guste!
#v(2em) // Probablemente haxa unha forma mellor de facer isto
#columns[
  #quote(
    block: true,
    attribution: [Diego Martínez, #linebreak() Física computacional avanzada, 2025.],
    [¿Recordáis las palabras de Fernando Simón de que como mucho iba a 
    haber 1 ó 2 casos? Pues en esta asignatura va a ser igual: va a 
    haber como mucho 1 ó 2 suspensos.]
  )
  #quote(
    block: true,
    attribution: [Néstor Armesto, #linebreak() Teoría cuántica de campos, 2025.],
    [Igual estáis pensando que estoy haciendo una cosa extraña. Os lo va 
    a dejar de parecer dentro de un minuto porque la voy a complicar más.]
  )
  #quote(
    block: true,
    attribution: [Víctor Pardo, #linebreak() Electromagnetismo I, 2025.],
    [Y a mí [me da pereza] la física. Y la vida en general.]
  )
  #quote(
    block: true,
    attribution: [Jaime Álvarez, #linebreak() Técnicas Experimentais II, 2025.],
    [El péndulo está un poco bailarín... no sabe para dónde va. Es como 
    yo hoy, no sé para dónde voy.]
  )
  #quote(
    block: true,
    attribution: [Carlos Montero, #linebreak() Óptica I, 2025.],
    [A potencia [solar] que chega aquí [polo norte] é moi pequena. Isto o 
    saben ben os pingüinos.]
  )
]
