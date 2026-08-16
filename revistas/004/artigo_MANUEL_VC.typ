#import("/estilo.typ"): *

#show: Artigo.with(
  estilo    : "HISTORIA",
  titulo    : [Buracos negros antes de Einstein?],
  autoria   : [Manuel Vázquez Carreira],
  subtitulo : [Como Michell e Laplace teorizaron por primeira vez os buracos negros.],
)

#columns[
  == Introdución

  Os buracos negros son, sen ningunha dúbida, das cousas máis sorprendentes que
  se descubriron en física o século pasado. A día de hoxe seguen sendo un enigma
  e unha enorme fronte aberta en investigación. Teorizar con precisión os buracos
  negros non tería sido posible sen a teoría da Relatividade Xeral de Einstein
  nin as investigacións de Thorne, Wheeler e Hawking, entre moitos outros. Con
  todo, como veremos a continuación, a historia sorpréndenos cun caso no que a
  curiosidade humana permite idear conceptos tan adiantados ao seu tempo, que
  requiriron dunha matemática tan avanzada para a súa resolución, coa que incluso os
  propios matemáticos crían que se terían librado de nós, os físicos.

  Esta é a historia de como John Michell e Pierre Simon Laplace formularon os
  primeiros conceptos sobre buracos negros de maneira independente, máis dun
  século antes da Relatividade Xeral.

  == Contexto histórico

  Ambas as formulacións teñen lugar nas décadas dos 80 e 90 do século XVIII. A
  esas alturas da historia, Europa sufría os radicais cambios causados pola
  Revolución Francesa e a caída dos reinos absolutistas. A Ilustración amosou os
  seus froitos co triunfo do pensamento liberal. A física daquela época vivía
  unha especie de período de transición entre dúas grandes revolucións
  científicas: a revolución newtoniana do século XVII que preparou o terreo para
  as posteriores revolucións da electrodinámica e da estrutura da materia no
  século XIX.

  Só 100 anos antes do inicio da nosa historia, Sir Isaac Newton publicaba
  en 1687 _Philosophæ Naturalis Principia Mathematica_, asentando as
  bases da física moderna coas súas leis do movemento e da gravitación universal.

  Dúas consecuencias deste desenvolvemento foron os protagonistas da nosa
  historia: Michell e Laplace. Ambos chegaron a unha conclusión común:
  #emph[existen estrelas tan masivas que fan curvar tanto a luz, que nin sequera
  esta pode escapar da atracción gravitacional]#footnote[Algo curioso desta
  historia é que non hai un único descubridor deste fenómeno, xa que, ao existir
  conflito entre Inglaterra e Francia, Laplace non soubo do artigo de Michell
  cando saíu.] A continuación estudaremos como chegou cada un a esta conclusión.

  == Hipótese de Michell

  John Michell (Eakring Nottinghamshire, 1724) foi un matemático e reverendo
  inglés. Destacou principalmente nos campos da xeoloxía e da astronomía. É
  coñecido, ademais, como o pai da sismoloxía moderna, xa que foi o primeiro en
  rexistrar os terremotos para a súa análise, ademais de inferir que se poderían
  propagar por ondas sísmicas. Na astronomía, John Michell realizou un importante
  traballo sobre estrelas binarias. Aplicando teoría da probabilidade a
  distribucións estelares (sendo así o primeiro astrónomo estatístico),
  demostrou que a maioría dos sistemas binarios que se ven no espazo son como o
  sistema _Tatooine_ de _Star Wars_ (estrelas que orbitan arredor
  de outras) e non unha casualidade de perspectiva. Outra grande achega foi a
  exitosa predición dos buracos negros, que é o obxecto deste artigo. Esta obra
  publícase en 1784, baixo o nome _"excesivamente longo e
  laborioso"_. #cite(label("mongomeri"))

  #quote(
    block: true,
    attribution: [Colin Montgomery],
    [On the Means of Discovering the Distance, Magnitude &c. of the Fixed
    Stars, in Consequence of the Diminution of the Velocity of Their Light, in
    Case Such a Diminution Should be Found to Take Place in any of Them, and
    Such Other Data Should be Procured from Observations, as Would be Further
    Necessary for That Purpose.]
  )

  senón que ademais deu a ferramenta para detectalos. Ferramenta coa que se
  detectou Cygnus X-1, o primeiro buraco negro descuberto e un temazo da banda
  Rush.
  
  #quote(
    block: true,
    attribution: [John Mitchell],
    [...since their light could not arrive at us; [...], we could have no
    information from light; yet, if any other luminous bodies should
    happen to revolve about them we might still perhaps from the motions of
    these revolving bodies infer the existence of the central ones with some
    degree of probability...]
  )
  Agora ben, Michell non só elucubra que poderían existir buracos negros e como
  detectalos. Senón que, empregando o valor estimado da velocidade da luz que se
  coñecía entón, realiza unha análise das dimensións que debería ter unha estrela
  para que se dean as condicións de _estrela escura_. Michell empregou un
  método xeométrico para realizar o estudo. Como se me fai incomprensible este
  método, xa que dista radicalmente de calquera metodoloxía estudada en calquera
  curso de física, vou explicar o procedemento en termos actuais que se nomea
  en #cite(label("mongomeri"), supplement: [pág. 92], )#footnote[Igualmente animo ó lector a botarlle un
  ollo ao artigo orixinal#cite(label("paper_largo_michell")), xa que ten certo interese
  histórico ver como se realizaba a física antigamente. Tamén vén explicado
  en #cite(label("mongomeri"), supplement: [pág. 92]).] // Estou poñendo as páxinas como suplementos, non estou seguro de que sexa a opción correcta

  #figure(
    image(width: 90%, "imaxes/diagramita_michell.png"),
    caption: [Diagrama orixinal empregado en #cite(label("paper_largo_michell")) para a
        análise xeométrica. A figura _per se_ non se atopa no artigo
        arquivado pola Royal Society, pero atópase en #cite(label("mongomeri"), supplement: [Véxase nota número
        3])]
  )

  == A análise xeométrica de Michell (en termos modernos)

  Supoñamos dous corpos: un grande atractor de masa $M$ e raio $R$, e unha
  partícula de masa $m$. O grande atractor (ou corpo central) e a partícula
  atráense mutuamente mediante unha forza $F = G (M m)/(r^2)$, onde podemos
  substituír a densidade do corpo central, $rho$, e $K = (4 pi)/3$ tal que

  $ F = K (rho m)/(r^2) R^3. $

  Podemos deducir a velocidade da masa $m$, que corresponderá con

  $ v^2 = (2K rho R^3)/r quad arrow.double.r quad v^2 prop 
  rho|_(r = "cte") $

  Por tanto, imos fixar $r$ na superficie do corpo central, $r=R$,

  $ v^2 (r=R) = 2K rho R^2, $

  de onde deducimos unha curiosa propiedade: ao ser $2K$ unha constante, a
  velocidade ao cadrado da partícula conservarase mentres non varíe o produto
  $rho R^2$. En termos matemáticos...

  $ (v^2)/(rho R^2) = 2K = "const." $

  Esta $v$ será a velocidade orbital da partícula na superficie do corpo central.
  Agora metámonos coa velocidade de escape, definida por Michell como
  _'the same velocity a body would have if it fell from infinity to the
  surface'_. Imos calculala mediante xogadas arcaicas que tivo que empregar
  Michell na súa época. Para iso, imos meternos no sistema Terra-Sol.

  A velocidade orbital da partícula na superficie do Sol será 14,65 veces a
  velocidade orbital da Terra arredor do Sol

  $ v_(o r b i t)(r = R_S) = 14,65v_(o r b i t) (r = r_(T e r r a) = 1 "UA"). $ // podería poñerse o r b i t como "orbit", pero perdería a tipografía de ecuación, que é a que está no orixinal. O mesmo con Terra.

  Agora, a traxectoria dunha partícula que cae desde o infinito (i.e., enerxía
  nula) será parabólica. Por tanto, a velocidade de escape na superficie do Sol
  será

  $  v_(p a r a b o l)(r = R_S) =& sqrt(2) v_(o r b i t)(r = R_S) = \
  =& 20,72v_(o r b i t)(r = r_(T e r r a)) $

  e, por tanto, $v_(p a r a b o l)(r=R_S) = v_(e s c a p e)("Sol")$. Por que Michell
  relaciona a velocidade de escape na superficie do Sol? Moi sinxelo, porque na
  época a velocidade da luz coñecíase como 10310 veces a velocidade orbital da
  Terra ao redor do Sol #cite(label("luz_bradley")) (Oh, sorpresa, a partícula de masa
  //% $m$ será un fotón {\large \omg}!). Deste xeito, podemos realizar unha
  $m$ será un fotón #text("OMG", size: 12pt)!). Deste xeito, podemos realizar unha // Cambiei o \large por aumentar directamente o tamaño do texto, creo que é a mellor opción
  comparación directa entre a velocidade de escape e a velocidade da luz.

  $ c/(v_(e s c a p e)("Sol")) = (10310 v_(o r b i t) (r = r_(T e r r a)))
  /(20,72 v_(o r b i t) (r = r_(T e r r a))) = 497. $

  Por tanto, unha estrela será escura se a súa velocidade de escape é, cando
  menos, 497 veces a velocidade de escape do Sol. Poderiamos dicir entón:
  #emph[Se existise unha estrela coa mesma densidade que o Sol, pero cuxo raio
  fose aproximadamente 500 veces maior, a luz non podería escapar dela e sería
  invisible para nós.]

  #quote(
    block: true,
    attribution: [Michell #cite(label("paper_largo_michell"), supplement: [Proposición 16, página 42])],
    [...if the semi-diameter of a sphere of the same density with the sun were
    to exceed that of the sun in the proportion of 500 to 1, a body falling
    from an infinite height towards it, would have acquired at its surface a
    greater velocity than that of light, and consequently, supposing light to
    be attracted by the same force in froportion to its vis inertiae, with
    other bodies, all light emitted from such a body would be made to return
    towards it, by its own proper gravity]
  )

  == Idea de Laplace

  Pasamos agora a Laplace. Pierre Simon Laplace (Beaumont-en-Auge, 1749) foi un
  matemático, astrónomo e físico francés. Foi un dos científicos máis influentes
  da súa época, chegando a ser coñecido como o _Newton francés_. A súa
  obra máis coñecida é _Mécanique Céleste_ (1799–1825), na que reformula a
  mecánica newtoniana para aplicala a sistemas astronómicos complexos. Nesta
  obra, Laplace desenvolve a teoría nebular do sistema solar, que postula que o
  sistema solar se formou a partir dunha nube de gas e po en rotación. Esta
  teoría foi un precursor importante das teorías modernas sobre a formación de
  sistemas planetarios. Laplace fixo todo iso e máis cousas que se ven na
  carreira, polo que non as comentarei. Centrarémonos agora na súa predición dos
  buracos negros.

  Ao contrario de Michell, Laplace non expón todo nun só artigo, senón que, nun
  primeiro momento, presenta a suposición de que poden existir este tipo de
  corpos celestes e, anos máis tarde, divulga unha 'proba matemática'. O
  contexto no que publica isto é, nada máis nin nada menos, o da Revolución
  Francesa. Desde 1773, Laplace atopábase na Academia francesa, onde anos antes
  aprendera física e matemáticas da man de D'Alembert.

  En 1794 cae Robespierre e, con el, a súa etapa do Terror. É entón cando o
  sistema educativo francés experimenta un enorme cambio que conduce á
  institucionalización da sociedade francesa moderna. Neste contexto fúndanse
  diversas institucións científicas, incluíndo o _Institut de France_,
  onde un ano despois Laplace sería elixido presidente. É por iso que cesa as
  súas actividades como profesor na Academia e dedícase á redacción da súa obra
  _Exposition du Système du Monde_, publicada en dous volumes en 1796.

  No sexto capítulo do quinto libro desta obra #cite(label("exposition_laplace"), supplement: [página
  348]) Laplace arrisca a enunciar cualitativamente a
  existencia de estrelas tan masivas que nin sequera a luz podería escapar
  delas. // % Laplace escribe:

  #quote(
    block: true,
    attribution: [Laplace],
    [Unha estrela luminosa da mesma densidade que a Terra, e cuxo diámetro
    fose duascentas cincuenta veces maior que o do Sol, non deixaría que ningún
    dos seus raios nos alcanzase en virtude da súa atracción; é, pois, posible
    que os maiores corpos luminosos do Universo sexan, por ese mesmo feito,
    invisibles.]
  )

  Ante a potente declaración de Laplace, un lector escéptico preguntouse: Como é
  iso posible? Así, Franz Xaver von Zach escribiulle a Laplace unha carta na que
  lle esixía unha demostración matemática da súa afirmación. Laplace responde e
  en 1799 publícaa na revista alemá _Allgemeine Geographische
  Ephemeriden_, editada polo mesmo von Zach #cite(label("laplace_original")). Tamén
  existe unha tradución ao inglés desta demostración en #cite(label("hawking_ellis")).

  == A 'proba matemática' de Laplace

  Supoñamos unha estrela de masa $M$ e raio $R$, e un fotón de masa#footnote{Let
  me cook} $m$, a unha distancia $r$ do centro da estrela.

  Agora empregamos a conservación da enerxía en $r=R$ e nun $r$ arbitrario, tendo
  en conta que a velocidade en $R$ sexa $c$, a velocidade da luz no baleiro. Por
  tanto,

  $ (m c^2)/2 - G (M m)/R = (m v^2)/2 - G (M m) / r. $

  Obviamente elimínanse as masas $m$. Agora particularizamos o cálculo no límite
  $r arrow.r infinity$, onde a velocidade do fotón é nula. É dicir, queremos que o noso
  fotón chegue ao infinito e alí quede quieto. Esa é a nosa condición de contorno
  no problema. Deste xeito

  $ c^2/2 - G M/R = 0 quad arrow.double.r quad c = sqrt((2 G M)/R), $

  que é a moi coñecida formuliña da velocidade de escape. A clave do negocio
  agora é o xenio de Laplace ao substituír a masa $M$ da estrela pola súa
  densidade $rho$ e o seu volume

  $ c = R sqrt((8 pi)/3 rho G), $

  onde empregamos que $M = 4/3 pi R^3 rho$. Imos agora diverxer un pouco
  do método orixinalmente empregado por Laplace. Este non desenvolve, como
  Michell, o proceso matemático no que chega á conclusión das proporcións
  necesarias para que unha estrela sexa escura. En lugar diso, Laplace, a partir
  das proporcións enunciadas en #cite(label("exposition_laplace")), amosa que a súa idea
  ten sentido extraendo dela un valor coñecido. Neste caso, Laplace substituiría
  os valores pertinentes para despexar da ecuación o valor da densidade
  terrestre. Deste xeito asegurábase de que o lector comprendese que a súa
  proposición tiña sentido. O problema dese método é que é moi aburrido. Do mesmo
  xeito que con Michell, non concibo como comprender a súa metodoloxía orixinal.
  Por tanto, farei unha exposición análoga, só que en vez de despexar a densidade
  terrestre, despexarei a velocidade da luz empregando a ecuación anterior e os
  valores propostos por Laplace en #cite(label("exposition_laplace")).

  Substituímos agora o raio da estrela por $R = 250 R_S$, onde $R_S = 6.9634 dot
  10^8 "m"$, e a densidade por $rho = rho_T = 5514 " kg/m"^3$. Por tanto // puxen un espacio dentro do string para separar as cifras das unidades

  $ c_(L a p l a c e) = 250 R_S sqrt((8 pi)/3 rho_T G) = 3.057 dot 10^8 "m/s" $ // aquí quitei o espacio porque cando van despois dun exponente xa van separadas, non sei moi ben por que

  O cal ten un erro porcentual respecto do valor actual do 1,96%. Nada mal.
  Deste xeito demostramos, de maneira indirecta mediante a confirmación do valor
  dunha magnitude coñecida, que a proposición de Laplace ten sentido.

  == Discusión

  Michell e Laplace foron dous xenios que conseguiron chegar a un resultado moi
  adiantado ao seu tempo. Non é tarefa sinxela imaxinar como sería un obxecto tan
  estraño como un buraco negro naquela época, e moito menos facelo por primeira
  vez. Hai que comprender que, naquela altura, a mecánica newtoniana tiña os
  mesmos anos que ten hoxe a mecánica cuántica, e aínda se debatía a natureza
  corpuscular ou ondulatoria da luz. Ademais, se Young tivese feito o seu
  experimento da dobre fenda antes de 1784, é probable que a ningún destes dous
  se lle ocorrera a idea de que unha _partícula_ de luz fose atraída por
  un corpo o suficientemente masivo.

  O obxectivo deste artigo non só é aprender un pouco sobre a historia da física,
  senón tamén intentar imaxinar o que pasaba polas mentes destes dous xenios.
  Saír un día a deitarse a mirar as estrelas e visualizar o cosmos. Mirar a
  constelación do Cisne e saber que, nas profundidades, se agocha unha forza
  misteriosa e invisible: o buraco negro de Cygnus X-1. Por suposto, eles
  descoñecían este astro escuro, pero invita a facerse unha idea do que tiña cada
  un nas súas mentes.

  Gustaríame rematar, unha vez máis, coa _Exposition du Système du Monde_
  de Laplace. Un pouco máis abaixo do enunciado das proporcións da estrela
  escura, escribe //% Laplace escribe:

  #quote(
    block: true,
    attribution: [Laplace],
    [...finalmente, os movementos específicos de todos estes grandes
    corpos que, obedecendo a súa atracción mutua e, probablemente, a impulsos
    primitivos, describen inmensos orbes; tales serían, en relación coas
    estrelas, os principais obxectos da astronomía futura.]
  )

  #SenCita("luz_bradley")
  #SenCita("laplace_original")
  #SenCita("star_wars_iv")
  #SenCita("cygnus_x1")

  #SenCita("paper_largo_michell")
  #SenCita("exposition_laplace")
  #SenCita("hawking_ellis")
  #SenCita("mongomeri")

  #CrearBibliografia("/revistas/004/bibliografia_MANUEL_VC.bib")

]