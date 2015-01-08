%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The Hong Kong Polytechnic University Thesis Class
%%  Author: Zongjian He
%%  Email:  zongjian.he@connect.polyu.hk
%%  Version History:
%%          v1.0 Sep. 2014
%%          Initial Release
%%  Acknowledgment: This template is based on the Stanford 
%%                  University Ph.D. thesis style 
%%                  by Joseph Pallas (1988).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\fileversion{1.0}
\def\filedate{2014/09/15}
\def\docdate{2014/09/15}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{hkputhesis}

\newif\ifdedic@tion         \dedic@tionfalse
\newif\if@tempbind          \@tempbindfalse

\newcommand{\poly@ptsize}{12pt}
\DeclareOption{10pt}{\renewcommand{\poly@ptsize}{10pt}}
\DeclareOption{11pt}{\renewcommand{\poly@ptsize}{11pt}}
\DeclareOption{12pt}{} % \poly@ptsize already set to 12pt
\DeclareOption{tempbind}{\@tempbindtrue} % \poly@ptsize already set to 12pt

\ProcessOptions

\LoadClass[twoside,a4paper,\poly@ptsize]{report}

% We need 1" margins except on the binding edge, where it is 1 1/2"
\oddsidemargin  0.5in
\evensidemargin 0in
\marginparwidth 38pt
\marginparsep   10pt
\topmargin      0pt 
\headsep        0.3in
\footskip       0.6in
\textheight     8.6in 
\textwidth      6in
\headheight     14.5pt

% Use 1.5 times the normal baseline-to-baseline skip
\renewcommand{\baselinestretch}{1.5}
% Use 0.6 em the paragraph skip
\setlength{\parskip}{0.6em}
% no indent. If you wish all indent, replace with the second line
\setlength\parindent{0pt}
%\usepackage{indentfirst}

% \author, \title are defined in book; here are the rest of the
% front matter defining macros
\def\university#1{\gdef\@university{#1}}
\def\dept#1{\gdef\@dept{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\superviser#1{\gdef\@supervisor{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\@title{}
\def\@author{}
\def\@university{The Hong Kong Polytechnic University}
\def\@degree{Doctor of Philosophy}
\def\@dept{Department of Computing}
\def\@supervisor{}
\def\@submitdate{\ifcase\the\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\the\year}

\def\dedicate#1{\dedic@tiontrue\gdef\dedication@text{#1}}

% Define the page heading with {fancyhdr}
\usepackage{fancyhdr}
\newcommand{\properpagestyle}
{
    \pagestyle{fancy}
    \fancyhead{} % clear all header fields
    \fancyhead[LE]{\nouppercase{\leftmark}}
    \fancyhead[RO]{\nouppercase{\rightmark}}
    \fancyfoot{} % clear all footer fields
    \fancyfoot[C]{\thepage}
    \renewcommand{\headrulewidth}{0.4pt}
}


\def\titlepage{%
    \thispagestyle{empty}%
    \null
    \begin{center}
        \large % I don't like upper case, if you prefer, add \uppercase
        \expandafter{\@university} \\ 
        \expandafter{\@dept}\\
    \end{center}
    \vskip0.5in
    \begin{center}
        \hyphenpenalty=10000\Large\expandafter{\@title}
    \end{center}
    \vfill
    \begin{center}
        \large
        ~~\\
        \@author
    \end{center}
    \vfill
    \begin{center}
        A thesis submitted in partial fulfillment of the requirements for \\
        the degree of \@degree \\
        \@submitdate \\
        \if@tempbind
        ~~\\
        Temporary Binding for Examination Purposes \\
        ~~\\
        \fi
    \end{center}
    \vskip0.1in
    \newpage}

\def\permissionpage{%
    {\newpage \parindent=0.75in \hyphenpenalty=10000 \thispagestyle{empty}
    \begin{quotation}
    \begin{center}
        \large \uppercase\expandafter{CERTIFICATE OF ORIGINALITY}
    \end{center}
    \bigskip
    \vskip0.5in

    \begin{sloppypar}
    \noindent I hereby declare that this thesis is my own work and that, to the best of my knowledge and belief, it reproduces no material previously published or written, nor material that has been accepted for the award of any other degree or diploma, except where due acknowledgement has been made in the text. \\
    \end{sloppypar}

    \begin{flushright}
    \begin{sloppypar}
        \underline{~~\quad\qquad\qquad\qquad\qquad\qquad~~} (Signed)\\
        \vskip0.5in
        \underline{\quad \@author \quad} (Name of Student)\\
     \end{sloppypar}
     \end{flushright}
    \end{quotation}}
    \vfill\newpage
    }

\def\frontmatter{%
    \pagenumbering{roman}
    \pagestyle{empty}
    \titlepage
    \permissionpage
    \ifdedic@tion
        \newpage \thispagestyle{empty}
        \begin{center}
            \Large\em\null\vskip1in
            \dedication@text
            \vfill\newpage
        \end{center}
    \fi
    \cleardoublepage
    \setcounter{page}{1}
    \pagestyle{plain}
    % three included files
    \include{abstract}
    \include{publication}
    \include{acknowledgement}
    }


\def\nonumchapter#1{%
    \chapter*{#1}
    \addcontentsline{toc}{chapter}{#1}}

\def\prefacesection#1{%
    \chapter*{#1}
    \addcontentsline{toc}{chapter}{#1}}

\newenvironment{dedication}
{\newpage\begin{center}\Large\em\null\vskip1in}%
    {\vfill\end{center}
}

\renewenvironment{abstract}
{\newpage \prefacesection{\abstractname}}

\newcommand{\pubname}{Publications}
\newenvironment{publication}%
{\newpage \prefacesection{\pubname}}

\newcommand{\ackname}{Acknowledgements}
\newenvironment{acknowledgements}%
{\newpage \prefacesection{\ackname}}

\let\acknowledgments\acknowledgements
\let\endacknowledgments\endacknowledgements

\newcommand{\abbname}{List of Abbreviations}
\newenvironment{abbreviation}%
{\newpage \prefacesection{\abbname}}

\renewcommand{\contentsname}{Table of Contents}
\def\mainmatter{%
    \tableofcontents
    \newpage
    \addcontentsline{toc}{chapter}{List of Figures}
    \listoffigures
    \newpage
    \addcontentsline{toc}{chapter}{List of Tables}
    \listoftables
    \newpage
    % abbreviation, no good solution yet.
    % this implementation is very ugly. But have no better idea
    \include{abbreviation}

    % reset the page counter
    \pagenumbering{arabic}
    \properpagestyle
}

\def\beforepreface{\frontmatter}
\def\afterpreface{\mainmatter}

% Redefine \thebibliography to go to a new page and put an entry in the
% table of contents
\let\@ldthebibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
    \newpage
    \addcontentsline{toc}{chapter}{References}
    \@ldthebibliography{#1}
}

\renewcommand\bibname{References}

% Start out normal
\properpagestyle
