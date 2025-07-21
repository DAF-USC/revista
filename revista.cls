% Este é o formato da revista. Se buscas por qué tal cou cal cousa se ve como
% se ve, deberías mirar aquí. Intentei que esto estivese comentado na medida do
% posible, para facilitar o uso e modificación desto no futuro. Todo esto foi
% escrito de 0 por varios estudantes da facultade de física da universidade de
% Santiago de Compostela.  Se queres saber como contribuir, botalle un ollo ao
% arquivo README.md. Este é un proxecto libre, de uso e de responsabilidade. En
% ningún momento nos imos facer responsables se compilas esto e se che queima a
% CPU (dudo que pase).

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{revista}[2025/07/21 Clase para a revista de Fisica USC]

\LoadClass[11pt,a4paper,twoside]{article}

% Cargamos funcions de Lua
\directlua{dofile('lua/funcions.lua')}

% :FACER: buscar mellores tipografías
% Tipo de letra. Cortesía de LuaLaTeX. É extremadamente fácil:
\RequirePackage{fontspec}

% Tipografía xeral
\setmainfont[
    Path           = ./fontes/LatinModern/,
    Extension      = .otf,
    UprightFont    = *-regular,
    ItalicFont     = *-italic,
    BoldFont       = *-bold,
    BoldItalicFont = *-bolditalic,
]{lmroman10}
% A tipografía para as matemáticas seleccinámola logo de cargar o paquete
% 'unicode-math' máis abaixo.

% Tipografía monoespaciada. Usase con \texttt{ aaa }
\setmonofont[
    Path      = ./fontes/LatinModern/,
    Extension = .otf,
]{lmmono10-regular}

% Tipografía Sans Serif. Usase con \textsf{ aaa }
\setsansfont[
    Path        = ./fontes/LatinModern/,
    Extension   = .otf,
    UprightFont = *-regular,
    ItalicFont  = *-oblique,
    BoldFont    = *-bold,
]{lmsans10}


% Esta é unha familia de fontes. Podemos activala facendo, dentro de parénteses
% { \FonteSimbolos bla bla bla ... }
% A peculiaridade é que esta fonte non ten letras, só símbolos. A idea é usala
% para sustituir as imaxes .PNG de cousas como mails,twitter,instagram, etc.
% Pra usar un símbolo so hai que copialo e pegalo nun entorno onde activásemos
% esta tipografía. Para buscar os iconos: https://www.nerdfonts.com/cheat-sheet
% É bastante posible que o editor que estedes usando non vos mostre o icono na
% pantalla correctamente. Non é problema, mentres sexa o icono correcto no PDF
% verase ben. Tamén é posible especificar o icono co seu código hexadecimal
% explícitamente, escribindo ^^^^eb2a Sí, os catro ^ son necesarios, 'eb2a' é o
% codigo hex.
\newfontfamily{\FonteSimbolos}[
    Extension   = .ttf,
    UprightFont = *-Regular,
    Path        = ./fontes/NerdFonts/,
]{SymbolsNerdFontMono}

% Usar galego (como debe ser)
\RequirePackage{polyglossia}
\setmainlanguage{galician}

% BIBLIOGRAFIA. Pasamos a usar o método máis comodo, xeral e rápido: CSL
% https://www.ctan.org/pkg/citation-style-language
% https://github.com/citation-style-language/styles
% https://www.zotero.org/styles
\RequirePackage[
    style       = american-physics-society,
    ref-section = section
]{citation-style-language}
\addbibresource{bibliografia.bib}

% Cores. En cada artigo usamos \definecolor{}{} pa coller o que queremos
\RequirePackage{xcolor}

% Graficos e tal. Se podes soñalo, podes facelo con TikZ.
\RequirePackage{tikz}
% para facer calculos cas posicions dos nodos, sumándolle cousas. Por exemplo,
% fixádevos que ás coordenadas (current page.west) 'súmaselle' (2.5,-5)
% \node[
%     red!90,
%     circle,
%     draw,
% ] at ($(current page.west)+(2.5,-5)$) {} ;
\usetikzlibrary{calc}
% Outros paquetes útiles (pero agora non necesarios) para tikz:
% 'tikzpagenodes'

% Pa ter fondos con \AddToShipoutPictureBG, usase na contraportada
\RequirePackage{eso-pic}

% Pa ter alphas (transparencia), por exemplo no fondo do botafumeiro. Úsase o
% switch e.g. \transparent{0.3}
\RequirePackage{transparent}

% E pos codigos QR da contraportada, con \qrcode{}. Ralentizan moito a
% compilación
\RequirePackage{qrcode}

% Para recuadros, fondos, etc.
\RequirePackage{tcolorbox}

% Xeometria do documento. Na portada e na contraportada sobreescribimos a
% xeometría con \newgeometry e volvemos a esta con \restoregeometry
\RequirePackage{geometry}
\geometry{
    paper       = a4paper, % tamaño do papel
    top         = 20mm,    % marxe superior
    left        = 10mm,    % marxe esquerdo
    right       = 10mm,    % marxe dereito
    bottom      = 25mm,    % marxe inferior
    nomarginpar = true,    % desactivar marxe para notas
    % showframe,            % mostra estructura, moi util
}

% Esto é pa mostrar as box, hyphenation points, glues, etc. Útil para depurar
% \RequirePackage{lua-visual-debug}

% E xa que falamos de depuración, está o comando este pa mostrar todos os
% paquetes que se usan (implícita e explícitamente) e súas versións. Toda esa
% info gárdase no *.log, de cara ao final logo dunha liña que pon *File List*
\listfiles

% Para colocar cousas en 2 (ou 3 ou 4...) columnas. É preferible á opcion da
% clase 'twocols' porque esa da moitísimos problemas no caso de que queiramos
% ter partes que non teñan 2 columnas. Aparte de que se pode configurar menos
\RequirePackage{multicol}

% E aumentamos a separación entre as columnas
\setlength{\columnsep}{5mm}

% Pa cambiar interlineados no momento usando \setstrech{}
\usepackage{setspace}
\setlength\parindent{5mm} % tamaño da indentación

% Para graficos
\RequirePackage{graphicx}
% \RequirePackage{svg}

% Mates e todo eso. Hai variedade, de feito, máis dos que se usan. Miña
% intención é que a xente sepa que existen
\RequirePackage{mathtools}  % mates xerais
\RequirePackage{amssymb}    % simbolos adicionais
\RequirePackage{amsthm}     % definir teoremas
\RequirePackage{diffcoeff}  % derivadas
\RequirePackage{esint}      % integrais diferentes
\RequirePackage{polynomial} % polinomios simples
\RequirePackage{tensor}     % indices e eso
\RequirePackage{braket}     % notación bra-ket
\RequirePackage{mathrsfs}   % letras reviradas \mathcal

% Esto é para eliminar un waring do paquete mathrsfs
% Orixe da solucion: https://tex.stackexchange.com/a/10701
% Referencia de \DeclareFontShape: https://web.mit.edu/newtex/doc/latex/base/fntguide/node22.html
\DeclareFontFamily{U}{rsfs}{\skewchar\font127 }
\DeclareFontShape{U}{rsfs}{m}{n}{%
    <-6> rsfs5
    <6-8> rsfs7
    <8-> rsfs10
}{}

% Tipografía de matemáticas. Necesitamos o paquete unicode-math
% IMPORTANTE: PRIMEIRO hai que cargar os paquetes de matemáticas e DESPOIS,
% unicode-math.
\RequirePackage[
    warnings-off={            % Esto só é pa desactivar uns avisos inútiles
        mathtools-colon,      %
        mathtools-overbracket %
    }                         %
]{unicode-math}

% Seleccionamos a propia tipografía
\setmathfont[
    Path      = ./fontes/LatinModern/,
    Extension = .otf,
]{latinmodern-math}

% Esto pa cambiar facilmente o estilo das 'captions' das cousas. Queremos que
% este justificada. singlelinecheck=false: evita que LaTeX centre pies de una
% sola línea (por defecto, lo hace aunque hayas pedido justificación).
\RequirePackage{caption}
\captionsetup{
    font            = footnotesize,
    justification   = justified,
    skip            = 6pt,
    singlelinecheck = false,
    labelfont       = {bf,sf,small},
    textfont        = {sf,small}
}

% Uns paquetes varios que non organicei
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage[scr]{rsfso}
\RequirePackage{adjustbox}
\RequirePackage{ragged2e} % Para justificar minipages
\RequirePackage{float}
\RequirePackage[small, unboxed]{cwpuzzle}
\RequirePackage{soul}

% Encabezados e pe de paxina, pa facilitar a creacion cun par de comandos
\RequirePackage{fancyhdr}
\setlength\headheight{20pt}

% O comando pa xerar o logo onde sexa, pode usarse con \fontsize
\newcommand{\LogoM}{
    \begin{tikzpicture}
        \node[
            shape     = circle,
            draw      = Resalte,        % Hai que definir estas cores en cada
            fill      = Resalte,        % revista
            text      = TextoEnResalte, %
            inner sep = 0pt,
            radius    = 0.5,
            inner sep = 1pt,
        ]
        at (00.05,-0.05)
        {$\overrightarrow{m}$};
    \end{tikzpicture}
}

% Esto e pa poñer o logo do momento no encabezado
\renewcommand\headrule{
    \vspace{-6pt}
    \hrulefill
    \raisebox{-15pt}
    {\huge\quad\LogoM\quad}
    \hrulefill
}

% ESTILOS DE PÁXINA E ÍNDICES.
% Estos estilos cambian os encabezados das páxinas e engaden
% os correspondetes indices dependendo dos artigos que haxa.

\NewDocumentCommand\definirEstiloEIndice{ m m }{%
    \fancypagestyle{#1}{%
        \fancyhf{} % Limpa as cabeceiras e pés de páxina
        \renewcommand{\headrulewidth}{0.4pt} % Engade liña no cabeceiro
        \fancyhead[LE,RO]{\MakeUppercase{#2}} % Nome da sección
        \fancyfoot[LE,RO]{\thepage} % Páxina
        \fancyfoot[LO,RE]{\imprimeTitulo} % Título
        \renewcommand{\footrulewidth}{0pt} % Sen liña no pé de páxina
        \headsep = 1cm % Espazo no cabeceiro
    }
    \expandafter\newcommand\csname Indice#1\endcsname{%
        \begin{tikzpicture}%
            \node (c) at (5.5,0) {\textbf{#2}};%
            \draw[thick] (0,0) -- ([xshift=-5pt]c.west);%
            \draw[thick] ([xshift=+5pt]c.east) -- (11,0);%
        \end{tikzpicture}%
    }
}

% SECCIÓNS DA REVISTA.
% Engadir aquí novas seccións !!

\definirEstiloEIndice{divulgacion}{Divulgación}
\definirEstiloEIndice{historia}{Historia}
\definirEstiloEIndice{actualidadeFacultade}{Actualidade da Facultade}
\definirEstiloEIndice{actualidadeCientifica}{Actualidade Científica}
\definirEstiloEIndice{filosofia}{Filosofía}
\definirEstiloEIndice{profesorado}{Recuncho do Profesorado}
\definirEstiloEIndice{entrevistas}{Entrevistas}
\definirEstiloEIndice{programacion}{Programación}
\definirEstiloEIndice{pasatempos}{Pasatempos}
\definirEstiloEIndice{anuncios}{Anuncios}

\newcommand{\SeccionTOC}[1]{%
    \csname Indice#1\endcsname
}

% Este macro pode invocarse con ou sen asterisco, ousexa \EngadeAoTOC*
% Co asterisco, aparte do titulo, tamén engade unha seccion ao TOC
%
% Argumentos:
%
% #1 (asterisco) crear unha seccion no TOC ou no
% #2 -> Nome do artigo
% #3 -> Nome do autor
% #4 -> Estilo da páxina (TIPO de artigo)
\NewDocumentCommand\EngadeAoTOC{ s m m m }{%
    % Primeiro, engadimos seccion ao TOC ou no? Depende de se o macro
    % se usou cun asterisco ou no
    \IfBooleanTF{#1}%
    {% No caso de usar asterisco, angadir unha seccion ao TOC
        \addtocontents{toc}{%
            \begingroup%
                \setlength{\parindent}{0pt}%
                \protect\SeccionTOC{#4}\protect\par%
            \endgroup%
        }%
    }%
    {% No caso de non telo, non engadir seccion ao toc
        \addtocontents{toc}{%
            \begingroup%
                \setlength{\parindent}{0pt}%
                \vspace{-5mm}%
            \endgroup%
        }
    }

    % Engadimos o nome do artigo
    \addcontentsline{toc}{section}{\protect{#2}}

    % Engadimos o nome do autor. Pa que quede ben metese nunha minipage
    \addtocontents{toc}{%
        % Definindo largura fixa para a minipage de texto com alinhamento
        % superior
        \begin{minipage}[t][.3cm][t]{9cm}
            % Ajuste fino para alinhar o resumo do texto com o topo da figura
            % (altere de acordo com o topo da figura)
            \protect{\small #3}%
            % Ajuste fino para alinhar o nome do autor do texto com el resumen
            \protect\vfill%
            % Ajuste fino para espaçamento entre figura e resumo e próximo
            % artigo do sumário
            \protect\vspace{1cm}%
            \protect%
        \end{minipage}
        \vfill
    }
    \addtocontents{toc}{\vspace{2em}}
}

% Este é un pequeno macro que fai uso da nova funcionalidade de Experimental
% LaTeX 3 (expl3 para os amigos). Comproba se un argumento está BALEIRO, ousexa
% '\exemplo{}' ten un argumento baleiro.
\ExplSyntaxOn
    \cs_set_eq:NN  \EstaBaleiro  \tl_if_blank:nTF
\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% __  _____ _ _         _            %
% \ \|_   _(_) |_ _   _| | __ _ _ __ %
%  \ \ | | | | __| | | | |/ _` | '__|%
%   \ \| | | | |_| |_| | | (_| | |   %
%    \_\_| |_|\__|\__,_|_|\__,_|_|   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Agora un dos comandos máis importantes. Debe usarse ao comezo de cada artigo.
%
% #1: (asterisco *). Poñelo engade seccion ao Indice
% #2: ESTILO DA PÁXINA cambia os encabezados: A escoller entre:
%         divulgacion,historia,actualidadeFacultade,actualidadeCientifica,
%         filosofia,entrevistas,programacion,pasatempos,anuncios,profesorado
% #3: TITULO do artigo
% #4: AUTORIA
% #5: SUBTITULO
%
% Exemplo:
%
% \Titular*       -> asterisco, polo que no Indice aparece seccion
% {divulgacion}   -> OBLIGATORIO especificar o ESTILO
% {titulo}        -> OBLIGATORIO especificar o TITULO
% {noether}       -> OPCIONAL especificar a AUTORÍA
% {subtitulo}     -> OPCIONAL especificar o SUBTITULO
%
% IMPORTANTE: Se non se quere especificar algo (autor ou subtitulo), hai que
% poñerlle os parenteses igualmente, pero baleiros, é dicir:
%
% \Titular*
% {divulgacion}
% {titulo}
% {}              -> sen autoría, debe ir cos parenteses baleiros
% {}              -> sen subtitulo, debe ir cos parenteses baleiros
%
\NewDocumentCommand\Titular{ s m m m m }{%
    % Primeiro, engadimos unha sección 'baleira'
    \phantomsection%
    % Mostramos o propio titular, como sempre. Todo dentro dun `center`
    \begin{center}
        % Esto es para que cuando el texto ocupe más de dos líneas, se amplie
        \vspace*{-5mm}
        % TITULO
        \begingroup
            \setstretch{2}\noindent{\color{Resalte}\Huge \textbf{#3}} \\
        \endgroup
        % AUTORÍA
        \EstaBaleiro{#4}% comprobamos se a autoría está baleira
            {\vspace*{3mm}}%                             --> se NON hai autor
            {\vspace*{3mm}{\Large #4} \\ \vspace*{3mm}}% --> se SI hai autor
        % SUBTITULO
        \EstaBaleiro{#5}% comprobamos se o subtitulo está baleiro
            {\vspace*{-3mm}}%               --> se NON hai subtitulo
            {\textit{#5} \vspace*{-3mm}}%   --> se SI hai subtitulo
        %
    \end{center}

    % Comprobamos se o comando \Titular se usou con un asterisco ou no
    \IfBooleanTF{#1}% recordade que #1 é o asterisco do comando
        {% no caso de ter o asterisco, engadimos unha seccion ao TOC.
            \EngadeAoTOC*{#3}{#4}{#2}% (#3)TITULO, (#4)AUTOR, (#2)ESTILO
        }%
        {% se non temos asterisco, non engadimos seccion
            \EngadeAoTOC{#3}{#4}{#2}%
        }
    % Aplicamos o estilo de páxina
    \pagestyle{#2}%
    % Aprobeito pa meter esto aquí. Resetea números nas figuras
    \setcounter{figure}{0}
}

% Orixinalmente tamén cambiábamos a numeración das ecuacións dentro de
% 'Titular' con '\setcounter{equation}{0}, pero dábanos warnings do tipo:
% ignoring duplicate destination with the name 'equation.1'
% asique pasamos a facelo deste modo
\numberwithin{equation}{section}

% Tipografia preciosa. Xoga cos espaciados moi ben para xustificar o texto.
\RequirePackage{microtype}

% Paquete para links
\RequirePackage{hyperref}
\hypersetup{
    hidelinks,
    colorlinks,  % Colorear os links
    linkcolor = {Resalte!55!black}, % links internos
    citecolor = {green!45!black},   % citas bibliográficas
    urlcolor  = {blue!80!black}     % URLs e links externos
}

% :FACER: refacer esto con \NewDocumentCommand. Como debería cambiar os \def?
%% VARIABLES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estas son varias 'variables', mellor dito, macros onde gardamos algúns
% valores para logo mostralos onde queiramos. Uso '\makeatletter' para que o
% símbolo '@' (que se chama, 'at'), sexa unha letra (de ahí o de 'make at
% letter'). Fago esto porque usando \def\... é a maneira máis simple que coñezo
% de definir macros coma estos, 'simples'
\makeatletter

% NUMERO
\def\Numero#1{\def\@Numero{#1}}
\newcommand{\imprimeNumero}{Núm.\@Numero}

% DATA
\def\Data#1{\def\@Data{#1}}
\newcommand{\imprimeData}{\@Data}

% :FACER: este texto pode non verse se a imaxe da portada ten cores moi claras
% Tal vez deberíamos cambiar de sitio dito texto? Ou cambiarlle a cor? Máis
% macros?
%
% O texto que aparece na imaxe da portada
\def\ComentarioImaxePortada#1{\def\@ComentarioImaxePortada{#1}}
\newcommand{\imprimeComentarioImaxePortada}{\@ComentarioImaxePortada}
\ComentarioImaxePortada{}

% TITULO REVISTA
\newcommand{\imprimeTitulo}{MOMENTUM}
\newcommand{\FormateaTitulo}[1]{%
    {\color{#1}$\overrightarrow{\text{\textbf{M}}}$}\textbf{OMENTUM}%
}

% RUTA PARA A IMAXE DA PORTADA
\def\ImaxePortada#1{\def\@ImaxePortada{#1}}
\newcommand{\imprimeImaxePortada}{\@ImaxePortada}

% PARTICIPANTES DO PROXECTO. Usase no índice, no lado dereito ca cor de resalte
\def\Participantes#1{\def\@Participantes{#1}}
\newcommand{\imprimeParticipantes}{\textcolor{TextoEnResalte}{\@Participantes}}
\Participantes{}

% LINK para o REPOSITORIO
\def\LinkRepositorio#1{\def\@LinkRepositorio{#1}}
\newcommand{\imprimeLinkRepositorio}{\@LinkRepositorio}
\LinkRepositorio{DAF-USC/revista}

% CORREO
\def\Correo#1{\def\@Correo{#1}}
\newcommand{\imprimeCorreo}{\@Correo}
\Correo{revistafisicausc@gmail.com}

% Texto de DESPEDIDA, na contraportada. :FACER: fedellar mais con estos macros?
\def\Despedida#1{\def\@Despedida{#1}}
\newcommand{\imprimeDespedida}{%
    \begin{center}%
        \Huge Un Momentum!\par%
    \end{center}%
    \vspace{1.1\baselineskip}
    \@Despedida%
}%
\Despedida{}

% AGRADECEMENTOS, na contraportada
\def\Agradecementos#1{\def\@Agradecementos{#1}}
\newcommand{\imprimeAgradecementos}{%
    \begin{center}%
        \Large Agradecementos:\par%
    \end{center}%
    \@Agradecementos%
}
\Agradecementos{}

% Link para o DRIVE
\def\EdicionsAnteriores#1{\def\@EdicionsAnteriores{#1}}
\newcommand{\imprimeEdicionsAnteriores}{\@EdicionsAnteriores}
\EdicionsAnteriores{https://www.usc.gal/gl/centro/facultade-fisica/revista-estudantil-momentum}

% Link para o grupo de WHATSAPP
\def\WhatsApp#1{\def\@WhatsApp{#1}}
\newcommand{\imprimeWhatsApp}{\@WhatsApp}
\WhatsApp{https://chat.whatsapp.com/E900g1Bq7QT5ZKeuiIpxTk}

\makeatother

% CORES de resalte.
%
% As cores defínense usando formato HTML, e.g. algo como ff0000 (vermello puro)
%
% Técnicamente, non fai falta definir estos comandos, pero así podemos escribir
% '\CorResalte{ff0000}' en vez de '\definecolor{Resalte}{HTML}{ff0000}', o cal
% é algo máis limpo. OLLO, hai que meter o de \hypersetup aquí para que as
% cores dos links cambien en cada revista: na clase, definimos as cores (nunhas
% liñas máis adiante), e se non metesemos o hypersetup no macro este, na
% revista non poderíamos cambiar as cores dos links.
\NewDocumentCommand\CorResalte{ m }{%
    \definecolor{Resalte}{HTML}{#1}%
    \hypersetup{linkcolor = {Resalte!55!black}}%
}%

\NewDocumentCommand\CorTextoEnResalte{ m }{
    \definecolor{TextoEnResalte}{HTML}{#1}
}

% Inicializo as cores agora. Nos artigos hai que usar \CorResalte{aabb00}, etc.
\definecolor{Resalte}{HTML}{ff0000}
\definecolor{TextoEnResalte}{HTML}{ffffff}

% Un macro para os pasatempos, para facilitarnos algo a vida
%
% #1 (entre corchetes [...]) texto opcional á dereita
% #2 TITULO. Primeiro argumento entre parenteses recurvos {...}
% #3 AUTOR. Segundo argumento entre parenteses recurvos {...}
%
% Exemplos:
% \Pasatempo[fontes: wikipedia]{Encrucillado}{Manolito}
% \Pasatempo{Integral dificil}{Alvaro}
%
% :FACER: non me convence meter todo dentro do argumendo de \section, pero
% funciona... asique todo ben
\NewDocumentCommand\Pasatempo{ o m m }{%
    \section*{%
        \textcolor{Resalte}{#2 }% AUTOR
        {\normalfont \itshape #3}% TITULO DO PASATEMPO
        \IfNoValueTF{#1}%
            {}%
            {\hfill {\small #1}}% TEXTO opcional
    }%
}


% CITAS TEXTUAIS
%
% Citas que quedan como un bloque no medio do texto
%
% #1: Contido da cita
% #2: Autoría
\NewDocumentCommand\Cita{ m m }{%
    \begin{quotation}
        {\itshape #1}\\
        \vspace{1ex}
        \hfill — #2
    \end{quotation}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Finalmente, os macros para xerar a portada, o indice e a contraportada

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ____   ___  ____ _____  _    ____    _     %
% |  _ \ / _ \|  _ \_   _|/ \  |  _ \  / \    %
% | |_) | | | | |_) || | / _ \ | | | |/ _ \   %
% |  __/| |_| |  _ < | |/ ___ \| |_| / ___ \  %
% |_|    \___/|_| \_\|_/_/   \_\____/_/   \_\ %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NewDocumentCommand\Portada{}{%
    % Esto de 'pageanchor' é para que non nos de un aviso do tipo
    % ignoring duplicate destination with the same name 'page.1' etc.
    \hypersetup{pageanchor=false}
    \pagenumbering{gobble}
    \thispagestyle{empty}

    % Creamos unha xeometria nova
    \newgeometry{
        top    = 2mm,  % marxe superior
        left   = 5mm,  % marxe esquerdo
        right  = 5mm,  % marxe dereito
        bottom = 5mm,  % marxe inferior
        nohead = true, % desactivar o encabezado
        nofoot = true, % desactivar o pe de paxina
    }

    \begingroup % un grupo para que o de parindent non afecte ao resto da revista
    \setlength\parindent{0pt}

    % TITULO %
    \vspace*{3mm}
    {%
        \centering%
        \fontsize{70pt}{0pt}\selectfont%
        \FormateaTitulo{Resalte}\par%
    }%
    \vspace*{6mm}
    {%
        \centering%
        \fontsize{18pt}{0pt}\selectfont%
        \textsf{A revista estudantil da Facultade de Física da USC}\par%
    }%
    \vspace*{7mm}

    % NUMERO DA REVISTA E DATA
    {
        \setstretch{0}
        \begin{tcolorbox}[
                colback  = Resalte,
                colframe = black,
                boxrule  = 2pt,
                boxsep   = 6pt,
                sharp corners,
            ]%
            {
                \fontsize{20pt}{0pt}\selectfont%
                \color{TextoEnResalte}\texttt{\imprimeNumero\hfill\imprimeData}\par%
            }%
        \end{tcolorbox}
    }

    % IMAXE DE CADA REVISTA
    % A imaxe da portada debe ser CADRADA EXACTAMENTE
    {
        \vspace*{-4pt} % este espazo negativo e pa que encaixe o da
        % data ca imaxe da portada
        \nointerlineskip
        \begin{picture}(\textwidth,\textwidth)%
            \put(0,0){%
                \setlength{\fboxsep}{0pt}%
                \setlength{\fboxrule}{2pt}% grosor do borde
                \fbox{%
                    % Hai que poñer \textwidth-4p porque \fbox crea unha liña
                    % cun certo grosor, a cal move a imaxe un pouco. Cada borde
                    % da \fbox ten 2pt, e a imaxe movese polo tanto o doble
                    % (4pt) para arriba e abaixo. Así encaixa perfecto
                    \includegraphics[width=\textwidth-4pt]{\imprimeImaxePortada}%
                }%
            }%
        \end{picture}
    }

    % IMAXES SUPERPOSTAS NA IMAXE DA PORTADA %
    \begin{tikzpicture}[remember picture, overlay]
        % Imaxe 1 (superposta)
        \node[
            anchor       = south west,
            xshift       = 0.9cm,
            yshift       = 3.7cm,
            fill         = gray,
            fill opacity = 0.75, % transparencia do fondo
            text opacity = 1,    % o texto sigue opaco
            inner sep    = 5pt   % separación interna do texto ao borde
        ]  at (current page.south west)
        {\normalsize \textcolor{white}{\imprimeComentarioImaxePortada} };

        % Imaxe 2 (superposta)
        \node[
            anchor = south west,
            xshift = 0.55cm,
            yshift = 0.5cm
        ] at (current page.south west)
        % :FACER: cambiamos moito de logos, igual metemos esto nun macro tamen?
        {\includegraphics[width=12cm]{logos/vicerreitoria-branco-negro.pdf}};
    \end{tikzpicture}
    \endgroup% <-- este cerra o grupo que contén o de \setlenght\parindent{0pt}

    % volvemos a cargar a xeometria que tiñamos no preambulo
    \restoregeometry
    \hypersetup{pageanchor=true}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ___ _   _ ____ ___ ____ _____ %
% |_ _| \ | |  _ \_ _/ ___| ____|%
%  | ||  \| | | | | | |   |  _|  %
%  | || |\  | |_| | | |___| |___ %
% |___|_| \_|____/___\____|_____|%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NewDocumentCommand\Indice{}{%
    \begingroup % un grupo para que o de parindent non afecte ao resto da revista
    \setlength\parindent{0pt}
    % Color del resalte trasparentado a la derecha del índice
    \begin{tikzpicture}[remember picture, overlay]
        \draw[
            line width = 0.73\textwidth,
            color      = Resalte!65!white
        ] ($(current page.north east) - (0,0)$) -- ($(current page.south east) - (0,0)$);
    \end{tikzpicture}
    % (non xoguedes a poñer liñas en blanco entre as tikzpictures, vai ir mal)
    % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Columna de la izqueirda, está el índice y el Sobre Momentum.
    % Para colocar ben
    % as as cousas hai que usar moitos 'minipage'.
    \begin{minipage}[t]{0.72\textwidth}%
        \vspace{-0.3cm}%
        \begin{minipage}[t]{\hsize}%
            \makebox[0pt][l]{%
                % ============ TOC ==============================================
                \begin{adjustbox}{valign=t,minipage={0.9\textwidth},margin={0pt,0pt}}
                    {
                        \section*{\Huge \textbf{Índice}}
                        \begingroup%
                            % Esto e para que non salte o Indice default, e o
                            % poidamos poñer nos
                            \let\contentsname\relax%
                            \tableofcontents% <--- o 'TOC' CARGASE AQUí
                        \endgroup%
                    }%
                \end{adjustbox}%
            }%
            \vfill
        \end{minipage}
    \end{minipage}
    \hfill
    % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LADO DEREITO COS PARTICIPANTES, VARIOS LINKS, DATA, etc, resaltado cunha cor
    \begin{minipage}[t]{0.28\textwidth}
        \vspace{-0.3cm}
        \hspace{-0.7cm}
        % Data e Número da revista
        \begin{center}
            \textcolor{TextoEnResalte}{\Large
                \textbf{\today }        \\[5mm]
                \textbf{\imprimeNumero} \\[1.5cm]
            }
        \end{center}
        % Aquí mostramos as persoas que participaron no proxecto.
        \imprimeParticipantes \\[1.5cm]
        % Links varios
        \begin{tikzpicture}[scale=1.5]
            \begingroup
                \hypersetup{urlcolor = TextoEnResalte}
                \node at (0,0) {
                    \FonteSimbolos\fontsize{20pt}{0pt}\selectfont
                    \textcolor{TextoEnResalte}{  }
                };
                \node[
                    anchor = west,
                    align  = left
                ] at (0.3,0)
                {
                    \footnotesize
                    \href{mailto:\imprimeCorreo}{\textbf{\imprimeCorreo}}
                };
                % Comentado mentras pensamos se metemos a revista na DAF ou no
                % \node at (0,-1)
                % {\FonteSimbolos\fontsize{20pt}{0pt}\selectfont
                % \textcolor{TextoEnResalte}{  }};
                % \node[
                %     anchor = west,
                %     align  = left
                % ] at (0.5,-1)
                % {
                %     \href{https://github.com/\imprimeLinkRepositorio}{\texttt{\imprimeLinkRepositorio}}
                % };
            \endgroup
        \end{tikzpicture} \\[1.7cm]
        % Logo da USC
        \begin{center}
            \includegraphics[width=0.8\linewidth]{logos/usc-negativo-escuro.pdf}
        \end{center}
    \end{minipage}
    \endgroup % <-- este cerra o grupo que contén o de \setlenght\parindent{0pt}
    \newpage
    \pagenumbering{arabic}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   ____ ___  _   _ _____ ____      _    ____   ___  ____ _____  _    ____    _    %
%  / ___/ _ \| \ | |_   _|  _ \    / \  |  _ \ / _ \|  _ \_   _|/ \  |  _ \  / \   %
% | |  | | | |  \| | | | | |_) |  / _ \ | |_) | | | | |_) || | / _ \ | | | |/ _ \  %
% | |__| |_| | |\  | | | |  _ <  / ___ \|  __/| |_| |  _ < | |/ ___ \| |_| / ___ \ %
%  \____\___/|_| \_| |_| |_| \_\/_/   \_\_|    \___/|_| \_\|_/_/   \_\____/_/   \_\%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NewDocumentCommand\Contraportada{}{%
    \newgeometry{
        top    = 5mm,  % marxe superior
        left   = 6mm,  % marxe esquerdo
        right  = 6mm,  % marxe dereito
        bottom = 8mm,  % marxe inferior
        nohead = true, % desactivar o encabezado
        nofoot = true, % desactivar o pe de paxina
    }

    % FONDO %
    \AddToShipoutPictureBG*{
        \put(0,-10){
            \parbox[b][1.2\paperheight]{\paperwidth}{
                \vfill
                \centering
                {\transparent{0.05}\includegraphics{logos/botafumeiro.png}}
                \vfill
            }
        }
    }
    % No caso de poñelo en todas as páxinas, pode pararse con
    % \ClearShipoutPicture
    {% Textos de despedida e agradecementos
        \vspace*{2.4cm}
        \begin{center}
            \begin{minipage}{0.68\linewidth}
                {\imprimeDespedida }
            \end{minipage} \\[1.5cm]

            \begin{minipage}{0.75\linewidth}
                \centering
                { \imprimeAgradecementos }
            \end{minipage}
        \end{center}
    }

    \thispagestyle{empty}
    \vspace*{3em}

    % Mostramos rama:hash usada para compilar esta revista
    \texttt{\directlua{gitInfo()}}

    \vfill
    \vspace{-1cm}
    \hrulefill

    % O do QR non sei por qué pero a veces colocase mal. Mirando con
    % lua-visual-debug pareceme que crea un numero incrible de boxes
    % que pode que
    % toleen a colocacion doutras cousas. Por agora furrula, polos pelos.
    \begin{minipage}[c][5cm]{5cm}
        \begin{center}
            Edicións anteriores: \\[2mm]
            \hypersetup{urlcolor=black}
            \qrset{height = 4cm}%
            % Que quede para a posteridade que rickrolleei a Celia e
            % a Sebas con este QR
            \qrcode{\imprimeEdicionsAnteriores}
        \end{center}
    \end{minipage}
    %
    \hfill % non se deben poñer liñas en branco arredor deste \hfill
    %
    \begin{minipage}[c][5cm]{4cm}
        \begin{center}
            Participa! (WhatsApp) \\[2mm]
            \hypersetup{urlcolor=black}
            \qrset{height = 4cm}%
            % Que quede para a posteridade que rickrolleei a Celia e
            % a Sebas con este QR
            \qrcode{\imprimeWhatsApp}
        \end{center}
    \end{minipage}
    %
    \hfill % deste tampouco
    %
    % Co logo da vicerreitoría
    \begin{minipage}[c][4cm]{9cm}
        \begin{center}
            Co financiamento de: \\[2mm]
            \begin{picture}(5cm,4cm)%
                \put(-60,30){\hbox{\includegraphics[width=11cm]{logos/vicerreitoria-branco-negro.pdf}}}
            \end{picture}
        \end{center}
    \end{minipage}
}

% DEFINICIÓNS
% Un par de definicións, cousas pequenas

% Acento gráfico ao lim
\renewcommand{\lim}{\mathop{\mathrm{lím}}\limits}

% Diferenciais inexactos
\newcommand*{\dbar}{\ensuremath{\text{\dj}}}
