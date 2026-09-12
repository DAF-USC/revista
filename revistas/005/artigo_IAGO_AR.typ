#import("/estilo.typ"): *

#show: Artigo.with(
  titulo: [Kepler, as dúas primeiras leis e a revolución astronómica],
  autoria: "Iago Arsequell Rodríguez",
  tema: "DIVULGACION",
)

#columns[

  == Introdución

  A Revolución Científica foi un dos eventos chave da historia. Este, por raro
  que pareza, foi motivado por problemas non intrínsecos á Terra, senón máis
  alá desta. É que a pregunta de como é o que vai máis alá do ceo parécenos
  agora trivial, que até un neno de primaria sabe máis ou menos a resposta. En
  cambio, gustaríame amosar a complexidade e o esforzo requirido para
  solucionar esta cuestión que por séculos foi un dos maiores misterios. Nesta
  conxuntura, Kepler foi quen de non só responder e nos dar un grande avance no
  coñecemento, senón un xeito de enfrontarse ao dilema cunha mentalidade e
  métodos innovadores para a época. Falarase de como atopou as súas dúas
  primeiras leis que desenvolveu no seu libro _Astronomia Nova_, libro de suma
  importancia na historia da astronomía e da ciencia.

  == Proceso de dedución das dúas primeiras leis de Kepler

  Tycho Brahe fora un nobre danés e un dos maiores astrónomos antes da
  invención do telescopio. Construíu un observatorio chamado Uraniborg, que se
  converteu no lugar cos instrumentos e medicións máis adiantadas da época.
  Entre os seus maiores logros áchanse medicións da posición e ángulos dos
  planetas cunha precisión de dous arcominutos (un minuto de arco equivale ao
  ancho da mina dun lapis vista a dous metros e medio de distancia). Foran
  medicións que sen ter telescopios nin material máis avanzado, resultan
  incribles e estendéronse durante vinte anos. Tras diferenzas co rei, abandona
  Dinamarca e acaba en Praga onde sería astrónomo real do Sacro Imperio Romano
  Xermánico. Aquí é onde entra Kepler. Brahe tiña os datos, mais non a
  capacidade para demostrar nada. Persoalmente, tiña o seu modelo onde a Terra
  era o centro do Universo e o Sol orbita arredor da Terra, coa diferenza de
  que o resto de planetas orbitan o Sol (un modelo híbrido). Kepler, apaixonado
  pola idea dun universo xeométrico e deseñado por Deus, quería demostrar que
  nos datos se obtiñan padróns xeométricos e leis matemáticas que eran reflexo
  dunha vontade divina. En resumo, un tiña os datos e o outro, a capacidade de
  usalos.

  Brahe, reticente de darlle os datos a Kepler de golpe (e moitos outros
  problemas), decidiu darlle os datos de Marte. Sería con este planeta co que
  principalmente Kepler traballaría, o que é unha casualidade histórica: Marte
  é un dos planetas con órbitas máis excéntricas do Sistema Solar, polo que é
  máis doado chegar a resultados con el que co resto de planetas. Primeiro,
  repasemos uns detalles da astronomía prekepleriana.

  #figure(
    image("/revistas/005/imaxes/0a.png"),
    caption: [Modelo tolemaico @bizarre_mars.]
  )

  A astronomía tradicional aristotélica pon a Terra no centro tal que os
  planetas orbitan a velocidade constante. Este modelo non concorda en absoluto
  coas observacións, como por exemplo co fenómeno do movemento retrógrado. Nas
  observacións antigas xa se observaba que os planetas se movían de oeste a
  leste, mais en certos tempos a velocidade diminúe (visto dende a Terra),
  paran e inverten o seu movemento até desaceleraren, pararen e volveren ao
  movemento de antes debuxando unha forma de lazo, aínda que este movemento non
  é igual sempre. Para este tipo de fenómenos, Tolomeo desenvolveu o seu modelo
  complexo que pretendía explicar e predicir as observacións que se tiñan na
  súa época. Para entender o sistema, describiremos os trazos máis importantes.
  Primeiro, a Terra é o centro do Universo. Os planetas móvense en pequenos
  círculos chamados epiciclos describindo unha órbita circular máis grande
  chamada deferente. No seu centro non se atopa a Terra, senón que esta está
  desprazada unha distancia. O outro trazo máis importante é o ecuante, que é o
  punto oposto á Terra (isto lembra os focos dunha elipse). Este punto defínese
  como a localización dende a cal o movemento do centro do epiciclo é circular
  uniforme. Isto explica tamén por que parece variar a velocidade dos planetas.
  Todo este sistema que parece tan arrevesado creouse para poder predicir as
  observacións astronómicas e as antigas concepcións (como o movemento circular
  uniforme).

  É posible que un modelo xeocéntrico describa a retrogradación dos planetas?
  Tolomeo ideou a súa teoría en boa parte para tentalo xustificar. Kepler, un
  xeocéntrico convencido, demostrou que si, o fenómeno pódese explicar pola
  diferenza de velocidade. Cando a Terra está afastada de Marte, véselle
  facendo unha traxectoria recta. Pola contra, cando se aproxima a Terra a
  Marte (ao estar máis cerca do Sol ten unha maior velocidade) a posición
  aparente de Marte desacelérase producindo este fenómeno (na seguinte imaxe
  vese mellor).

  #figure(
    image("/revistas/005/imaxes/0b.png"),
    caption: [Retrogradación de Marte @bizarre_mars]
  )

  Unha dificultade engadida fora que a Terra non era un observador fixo, senón
  que tamén se move. Sería moito máis sinxelo observar dende o Sol, e isto
  pódese facer aproveitando as oposicións, momentos nos que o Sol e o planeta
  están aliñados nos lados opostos da Terra. Nese caso, por xeometría básica, o
  ángulo entre o Sol e Marte é o mesmo visto dende a Terra que dende o Sol. Se
  se coñece a distancia Terra-Sol, pódese usar perfectamente o Sol como
  referencia. Isto permite contestar unha pregunta fundamental dende tempos
  antigos: é a velocidade angular dos planetas uniforme? Pensadores tan
  sobresaíntes coma Platón ou Aristóteles estableceran que si. Kepler tomou
  como referencia doce oposicións, de 1580 a 1604. Se a velocidade angular fose
  uniforme e contando que o ano marciano son 687 días:

  $
    T_M = 687 "días" arrow omega_M = frac(360º, 687 "días") = frac(0.524º, "días", style: "horizontal") 
  $


  Cos datos observacionais, Kepler podía predicir onde debería de estar Marte
  na próxima oposición. Calculando a posición das próximas o erro acumulado era
  moi superior aos dous arcominutos mencionados antes. É importante notar que
  esta rigorosidade en ter erros aceptables é algo meritorio de Kepler nunha
  época na que non se acostumaba. Isto permitiulle demostrar como o movemento
  angular dos planetas non é constante.

  #figure(
    image("/revistas/005/imaxes/1.png"),
    caption: [Oposicion Marte e ángulos do Sol e Terra @bizarre_mars]
  )


  O seguinte paso é construír un modelo de órbita. Se a velocidade non é
  constante, a velocidade variará na órbita. Isto derivou en recuperar a idea
  do ecuante. Recuperalo provoca que, ao ter que conservar o movemento circular
  respecto do ecuante, Marte se mova máis rápido cando está máis afastado del
  (e, por tanto, está máis cerca do Sol) e máis lento cando está máis cerca
  (máis lonxe do Sol). Kepler incorporaríao coidadosamente, construíndo o
  modelo do seguinte xeito. Primeiro, Tolomeo asume que a distancia do centro
  da órbita ao Sol ($e_"Sol"$) e ao ecuante ($e_"ecuante"$) son iguais,
  Kepler asumiraos como variables. Logo, debido a que a velocidade angular é
  constante, podemos tomar catro vectores do ecuante a Marte cuns ángulos
  hipotéticos (atópanse dividindo o período orbital entre os días que hai entre
  observacións), para comparalos cos catro vectores dos ángulos do zodíaco
  (vistos dende o Sol) que son os ángulos observacionais (tomando só catro
  posicións).

  /* Error parsing image
  #figure(
    image("/revistas/005/imaxes/3.jpg"),
    caption: [Variables e resultados da _Hipótese Vicaria_ @bizarre_mars]
  )
  */


  Por un axuste de computación a forza bruta podemos achar o círculo único
  (órbita superposta) onde intersecan os dous conxuntos de catro vectores. Este
  método tan tedioso que levou moito tempo resultou nun éxito ao poñer o resto
  de observacións, xa que deu un erro total de 2 arcominutos. O devandito
  modelo, chamado _Hipótese Vicaria_ (_Vicaria_ quere dicir
  _substitutiva_) pode semellar verdadeiro, pero Kepler quería
  comprobalo antes.

  Kepler desenvolveu un método que, con só simple trigonometría, podía saber a
  distancia do Sol a Marte. Os planos orbitais da Terra e Marte non son iguais,
  senón que están inclinados cun ángulo $alpha thick approx 1.85º$. Isto permite
  facer o seguinte triángulo entre o Sol, Marte e a Terra a partir dunha
  oposición onde a distancia vertical entre os planos orbitais sexa máxima.
  Engadindo unha segunda oposición no lado oposto, pódese facer un sistema de
  dobre triángulo co que se pode, coñecendo a distancia Sol-Terra (coñecida por
  Kepler e tendo un valor mínimo e máximo) e os ángulos do sistema, deducir a
  distancia do Sol a Marte e ao centro da órbita.
  
  #figure(
    image("/revistas/005/imaxes/4.png"),
    caption: [Problema trigonométrico xerado polas dúas oposicións @bizarre_mars]
  )


  Kepler descubriu que, comparando as distancias Marte-Sol preditas e
  utilizadas polo modelo, estas diverxían polo menos un 14% e até un 42%
  entre as calculadas coas medicións directas. Isto foi un gran problema, que
  fixo a Kepler dubidar cal sería o erro, se talvez é o círculo perfecto que se
  supón como órbita ou o ecuante. Se se modifica a _Hipótese Vicaria_
  para poñer as distancias Marte-Sol calculadas, a distancia ao centro do
  ecuante e ao Sol é aproximadamente igual. O mesmo que o modelo de Tolomeo. A
  Kepler parecíalle que funcionaba, mais na súa _Hipótese Vicaria_
  modificada cando se calculaban as predicións, agora devolvían un erro de oito
  arcominutos.

  Estes oito minutos son clave para revolucionar a astronomía. Non é un grande
  erro. O propio modelo de Tolomeo non baixaba dos dez arcominutos. Kepler non
  estaba convencido cos erros, xa que o das observacións era na súa como moito
  de dous arcominutos. En lugar de ignoralo, entendeu que necesitaba buscar
  novas causas e sistemas e repensar todo o que fixera até agora, remeditar
  toda a astronomía. Que fan que se movan os planetas? Ninguén pretendera
  seriamente entender isto. Kepler imaxinou o Sol como un grande imán que facía
  unha forza que chamou "especie inmaterial do corpo solar". Esta forza sería
  inversa á distancia, da mesma maneira que a luz é máis débil canto máis
  dispersa está (repárese en que se tivese sabido a lei cadrática inversa da
  luz, podería ter sido capaz de deducir a lei da gravitación). Así, canto máis
  afastado da Terra, menor forza e menor velocidade. Este intento de
  explicación física intúe unha posible relación matemática.

  Kepler sabía de como Arquímedes demostrara a relación entre a circunferencia
  e o diámetro dividindo o círculo entre triángulos cada vez máis pequenos. Un
  método que precedía ao uso de 
  /* Non sei se quere dicir dividíndo o círculo
  "entre" triángulos ou "en" triángulos, déixoo como está por se acaso */
  infinitesimais e que o mesmo Kepler pretendeu replicar. Se dividimos a órbita
  en triángulos de base $d$ (a variación da posición do planeta) e a altura $r$
  (a posición do Sol ao planeta), a área de cada triángulo é
  $A=frac(1,2)b h = frac(1,2)d r$. A velocidade é inversamente proporcional á
  posición $v= frac(k, r) = frac(d,t)$. Entón, o tempo é directamente
  proporcional ao produto de $r$ e $d$ e inversamente proporcional a unha
  constante $k$ tal que $t= frac(r d, k)$. Este método de triangulación é a
  segunda lei de Kepler, que postula que o planeta se move nun intervalo de
  tempo que varre áreas iguais. Kepler non sabía como determinar a posición
  exacta en cada momento porque a velocidade varía a cada instante, algo que co
  cálculo moderno sería sinxelo. Isto coñécese como o _problema de
  Kepler_, que motivaría o desenvolvemento do cálculo posterior. Tras crear
  este método, Kepler abandonaría o concepto de ecuante.

  Se o aplicamos á _Hipótese Vicaria_, as predicións que nos devolven
  son dun erro ínfimo en certas posicións e erros enormes noutras. Isto motivou
  a Kepler a dar o golpe de graza á astronomía antiga: as órbitas circulares.
  Se modificaba a forma da órbita facendo que os lados do círculo se acercasen
  máis ao centro, os resultados melloraban. Kepler desevolveu un método moi
  orixinal para saber a forma da órbita. Marte e a Terra teñen posicións
  diferentes porque se están a mover. Se puidésemos fixarnos nunha posición,
  poderiamos facilmente saber a posición do outro. Isto é precisamente o que
  conseguiu Kepler. Se tomamos unha posición de Marte, a Terra estará nunha
  posición determinada. Nun período marciano, Marte volverá á mesma posición,
  pero a Terra estará nunha distinta. Se recompilamos suficientes posicións da
  Terra, podemos saber a forma da Terra de maneira aproximada, xa que a
  sucesión de posicións revela a órbita.

  #figure(
    image("/revistas/005/imaxes/5.png"),
    caption: [
      Debuxo do propio Kepler onde mostra a Marte na mesma posición, e a
      posición da Terra despois de varios períodos de Marte @kepler_2015.
  ])

  A conclusión á que chegou Kepler foi que a forma da órbita debe ser algunha
  clase de forma oval. Mais, que tipo de óvalo? El pensaba que unha forma
  semellante á dun ovo. No entanto, hai multitude de óvalos, entre eles a
  elipse, que Kepler desestimou por crer que era demasiado simple e que, en tal
  caso, tería sido moi evidente para os gregos. Kepler desenvolveu un método de
  epiciclos (tanto tempo quitándoos para acabar usándoos resulta irónico) para
  simular a órbita que lle resultaba na forma dun ovo, pero que non servía para
  predicir as observacións. Comentaramos antes que daba mellores resultados se
  ambos os lados opostos do círculo se encollían cara ao interior, comparados á
  curvatura resultado da triangulación. A máxima distancia entre o círculo e
  esta curvatura é de 0,0049. Kepler desenvolvera paralelamente unha ecuación
  que lle 
  /*aquí e despois usa o apóstrofo como separador decimal, cando o
  único válido segundo a RAG é a coma (tamén o punto segundo a convención
  internacional ISO 80000-1) ademáis de que se fose unha distancia debería ter
  unidades*/
  daba o ángulo de Marte respecto ao vector posición entre o centro e o Sol que
  Kepler chamaría _ecuación óptica_. Por pura casualidade, tras analizar esta
  ecuación deuse de conta que en 5’30º o seu valor máximo, cando o ángulo do 
  /*os minutos e os graos escríbense na orde graosº minutos' segundos",
  tampouco sei se querería poñer segundos (") despois dos minutos*/
  centro e do Sol é de 90º, se tomamos a secante de 5’30º, o resultado daba
  1,0049. Xusto a distancia máxima máis un! Se modifica o seu modelo e axusta o
  seu método de epiciclos para facer que as distancias Marte-Sol fosen
  proporcionais á secante da ecuación óptica, o seu modelo encaixaría coas
  observacións. Este complexo modelo xeométrico trazaba unha elipse perfecta.
  Aínda así, Kepler equivocouse inicialmente e, frustrado, desestimou este
  modelo. Emocionado por atopar novas ideas, pensou sobre figuras xeométricas.
  Ao probar a elipse, deuse de conta que funcionaba e que xa a descubrira antes
  co devandito modelo. Tras catro largos anos, descubriuse a primeira lei de
  Kepler (nótese que a segunda foi anterior á primeira).

  #figure(
    image("/revistas/005/imaxes/6.png"),
    caption: [
      Esquema do problema formulado coa curvatura de círculo perfecto e
      observada, e a ecuación óptica e a secante @bizarre_mars.
  ])

  == Conclusión

  A principal motivación deste artigo é a de amosar a relevancia de todo este
  desenvolvemento. Na época de Kepler, os métodos científicos eran
  practicamente inexistentes. El foi quen de deixar de man a tradición e
  preconcepcións para desenvolver unha cadea de razóns lóxicas que xustificaban
  as dúas leis de Kepler. É moi difícil esaxerar como de significativas foron
  estas leis e a futura lei de gravitación (motivada principalmente polos
  resultados de Kepler) para a historia e a ciencia. Comparemos a absoluta
  confusión e incompletitude do coñecemento humano de épocas anteriores coa
  claridade e simplicidade destas leis (sobre todo a da gravitación) que
  establecen de xeito sinxelo como se moven os astros, algo de aparente gran
  complexidade e misticismo. Esta é a razón do triunfo da ciencia a futuro, a
  esperanza de que todos os fenómenos do mundo podían ter leis tan belas e
  simples.

  #SenCita("historia_marte")
  #SenCita("bizarre_mars")
  #SenCita("kepler_disc")
  #SenCita("shoulders")
  #SenCita("koestler_2017")
  #SenCita("kepler_2015")
  
  
  #CrearBibliografia("/revistas/005/bibliografia_IAGO_AR.bib")

]
