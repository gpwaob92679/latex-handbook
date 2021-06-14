\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{indiv}[2021/06/14 v1.0 Custom LaTeX Class for latex-handbook by gpwaob92679]

% Document Settings
\LoadClass[class=extbook, crop=false, multi=true, float=true, a4paper, 12pt, oneside]{standalone}
%\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[
	top=2cm,
	bottom=2cm,
	left=2cm,
	right=2cm,
	headheight=17pt,
	includehead, includefoot,
	footskip=50pt
]{geometry} 

% Multi-file support
\usepackage[abspath, parent]{currfile}
\usepackage{standalone}
\usepackage{import}

% AMS Packages
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}

% graphicx
\usepackage{graphicx}
\graphicspath{{\StrSubstitute{\currfileabsdir\currfilebase}{\string s\string r\string c}{images}}}


\newcommand{\img}[1]{ % for inline image insertion
	\ %
	\raisebox{-0.1\baselineskip}{%
		\includegraphics[
		height=\baselineskip,
		width=\baselineskip,
		keepaspectratio,
		]{#1}%
	}%
	\ %
}

\newcommand{\tabimg}[1]{ % for in-tabular image insertion
	\raisebox{-0.3ex}{%
		\includegraphics[
		height=1.2em,
		keepaspectratio,
		]{#1}%
	}%
}

% Paragraph Style
\usepackage{indentfirst}
\setlength{\parindent}{2em}
\renewcommand{\baselinestretch}{1.25}
\setlength{\parskip}{1ex}

% Fonts
\usepackage{fontspec}
\usepackage{xeCJK}
\setCJKfamilyfont{ming}{新細明體}
\setCJKfamilyfont{kai}{標楷體}
\setCJKfamilyfont{hei}{Taipei Sans TC Beta}
\setCJKmainfont[AutoFakeBold=1.5]{標楷體}
\setCJKsansfont{Noto Sans CJK TC}
%\setCJKsansfont{Taipei Sans TC Beta}
\setCJKmonofont{Noto Sans CJK TC}

%\setmainfont{Times New Roman}
\setsansfont{Aller}
\setmonofont{Consolas}
\newfontfamily{\OSfamily}{Open Sans}

% For TeX-related logos
\usepackage{hologo}
\hologoFontSetup{general=\rmfamily}
\let\tmpTeX\TeX
\renewcommand{\TeX}{\textrm{\tmpTeX}}
\let\tmpLaTeX\LaTeX
\renewcommand{\LaTeX}{\textrm{\tmpLaTeX}}

% Floats, Figures, Tables, ...
\usepackage[table]{xcolor}
\usepackage{float}
\usepackage[justification=centering, labelfont=sf, textfont=sf]{caption}


\renewcommand{\figurename}{圖}

\usepackage{array}
\usepackage{tabularx}
\usepackage{booktabs}
\usepackage{multirow}
\usepackage{diagbox}
\renewcommand{\tablename}{表}

\setlength{\arrayrulewidth}{1pt}
\arrayrulecolor{black}
\renewcommand{\arraystretch}{1.5}

\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}


\usepackage{makecell}
\renewcommand{\theadfont}{\centering\bfseries\large}
\newcommand{\Thline}{\Xhline{2\arrayrulewidth}}
\newcolumntype{T}{!{\vrule width 2\arrayrulewidth}}
%\newcolumntype{H}[1]{>{\hsize=#1\hsize\arraybackslash}X}



% Enumerate and Itemize
\usepackage{enumitem}
\setlist{
	labelsep=1ex,
	labelindent=\parindent,
	nosep
}


% Enum and Item in tabular envs (to avoid weird spacing issues)
\newenvironment{tabitemize}{%
	\begin{minipage}[t]{\linewidth}%
		\begin{itemize}[label=\textbullet, nosep, left=0pt, after={\vspace{0.5\baselineskip}}]
}{%
		\end{itemize}%
	\end{minipage}%
}
% Figures in tabular envs
\newcommand{\tabfig}[2][0.95]{%
	\resizebox{#1\linewidth}{!}{#2}% default width to 0.95\linewidth
}

\newenvironment{tabmp}[1][0.5]{%
	\begin{minipage}[t]{\linewidth}%
%		\centering
		\def\tabmpAfterSepMultiple{#1} % fix: argument can't be taken in end code
		\vspace{-0.5\baselineskip}%
}{%
		\vspace{\tabmpAfterSepMultiple\baselineskip}% default spacing is 0.5\baselineskip
	\end{minipage}%
}

% Code
\usepackage[chapter]{minted}
\setminted{
	breaklines,
	tabsize=4,
	style=texstudio
}

% tcolorbox
\usepackage[breakable, minted, skins]{tcolorbox}

%
\renewcommand{\listingscaption}{程式碼}
\renewcommand{\theFancyVerbLine}{\ttfamily{\footnotesize{\arabic{FancyVerbLine}}}} % redefine style of line numbers
\newtcblisting{src}{
	listing only,
	breakable,
	enhanced,
	listing engine=minted,
	minted language=LaTeX,
%	minted style=colorful,
	minted options = {
		linenos, 
		breaklines=true,
		breakanywhere, 
		breakanywheresymbolpre=,
		numbersep=3.75mm,
		tabsize=4
	},
	drop fuzzy shadow,
	left=7mm,
	arc=2pt,
	overlay = {
		\begin{tcbclipinterior}
			\fill[gray!25] (frame.south west) rectangle ([xshift=7mm]frame.north west);
		\end{tcbclipinterior}
	}  
}

% hyperref
\usepackage{hyperref}
\hypersetup{
	colorlinks=true,
	linkcolor=black,
	filecolor=magenta,   
	urlcolor=blue
}

% Header
\usepackage{fancyhdr}
\fancypagestyle{plain}{
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	\fancyhf{}
	\rhead{\ttfamily\thepage}
%	\rfoot{\includegraphics[width=10em]{/logo/\arabic{page}.jpg}}
}
\fancypagestyle{fancy}{
	\renewcommand{\headrulewidth}{2pt}
	\renewcommand{\footrulewidth}{2pt}
	\fancyhf{}
	\rhead{\ttfamily\thepage}
	\lhead{\leftmark}
%	\cfoot{\leftmark}
%	\rfoot{\includegraphics[width=5em]{/logo/\arabic{page}.jpg}}
}
\pagestyle{fancy}

% Chemistry and Physics
\usepackage{chemfig}
\renewcommand\printatom[1]{\ensuremath{\mathsf{#1}}}

\usepackage{tikz}
\usepackage[american]{circuitikz}

% chess, chinese chess, sudoku, labyrinth
\usepackage{texmate}
\usepackage{cchess}
\usepackage{sudoku}
\usepackage{labyrinth}

%zhnumber
\usepackage{zhnumber}

% Counters
\usepackage{chngcntr}
\counterwithin{chapter}{part}
\renewcommand{\thechapter}{\arabic{chapter}}


% Title Styles
\usepackage{titlesec}
\titleformat{\chapter}[frame]{\normalfont\huge\bfseries}{第\ \thechapter\ 章}{20pt}{\Huge}
\titlespacing{\chapter}{0pt}{-15pt}{30pt}
\titleformat{\section}{\normalfont\Large\bfseries}{\thesection}{1em}{}
%\titleformat{\part}[]

% TOC
\renewcommand{\contentsname}{目錄 Table Of Contents}


% Debug
%\usepackage{lipsum}
%\usepackage{showframe}

% UNUSED
%\usepackage{moreenum}

