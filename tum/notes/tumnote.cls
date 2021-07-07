% ------------------------------------------------------------------------------
%
% A very simple document class for notes or short texts.
% Based on the TUM CD principles. Designed from scratch for easy readability (in
% contrast to existing TUM CD templates).
%
% Created: 01.12.2017
% Author: Lukas Liebel
%
% Known bugs:
%   - badly hacked footer
%     - will probably break for long titles
%     - looks weird if title/author/date is missing
%   - long titles do not break properly
%   - newlines in title not working
%   - text does not break properly (does not respect right margin)
%
% Change log:
%   - 01.12.2017  (LL)  Created!
%   - 01.12.2017b (LL)  Changed footer format, decreased pre/post sec/subsec
%                       heading space, modified footer size
%
% ------------------------------------------------------------------------------


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tumnote}[2017/12/01]

\LoadClass{scrartcl}

\usepackage{tumbase}

\usepackage[a4paper,
twoside=false,
    top=20mm,
    bottom=20mm,
    left=20mm,
    right=20mm,
    foot=12.5mm,
    head=12.5mm,
    includehead,
    includefoot,
]{geometry}
\usepackage[absolute]{textpos}
\usepackage{calc}
\textblockorigin{20mm}{20mm}

\usepackage{graphicx}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

\usepackage[scaled]{helvet}
\renewcommand{\familydefault}{\sfdefault}

\setlength{\parindent}{0pt}
\setlength{\parskip}{.5\baselineskip}

\usepackage{lastpage}

\RequirePackage{xkeyval}
\DeclareOptionX{lang}[ngerman]{\providecommand{\TUMlang}{#1}}
\ProcessOptionsX
\RequirePackage[\TUMlang]{babel}

\iflanguage{ngerman}{
  \newcommand{\TUMgroup}{Lehrstuhl für Methodik der Fernerkundung}
  \newcommand{\TUMfaculty}{Ingenieurfakultät Bau Geo Umwelt}
  \newcommand{\TUMname}{Technische Universität München}
}{
\iflanguage{english}{
  \newcommand{\TUMgroup}{Chair of Remote Sensing Technology}
  \newcommand{\TUMfaculty}{TUM Department of Civil, Geo and Environmental Engineering}
  \newcommand{\TUMname}{Technical University of Munich}
}{}
}

\usepackage[pdftex]{hyperref}
\hypersetup{
    hidelinks,
    pdftitle={Note}
}

\setkomafont{pagefoot}{\sffamily\fontsize{7.5pt}{8pt}\selectfont}
\usepackage{fancyhdr}
\graphicspath{{../base/images/}}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0mm}
\renewcommand{\footrulewidth}{0mm}
\fancyhead[R]{\includegraphics[width=19mm]{logo-blue-TUM}}
\fancyfoot[R]{\hfill\thepage\,/\,\pageref*{LastPage}}

\usepackage{tabularx}
\renewcommand\maketitle{
  %
  {\Huge\@title\\[.25\baselineskip]}
  %
  \fancyfoot[R]{
    \usekomafont{pagefoot}
    \begin{tabularx}{\linewidth}{@{}llX@{}}
      \textbf{\@title} & \TUMgroup & \\
      \@author & \TUMfaculty & \\
      \@date & \TUMname & \hfill\thepage\,/\,\pageref*{LastPage}
    \end{tabularx}
  }
}

\usepackage{enumitem}
\setlist{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}

\makeatletter
  \let\origsection\section
  \renewcommand\section{\@ifstar{\starsection}{\nostarsection}}
  \newcommand\nostarsection[1]
  {\sectionprelude\origsection{#1}\sectionpostlude}
  \newcommand\starsection[1]
  {\sectionprelude\origsection*{#1}\sectionpostlude}
  \newcommand\sectionprelude{%
    \vspace{-.5\baselineskip}
  }
  \newcommand\sectionpostlude{%
    \vspace{-1\baselineskip}
  }
  \let\origsubsection\subsection
  \renewcommand\subsection{\@ifstar{\starsubsection}{\nostarsubsection}}
  \newcommand\nostarsubsection[1]
  {\subsectionprelude\origsubsection{#1}\subsectionpostlude}
  \newcommand\starsubsection[1]
  {\subsectionprelude\origsubsection*{#1}\subsectionpostlude}
  \newcommand\subsectionprelude{%
    \vspace{-.5\baselineskip}
  }
  \newcommand\subsectionpostlude{%
    \vspace{-.75\baselineskip}
  }
\makeatother


\usepackage{tumbase}
\usepackage{tumabbrev}

\endinput
