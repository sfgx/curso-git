%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                    %%
%%                   e03practicos.cls                 %%
%%                                                    %%
%% ================================================== %%
%%                                                    %%
%% Version:     0.5 (2025/04/01)                      %%
%% Author:      Santiago Foguet                       %%
%% Basado en:   seu-ml-assing.cls de Jerry van        %%
%% License:     MIT LICENSE                           %%
%% Compiler:    latex, pdflatex, xelatex, lualatex    %%
%%                                                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sfcursos}[2025/11/17 Cursos Varios SF]

%% Class and Options
\def\@@ptsize{11pt} % default font size
\DeclareOption{9pt}{\def\@@ptsize{9pt}}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}

\def\@twoside{0} % default as oneside
\DeclareOption{oneside}{\def\@twoside{0}} % one-side document
\DeclareOption{twoside}{\def\@twoside{1}} % two-side document

\ProcessOptions\relax
\LoadClass[a4paper,onecolumn,\@@ptsize]{article}

%% Page Settings
\RequirePackage[inner=2.0cm,outer=2.0cm,top=1cm,bottom=3.5cm]{geometry}
\newcommand{\firstfooteradditionalheight}{2em} % add. height foot on 1st page
\hfuzz=.5em % disable false positive of overfull \hbox


%% Document Propertities
\global\let\@assignno\@empty
\global\let\@semester\@empty
%\global\let\@studentID\@empty
\global\let\@contacto\@empty
\global\let\@instructor\@empty
\global\let\@duedate\@empty
\global\let\@author\@empty
\global\let\@ciclo\@empty
\global\let\@mainproblem\@empty
\newcommand{\assignno}[1]{\gdef\@assignno{#1}} % Assignment Number
\newcommand{\semester}[1]{\gdef\@semester{#1}} % Semester
%\newcommand{\studentID}[1]{\gdef\@studentID{#1}} % Student ID
\newcommand{\instructor}[1]{\gdef\@instructor{#1}} % Instructor
\newcommand{\duedate}[1]{\gdef\@duedate{#1}} % Due Date of the Assignment
\newcommand{\mainproblem}[1]{\gdef\@mainproblem{#1}} % The main problem of the assignment
\newcommand{\contacto}[1]{\gdef\@contacto{#1}} % Información de contacto
\newcommand{\ciclo}[1]{\gdef\@ciclo{#1}} % Año lectivo

%% Carga de paquetes
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage[fixed]{fontawesome6}
\RequirePackage{libertine}
\RequirePackage{amssymb}
\RequirePackage[hidelinks,colorlinks,linkcolor=gblue]{hyperref}
\RequirePackage{multicol}
\RequirePackage{enumitem}
%\RequirePackage{eucal,esint}

% Definición de colores
\definecolor{gblue}{RGB}{23,78,166}
\definecolor{gmblue}{RGB}{66,103,210}
\definecolor{glblue}{RGB}{210,227,252}
\definecolor{gred}{RGB}{165,14,14}
\definecolor{gmred}{RGB}{234,67,53}
\definecolor{glred}{RGB}{250,210,207}
\definecolor{gorange}{RGB}{227,116,0}
\definecolor{gmorange}{RGB}{251,188,4}
\definecolor{glorange}{RGB}{254,239,195}
\definecolor{ggreen}{RGB}{13,101,45}
\definecolor{gmgreen}{RGB}{52,168,83}
\definecolor{glgreen}{RGB}{206,234,214}
\definecolor{gblack}{RGB}{32,33,36}
\definecolor{gmblack}{RGB}{154,160,166}
\definecolor{glblack}{RGB}{241,243,244}
\definecolor{gpink}{RGB}{199, 21, 133}
\definecolor{gmpink}{RGB}{255, 105, 180}
\definecolor{glpink}{RGB}{255, 192, 203}
\definecolor{gteal}{RGB}{0,71,71}
\definecolor{gmteal}{RGB}{0,209,209}
\definecolor{glteal}{RGB}{184,255,255}
\definecolor{gpurple}{RGB}{128,0,128}
\definecolor{gmpurple}{RGB}{209,0,209}
\definecolor{glpurple}{RGB}{255,184,255}

%% Captions Settings
\RequirePackage[font=footnotesize,labelfont=bf]{caption}

%% TikZ Rule
\RequirePackage{tikz}
\usetikzlibrary{fadings, calc}
\newcommand{\tikzrule}[3][]{\tikz{\fill[#1] (0,0) rectangle (#2,#3);}}

%% Sections Settings
\RequirePackage[explicit]{titlesec}
\RequirePackage{suffix}
\pgfdeclarelayer{background}
\pgfsetlayers{background,main}

\RequirePackage[many]{tcolorbox}
\tcbuselibrary{listingsutf8}
\RequirePackage{varwidth}

\titleformat{\section}[block] % Use the 'block' shape
  {} % Spacing before the title (empty in this case, defined by tcolorbox options below)
  {} % The label (section number) is handled inside the tcolorbox
  {0em} % Horizontal separation between label and title
  {
    \vspace*{-1.5em}
    \begin{tcolorbox}[enhanced jigsaw, colframe=white, 
    interior style={left color=gblue, right color=glblue},
    coltext=white]
    {\Large\textbf\thesection. \textbf{#1}}
    \end{tcolorbox}
    \vspace{-2.5em}
  }

\tcbuselibrary{theorems}
\newtcbtheorem[number within = section]{tarea}{Tarea}{
    theorem style=plain,
    description delimiters none,
    terminator sign none,
    separator sign={\ $\blacktriangleright$\ },
    arc=3mm,
    boxrule=.5mm,
    colframe=gblue,
    colback=white,
    fonttitle=\sffamily\bfseries,
    coltitle=gblue,
    before lower={\textcolor{gblue}{\textsf{\textbf{Anotaciones:}}}\ },
}{}


%% Color Boxes

\newtcolorbox{informacion}[2][]{enhanced,
before skip=2mm,after skip=2mm,
colback=black!5,colframe=black!50,boxrule=0.2mm,
attach boxed title to top left={xshift=1cm,yshift*=1mm-\tcboxedtitleheight},
varwidth boxed title*=-3cm,
boxed title style={frame code={
\path[fill=tcbcolback!10!black]
([yshift=-1mm,xshift=-1mm]frame.north west)
arc[start angle=0,end angle=180,radius=1mm]
([yshift=-1mm,xshift=1mm]frame.north east)
arc[start angle=180,end angle=0,radius=1mm];
\path[left color=tcbcolback!80!black,right color=tcbcolback!80!black,
middle color=tcbcolback!95!black]
([xshift=-2mm]frame.north west) -- ([xshift=2mm]frame.north east)
[rounded corners=1mm]-- ([xshift=1mm,yshift=-1mm]frame.north east)
-- (frame.south east) -- (frame.south west)
-- ([xshift=-1mm,yshift=-1mm]frame.north west)
[sharp corners]-- cycle;
},interior engine=empty,
},
fonttitle=\bfseries,
title={#2},#1}

\newtcblisting{cmdshell}{colback=black!10,colupper=black, boxrule=0mm,
listing only,listing options={style=gitstyle,language=git},
every listing line={{\small\ttfamily \$ }}}


\newlist{cirlist}{itemize}{1}
\setlist[cirlist]{
    label = {\color{gblue}\faCircle[regular]}
}

\newlist{chklst}{itemize}{1}
\setlist[chklst]{
    label = {\large\faSquare[regular]},
}

%\usepackage{listingsutf8}
%% Definir comandos Git
\lstdefinelanguage{git}{%
    morekeywords = {git, pwd, mkdir, ls, clear, cd},%
    morekeywords = [2]{init, clone, add, mv, restore, rm, bisect,%
    diff, grep, log, show, status, backfill, branch, commit, merge,%
    rebase, reset, switch, tag, fetch, pull, push, config, checkout,%
    remote, version},%
    sensitive = true,%
    morecomment = [l]{\#},%
}

\lstdefinestyle{gitstyle}{%
    language = git,%
    basicstyle = \normalsize\ttfamily,%
    keywordstyle = \color{gblue},%
    keywordstyle = {[2]\color{gred}},%
    commentstyle = \color{ggreen},%
}


%% Header and Footer
\RequirePackage{fancyhdr}
\setlength{\headheight}{52pt}
\setlength{\marginparwidth}{2cm}
\pagestyle{fancy}
\if\@twoside0
    \lhead{
        \fontfamily{LinuxLibertineT-OsF}\selectfont
            \textsc{\titulologo (\@ciclo ) -- \@title~\@assignno}
    }
    \rhead{\thepage}
    \renewcommand\headrule{\vspace{-0.7em}\tikzrule[gblue, path fading=east]{.75\textwidth}{0.3mm}}
\else
    \fancyhf{}
    \renewcommand\headrule{%
        \ifodd\thepage
            \vspace{-0.7em}\tikzrule[gblue, path fading=east]{.5\textwidth}{0.3mm}
        \else
            \vspace{-0.7em}\hfill\tikzrule[NavyBlue, path fading=west]{.75\textwidth}{0.3mm}
        \fi
    }
    \fancyhead[LO]{
        \fontfamily{LinuxLibertineT-OsF}\selectfont
            \textsc{\titulologo (\@ciclo ) -- \@title~\@assignno}
        \renewcommand\headrule{\vspace{-0.7em}\tikzrule[gblue, path fading=east]{.75\textwidth}{0.3mm}}
    }
    \fancyhead[RE]{
        \fontfamily{LinuxLibertineT-OsF}\selectfont
        \textsc{\micrologo (\@ciclo ) -- \@title~\@assignno}
    }
    \fancyhead[LE,RO]{\thepage}
\fi
\cfoot{}
% header and footer style for the first page
\fancypagestyle{firstpage}{
    \renewcommand\headrule{}
    \lhead{}
    \rhead{}
    \cfoot{
        \fontfamily{LinuxLibertineT-OsF}\selectfont
        \vspace*{-\firstfooteradditionalheight}
        %\vspace{-0.05em}
        \tikzrule[ggreen, path fading=west]{.5\textwidth}{.15em}%
        \tikzrule[gblue, path fading=east]{.5\textwidth}{.15em}

        \footnotesize\centering
        \textit{Contacto: }~\@contacto
    }
}

%% Title Settings
\RequirePackage{tabularx}
\RequirePackage{afterpage}
%\newcommand{\pdftitleadditionalname}{Solution}
\makeatletter         
\renewcommand\maketitle{

    \thispagestyle{firstpage}
    \fontfamily{LinuxLibertineT-OsF}\selectfont % set font as Linux Libertine
    \enlargethispage{-\firstfooteradditionalheight} % make room for the footer
    \begin{minipage}{10.5cm}
        \centering
        {
            \fontsize{36}{48}\selectfont
            {\scshape \titulologo}
        }\\[.5em]
        {
            \textit{\faCalendarDays ~Fecha:~\@duedate{}}
        }
    \end{minipage}
    \begin{minipage}{5cm}
        \vspace{0.7em}
        \centering
        {
            \large
            \fontfamily{LinuxBiolinumT-OsF}\selectfont
            \textcolor{gblue}{\@ciclo ~ -- ~ \@semester}
            \vspace{2mm}
        }
        \LARGE\@title~{\fontfamily{bch}\selectfont\@assignno}
    \end{minipage}
    \\[.3em]
    \tikzrule[ggreen]{\textwidth}{.3em}

    \ifx\@mainproblem\@empty
        \vspace{2mm}
    \else
        \begin{center}
            \vspace{-0.25\baselineskip}\color{black}
            \huge\@mainproblem
        \end{center}
        \vspace{5mm}
    \fi

    \fontfamily{cmr}\selectfont % Computer Modern

    % Set up document meta data
    % Note that it should be placed here because
    % by now \@author and \@title have been set.

}
\makeatother
