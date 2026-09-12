#import("/estilo.typ"): *

#show: Artigo.with(
	titulo		: [Aplicacións da física no campo da medicina],
	subtitulo	: [Técnicas de imaxe por Resonancia Magnética Nuclear.],
	autoria		: "Daniel Bostán Boxenean",
	tema  		: "DIVULGACIÓN",
)

#columns[

	== Introdución

	Acode ao Servizo de Neuroloxía un varón de 56 anos, fumador dun paquete diario
	durante 34 anos. Diagnosticado de carcinoma microcítico de lobo pulmonar medio
	(dereito) hai 15 meses, sendo positivo para PD-L1 e CD-56, parece responder ao
	tratamento tras oito sesións e catro meses de carboplatino e etopósido a doses
	elevadas segundo protocolo NCCN 2024. Na consulta refire hemiparesia
	contralateral e problemas na fala, polo que o relacionamos a afectación de
	cápsula interna e córtex. Exploración física: PA: 126/87 mmHg, FC: 85 lpm,
	SatO2: 98%, auscultación pulmonar e cardíaca normais. Semella consciente,
	afebril. Porén, sospeitamos lesión do Sistema Nervioso Central, dado que
	presenta hiperreflexia e signo de Babinski positivo, así que derivámolo a
	radioloxía ante sospeita de metástase (@fig:dbb:1).

	#figure(
		image(
			width: 65%,
			"/revistas/003/imaxes/dbb1.png"
		),
		caption: [
	        RMN en corte axial $T 1$. Obsérvase unha masa tumoral
        	no lobo temporal dereito, con afectación talamocortical.	
		]
	) <fig:dbb:1>

	Pero de que maneira Philips ou Siemens #footnote[Xunto con General Electrics e
	Toshiba, as principais comercializadoras de equipos NMR hoxe en día.] conseguen
	obter tal detalle cun #emph[doughnut] de metal xigante?

	== Historia da Resonancia Magnética Nuclear

	En 1938, Rabi bautiza o fenómeno da Resonancia Magnética Nuclear (NMR),
	consistente en que algúns núcleos teñen a capacidade de absorber e remitir
	enerxía en forma de radiofrecuencia (RF) se están sometidas a un campo
	magnético $arrow(B)_0$. Non foi ata 1973 que Paul Lauterbur conseguiu un método
	para codificar espacialmente os sinais da NMR empregando gradientes lineais de
	campo. A diferenza doutras técnicas de imaxe convencionais, a NMR non emprega
	radiación ionizante --as ecografías tampouco, pois interpretan sinais por
	ultrasóns--, o que a fai unha alternativa inocua.

	== Concepto básico da NMR

	Na NMR diagnóstica, emprégase o átomo de hidróxeno pola sinxela razón de que os
	animais temos abundante H, principalmente en forma de auga e graxa (85% aprox.
	da masa total). Ademais, a procura do protón permite distinguir os diferentes
	tecidos que atopamos no corpo debido ás propiedades químicas que teñen.

	O momento angular do núcleo magnetizado produce un momento magnético
	($arrow(mu)$), definido pola relación xiromagnética ($gamma$) particular para
	cada átomo (42,58 MHz/T no hidróxeno). Como é de esperar, un conxunto de
	momentos magnéticos non terá aliñación ningunha ata que apliquemos un campo
	magnético externo ($arrow(B)_0$), o que fai que os spins se ordenen co campo
	magnético (@fig:dbb:2 esquerda). É fundamental para entender a NMR
	coñecer a frecuencia de Larmor $omega_0$. (@fig:dbb:2 dereita)

	#figure(
		grid(
			columns: (30%,60%),
			gutter: 1em,
			image(
				width: 100%,
				"/revistas/003/imaxes/dbb3.png"
			),
			image(
				width: 93%,
				"/revistas/003/imaxes/dbb2.png"
			),
		),
		caption: [
	        Esquerda: Núcleo aliñado a un campo magnético. Dereita: Núcleo 
			en fase	de relaxación lonxitudinal $T 1$. Ecuación de Larmor:
        	$arrow(omega)= gamma arrow(B)$.
		]
	) <fig:dbb:2>

	Xa entendemos por que nuclear, e tamén por que magnética, pero por que
	resonancia? Os spins están aliñados --case-- perfectamente con $arrow(B)$, pero
	ao 'atordalos' cun pulso de radiofrecuencia (pulso RF) seguirán xirando en
	sentido perpendicular ao campo magnético coa mesma frecuencia $omega$ que o
	pulso RF, e esa oscilación emite un sinal medible. Pasado un tempo (variable
	segundo o tecido e o pulso RF), o spin volve a orientarse con $arrow(B)$
	(denominado magnetización ou relaxación lonxitudinal). O movemento que realiza
	durante a reorientación é a precesión (e nutación) arredor de $arrow(B)$ cun
	ángulo $theta$, que é de 90º con cada pulso RF, e decae coa relaxación
	lonxitudinal, xa que lembremos que en todo momento o spin segue a rotar coa
	mesma frecuencia. Veremos en profundidade a interpretación dos compoñentes
	vectoriais e o que significan (@fig:dbb:3).

	$
    S(t) = gamma N B sin(theta) cos(omega t)
	$

	#figure(
		image(
			width: 38%,
			"/revistas/003/imaxes/dbb4.png"
		),
		caption: [
			En gris $arrow(B)$, en vermello $arrow(mu)$, en verde a proxección de
        	$arrow(mu)$, que constitúe a intensidade do sinal ao introducilo nunha
        	bobina.
    	]
	) <fig:dbb:3>

	Lembremos algúns fundamentos como a lei de Lenz, entre outros, para ter ben en
	conta os determinantes da amplitude e frecuencia da función. Debemos entón
	diferenciar moi ben dous fenómenos:

	- Relaxación $T 2$: é o tempo que o núcleo rota pola
       influencia do pulso RF perpendicular ao campo magnético.
       Durante $T 2$, $theta$ é máximo e constante. O sinal
       obtido do conxunto de protóns denomínase magnetización transversal.
   
	- Relaxación $T 1$: entre o instante en que remata
       $T 2$ e se aliña correctamente con $arrow(B)$. En $T 1$,
       $theta$ vai decaendo. O sinal do conxunto é a
       magnetización lonxitudinal.

	Cada tecido ten uns tempos de relaxación distintos, incluso pode ser que
	$T 1 eq.not T 2$ no mesmo tecido, por exemplo en $T 2$ veremos o líquido
	cefalorraquídeo de cor branca, mentres que en $T 1$ será negro (@fig:dbb:1), polo que cada zona emitirá un sinal distinto, que se traduce
	nunha imaxe de altísima precisión.

	== Relaxación $T 2$

	Agora ben, non estamos tendo en conta a cantidade innumerable de átomos de H
	que hai por unidade de volume; e aínda que comezan (tras o pulso RF) co mesmo
	momento angular, pasado un tempo empezan a desfasarse e decaendo $theta$, o
	que dá como resultado unha curva de '#emph[decay]' na amplitude desas
	oscilacións no eixo horizontal (@fig:dbb:4). Hai basicamente dous
	parámetros que determinan o contraste entre os tecidos. Un deles é ese
	#emph[decay], onde cada tecido ten un $T 2$ distinto (curva distinta). O outro
	é $N$, é dicir, a densidade de núcleos xirando (a amplitude correspondente a
	$t=0$). Estas características son intrínsecas do tipo de tecido que estamos a
	estudar. Porén, o que o radiólogo pode modular é o #emph[Time of Echo] (TE)
	que é o tempo que esperamos para recibir o sinal dende que se enviou o pulso
	RF.

	#figure(
		image(
			width: 65%,
			"/revistas/003/imaxes/dbb5.png"
		),
		caption: [
			Funcións #emph[decay] en $T 2$ para distintos tecidos. O sinal,
        	loxicamente, é sinusoidal e decae, polo que a curva da imaxe obtémola
        	de axustar a ecuación de forma que vemos a variación das amplitudes no
        	tempo. Imaxe NMR de escala de grises invertida, recurso moi empregado
        	para resaltar mellor estruturas como a duramáter.
    	]
    ) <fig:dbb:4>

	== Relaxación $T 1$

	A curva de $T 1$ é distinta pero intuitiva. É, por así dicilo, o fenómeno
	inverso ou consecuente de $T 2$. Estando todos os núcleos xirando con ángulos
	distintos, xa desfasados, pasado ese tempo ($T 1$) a maioría dos núcleos están
	remagnetizados con $arrow(B)$. Neste caso, obtemos unha gráfica característica
	que, como xa veremos, complementa ben o sinal obtido na relaxación $T 2$ (@fig:dbb:5). 
	Podemos tamén modular o tempo que esperamos entre estimulacións
	repetidas, é dicir, cada canto enviamos un pulso RF. É o que chamamos
	#emph[Time of Repetition] (TR).

	#figure(
		image(
			width: 70%,
			"/revistas/003/imaxes/dbb6.png/"
		),
		caption: [
			Curvas de $T 1$, coa barra gris indicando o TR. Pódese observar que un
        	tecido con $T 1$ longo (rosa) corresponde cunha zona con menos sinal
        	para ese TR. Imaxe con cor invertida.
    	]
    ) <fig:dbb:5>

	== Relacións das relaxacións

	O desafío está en escoller os TE e TR adecuados para cada situación, que
	depende non só da 'exposición' que queiramos (como se dunha fotografía se
	tratase), senón das características do propio tecido. O rabdomiosarcoma é un
	tumor mesenquimal #footnote[Mesénquima: tecido de orixe mesodérmico, sumado a
	endodermo e ectodermo, que son as tres capas xerminais de calqueira tecido
	embrionario con capacidade de diferenciación, neste caso, a tecido conectivo
	(músculo, óso, graxa, cartílago…).] de orixe embrionaria que tende a
	diferenciarse a músculo esquelético. Ante un estudo por NMR, o radiólogo ten
	que ter en conta a exploración física e a historia clínica para orientar un
	diagnóstico e así predicir non só o tecido que buscamos, senón o tipo de tumor
	(que como ten orixe mesodérmica, será semellante ao músculo circundante), polo
	que debe elixir as secuencias máis óptimas en función dos $T 1$ e $T 2$ da masa
	que buscamos.

	#figure(
		image(
			width: 75%,
			"/revistas/003/imaxes/dbb7.png"
		),
		caption: [
			Relación TR/TE na recepción de sinal. Un TR curto
        	inflúe na amplitude en $t=0$ para a fase $T 2$ (liña laranxa).
        	Cada nova barra laranxa é un pulso RF, o que 'reinicia' un $T 2$.
    	]
	) <fig:sennome>

	Como se pode comprobar na @fig:sennome, o TE depende directamente do TR, e con el o
	sinal que esperamos recibir dos tecidos. Un tecido hipotético cun $T 1$ máis
	curto, cuxa curva estaría enriba da azul, terá unha amplitude maior na curva
	laranxa en $t=0$. O pulso RF é como pulsar #emph[play] nun cronómetro, que dá
	comezo a $T 2$. Se poñemos un TR e TE moi curtos, a relaxación transversal
	($T 2$) non nos daría moita información, xa que estariamos constantemente
	excitando eses núcleos, e sempre estariamos nunha zona da gráfica con pouca
	dispersión das curvas (porque cada tecido ten unha curva distinta). É por iso
	que cando unha secuencia establece un TE e TR curtos, dicimos que está
	potenciada ou ponderada en $T 1$ #footnote[Se poñemos un TR longo e un TE curto
	obteriamos o que se chama Proton Density Image.], e viceversa. Non son
	excluíntes, senón complementarias.

	Por suposto, $T 1 + T 2$ constitúe o tempo que tarda o núcleo en aliñarse
	totalmente con $arrow(B)$ dende o pulso, e aínda que medimos ambos os tempos
	como fenómenos distintos, a realidade é que son un contínuum, e, por tanto, o
	vector de magnetización pódese descompoñer en dous vectores perpendiculares. A
	este sistema chamámoslle #emph[rotating frame], e vemos como ao longo do
	tempo, a compoñente horizontal decae (corresponde coa magnetización
	transversal, que ocorre durante $T 2$) e o vertical medra. Recomendo indagar
	nestes aspectos, que carecen de interese clínico e, por tanto, non teñen lugar
	neste artigo.

	== Polarización

	Todos os camiños levan a Boltzmann. Esta ecuación determina que fracción dos
	núcleos están orientados de forma paralela e cantos de forma antiparalela, que
	con parámetros corporais resulta un número moi baixo. Nun conxunto de 99 spins,
	50 arriba e 49 abaixo, a inmensa maioría cancelará os seus momentos magnéticos,
	e desta forma un só spin é o que emite sinal real aproveitable. No entanto,
	lembro que o sinal depende tamén das características intrínsecas de cada
	tecido, e que estamos omitindo cuestións como a non-homoxeneidade do campo
	magnético, o spin #emph[echo] e moitas transformadas de Fourier.

	$
    S = frac(N_"total" gamma^3 accent(h,macron)^2 B_0^2 , 4 k T)
	$

	Existe unha técnica baseada en hiperpolarizar gases nobres como o Xe-129 ou
	He-3, dado que emiten moito máis sinal. Desta forma conseguimos unha mellor
	resolución en determinadas estruturas, útil, por exemplo, en estudos en
	asmáticos. Outro contraste útil (intravenoso) é o gadolinio.

	== Do imán á pantalla

	Para rematar, sabemos que a radiografía tradicional é unha proxección, e que
	unha tomografía son radiografías en serie que 'cortan' fisicamente nun plano.
	A información recibida dunha NMR non é en planos; e, por tanto, non falamos de
	píxeles, senón de vóxeles; aínda que o plano de referencia é o campo magnético,
	que sempre é o mesmo #footnote[NUNCA se apaga un equipo NMR. Se pasades ao lado
	do CACTUS escoitaredes un son periódico, 'hidráulico'. É un sistema de
	refrixeración de helio líquido, para manter a intensidade día e noite (sae máis
	barato que apagalo).] (SEMPRE a 2-7 T, incluso cando non está funcionando a
	máquina). Por defecto, obtemos imaxes no plano axial, pero as bobinas de
	gradiente (as responsables dese insoportable e característico ruído)
	'desprazan' $arrow(B)$ de forma que, sen mover o equipo nin o paciente,
	podemos obter imaxes en tempo real en calquera plano.

	A NMR cambiou por completo o enfoque diagnóstico na medicina, e conclúe unha
	proba máis da importancia na colaboración entre disciplinas científicas para a
	saúde.

	#SenCita("harrison_2020")
	#SenCita("cunn_74")

	#CrearBibliografia("/revistas/003/bibliografia_DANIEL_BB.bib")

]
