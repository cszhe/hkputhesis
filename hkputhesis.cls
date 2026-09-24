%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The Hong Kong Polytechnic University Thesis Class
%%  Author: Zongjian He
%%  Email:  zongjian.he@connect.polyu.hk
%%  Version History:
%%          v1.0 Sep. 2014
%%          Initial Release
%%          v2.0 Sep. 2026
%%          Updated to the "Regulations on the Format and
%%          Presentation of Thesis for RPg Degrees" in the PolyU
%%          Research Postgraduate Student Handbook (2025/26):
%%            - electronic (PDF) submission, one-sided by default
%%            - new cover page (capitalised title and name,
%%              MPhil/PhD, year of award, initial submission note)
%%            - Dual PhD partner university and transfer-in PhD
%%              research attribution statement
%%            - 1.5 or double line spacing
%%            - optional lists of figures/tables/abbreviations
%%  Acknowledgment: This template is based on the Stanford
%%                  University Ph.D. thesis style
%%                  by Joseph Pallas (1988).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\fileversion{2.0}
\def\filedate{2026/09/24}
\def\docdate{2026/09/24}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{hkputhesis}[\filedate\space v\fileversion\space
    The Hong Kong Polytechnic University thesis class]

\newif\ifdedic@tion         \dedic@tionfalse
\newif\ifpoly@initial       \poly@initialfalse
\newif\ifpoly@print         \poly@printfalse
\newif\ifpoly@mphil         \poly@mphilfalse
\newif\ifpoly@double        \poly@doublefalse
\newif\ifpoly@lof           \poly@loftrue
\newif\ifpoly@lot           \poly@lottrue
\newif\ifpoly@attrib        \poly@attribfalse

\newcommand{\poly@ptsize}{12pt}
\DeclareOption{10pt}{\renewcommand{\poly@ptsize}{10pt}}
\DeclareOption{11pt}{\renewcommand{\poly@ptsize}{11pt}}
\DeclareOption{12pt}{} % \poly@ptsize already set to 12pt
% Initial submission for examination (adds a note on the cover page).
% "tempbind" is kept for compatibility with v1.0.
\DeclareOption{initial}{\poly@initialtrue}
\DeclareOption{tempbind}{\poly@initialtrue}
% Degree
\DeclareOption{phd}{\poly@mphilfalse}
\DeclareOption{mphil}{\poly@mphiltrue}
% Line spacing: the regulations require double or one-and-a-half
\DeclareOption{onehalfspace}{\poly@doublefalse}
\DeclareOption{doublespace}{\poly@doubletrue}
% Two-sided layout with a binding margin, for a printed copy.
% Theses are now submitted electronically, so this is off by default.
\DeclareOption{print}{\poly@printtrue}
% The lists of figures, tables and abbreviations are all optional
\DeclareOption{nolof}{\poly@loffalse}
\DeclareOption{nolot}{\poly@lotfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions\relax

\ifpoly@print
    \LoadClass[twoside,a4paper,\poly@ptsize]{report}
\else
    \LoadClass[oneside,a4paper,\poly@ptsize]{report}
\fi

% A4 paper. Printed copies keep the old 1.5" binding edge.
\RequirePackage[a4paper]{geometry}
\ifpoly@print
    \geometry{inner=1.5in, outer=1in, top=1.2in, bottom=1.2in,
              headheight=15pt, headsep=0.3in, footskip=0.6in}
\else
    \geometry{hmargin=1.1in, top=1.2in, bottom=1.2in,
              headheight=15pt, headsep=0.3in, footskip=0.6in}
\fi

% Use one-and-a-half (default) or double line spacing
\RequirePackage{setspace}
\ifpoly@double
    \doublespacing
\else
    \onehalfspacing
\fi
% Use 0.6 em the paragraph skip
\setlength{\parskip}{0.6em}
% no indent. If you wish all indent, replace with the second line
\setlength\parindent{0pt}
%\usepackage{indentfirst}

% \author, \title are defined in report; here are the rest of the
% front matter defining macros
\def\university#1{\gdef\@university{#1}}
\def\dept#1{\gdef\@dept{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\superviser#1{\gdef\@supervisor{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\awardyear#1{\gdef\@awardyear{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\degreeabbr#1{\gdef\@degreeabbr{#1}}
% Dual PhD only
\def\partneruniversity#1{\gdef\@partneruniversity{#1}}
\def\partnerdept#1{\gdef\@partnerdept{#1}}
% Transfer-in PhD only:
% \attribution{chapters done at PolyU}{chief supervisor}{previous university}
\def\attribution#1#2#3{\poly@attribtrue
    \gdef\@attribchapters{#1}%
    \gdef\@attribsupervisor{#2}%
    \gdef\@attribprevuniv{#3}}

\def\@title{}
\def\@author{}
\def\@university{The Hong Kong Polytechnic University}
\ifpoly@mphil
    \def\@degree{Master of Philosophy}
    \def\@degreeabbr{MPhil}
\else
    \def\@degree{Doctor of Philosophy}
    \def\@degreeabbr{PhD}
\fi
\def\@dept{Department of Computing}
\def\@supervisor{}
\def\@partneruniversity{}
\def\@partnerdept{}
% Month and year of the initial submission
\def\@submitdate{\ifcase\the\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\the\year}
\edef\@awardyear{\number\year}

\def\dedicate#1{\dedic@tiontrue\gdef\dedication@text{#1}}

% Define the page heading with {fancyhdr}
\RequirePackage{fancyhdr}
\newcommand{\properpagestyle}
{
    \pagestyle{fancy}
    \fancyhead{} % clear all header fields
    \ifpoly@print
        \fancyhead[LE]{\nouppercase{\leftmark}}
        \fancyhead[RO]{\nouppercase{\rightmark}}
    \else
        \fancyhead[R]{\nouppercase{\rightmark}}
    \fi
    \fancyfoot{} % clear all footer fields
    \fancyfoot[C]{\thepage}
    \renewcommand{\headrulewidth}{0.4pt}
}

% Anchor for hyperref, a no-op if hyperref is not loaded
\AtBeginDocument{\providecommand\phantomsection{}}

% Cover page
\def\poly@coverpage{%
    \thispagestyle{empty}%
    \null\vskip0.5in
    \begin{center}
        {\hyphenpenalty=10000\Large\bfseries
         \MakeUppercase{\@title}\par}
        \vskip1in
        {\large \MakeUppercase{\@author}\par}
    \end{center}
    \vfill
    \begin{center}
        \large
        \@degreeabbr \\
        \@university \\
        \ifx\@partneruniversity\@empty\else
            {\normalsize This programme is jointly offered by
             \@university\ and \@partneruniversity\par}
        \fi
        \@awardyear
        \ifpoly@initial
            \\[0.5in]
            Initial Submission for Examination Purpose
        \fi
    \end{center}
    \vskip0.3in
    \newpage}

% Title page
\def\poly@titlepage{%
    \thispagestyle{empty}%
    \null
    \begin{center}
        \large
        \@university \\
        \@dept \\
        \ifx\@partneruniversity\@empty\else
            \vskip0.2in
            \@partneruniversity \\
            \ifx\@partnerdept\@empty\else \@partnerdept \\ \fi
        \fi
    \end{center}
    \vskip0.5in
    \begin{center}
        \hyphenpenalty=10000\Large \@title
    \end{center}
    \vfill
    \begin{center}
        \large
        \@author
    \end{center}
    \vfill
    \begin{center}
        A thesis submitted in partial fulfilment of the requirements for \\
        the degree of \@degree \\
        \@submitdate
    \end{center}
    \vskip0.1in
    \newpage}

% A signature block used by the declarations below
\def\poly@signature{%
    \begin{flushright}
    \begin{sloppypar}
        \underline{~~\quad\qquad\qquad\qquad\qquad\qquad~~} (Signed)\\
        \vskip0.5in
        \underline{\quad \@author \quad} (Name of student)\\
    \end{sloppypar}
    \end{flushright}}

\def\permissionpage{%
    {\newpage \parindent=0.75in \hyphenpenalty=10000 \thispagestyle{empty}
    \begin{quotation}
    \begin{center}
        \large CERTIFICATE OF ORIGINALITY
    \end{center}
    \bigskip
    \vskip0.5in

    \begin{sloppypar}
    \noindent I hereby declare that this thesis is my own work and that, to the best of my knowledge and belief, it reproduces no material previously published or written, nor material that has been accepted for the award of any other degree or diploma, except where due acknowledgement has been made in the text.
    \end{sloppypar}

    \poly@signature
    \end{quotation}}
    \vfill\newpage
    }

% Only applicable to and mandatory for transfer-in PhD students
\def\attributionpage{%
    {\newpage \parindent=0.75in \hyphenpenalty=10000 \thispagestyle{empty}
    \begin{quotation}
    \begin{center}
        \large STATEMENT OF RESEARCH ATTRIBUTION AND\\
        INTELLECTUAL PROPERTY CLEARANCE
    \end{center}
    \bigskip
    \vskip0.5in

    \begin{sloppypar}
    \noindent This thesis incorporates research conducted both prior to and during my registration as a PhD student at The Hong Kong Polytechnic University (PolyU).

    \noindent I hereby confirm that Chapters \@attribchapters\ of this thesis were completed at PolyU under the supervision of \@attribsupervisor. All other content of this thesis was completed at \@attribprevuniv, and I have obtained full and proper clearance for all intellectual property (IP) and research data derived from or employed in the research conducted at \@attribprevuniv.
    \end{sloppypar}

    \poly@signature
    \end{quotation}}
    \vfill\newpage
    }

% Include a file only if it exists, so the optional parts can be removed
\def\poly@includeifexists#1{\IfFileExists{#1.tex}{\include{#1}}{}}

\def\frontmatter{%
    \pagenumbering{roman}
    \pagestyle{empty}
    \poly@coverpage
    \poly@titlepage
    \permissionpage
    \ifpoly@attrib
        \attributionpage
    \fi
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
    % three included files; publication is optional
    \poly@includeifexists{abstract}
    \poly@includeifexists{publication}
    \poly@includeifexists{acknowledgement}
    }


\def\nonumchapter#1{%
    \chapter*{#1}
    \phantomsection
    \addcontentsline{toc}{chapter}{#1}}

\def\prefacesection#1{%
    \chapter*{#1}
    \phantomsection
    \addcontentsline{toc}{chapter}{#1}}

\newenvironment{dedication}
{\newpage\begin{center}\Large\em\null\vskip1in}%
    {\vfill\end{center}
}

\renewenvironment{abstract}
{\newpage \prefacesection{\abstractname}}{}

\newcommand{\pubname}{Publications Arising from the Thesis}
\newenvironment{publication}%
{\newpage \prefacesection{\pubname}}{}

\newcommand{\ackname}{Acknowledgements}
\newenvironment{acknowledgements}%
{\newpage \prefacesection{\ackname}}{}

\let\acknowledgments\acknowledgements
\let\endacknowledgments\endacknowledgements

\newcommand{\abbname}{List of Abbreviations}
\newenvironment{abbreviation}%
{\newpage \prefacesection{\abbname}}{}

\renewcommand{\contentsname}{Table of Contents}
\def\mainmatter{%
    \tableofcontents
    \ifpoly@lof
        \cleardoublepage
        \phantomsection
        \addcontentsline{toc}{chapter}{\listfigurename}
        \listoffigures
    \fi
    \ifpoly@lot
        \cleardoublepage
        \phantomsection
        \addcontentsline{toc}{chapter}{\listtablename}
        \listoftables
    \fi
    % abbreviation.tex is optional; delete it if you do not need the list
    \cleardoublepage
    \poly@includeifexists{abbreviation}

    % reset the page counter
    \cleardoublepage
    \pagenumbering{arabic}
    \properpagestyle
}

\def\beforepreface{\frontmatter}
\def\afterpreface{\mainmatter}

% Redefine \thebibliography to go to a new page and put an entry in the
% table of contents. Done at \begin{document} so that it also works
% with packages that redefine thebibliography, e.g., natbib.
\def\poly@thebibliography#1{%
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\bibname}
    \@ldthebibliography{#1}}
\AtBeginDocument{%
    \let\@ldthebibliography\thebibliography
    \let\thebibliography\poly@thebibliography}

\renewcommand\bibname{References}

% Start out normal
\properpagestyle
