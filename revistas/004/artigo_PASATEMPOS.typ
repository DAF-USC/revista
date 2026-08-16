#import("/estilo.typ"): *

#show: Artigo.with(
  estilo    : "PASATEMPOS",
  titulo    : [Intuición, Integrais e Álxebra],
  autoria   : [],
  subtitulo : [],
)

#columns[
//   % \section*{\textcolor{Resalte}{Uns problemas máis ou menos intuitivos\\ } {\normalfont \itshape   non kero poñer o meu nome lol xd}}%
// % \Pasatempo{Uns problemas máis ou menos intuitivos}{Baseado na revista ``A Gota de Milikan''}

  // FACER:MIGRACIÓN: Falta a función Pasatempo 
  = Uns problemas máis intuitivos

  #v(1em)

  Para crear a nova revista da facultade estivemos investigamos sobre as
  anteriores, na primeira, _A gota de Millikan_, aparecía unha sección de
  'paradoxos' e inspirados nestes propoñemos estes problemas que poden tanto
  resolver por intuición como formular as ecuacións que subxacen.

  #figure(
    image(width: 90%, "imaxes/foto1.png"),
    caption: [*Esquerda:* Imaxe do problema 1. *Dereita:* Imaxe
        do problema 3 (fonte: _El profesor Layton y la villa
        misteriosa_).]
  ) 
  #enum(numbering: "1.")[
      Faise pasar unha corda longa por unha polea.
      Pendúrase un acio de plátanos dun extremo da corda mentres un
      mono do mesmo peso cólgase do outro extremo. Que sucederá cos
      plátanos cando o mono comeza a trepar pola corda?
    ][
      A túa rutina da mañá antes de ir a clase
      consiste sempre en tomar un café con leite, mais hoxe vas
      apurado, tes un exame, son case as nove e a aínda segues en
      casa. Coas présas fiches o teu café extremadamente quente, de
      que xeito, agregando o leite, consegues que se arrefríe
      antes? Esperando cinco minutos e logo botar o leite frío ou
      botando o leite frío e despois esperar cinco minutos?
    ][
      Temos unha balanza de dous brazos e oito
      masas. Destas 8 masas, 7 pesan o mesmo e unha é máis lixeira.
      Cal é o número mínimo de medidas, e que medidas son, para
      determinar exactamente cal das masas é a máis lixeira?
    ][
      Quentar un pedazo de ferro con forma de donut fai que o
      diámetro do oco aumente ou diminúa?
    ]
]
// % \section*{\textcolor{Resalte}{Determina o espazo de fases\\ } {\normalfont \itshape   autor 2}}%

= Uns problemas #emph[menos] intuitivos

Para que teñas que darlle varias voltas á cabeza e tal vez repasar algo de
física e matemáticas.
#v(1em)
#columns[
  - Para comezar, algo máis simple
  $ integral tan(x) dif x $ // FACER:MIGRACIÓN: Quitarlle o número a algunhas ecuacións
  - Unha raíz cadrada pode cambialo todo!
  $ integral sqrt(tan(x)) dif x $
  - Cun premio de 2.5 puntos, podes integrar o seguinte?
  $ integral_0^infinity (x^(3 slash 2))/(x^3 +1) dif x $
// % \item Para rematar coas integrais
//     %     \[ \int \frac{1}{\sqrt{a^2+\sin^2{(x)}}} dx \]

  #colbreak()

  - Sabes que é un #emph[monoide]? É un grupo onde se relaxa a
    existencia de elemento inverso. Proba que o conxunto $(cal(P)(X))$
    (o conxunto de todos os subconxuntos de $X$) xunto coa operación unión
    ($union.big$) é un monoide. Cal é o elemento neutro?
  - Sabes que é un #emph[grupo]? Próbao demostrando que o conxunto
    {1,0} coa operación dada pola porta lóxica XOR é un // FACER:MIGRACIÓN: XOR vai con typewritter font
    grupo.
  - Sabes que é un #emph[anel]? Busca algún exemplo que non sexan matrices.
  - Sabes que é un #emph[espazo vectorial]? É un grupo máis un anel.
    Defíneo completamente sen usar frechas ou exemplos en $RR^2$ ou
    $RR^3$.
  - Sabes que é unha #emph[álxebra]? Non é máis ca unha parella de aneis.
    Ocurreseche algún exemplo?

]

// % \vspace{0.6cm}\hrule\vspace{0.4cm}
// % \noindent \textbf{CHAMADA A TODOS OS NOSOS LECTORES}
// % {
// %     \hypersetup{urlcolor = Resalte}
// %     \noindent Dende dirección queremos animarvos a todos vós, lectores, que
// %     participedes nesta sección de pasatempos (escanea o QR da contraporta ou
// %     contáctanos por Instagram,
// %     \href{https://www.instagram.com/\imprimeInstagram}{\textbf{@\imprimeInstagram}},
// %     ou o correo \href{mailto:\imprimeCorreo}{\textbf{\imprimeCorreo}}). Estamos
// %     atravesando unha tempada de seca de participación nesta sección, sen ti
// %     posiblemente esta sección non sobreviva a futuras versións. Participa! Aporta o
// %     teu gran de area!
// % }