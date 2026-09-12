#import("/estilo.typ"): *

#show: Artigo.with(
    titulo: [De onde xorde a ecuación de Schrödinger?],
    subtitulo: [Unha bela relación entre a mecánica clásica, a óptica e a cuántica.],
    autoria: [Mauro Garrido Rodríguez],
    tema  : "DIVULGACIÓN",
)

#columns[

    Na maioría de libros de texto de mecánica cuántica a ecuación de Schrödinger
    introdúcese axiomaticamente; como é posible non dar unha xustificación da pedra
    angular da cuántica? Como chegou Schrödinger á súa ecuación? Neste artigo imos
    explorar o xeito, elegante e profundo, co que Schrödinger chega a unha das máis
    importantes ecuacións da física no seu artigo de 1926, adaptándoo ao lector
    para unha exposición máis didáctica.

    == A analoxía opto-mecánica

    Schrödinger lémbranos como, antes de ser coñecido o fenómeno da difracción da
    luz, esta era considerada como transportada por 'raios': a luz propagábase en
    liña recta nun mesmo medio, e cambiaba a súa pendente ao pasar a outros, mais
    mantendo sempre unha propagación rectilínea. Se un físico que só coñecese a
    óptica xeométrica (O.X.) quixese explicar a difracción, dinos Schrödinger,
    atoparíase con que os raios '_xa non serían rectilíneos e influiríanse
    uns aos outros dun xeito do máis curioso, en total contradición coas máis
    fundamentais leis da óptica xeométrica_'. Na macroescala, a O.X. pode funcionar,
    mais cando os obxectos cos que tratamos se volven comparables coa lonxitude de
    onda da luz (un parámetro que por suposto na O.X. carece de sentido) esta falla
    estrepitosamente e temos fenómenos como os de difracción. A raíz disto, e
    inspirado no traballo de De Broglie, dinos: '_acaso non está un tentado a
    investigar se a non-aplicabilidade da mecánica ordinaria a problemas
    micromecánicos é quizais do mesmo tipo que a non-aplicabilidade da óptica
    xeométrica no fenómeno de difracción ou interferencia?_'. Hai acaso unha
    formulación da mecánica clásica que teña que ver cun comportamento ondulatorio?
    *Si*, e era coñecida por *sir William Rowan Hamilton* en 1833.
    Este fixouse no parecido do principio de mínima acción mecánico co principio de
    Fermat óptico. Lembremos que di cada un:



    - *Principio de mínima acción*. Resumidamente, consiste nunha
        reformulación da mecánica clásica (a chamada mecánica analítica), onde, de
        tódalas traxectorias posibles que pode tomar un partícula, esta só escolle
        aquela que fai estacionaria unha determinada cantidade denominada
        *acción* (isto é, que non cambia a primeira orde baixo variacións
        pequenas da traxectoria), de xeito que

        $ delta S = 0 arrow.r  (d) / (d t) (partial
            cal(L)) / (partial dot(q)) - (partial cal(L)) / (partial q) = 0 $

        onde $ cal(L) = T - V$ é o lagranxiano,
        $S = integral_(t_0,q_0)^(t,q) cal(L) (q,dot(q), t) d t$, e a ecuación que se deriva
        do principio de mínima acción é a ecuación de Euler-Lagrange, que é a que rexe
        o movemento da partícula, o equivalente a $F = m a$ na mecánica estándar ou
        clásica.

    #figure(
       image(width: 70%, "/revistas/002/imaxes/hj2.png"),
       caption: [Traxectorias posibles para unha partícula. @bahramhouchmandzadeh_2020]
    ) <fig:schro1>

    - *Principio de Fermat*. Postula que os raios de luz seguen as
        traxectorias de mínimo tempo. Lagrange xeneralizaríao matizando que realmente
        as traxectorias que son escollidas son as estacionarias. Ao igual que no caso
        mecánico, non sempre se escollen as traxectorias de mínima acción, senón as que
        a fan estacionaria. Este principio, de feito, pode facerse equivalente ao
        anterior tendo en conta un lagranxiano óptico $cal(L)_(op) = n(s)$ ($n(s)$
        é o índice de refracción en cada punto), sendo a nosa condición de 'acción
        óptica' ou 'camiño óptico' estacionario a seguinte

        $
            delta S_(op) = integral_A^B cal(L)_(op) d s = 0
        $

        Este camiño óptico ten unha interpretación clara: é a distancia que
        percorrería a luz no baleiro no tempo que tarda esta en facelo nun medio con
        $n(s)$, posto que o índice é unha medida da relación entre as distancias
        percorridas nun medio e no baleiro, $n=c/v = frac(d x_c, d t, style: "horizontal") / frac(d x_v, d t, style: "horizontal") =
        (d x_c) / (d x_v)$. Se resolvemos esta ecuación, atoparemos a *ecuación
        dos raios da óptica xeométrica*.
        $
            (d)/(d s)(n (d arrow(r))/(d s)) = nabla n
        $


        Así, esta analoxía levou a Hamilton á idea de que o movemento dunha
        partícula podería describirse como o análogo a un raio de luz propagándose nun
        medio inhomoxéneo ($n(s)$).

        Así, *de igual xeito que os raios ópticos seguen liñas ortogonais ás
        superficies de fase constante* (as frontes de onda da luz), *as
        traxectorias das partículas seguirían liñas ortogonais ás superficies de acción
        constante*. A partir desta profunda idea, Hamilton propón que
        $
            p = (partial S)/(partial q)
        $


    É dicir, que a variación da acción coa posición (xeneralizada) dá lugar ao
    momento (xeneralizado) das partículas, que polo tanto se moven ortogonalmente
    ás superficies de acción constante.

    #figure(
    image(width: 60%, "/revistas/002/imaxes/hj1.png"),
    caption: [Relación entre as superficies de fase constante e os raios        @bahramhouchmandzadeh_2020]
    ) <fig:schro2>


    Se combinamos este feito co principio de mínima acción, pasando primeiro polas
    *ecuacións canónicas* (reformulación da de Euler-Lagrange facendo o
    cambio de dependencia $dot(q) arrow.r p$, onde agora o papel de
    $cal(L)$ faino $cal(H)$, o Hamiltoniano), atopamos a ecuación de
    *Hamilton-Jacobi*.

    $
        frac(partial S, partial t) + cal(H) (q,frac(partial S, partial q),t) = 0
    $

    Esta ecuación, aínda que non o pareza, é clave para entender a ecuación de
    Schrödinger. Imos reescribila e ver o caso máis simple para entendela mellor, o
    dunha partícula de masa $m$ movéndose nun potencial $V(x,y,z)$, de xeito que
    $cal(H) = E = T + V = frac(1, 2 m)(p_(x)^(2)+ p_(y)^(2)+ p_(z)^(2)) + V (x,y,z)$.
    Se incluímos este hamiltoniano na ecuación de Hamilton-Jacobi, e tendo en conta
    a suposición de Hamilton $p = frac(partial S, partial q)$ atopamos que

    $
        frac(partial S, partial t) + frac(|nabla S|^(2), 2 m) + V (x,y,z)= 0
    $

    Para simplificar aínda máis esta expresión, consideremos un hamiltoniano
    independente do tempo, de xeito que obteñamos unha ecuación para partículas con
    enerxía constante. Isto determinará a dependencia temporal da acción

    $
     frac(partial S, partial t) = - cal(H) -> #rect[$S =(E)t + f(x,y,z)$]
    $

    Deste xeito, executando a derivada temporal de $S$, a ecuación de
    Hamilton-Jacobi queda reducida a

    $
        |nabla S| = sqrt(2m(E-V))
    $

    Posto que a enerxía cinética é $T=E-V$, isto non é máis que

    $
        |nabla S| =  |arrow(p)| -> #rect[$nabla S = arrow(p)$]
    $
    O gradiente da acción, perpendicular ás traxectorias, é o momento da partícula.
    Esta é a ecuación dos raios-mecánicos, é dicir, das traxectorias, de enerxía
    constante.

    == A analoxía opto-mecano-cuántica

    Schrödinger é consciente de que ata aquí non hai nada novo. O que el propón é
    tomarse esta ecuación en serio. Se realmente esta é o equivalente á ecuación
    dos raios da O.X., e a óptica é en realidade ondulatoria, emerxendo estes
    delas, por que non facer o mesmo para as partículas para as súas traxectorias?
    Tomándonos en serio a analoxía, a ecuación de Hamilton-Jacobi asócialles ás
    partículas unha fase, a acción, que debe de ser a fase dunha onda. *Se a
    luz cumpría unha determinada ecuación de ondas, que ecuación de ondas cumprirá
    unha partícula material?*

    Antes de chegar a ela, temos que ter en claro que tipo de onda é a que ten a
    fase da ecuación de Hamilton-Jacobi: posto que provén de esixir unha fase
    estacionaria, pódese probar moi facilmente que é equivalente á *ecuación
    da _eikonal_* da óptica, que é válida para *{ondas
    localmente planas*, é dicir, ondas cunha variación de fase suave, con frontes
    de onda localmente planas.

    #figure(
        image(width: 70%, "/revistas/002/imaxes/hj3.png"),
        caption: [Ondas localmente planas. @apuntes_optica_2]
    ) <fig:schro3>

    Na mecánica clásica as únicas ondas consideradas serán localmente planas, que dan
    solucións exactas para as traxectorias; pero, en mecánica cuántica, ao igual
    que pasaba coa óptica ondulatoria e coa O.X., poderemos ter moitas máis
    posibilidades de ondas, *que darán lugar a movementos inexplicables
    mediante o concepto de raios, é dicir, de traxectorias*.



    Así, antes de pasar á ecuación de Schrödinger, poremos a proba este concepto de
    ondas asociándolle á función de ondas $Psi$ (o que ondula, cuxo significado
    descoñecemos, análogo ao campo electromagnético da luz) dunha *onda
    localmente plana* (polo comentado de que a ecuación de Hamilton-Jacobi só
    aplica a estas) a acción $S = E t + f(x,y,z)$ como fase (lembremos que isto
    implica $E="cte"$), recordando que debe cumprir $nabla S = arrow(p) -> nabla f(x,y,z) = arrow(p)$. Así,
    $
        Psi = A(x,y,z) e^(i(S/B)) = A(x,y,z)e^(i(E/B t + f(x,y,z)/B))
    $

    onde $B$ é unha constante que permite que o que entra na exponencial sexa
    adimensional. Esta é a clase de ondas que corresponden á ecuación de
    Hamilton-Jacobi, ondas localmente planas de $E="cte"$ cuxas frontes son moldeadas
    por $f(x,y,z)$.

    Schrödinger di: "_un non pode resistir a tentación de supor que $B$ sexa
    unha constante universal, porque nese caso_", facendo $B = planck$, a frecuencia
    desta onda é


    $
        omega = frac(E, planck) -> #rect[$E = planck omega$]
    $

    A famosa relación de De Broglie enerxía-frecuencia!

    == A ecuación de Schrödinger

    Para o caso simple que estamos tratando da partícula unidimensional,
    Schrödinger propón que $Psi$ cumpre unha ecuación de ondas ordinaria

    $
        frac(partial^2 Psi, partial x^2) =
        frac(1, u^2) frac(partial^2 Psi, partial t^2)
    $

    Agora, asume que estas ondas se moven cunha velocidade de fase dada pola
    ecuación de Hamilton-Jacobi, asumindo tamén solucións de
    enerxía constante (polo tanto, a parte temporal da acción será $S=E t$), o cal
    converte a esta ecuación de ondas na *ecuación de Schrödinger
    independente do tempo*. Así,
        
    $
      #rect[ 
        #block(inset: (top:12%, bottom: 12%))[
         $display(-frac(planck, 2m) frac(partial^2 Psi, partial x^2) +
        V(x,y,z) Psi = E Psi)$  ]]
    $


    Que, polo dito anteriormente, é unha ecuación só válida para ondas asociadas a
    partículas de enerxía constante. Fixémonos en que agora non se asume unha onda localmente
    plana (a ecuación non foi obtida con esa premisa), co que esta ecuación é
    valida para ondas arbitrarias que corresponderían ás 'traxectorias'
    cuánticas. Plasmar a importancia desta ecuación neste artigo é unha tarefa
    colosal que non pode abarcarse aquí, mais o que fai Schrödinger inmediatamente
    despois de conseguila é aplicala ao átomo de Hidróxeno, reproducindo así os
    valores cuantificados dos niveis de enerxía, explicando o átomo de Bohr. É de
    interese resaltar o feito de que se poidan obter tantos resultados sen darlle á
    $Psi$ unha interpretación aínda.


    #SenCita("schrodinger.e_1926")
    #SenCita("schrodinger.e_1926_2")
    #SenCita("hamilton_optico_mechanical")
    #SenCita("hamilton_jacobi_equation")

    #CrearBibliografia("/revistas/002/bibliografia_SCHRODINGER.bib")
]
