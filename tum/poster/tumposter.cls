%
% tumposter v1.0
%
% this latex documentclass is a reimplementation of scientific poster folowing Corporate Design of TU Munich.
%
% - Tested as A0 scientific poster in portrait
% - Follows TUM Corporate Design when possible (marked as "CD" or "checked")
% - Inspired by modifications of Lukas Liebel (2016)
%
% @author marc.russwurm@tum.de (2017)

\ProvidesClass{tumposter}
\NeedsTeXFormat{LaTeX2e}[1995/06/01]

% Inherit from sciposter
\LoadClassWithOptions{sciposter}

%% lengths
\newlength{\headerheight}
\newlength{\footerheight}
\newlength{\tumlogowidth}

\setlength{\headerheight}{86mm} % checked 46mm \PlakatKopfzeileAbstand + 40mm \PlakatKopfzeileHoehe
\setlength{\tumlogowidth}{87.2mm} % checked
\setlength{\footerheight}{75mm} % checked
\setlength{\footerheight}{46mm} % checked

% remove vertical rule between columns
\setlength{\columnseprule}{0pt}

% originally \PlakatSpaltenAbstand
\setlength{\columnsep}{18mm}

\newcommand{\fancywhitespace}{\vspace*{\fill}\null}

% even margins at each side
\setmargins[\papermargin] %% CD -- PlakatSeiteRand

%% Colors
\definecolor{tumblue}{RGB}{0,101,189}

\RequirePackage{tumbase}
\RequirePackage{tummath}
\RequirePackage{tumabbrev}

%\RequirePackage[scaled]{helvet}
%\renewcommand{\familydefault}{\sfdefault}

%% %% %% %% %% %% %% %% %% %% %% %% FONTS %% %% %% %% %% %% %% %% %% %% %% %%

\newcommand{\veryverytiny}{\fontsize{15}{15}\selectfont}
\newcommand{\verytiny}{\fontsize{18}{18}\selectfont}
\renewcommand{\tiny}{\fontsize{22}{22}\selectfont}
\renewcommand{\scriptsize}{\fontsize{20.74}{25}\selectfont}
\renewcommand{\footnotesize}{\fontsize{24.88}{30}\selectfont}
\newcommand{\bulletsize}{\fontsize{24.5}{27.2}\selectfont} %% CD -- \PlakatAufzaehlungSymbolSchriftgroesse
\renewcommand{\small}{\fontsize{28}{30}\selectfont} %% CD -- \PosterSmallFont
\renewcommand{\normalsize}{\fontsize{36}{40}\selectfont} %% CD
\renewcommand{\large}{\fontsize{42}{50}\selectfont} %% CD -- \PlakatKopfzeileSchriftgroesse
\renewcommand{\Large}{\fontsize{50}{53}\selectfont} %% CD -- PlakatTitelDrei
\renewcommand{\LARGE}{\fontsize{61.92}{77}\selectfont}
\renewcommand{\huge}{\fontsize{74.3}{93}\selectfont}
\renewcommand{\Huge}{\fontsize{90}{100}\selectfont} %% CD -- PlakatTitelSchriftGroesse
\renewcommand{\veryHuge}{\fontsize{107}{134}\selectfont}
\renewcommand{\VeryHuge}{\fontsize{107}{134}\selectfont}
\renewcommand{\VERYHuge}{\fontsize{107}{134}\selectfont}

\renewcommand{\titlesize}[1]{{\Huge #1 \par}\vspace{20pt}} %% CD PlakatTitelEins
\newcommand{\headersize}{\large} %% CD \PlakatKopfzeileSchriftgroesse
\newcommand{\footersize}{\small} %% CD -- \PosterSmallFont

\renewcommand{\sectionsize}{\Large} %\PlakatTitelDrei
\renewcommand{\authorsize}{\sectionsize}

%\RequirePackage{enumitem}
%\setlist[itemize]{topsep=0pt, partopsep=0pt, itemsep=0pt, parsep=.5\parskip, leftmargin=.6em} % \PlakatAufzaehlungAbstandLinks
%\setlist[enumerate]{topsep=0pt, partopsep=0pt, itemsep=0pt, parsep=\parskip, leftmargin=.6em + 1cm}

% bullets
\RequirePackage{calc}
\def\labelitemi{\raise0.2em\hbox{\bulletsize$\bullet$}} %% CD --  \PlakatAufzaehlungEbeneEinsSymbol
\def\labelitemii{\raise0.2em\hbox{\bulletsize$-$}} %% CD --  \PlakatAufzaehlungEbeneEinsSymbol


%% %% %% %% %% %% %% %% %% %% %% %% MAKETITLE %% %% %% %% %% %% %% %% %% %% %% %%

% input parameter \header, similar to \title and \author
\newcommand\header[1]{\renewcommand\@header{#1}}
\newcommand\@header{}

\renewcommand{\maketitle}{
	%% header
	%\colorbox{green}{
	\begin{minipage}[!t][\headerheight][t]{.7\linewidth}
	 \headersize\color{tumblue}\@header
	\end{minipage}
	%}
	\hfill
	%\colorbox{red}{
	\begin{minipage}[t][\headerheight][t]{.3\linewidth}
	\flushright\includegraphics[width=\tumlogowidth]{logo-blue-TUM}
	\end{minipage}
	%}

	%% title
	\begin{minipage}{\textwidth}
			{\titlesize{\@title}}
			\vspace{.5\titleskip}

			{\authorsize {\@author}}
	\end{minipage}%}}

\vspace{\titleskip}
}

%% %% %% %% %% %% %% %% %% %% %% %% FOOTER %% %% %% %% %% %% %% %% %% %% %% %%

\newenvironment{footer}[1][]
	{ % begin
	\vfill
	\begin{minipage}[\footerheight]{\linewidth}
	\footersize
	}
	{% end
	\end{minipage}
	}


%% %% %% %% %% %% %% %% %% %% %% %% SECTION & SUBSECTION %% %% %% %% %% %% %% %% %% %% %% %%

%% Redefinition of Section and subsection (modified from sciposter.cls)
\RequirePackage{titlesec}

\titleformat{\section}         % Customise the \section command
{\sectionsize\raggedright} % Make the \section headers large (\Large),
% small capitals (\scshape) and left aligned (\raggedright)
{}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
{}                           % Can be used to insert code before the heading.
[{\color{tumblue}\titlerule[2pt]}] % changed thickness of titlerule (used to be 1pt), as suggested by Tobi 

\titleformat{\subsection}
{\subsectionsize\raggedright}
{}{0em}
{}

%% %% %% %% %% %% %% %% %% %% %% %% TIKZ Thicknesses %% %% %% %% %% %% %% %% %% %% %% %%
%
% -- values eyeballed

\RequirePackage{tikz}
\tikzset{
    ultra thin/.style= {line width=.5pt},
    very thin/.style=  {line width=1pt},
    thin/.style=       {line width=2pt},% thin is the default
    semithick/.style=  {line width=2.5pt},
    thick/.style=      {line width=3pt},
    very thick/.style= {line width=3.5pt},
    ultra thick/.style={line width=4pt}
}
