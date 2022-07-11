\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aalesson}[01/07/2016, v1.0 Classe pour les cours de Alexis Achim inspirée du template PeerJ]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions*
\LoadClass{report}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[francais]{babel}
\RequirePackage{fourier}

\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{graphicx}

\RequirePackage[french]{minitoc}

\RequirePackage[left=5cm,%
                right=2cm,%
                top=2.25cm,%
                bottom=2.25cm,%
                headheight=12pt,%
                marginparwidth=124pt, %
                letterpaper]{geometry}%
                
\RequirePackage[hyperindex=true,%
            	linkcolor=color1,%
            	urlcolor=color1,%
            	filecolor=color1,%
            	citecolor=color1,%
            	colorlinks=true]{hyperref}
                
                
\RequirePackage{natbib}
\bibliographystyle{apalike-fr}

\newcommand*{\@logo}{}
\newcommand*{\@info}{}

\newcommand*{\logo}[1]{\renewcommand*{\@logo}{#1}}
\newcommand*{\info}[1]{\renewcommand*{\@info}{#1}}

\newcommand{\sub}[1]{$_{#1}$}

% ===================================
% Color panel set-up
% ===================================

\RequirePackage[table]{xcolor}

\definecolor{fontAbstract}{RGB}{255,255,255}
\definecolor{backgroundAbstract}{RGB}{0, 166, 252}
\definecolor{color1}{RGB}{56,170,255}
\definecolor{color2}{RGB}{234,248,255}
\definecolor{color3}{RGB}{225,243,250}

% ===================================
% section/subsection/paragraph set-up
% ===================================
\RequirePackage[explicit]{titlesec}
\titleformat{\chapter}
  {\normalfont\Huge\bfseries\filleft}
  {}
  {0em}
  {%
    \parbox[b]{\dimexpr\linewidth-2.5cm\relax}{#1}\hfill%
    \parbox[b]{2cm}{\hfill{\fontsize{75}{96}\selectfont\color{color1}\thechapter}}%
  }
  []
\titleformat{\section}
  {\color{color1}\large\sffamily\bfseries}
  {\thesection}
  {0.5em}
  {\MakeUppercase{#1}}
  []
\titleformat{name=\section,numberless}
  {\color{color1}\large\sffamily\bfseries}
  {}
  {0em}
  {\MakeUppercase{#1}}
  []  
\titleformat{\subsection}
  {\sffamily\bfseries}
  {\thesubsection}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}
  {\sffamily\small\bfseries\itshape}
  {\thesubsubsection}
  {0.5em}
  {#1}
  []    
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1}
  
% ===================================
% Progressbar command
% ===================================

\RequirePackage{pgf}		% Create PostScript and PDF graphics in TeX
\RequirePackage{tikz}
\RequirePackage{totcount}	% Find the last value of a counter
\regtotcounter{page}%

\newcommand{\pageprogressbar}{%
	\begin{tikzpicture}%
	\fill[color1] (0,0) rectangle ((\thepage*4/\totvalue{page},0.2);
	\draw (0,0) rectangle (4,0.2);
	\end{tikzpicture}
}
  
% ===================================
% header and footer set-up
% ===================================
  
\RequirePackage{fancyhdr}  % custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\fancyfoot{}
\fancyhead[RO,LE]{}
\fancyhead[LO]{\leftmark}
\fancyhead[RE]{\rightmark}

% Headers
%\lhead{}%
%\chead{}%
%\rhead{}%
% Footers
%\lfoot{}%
%\cfoot{}%
\rfoot{\pageprogressbar \quad \small\sffamily\bfseries\thepage/\pageref{LastPage}}%

\pagestyle{fancy}

% ===================================
% Figures and tables style set-up
% ===================================

\RequirePackage{caption}

\captionsetup[figure]{box=colorbox,boxcolor=color2,slc=off}
\captionsetup[figure]{labelfont={color=color1}}

\captionsetup[table]{box=colorbox,boxcolor=color2,slc=off}
\captionsetup[table]{labelfont={color=color1}}

\captionsetup{tablename=\bsc{Tableau}}

\renewcommand{\tablename}{Tableau}
\renewcommand{\figurename}{Figure}


\makeatletter
\renewenvironment{table}{%
\arrayrulecolor{color1}%
\arrayrulewidth0.4mm%
\rowcolors{2}{color2}{color3}%
\@float{table}%
}{%
  \end@float
}
\makeatother

% ===================================
% Abstract style set-up
% ===================================

\RequirePackage{mdframed}

\renewenvironment{abstract}
{
\begin{flushleft}
\colorbox{backgroundAbstract}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\color{fontAbstract}\large\sffamily\textbf{\abstractname}}}
\end{flushleft}
\vspace{-0.6cm}
\begin{mdframed}[backgroundcolor=color2,hidealllines=true]
}
{
\end{mdframed}
}

% ===================================
% Margin note style set-up
% ===================================

\RequirePackage[textsize=small,color=white,bordercolor=white]{todonotes}
\reversemarginpar

% ===================================
% Title page style set-up
% ===================================

\makeatletter
\renewcommand\maketitle{
\begin{titlepage}
	\begin{center}
	
	\includegraphics[height=2cm]{\@logo}
	
	\vspace{\fill}
	
	\Huge \@title
	
	\vspace{0.3cm}
	
	\hrule height 1pt
	
	\begin{flushright}
	\Large \@author
	\end{flushright}
	
	\vspace{\fill}
	
	\Large \@info \\ \vspace{0.7cm}
	\large \@date
	\end{center}
\end{titlepage}
}
\makeatother