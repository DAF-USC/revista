// :FACER:MIGRACION: seguimos ca idea de ter unha función aqui cas cousas do artigo?
#import("/estilo.typ"): *

#show: Titular.with(
    titulo    : [Carathéodory e a axiomatización\ da termodinámica],
    subtitulo : [Sobre a pretensión de transformar un coñecemento puramente fenomenolóxico en puramente matemático.],
    autoria   : "Sebastián Táboas Pazo",
    estilo    : "DIVULGACION",
)

=== Introdución

Quizais o espírito que une a todos os científicos sexa a pescuda de respostas á
realidade material que se nos impón, na física algúns acadaran o gozo na idea
dunha _teoría do todo_ que nos brinde explicación a todo o que acontece.
Outros, no entanto, pretenderan buscar un denominador común capaz de
fundamentar calquera teoría, mesmo _unha teoría do todo_; este é un espírito
axiomatizador que se xesta dende a antigüidade xa con Aristóteles ou Euclides e
se estende até hoxe en día, así tamén se pretendeu axiomatizar a física. Na
conferencia do Congreso internacional de Matemáticos de 1900, David Hilbert
propuxo os coñecidos _23 problemas de Hilbert_ #footnote[Realmente só propuxera
dez deles.], entre eles o de axiomatizar toda a física.

Os esforzos neste proxecto son moitos e en moitas ramas, mais agora destacamos
o traballo da axiomatización da termodinámica, quizais o menos frutífero de
todos eles. Nun primeiro momento, a persoa que aceptou este desafío foi o
matemático grego Constantin Carathéodory na súa obra _Untersuchungen über die
Grundlagen der Thermodynamik_

=== A axiomatización de Carathéodory

No seu traballo de 1909, Carathéodory parte de tan só tres definicións
primitivas e dous axiomas para fundamentar toda a termodinámica que pioneiros
coma Kelvin, Carnot ou Clausius edificaran ao longo de máis de medio século.
Primeiramente, o matemático define a equivalencia de sistemas e as variábeis de
estado, como a caracterización dos cambios de estado. O primeiro axioma que
propón é unha reescritura do primeiro principio da termodinámica:

#quote(
    attribution: [Carathéodory, 1909],
    block: true,
)[
    Cada fase $phi.alt_i$ dun sistema S en equilibrio asóciase a unha función
    $epsilon_i$ das cantidades $V_i$, $p_i$, $m_i$, que é proporcional ao volume
    total $V_i$ da fase e denomínase enerxía interna da devandita fase. A suma
    $epsilon = sum epsilon_i$ de todas as fases chámase enerxía interna do sistema.
    En calquera cambio de estado adiabático, o cambio de enerxía incrementado polo
    traballo externo, $A$, é nulo; é dicir, en signos, se se denotan os valores
    inicial e final da enerxía con} $hat(epsilon)$ _e_ $epsilon$ ~ respectivamente
    $hat(epsilon) – epsilon + A = 0$
]

Até aquí non hai nada novidoso, non obstante, debemos pensar que as expresións
matemáticas que frecuentemente manexamos en termodinámica son diferenciais de
Pfaff: $"df"=sum x_i "dX"_i$, os cales no caso adiabático ($overline(d) Q = 0$)
supoñen un problema de curvas características entre o estado inicial e o final.
Nesta clase de procesos, estas 1–formas verifican sempre o segundo lema de
Schwarz, polo que se trata de diferenciais exactos que podemos integrar; agora
ben, en procesos non adiabáticos isto non é así. O matemático grego é tamén
autor dun teorema que leva o seu nome: este asegúranos que para toda 1–forma
non exacta existe un factor integrante que a converte en integrábel. Así,
afirma, ao retirar a restricción adiabática, que para $macron(d) Q = "dU" –
macron(d) W$ existe un factor integrante, que é o inverso da temperatura
absoluta ($1\/T$), que converte a $macron(d) Q$ en exacta, este novo diferencial
é a entropía $"dS"$. Desta forma, semella sólido enunciar o seguinte axioma:

#quote(attribution: [Carathéodory, 1909 @c1909])[
    En calquera entorno dun estado inicial arbitrario hai estados que son
    inaccesíbeis mediante cambios de estado adiabáticos
]

Este teorema dinos que para todo estado $alpha$ de equilibrio existe polo
menos un estado $beta$ tal que o segundo é accesíbel dende o primeiro, mais
non á inversa. Isto supón asumir que existe un número arbitrario de curvas
adiabáticas, tantas como se propoña para soster o seu sistema. Até este
momento, Carathéodory non se referira todavía a unha magnitude tan fundamental
na termodinámica como é o calor. Tal é que non fai referencia algunha á noción
primitiva do calor ao longo de todo o seu desenvolvemento, deslindándose da
realidade física evidencíabel e usándoa só como un comodín para describir
aquelas curvas que non foran da clase que define o primeiro postulado.

=== Críticas

Estes axiomas semellan constituír un análogo aos principios clásicos da
imposibilidade dos móbiles perpetuos, no caso de seren formulados sen ningunha
clase de erro. A difusión deste traballo foi prácticamente nula nun principio,
non foi até que M. Born sinala o innovador deste artigo que pasara despercibido
nun extenso estudo de 1921. A crítica pronto florece e florea ampla e
negativamente o traballo de Carathéodory, dando un salto exponencial a mediados
do século pasado co auxe da termodinámica irreversíbel na que se evidenciaban
os problemas destes enunciados, cando menos insuficientes, pois o matemático
sempre restrinxírase a un marco de procesos quasiestáticos.

#figure(
    image(
        width: 100%,
        // :FACER:MIGRACION: xogar máis cos tipos 'path'
        "/revistas/001/imaxes/termodinamica.jpeg"
    ),
    caption: [ Constantine Carathéodory.]
) <fig:caratheodory:1>

Unha das primeiras críticas que aparece vén de man de Max Planck, quen sinalara
a súa falta de contacto coa evidencia experimental nunha rama de fundamento
plenamente fenomenolóxica. Este último sentenciara:
#quote(
    // non se vai mostrar a persona esta, porque o modo bloque está
    // desactivado, asique se mostra a cita na propia liña
    attribution: [(Planck, 1926)],
    block: false,
)[…ninguén até agora tratou de alcanzar soamente
    mediante procesos adiabáticos todo punto no entorno de calquera estado de
    equilibrio, e así comprobar se de veras son inaccesíbeis, […], este axioma non
    nos brinda o menor indicio que nos permita diferenciar os estados accesíbeis
    dos inaccesíbeis
].
Outra crítica de entre moitas radica, aínda que se
evidencie a existencia dun factor integrante vinculado á escala absoluta
Kelvin, este non comporta necesariamente unha función da clase das temperaturas
termodinámicas, malia ser este erro rectificábel.

A pesar de nunca ser realmente aceptado (Chandrasekar, no seu libro
_Introducción ao estudo da Estructura Estelar_, denomínao só como "un
punto de vista"), o simple atreverse é un paso xigante para o desenvolvemento
científico. Este traballo de 1909 constitúe indudabelmente un fito histórico da
ciencia, aínda que sexa errado, relegado á posición de mera curiosidade
académica, acabando por ocupar un lugar secundario nos manuais de
termodinámica.

Ademais desta versión histórica da axiomática termodinámica, atopamos hoxe o
edificante escrito de Herbert B. Callen, _Thermodynamics and an
Introduction to Thermostatistics_, que a estructura axiomáticamente, como outro
punto de vista, e o fundamenta todo no que el chama "o problema básico da
termodinámica". Moitos dos textos actuais que empregan estudantes son deudores
de Callen, como por exemplo _Curso sobre el formalismo y los métodos de
la Termodinámica_ de J. Biel-Gayé. Aínda con todo, até agora non se conseguiu
unha formulación axiomática puramente matemática equivalente á clásica
formulación de Gibbs exclusivamente fenomenolóxica, quizais, a termodinámica
comporte un caso especial dentro do paradigma científico actual no que é
imposíbel evidenciala dende uns principios matemáticos xerais e primitivos.
