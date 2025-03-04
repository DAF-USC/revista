% Este é o formato da revista. Se buscas por qué tal cou cal cousa se ve como
% se ve, deberías mirar aquí. Intentei que esto estivese comentado na medida do
% posible, para facilitar o uso e modificación desto no futuro. Todo esto foi
% escrito de 0 por varios estudantes da facultade de física da universidade de
% Santiago de Compostela.  Se queres saber como contribuir, botalle un ollo ao
% arquivo README.md. Este é un proxecto libre, de uso e de responsabilidade. En
% ningún momento nos imos facer responsables se compilas esto e se che queima a
% CPU (dudo que pase).
%
% os comentarios con :FACER: están para usar con ferramentas como grep

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{revista}[2025/03/03 Clase para a revista de Fisica USC]

\LoadClass[11pt,a4paper,twocolumn,twoside]{extarticle}

% :FACER: buscar mellores tipografías
% Tipo de letra. Cortesía de LuaLaTeX. É extremadamente fácil:
\RequirePackage{fontspec}

% Tipografía monoespaciada
\setmonofont[
    Path      = ./fontes/LatinModern/,
    Extension = .otf,
]{lmmono10-regular}

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
% 'unicode-math' máis abaixo

% Usar galego (como debe ser)
\RequirePackage[galician]{babel}
% Usar babel pode fastidiar as citas con biblatex, asique hai que usar
% 'csquotes'
\RequirePackage{csquotes}

% :FACER: non temos un estilo concreto para a bibliografía
% Bibliografia
\RequirePackage[
    style  = alphabetic,
    natbib = true
]{biblatex}
\addbibresource{bibliografia.bib}

% Cores. En cada artigo usamos \definecolor{}{} pa coller o que queremos
\RequirePackage{xcolor}

% Graficos e tal. Se podes soñalo, podes facelo con TikZ
\RequirePackage{tikz}
 % para facer calculos cas posicions dos nodos, sumándolle cousas
\usetikzlibrary{calc}

% Para poder usar os marxes de referencia para colocar nodos. Usase na portada
% con 'text area'. NOTA: xa non fai falta, pero deixoo aquí como informacion
% \RequirePackage{tikzpagenodes}

% Pa ter fondos con \AddToShipoutPictureBG, usase na contraportada
\RequirePackage{eso-pic}

% Pa ter alphas (transparencia), por exemplo no fondo do botafumeiro
\RequirePackage{transparent}

% E pos codigos QR da contraportada, con \qrcode{}
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
    bottom      = 20mm,    % marxe inferior
    nomarginpar = true,    % desactivar marxe para notas
    % showframe,            % mostra estructura, moi util
}

% esto é pa mostrar as box, hyphenation points, glues, etc. Útil para depurar
% \RequirePackage{lua-visual-debug}

% :FACER: como usar duas columnas?
% Por agora usamos a opcion 'twocolumn' da clase 'article'. Eventualmente
% poderíamos pasar a usar os entornos de dúas columnas deste paquete.
% Véxase:
% https://www.overleaf.com/learn/latex/Multiple_columns
% https://tex.stackexchange.com/a/285444
\RequirePackage{multicol}

% Pa cambiar interlineados no momento usando \setstrech{}
\usepackage{setspace}

\setlength\parindent{5mm} % tamaño da indentación

% Para graficos
\RequirePackage{graphicx}
% \RequirePackage{svg}

% Mates e todo eso
\RequirePackage{mathtools}  % mates xerais
\RequirePackage{amssymb}    % simbolos adicionais
\RequirePackage{amsthm}     % definir teoremas
\RequirePackage{diffcoeff}  % derivadas
\RequirePackage{esint}      % integrais diferentes
\RequirePackage{mathrsfs}   % letras reviradas \mathcal
\RequirePackage{polynomial} % polinomios simples
\RequirePackage{tensor}     % indices e eso

\RequirePackage{svrsymbols} % simbolos variados
\RequirePackage{adforn}     %

% este debe cargarse logo dos paquetes matematicos
\RequirePackage{unicode-math}
\setmathfont[
    Path      = ./fontes/EulerMath/,
    Extension = .otf,
]{Euler-Math}

% :FACER: facer o subtitulo opcional (con \NewDocumentCommand e \IfNoValueTF)
% Un dos comandos máis importantes. Debe usarse ao comezo de cada artigo.
\newcommand{\titular}[4]{%
    % #1: nome do artigo,
    % #2: nome do autor,
    % #3: estilo da páxina, cambia os encabezados (e no futuro pode que mais
    %     cousas) A escoller entre:
    %     divulgacion,historia,actualidadeFacultade,actualidadeCientifica,
    %     filosofia,entrevistas,programacion,pasatempos,anuncios
    % #4: subtítulo do artigo
    \pagestyle{#3}
    \twocolumn[%
        \begin{@twocolumnfalse} % desactivamos temporalmente as duas columnas
            \begin{center}
                \vspace*{1em}
                \noindent
                {\color{Resalte}\Huge \textbf{#1}} \\
                \vspace{3mm}
                {\Large #2} \\
                \vspace{3mm}
                \textit{#4}
                \vspace{3mm}
            \end{center}
        \end{@twocolumnfalse}
    ]
    % aprobeito pa meter esto aquí. Resetea números nas ecuacións e figuras
    \setcounter{equation}{0}
    \setcounter{figure}{0}
}

% Esto pa cambiar facilmente o estilo das 'captions' das cousas
\RequirePackage[justification=centering]{caption}
\captionsetup[figure]{ labelfont=bf }
\captionsetup[table]{ labelfont=bf }

% Uns paquetes varios que non organicei
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{comment}
\RequirePackage{lettrine}
\RequirePackage{ragged2e}
\RequirePackage[scr]{rsfso}

% Encabezados e pe de paxina
% Pa facilitar a creacion cun par de comandos
\RequirePackage{fancyhdr}

% ESTILOS DE PÁXINA.
% Estos estilos cambian os encabezados das páxinas dependendo dos artigos que
% haxa.

% O comando pa xerar o logo onde sexa, pode usarse con \fontsize
\newcommand{\LogoM}{
    \begin{tikzpicture}
        \node[
            shape     = circle,
            draw      = Resalte,
            fill      = Resalte,
            text      = TextoEnResalte,
            inner sep = 0pt,
            radius    = 0.5,
            inner sep = 1pt,
        ]
        at (0,0)
        {$\vec{m}$};
    \end{tikzpicture}
}

% esto e pa poñer o logo do momento no encabezado
\renewcommand\headrule{
    \vspace{-6pt}
    \hrulefill
    \raisebox{-15pt}
    {\huge\quad\LogoM\quad}
    \hrulefill
}

% artigos de DIVULGACION
\fancypagestyle{divulgacion}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{DIVULGACIÓN}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% artigos de HISTORIA
\fancypagestyle{historia}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{HISTORIA}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% artigos de ACTUALIDADE DA FACULTADE
\fancypagestyle{actualidadeFacultade}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{ACTUALIDADE DA FACULTADE}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% artigos de ACTUALIDADE CIENTIFICA
\fancypagestyle{actualidadeCientifica}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{ACTUALIDADE CIENTÍFICA}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% artigos de FILOSOFIA
\fancypagestyle{filosofia}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{FILOSOFÍA}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% artigos de ENTREVISTAS
\fancypagestyle{entrevistas}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{ENTREVISTAS}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% artigos de PROGRAMACIÓN
\fancypagestyle{programacion}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{PROGRAMACIÓN}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% seccions de PASATEMPOS
\fancypagestyle{pasatempos}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{PASATEMPOS}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% seccions de ANUNCIOS
\fancypagestyle{anuncios}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{ANUNCIOS}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% Tipografia preciosa. Xoga cos espaciados moi ben para xustificar o texto.
\RequirePackage{microtype}

% Texto de proba
\RequirePackage{lipsum}

% :FACER: cores desto..?
\RequirePackage{hyperref}
\hypersetup{
    hidelinks,
    colorlinks,  % Colorear os links
    linkcolor = {red!55!black},   % links internos
    citecolor = {green!45!black}, % citas bibliográficas
    urlcolor  = {blue!80!black}   % URLs e links externos
}

%% MACROS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter

% NUMERO
\def\Numero#1{\def\@Numero{#1}}
\newcommand{\imprimeNumero}{Num.\@Numero}

% DATA
\def\Data#1{\def\@Data{#1}}
\newcommand{\imprimeData}{\@Data}

% Artigos
\def\PrimeiroArtigo#1{\def\@PrimeiroArtigo{#1}}
\newcommand{\imprimePrimeiroArtigo}{\@PrimeiroArtigo}
% \def\SegundoArtigo#1{\def\@SegundoArtigo{#1}}
% \newcommand{\imprimeSegundoArtigo}{\@SegundoArtigo}
% \def\TerceiroArtigo#1{\def\@TerceiroArtigo{#1}}
% \newcommand{\imprimeTerceiroArtigo}{\@TerceiroArtigo}

% TITULO REVISTA
\newcommand{\imprimeTitulo}{MOMENTUM}
\newcommand{\FormateaTitulo}[1]{%
    {\color{#1}$\overrightarrow{\text{\textbf{M}}}$}\textbf{OMENTUM}%
}

% RUTA PARA A IMAXE DA PORTADA
\def\ImaxePortada#1{\def\@ImaxePortada{#1}}
\newcommand{\imprimeImaxePortada}{\@ImaxePortada}

\makeatother
% Todos esos comandos teñen a info da revista. Gardase o valor nunha variable,
% e imprimese no PDF con outro comando diferente. Esto da bastante
% flexibilidade

% En cada revista hai que usar estos comandos ao comezo.
%
% \Numero{0}
% \Data{Enero do 1900}
% \PrimeiroArtigo{Entrevista a Marie Curie}
% \ImaxePortada{./cern.png}
% \definecolor{Resalte}{HTML}{ff0000}
% \definecolor{TextoEnResalte}{HTML}{000000}

% Os comandos anteriores definen as variables. Pa mostralas no pdf hai que usar:
%
% \imprimeTitulo          Titulo da revista
% \imprimeNumero          Numero da revista
% \imprimeData            Data de creacion
% \imprimeImaxePortada    ruta para a imaxe de portada, debe especificarse en cada revista
% \imprimePrimeiroArtigo  %
% \imprimePrimeiroArtigo  % Nomes dos artigos principais.
% \imprimeTerceiroArtigo  %
% \color{Resalte}         Para colorear cousas ca cor específica de cada revista

% :FACER: remirar estos conteos...
\pagenumbering{arabic}\setcounter{page}{1}
