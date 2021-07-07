\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tumposting}[2017/07/12]

\LoadClass[%
  a4paper,
  10pt,
%   twoside,
]{scrartcl}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

\RequirePackage{xkeyval}
\DeclareOptionX{lang}[ngerman]{\providecommand{\TUMlang}{#1}}
% \DeclareOptionX{lang}[ngerman]{\selectlanguage{#1}}
\ProcessOptionsX

\RequirePackage[ngerman,american,\TUMlang]{babel}

\usepackage{tumbase}

% editable parameters
\iflanguage{ngerman}{
  \newcommand{\TUMgroup}{Lehrstuhl für Methodik der Fernerkundung}
  \newcommand{\TUMfaculty}{Ingenieurfakultät Bau Geo Umwelt}
  \newcommand{\TUMname}{Technische Universität München}
}{
\iflanguage{english}{
  \newcommand{\TUMgroup}{Remote Sensing Technology}
  \newcommand{\TUMfaculty}{TUM Department of Civil, Geo and Environmental Engineering}
  \newcommand{\TUMname}{Technical University of Munich}
}{}
}

% fixed parameters
\newlength{\baseheight}
\setlength{\baseheight}{10mm}

\usepackage{geometry}
\geometry{%
%   pass,
%   showframe,
%   showcrop,
%
  a4paper,
  top   =30mm,
  right =20mm,
  bottom=20mm,
  left  =20mm,
%
%   includeheadfoot,
  ignoreheadfoot
}

\usepackage[utf8]{inputenc}

\usepackage{graphicx}

\usepackage[%
%   headsepline,
%   footsepline,
]{scrlayer-scrpage}

% left header
\ihead[%
  \resizebox{!}{.55\baseheight}{%
    \parbox{100mm}{%
      \TUMgroup\\
      \TUMfaculty\\
      \TUMname
    }
  }
]{}

% right header
\ohead*{\includegraphics[height=\baseheight]{base/images/logo-blue-TUM}}

\cfoot*{}

\setkomafont{pageheadfoot}{\fontfamily{phv}\selectfont\color{tumblue}}% Fußzeile normale Schrift 

% \AtBeginDocument{foo}


\endinput