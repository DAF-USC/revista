#import("/estilo.typ"): *

#show: Titular.with(
    titulo    : "Skyrmións, ou que é a física",
    subtitulo : "O que unha teoría errada da interacción forte nos recorda sobre como funciona a ciencia.",
    autoria   : "Víctor Díaz Díaz",
    estilo    : "DIVULGACION",
)

=== Introdución

Hai pouco máis de dous séculos a ciencia comezou a establecerse como unha
ferramenta moi poderosa á hora de investigar e entender o Universo. Grazas a
ela podemos entender unha multitude de fenómenos, e aplicar estes coñecementos
para conseguir fins que doutro xeito parecerían imposibles. Neste ambiente de
éxito, é sinxelo deixarse levar e asumir que a ciencia nos proporciona acceso á
#quote(block:false)[verdade obxectiva] do Universo, e que con ela poderemos dar
resposta a calquera pregunta que se nos ocorra. Sen embargo, a realidade é que
a ciencia está limitada por definición.

Neste pequeno artigo imos exemplificar isto no caso da física empregando os
skyrmións.

=== Os skyrmións

A física de altas enerxías estuda as compoñentes máis fundamentais da Natureza,
o que na actualidade se corresponde con partículas subatómicas coma os
electróns e os quarks. Dende o punto de vista teórico, estas partículas
represéntanse matematicamente coma solucións dunha determinada teoría cuántica
de campos (QFT), sendo a día de hoxe o Modelo Estándar a teoría máis completa e
efectiva para isto. Estas QFTs son modelos matemáticos moi ricos, que describen
unha gran cantidade de fenómenos a partir dun número relativamente reducido de
ingredientes.

Un exemplo disto pode verse no tipo de solucións destas teorías. Como xa se
dixo, as partículas elementais correspóndense con algunhas das solucións, pero
non con todas. En algúns casos existen outro tipo de solucións, denominadas
_solitóns_, con características similares ás partículas pero tamén con
algunhas diferenzas importantes.

Hoxe en día, os solitóns non gozan do mesmo protagonismo que as partículas á
hora de representar as interaccións fundamentais, pero cando o campo da física
de altas enerxías aínda non estaba tan asentado coma agora, a situación era moi
diferente. Cando aínda se estaba intentando formular teoricamente a interacción
forte, aquela que sucede entre protóns e neutróns (chamados _nucleóns_ en
conxunto) no núcleo dos átomos, Tony Skyrme traballou nun modelo que contiña un
campo escalar, o campo piónico, cuxas solucións tipo partícula se correspondían
cos pións e cuxas solucións tipo solitón, chamadas _skyrmións_, se
correspondían cos nucleóns. Así naceu o _modelo de Skyrme_.

#figure(
    image(
        width: 100%,
        "/revistas/001/imaxes/Skyrmions.jpeg"
    ),
    caption: [Representación gráfica dun skyrmión,onde o número de buracos se corresponde coa súa carga topolóxica.]
)

Co tempo, a pesar duns primeiros resultados exitosos da teoría, o modelo de
Skyrme foi abandonado como candidato á teoría fundamental da interacción forte.
Isto débese a que a teoría ignora a existencia dos quarks, as partículas
constituíntes dos nucleóns que foron descubertas en experimentos posteriores e
que son descritas matematicamente pola Cromodinámica Cuántica (QCD) e
subsecuentemente polo Modelo Estándar: a mellor teoría das interaccións
fundamentais (cuánticas) da que dispoñemos a día de hoxe. Esto significa que o
modelo de Skyrme é incompatible co Modelo Estándar, e sen embargo algunha xente
(incluído o autor deste artigo) segue traballando con el. Por que? Que
utilidade pode ter isto?

Para entender isto debemos primeiro fixarnos nun réxime concreto. A baixas
enerxías, a presenza dos quarks apenas ten efecto e os nucleóns compórtanse
como obxectos sen partes, sen graos de liberdade internos. Neste caso, os
cálculos feitos empregando skyrmións proporcionan resultados en bo acordo con
observacións experimentais. Polo tanto, neste réxime é perfectamente válido
empregar o modelo de Skyrme para calcular teoricamente certas magnitudes e
ignorar por completo a QCD. Pero como pode xustificarse esto? Para que queremos
traballar con partículas que non existen podendo facelo cas que si?

=== Teorías efectivas

Para responder a esta pregunta, imos considerar un problema totalmente
diferente. Supoñamos que quero describir o movemento de Xúpiter ao redor do
Sol. Necesito coñecer con precisión infinita a dinámica de todos os obxectos
que existen no Universo para poder facelo? Por sorte para nós, a resposta é
non. Non necesitamos coñecer a posición de todas as partículas de gas que
forman o planeta, ou que efecto ten sobre a súa órbita a variación da súa
temperatura debida ao reflexo da luz do Sol sobre os seus satélites. Basta con
considerar os aspectos máis relevantes para a súa dinámica, que se reducen a
pouco máis que a súa masa, radio e distancia ao Sol. O resto de factores terán
o seu efecto, pero será tan pequeno que á hora de medilo non seremos capaces de
resolvelo. Así, podemos ignoralos completamente.

Para facer física, o primeiro paso é elixir que magnitudes son relevantes no
noso problema. Este é un proceso complicado, e sempre en continua revisión,
pero inevitable se queremos poder formular preguntas e buscar respostas que
sexan satisfactorias en certo grao. Con elo, formulamos unha teoría o máis
simple posible que nos resolva as dúbidas que temos, e unha vez que o
conseguimos buscamos predicir con ela fenómenos novos. Pouco a pouco, as
teorías vanse refinando e conséguese explicar unha cantidade cada vez maior de
fenómenos co menor número de ingredientes. Sen embargo, as teorías que quedan
atrás non se esquecen por completo, nin só se formulan teorías novas que
busquen ser máis completas que as anteriores. As teorías que só son válidas nun
rango concreto coñécense como _teorías efectivas_ e, nese rango, son
exactamente igual de válidas que as teorías máis xerais.

Se quixese medir a lonxitude da miña mesa cunha precisión de centímetros, sería
o mesmo medir cunha regra con marcas cada milímetro que cunha regra con marcas
cada nanómetro. A resposta sería igualmente 100 centímetros, e calquera decimal
adicional sería descartado, pero é máis sinxelo de ver na regra que está en
milímetros. Esta é precisamente a utilidade de empregar teorías efectivas:
usualmente, cantos menos graos de liberdade teña unha teoría, máis sinxelo será
traballar con ela. E se nos proporciona a precisión que buscamos, o máis lóxico
é traballar ca teoría máis simple. Porén, para describir algunhas propiedades
xerais dun núcleo atómico, podo seguir empregando o modelo de Skyrme porque
este é moito máis sinxelo que a QCD, e os resultados que se obteñen son
suficientemente bos.

=== A ciencia fala do #quote(block:false)[como]

A partir do que xa se mencionou debería ser sinxelo clasificar as teorías
efectivas coma #quote(block:false)[non reais], #quote(block:false)[útiles, pero
non verdadeiras]. A pregunta entón é #quote(block:false)[que teorías son
reais?], ao que podemos responder #quote(block:false)[as que non sexan
efectivas]. Pero resulta que todas as teorías da física son teorías efectivas.
Dende a lei de Hooke ata o Modelo Estándar, só son válidas nun rango
determinado dos seus parámetros. Así, non temos moita xustificación para
asegurar que os quarks son reais e os skyrmións non. Si podemos establecer un
criterio para elixir que teoría é #quote(block:false)[máis real] que outra,
considerando que a #quote(block:false)[máis real] é aquela que describe unha
maior cantidade de fenómenos. Sen embargo, a única #quote(block:false)[teoría
real] sería aquela capaz de describir todos os fenómenos do Universo en
conxunto, e isto é algo que non coñecemos e posiblemente non poidamos formular
nunca.

Con isto, vemos de xeito claro unha noción fundamental sobre que é a física (ou
calquera outra ciencia natural) e cal é a súa utilidade. En última instancia, a
física non se preocupa de #quote(block:false)[que son as cousas] se non de
#quote(block:false)[como se comportan as cousas]. Así, dentro dun rango de
precisión determinado, un #quote(block:false)[núcleo atómico] e
#quote(block:false)[algo que se comporta exactamente igual que un núcleo
atómico] son nocións totalmente indistinguibles dende o punto de vista
científico. Precisamente neste feito radica a súa eficacia: ao eliminar certos
detalles e centrarse nos aspectos que son fundamentalmente diferentes, resulta
moito máis sinxelo caracterizalos e entendelos.

E é que ao facer física sempre se deben asumir certas cousas, sempre se debe
tomar certos elementos ou relacións como #quote(block:false)[real], e a partir
delas estudar as consecuencias. Pero este primeiro paso é un acto non
científico. Porén, non debe menosprezarse a importancia da filosofía no proceso
da investigación da realidade e a súa conexión ca ciencia. Pode parecer que as
medidas experimentais son obxectivas e independentes da opinión de quen as
faga, pero non se debe esquecer que no traballo científico ten unha gran
importancia a interpretación dos resultados e que os principios filosóficos
aceptados no momento guían de xeito sutil a investigación científica. En moitos
casos, un gran avance na ciencia vén despois dun cambio de paradigma
filosófico, e viceversa.
