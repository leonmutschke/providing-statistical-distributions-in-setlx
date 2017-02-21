\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dhbwreport}[2017/02/20 DHBW Report class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}%scrartcl
\ProcessOptions\relax
\LoadClass[12pt, a4paper, parskip, abstracton]{scrreprt}

% Packages
\RequirePackage{color, graphicx, tabularx, scrpage2, tikz, listings, lstautogobble, titletoc, subfigure, pstricks}
\RequirePackage[super, square, comma, numbers]{natbib}
%\RequirePackage[rigidchapters,explicit]{titlesec}
\RequirePackage[printonlyused]{acronym}
\RequirePackage[english]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[unicode,pdfnewwindow,colorlinks]{hyperref}
\RequirePackage{fontspec}
\RequirePackage{csquotes}
\RequirePackage{scrhack}
%\RequirePackage{biblatex}


\newcommand{\DHBW}{Baden - Wuerttemberg Cooperative State University Mannheim}

\newcommand{\timeframe}[1]{\newcommand{\TimeFrame}{#1}}
\newcommand{\matriculationno}[1]{\newcommand{\MatrikelNummer}{#1}}
\newcommand{\course}[1]{\newcommand{\Kurs}{#1}}
\newcommand{\corrector}[1]{\newcommand{\BetreuerDH}{#1}}

\renewcommand{\normalsize}{\fontsize{12pt}{10pt}\selectfont}
\renewcommand*{\lstlistlistingname}{List of Listings}
\renewcommand{\baselinestretch}{1.50}\normalsize
%\titlespacing{\chapter}{0pt}{0pt}{35ex}
\DeclareFixedFont{\chapterfont}{T1}{pnc}{bx}{n}{6cm} %\DeclareFixedFont{\chapterfont}{T1}{phv}{bx}{n}{6cm}

\newcolumntype{C}{>{\centering\arraybackslash}X}

\definecolor{blue}{rgb}{0.1015625, 0.37890625, 0.66015625}
\definecolor{blueLight}{cmyk}{0.113, 0.085, 0.000, 0.027}	
\definecolor{darkgrey}{RGB}{32,32,32}
\definecolor{lightgrey}{rgb}{0.75 0.75 0.75}
\definecolor{linkblue}{rgb}{0 0.1 0.5}

\addtokomafont{section}{\color{blue}}
\addtokomafont{subsection}{\color{blue}}
\addtokomafont{title}{\color{blue}}
\addtokomafont{chapter}{\color{blue}}


\hypersetup
{
	linkcolor=black,
	linkbordercolor=lightgrey,
	urlcolor=linkblue,
	urlbordercolor=linkblue,
	citecolor=black,
	citebordercolor=white,
	% pdfborderstyle={/S/U/W 0.3}, % underlined links
	linktoc=section, % none,section,page,all
	pdfstartview={FitV},
	pdfborder={0 0 0},
}

\definecolor{editorGray}{rgb}{0.95, 0.95, 0.97}
\definecolor{editorBlue}{HTML}{008FFF}
\definecolor{editorGreen}{HTML}{2BA91C}

\lstdefinelanguage{javascript}{
  morekeywords={typeof, new, true, false, catch, function, return, null, catch, switch, var, if, in, while, do, else, case, break},
  morecomment=[s]{/*}{*/},
  morecomment=[l]//,
  morestring=[b]",
  morestring=[b]'
}

\lstset{ %
	backgroundcolor=\color{blueLight},
	breakatwhitespace=true,
	breaklines=true,
	captionpos=b,
	extendedchars=true,
	showstringspaces=false,
	stepnumber=1,
	tabsize=4,
	autogobble=true,
	% Basic design
	backgroundcolor=\color{editorGray},
	basicstyle={\small\ttfamily},   
	frame=l,
	% Line numbers
	xleftmargin={0.75cm},
	numbers=left,
	stepnumber=1,
	firstnumber=1,
	numberfirstline=true,
	% Code design   
	keywordstyle=\color{blue}\bfseries,
	commentstyle=\color{darkgray}\ttfamily,
	ndkeywordstyle=\color{editorGreen}\bfseries,
	stringstyle=\color{editorGreen},
	% Support for German umlauts
	literate=%
	{Ö}{{\"O}}1
	{Ä}{{\"A}}1
	{Ü}{{\"U}}1
	{ß}{{\ss}}1
	{ü}{{\"u}}1
	{ä}{{\"a}}1
	{ö}{{\"o}}1
}

\renewcommand{\maketitle}
{
	\hypersetup{pdftitle={\@title},pdfauthor={\@author},pdfsubject={\@subject}}
	\begin{titlepage}
		%\includegraphics[width=0.25\textwidth]{./pic/logo/}\hfill
		\begin{tikzpicture}[opacity=0.5]
			\pgftext{\includegraphics[width=0.25\textwidth]{./pic/logo/dhbw.png}}\\
		\end{tikzpicture}
		\vfill
		\begin{center}
			\textcolor{blue}{\begin{Huge}\textbf{\@title}\end{Huge}}\par
			\textcolor{blue}{\begin{huge}\@subtitle\end{huge}}\par\vfill
			\textbf{\textsc{\@subject}}\par\vfill
			\@titlehead\par\vfill
			Course of Studies: \textsl{Applied Computer Science}\par
			at \par 
			\@publishers{} \par\vfill
			by \par
			\@author{}\par\vfill
			\@date{}
		\end{center}
		\vfill
		\begin{tabular}{ll}
			Duration & \TimeFrame{}\\
			Matriculation Number, Course & \MatrikelNummer{}, \Kurs{}\\
			Consultant for the Cooperative State University & \BetreuerDH{} \\
		\end{tabular}
	\end{titlepage}
	\begin{titlepage}
		\thispagestyle{plain}
		\begin{center}
			\@uppertitleback\par\vfill
			\@dedication\par\vfill
			\vspace*{\fill}
			\@lowertitleback
		\end{center}
	\end{titlepage}
}

\def\and{\\ &}% Ends table column and leaves the first of the nex row empty
\automark[section]{chapter}

\newcommand{\honestyRep}%Declaration of Academic Honesty
{
	\newpage
	\thispagestyle{plain}
	\renewcommand{\abstractname}{Declaration of Academic Honesty}
	\begin{abstract}
		Hereby we declare that we wrote this \@subject{} on our own, not having used any additives other than declared within this document. \\
		All passages and ideas being not our own are fully and properly acknowledged.
		\newline \newline \newline \newline
		\begin{center}	\rule{0.4\textwidth}{0.4pt}\\ (\@author) \\ Mannheim -- \today{}\end{center}
	\end{abstract}
	\renewcommand{\abstractname}{Abstract}
	\clearpage
} 

\pagestyle{scrheadings}
\ihead{\@author}
\chead{}
\ohead{\rightmark}
\ifoot{\tiny{\textit{\copyright 2017 León Mutschke \& Jonas Siefker. All Rights Reserved. \\Unauthorized use and disclosure strictly forbidden.}}}
\cfoot{\pagemark}
%\ofoot{\includegraphics[width=0.25\textwidth]{./pic/logo/}}
\setlength{\textwidth}{160mm}
\setlength{\textheight}{240mm}
\setlength{\headsep}{13mm}



