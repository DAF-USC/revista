#import("/estilo.typ"): *

#show: Artigo.with(
    estilo    : "DIVULGACION",
    titulo    : [O Teorema de Bohr-Van Leeuwen:\ o segredo está na cuántica],
    autoria   : [Luis Arcas Morcillo],
    subtitulo : [Da imposibilidade clásica do magnetismo.],
)

#columns[

    _Classical magnetism is fake_. Estou seguro de que con este artigo a
    polémica está servida. Gústame imaxinar que os nosos prezados lectores
    dividiranse en dous bandos. Uns entrarán en pánico e ante a afirmación anterior
    quererán abolir o estudo da magnetostática clásica en tódalas facultades do
    país. Outros, quizais máis cínicos (e con razón), pensarán que ten moito
    sentido que o magnetismo é unha consecuencia cuántica. A fin de contas, todo
    fenómeno a escala atómica debe rexer as leis da mecánica cuántica. Non
    obstante, este feito non era para nada coñecido no comezo do século XX, onde
    comeza a nosa historia. Abrochade os vosos cintos, porque avecíñanse curvas.

    == O magnetismo previo ao átomo

    Supoño que os inicios da teoría do magnetismo son coñecidos pola maioría, pero
    en resumidas contas aconteceu máis ou menos así:

    Dende tempos inmemoriais, antigas civilizacións xa coñecían a ferrita, un
    mineral que posuía a fascinante propiedade de atraer metais. Séculos despois,
    científicos renomados como Faraday, Lenz e Maxwell contribuíron ao primeiro
    formalismo dunha teoría que actualmente coñecemos como electromagnetismo (EM),
    nunha formulación de campos que é de moita utilidade para sentar as bases da
    electrodinámica. Así, o ser humano era agora capaz de simular as propiedades da
    ferrita a partir de cargas eléctricas en movemento nun circuíto, mostrando o
    vínculo profundo entre a electricidade e os imáns. No entanto, quedaba pendente
    unha cuestión: por que hai materiais que presentan campos magnéticos propios
    permanentes? Que propiedades ten a ferrita e outros materiais presentes na
    natureza para actuar como imáns naturais?

    O descubrimento do átomo e das primeiras partículas subatómicas tivo unha
    gran relevancia non só a nivel experimental, senón tamén conceptual. Os
    electróns e protóns teñen carga igual e de signo oposto, pola súa contra, as
    masas son distintas, onde claramente é maior a masa do protón. Entón, ten
    sentido pensar que estas partículas cargadas en particular, e os átomos en
    xeral, son susceptibles individualmente á actuación de campos
    electromagnéticos. A enerxía adquirida pola presenza dun campo magnético pode
    describirse a partir do momento magnético da partícula cargada:

    $
        arrow(mu) = 1/(2m) (arrow(r) times q arrow(v) )
        arrow.double
        E = - arrow(mu) arrow(B) = - mu_z B.
    $ <ec.:energia_momento>

    O signo negativo corresponde ao feito de que a enerxía se minimiza cando o
    momento magnético $arrow(mu)$ está aliñado co campo: $E=E_"mín"
    arrow.l.r.double arrow(mu) parallel arrow(B) arrow.l.r arrow(mu) = mu
    hat(z)$.

    Sen entrar en moitos detalles, o comportamento dos momentos magnéticos dos
    átomos individuais fronte a campos magnéticos permitiríanos describir o
    material. Se tódolos momentos están aliñados entre eles, falamos de
    _ferromagnetismo_: o material presentaría un comportamento de imán natural
    cando se introduce un campo magnético. Se os momentos magnéticos individuais
    están desaliñados, de tal xeito que aparentemente se opoñen ao campo externo,
    falamos de _diamagnetismo_. Non obstante, se a interacción parece favorable
    á dirección do campo, falaremos de _paramagnetismo_.

    == Langevin e o primeiro modelo atómico do paramagnetismo

    En 1905, o físico francés Paul Langevin foi o primeiro en presentar un modelo
    que fose capaz de explicar a escala atómica o comportamento dos distintos
    materiais fronte a campos magnéticos. Actualmente estúdase como a _teoría
    semiclásica do paramagnetismo_ [Sec. 2.1.4.]@blundell.s_2001. Langevin
    propoñía que os átomos tiñan un momento magnético constante apuntando a certa
    rexión do espazo segundo a distribución de Boltzmann:

    $
        d P = 1/Z e^(E/(K_B T)) d Omega,
        Z = integral_0^(2pi) integral_0^pi e^(E/(K_B T)) d Omega,
    $
    <ec.:bvl_boltzmann>

    onde $d Omega = sin(theta)d theta d phi$ é a diferencial do ángulo sólido.
    Así, dados $N$ átomos dun material lineal nun volume $V$, a magnetización
    resultante do material é a seguinte:

    $
        M = N/V integral mu_z d P = N / V dot L ((mu B) / (k_B T)),
    $ <ec.:blv_langevin>

    onde $L(y) = coth(y)-y^(-1)$ é a función de Langevin. Dous anos máis tarde, o
    tamén francés Pierre Weiss propuxo outro modelo que corrixía o de Langevin e
    introducía o comportamento ferromagnético de diversos materiais na teoría.

    == As disertacións de Bohr e Van Leeuwen. Unha nova teoría.

    Os problemas non tardarían en chegar. Xa por 1911, un novo Niels Bohr puxo en
    dúbida a teoría de Langevin, achando unha contradición infranqueable se
    soamente se empregaban técnicas de Mecánica Estadística. Anos máis tarde, unha
    estudante da Universidade de Leiden, chamada Hendrika Johanna van Leeuwen
    disertaría sobre o mesmo tema na súa tese doutoral, chegando ás mesmas
    conclusións que Bohr. Vexamos cal foi o seu razoamento e as conclusións finais
    [Sec. 1.2.2.]@blundell.s_2001.

    Consideremos unha mostra paramagnética de $N$ átomos, todos coa mesma masa, no
    seo dun campo magnético. Consideraremos exclusivamente o momento debido aos
    electróns, sendo o resultado xeral para outras partículas cargadas. Tense entón
    que cada electrón ten un momento magnético:

    $
        arrow(mu) = (-e)/(2m) (arrow(r) times dot(arrow(r)))
        arrow.double
        mu_z = sum_(i=1)^(3 N) a_i (q_1, dots, q_(3N))dot(q)_i.
    $

    É dicir, o momento magnético total nunha dirección (a dirección do campo
    $arrow(B)$) é unha función explícita das velocidades nas coordenadas xerais.

    Consideremos ademais que o noso sistema conserva a súa enerxía, de tal feito
    que o total correspóndese co hamiltoniano, función de coordenadas xerais,
    $arrow(q)$ e os seus momentos canónicos conxugados, $arrow(p)$. Para un sistema
    sometido a un campo electromagnético caracterizado polos potenciais
    $(phi.alt,arrow(A))$, dáse o seguinte hamiltoniano:

    $
        E = H(arrow(q), arrow(p))
        =
        1/(2m) sum_(i=1)^(N)(arrow(p)_i - e arrow(A)_i)^2 + e phi.alt (q_1, dots, q_(3N))
    $

    Podemos realizar a media os seus momentos magnéticos para achar a enerxía media
    do sistema $chevron.l E chevron.r = -B chevron.l mu_z chevron.r$. Segundo a
    Mecánica Estatística
    @ec.:bvl_boltzmann e o modelo de Langevin @ec.:blv_langevin,
    podemos calcular esta media a partir da función de partición $Z$ da mostra:

    $
        chevron.l mu_z chevron.r = integral mu_z d P
        =
        1 / Z integral e^(-beta H(arrow(q), arrow(p))) d^N (arrow(q), arrow(p)),
    $ <ec.:bvl-mec_est>

    onde $beta^(-1) = k_B T$. Recordando as relacións de conxugación canónica no
    formalismo hamiltoniano, temos que $dot(q)_i = (partial H)/(partial
    p_i)$, e polo tanto a media cumpre que:

    $
        chevron.l mu_z chevron.r
        =
        1/Z integral.double sum_(1=1)^(3N)a_i (q_1, dots, q_(3N))
            (partial H)/(partial p_i)e^(-beta H)d^(3N)(arrow(q), arrow(p)).
    $

    No entanto, se integrarmos na totalidade do espazo de fases, veremos que a
    media é igual a cero#footnote[É un bo exercicio para o lector facer os
    cálculos, aquí vai unha pista: separe a integral múltiple no producto das
    integrais na posición $arrow(q)$ e o seu momento $arrow(p)$. O integrando
    dependente de $arrow(p)$ é impar, e polo tanto a integral anúlase.]. Deste modo,
    baixo a acción do campo, en media estatística hai tantos momentos aliñados
    coma desaliñados: a mostra é diamagnética.

    En resumidas contas, de ser pola teoría clásica, non habería magnetismo
    posible, nunha clara contradición coa realidade experimental. Así, era
    necesaria unha nova teoría que fose capaz de explicar a presenza do magnetismo
    na natureza. Segundo @van-vleck.jh_1977, foi este feito o
    que motivou a Bohr a introducir a cuantización do momento angular orbital do
    electrón ao redor do núcleo de hidróxeno para formular o seu famoso modelo
    atómico. Así, un pode afirmar que o nacemento da cuántica está moi vinculado ao
    magnetismo atómico.

    == Conclusións

    En definitiva, aínda que a teoría de Maxwell é moi útil para explicar fenómenos
    electromagnéticos clásicos coma a indución magnética ou mesmo a luz (o que
    podería dar para outro artigo), a imposibilidade de explicar o fenómeno do
    paramagnetismo pon de manifesto que fai falla unha teoría máis completa, que
    teña presente o comportamento propio dos átomos. É dicir, que, unha vez máis, a
    cuántica está aquí para salvarnos da catástrofe. Un desenvolvemento máis
    completo do rol da cuántica no magnetismo pode cursarse na materia de
    Nanomagnetismo e Nanotecnoloxía desta facultade.

    #CrearBibliografia("/revistas/002/bibliografia_LEEUWEN.bib")

]
