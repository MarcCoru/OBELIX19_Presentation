% ------------------------------------------------------------------------------
%
% A very simple document class for arXiv publications.
% Contains a lot of features from other TUM-LMF document classes but bundles
% them in one file to make it easy to deploy it to arXiv.
%
% Created: 15.10.2018
% Author: Lukas Liebel (lukas.liebel@tum.de)
%
% Known bugs:
% - None (so far)
%
% Change log:
%   - 15.10.2018  (LL)  Created!
%
% ------------------------------------------------------------------------------


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tumarxivarticle}[2018/10/04]

\LoadClass[
    twocolumn,
    twoside,
    10pt,
    letterpaper,
    table
  ]{scrartcl}

\RequirePackage{xkeyval}
\DeclareOptionX{lang}[english]{\providecommand{\TUMlang}{#1}}
\ProcessOptionsX
\RequirePackage[\TUMlang]{babel}

% encoding
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

% page layout
\usepackage[
    margin=1.85cm,
    footskip=1cm,
  ]{geometry}

% fonts
\usepackage{times}
\addtokomafont{sectioning}{\rmfamily}

% spacing
\RedeclareSectionCommands[
    beforeskip=-.5\baselineskip,
    afterskip=.25\baselineskip
  ]{section,subsection,subsubsection}
\RedeclareSectionCommands[
    beforeskip=.5\baselineskip,
    afterskip=-1em
  ]{paragraph,subparagraph}
\setlength{\parskip}{5pt}
\setlength{\parindent}{0pt}

% abstract
\usepackage{abstract}
\renewcommand{\absnamepos}{empty}

% typesetting
\usepackage{microtype}
\interfootnotelinepenalty=10000

% units
\usepackage{siunitx}
\sisetup{
  detect-all,
  range-units=single,
  range-phrase=--,
  binary-units=true,
  product-units=single,
  per-mode=fraction,
  exponent-product = \cdot
  }
\DeclareSIUnit\px{px}
\usepackage[super]{nth}

% math
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{amsthm}
\usepackage{mleftright}
\providecommand{\mathsymbol}[1]{\ensuremath{\boldsymbol{#1}}}
\let\temp\rmdefault
\usepackage{mathpazo}
\let\rmdefault\temp
\usepackage{upgreek}
\newcommand\Tau{\mathrm{T}}
\DeclareMathAlphabet{\mathbit}{OT1}{cmr}{bx}{it}
\usepackage{xstring}
\newcommand{\function}[1][f]{\ensuremath{\operatorname{#1}}}
\newcommand{\functionAt}[2][f]{\ensuremath{\ifthenelse{\equal{#1}{}}{}{\function[#1]}\mleft(#2\mright)}}
\newcommand{\V}[1]{\ensuremath{\mathsymbol{\lowercase{#1}}}}
\newcommand{\VecDef}[1]{\mleft( #1 \mright)}
\newcommand{\Set}[1]{\ensuremath{\mathcal{\uppercase{#1}}}}
\newcommand{\datal}{x}
\newcommand{\datalabel}{\ensuremath{y}}
\newcommand{\DataVec}{\ensuremath{\V{\datal}}}
\newcommand{\LabelVec}{\ensuremath{\V{\datalabel}}}
\newcommand{\abs}[1]{\ensuremath{\left\lvert #1 \right\rvert}}

% quotation marks
\usepackage[autostyle=true]{csquotes}

% enumerations
\usepackage[inline]{enumitem}

% abbreviations and glossary
\usepackage{glossaries}
\include{acronyms}

% custom abbreviations
\newcommand{\ia}{\textit{i{.}a{.}}, }
\newcommand{\ie}{\textit{i{.}e{.}}, }
\newcommand{\eg}{\textit{e{.}g{.}}, }
\newcommand{\etc}{\textit{etc}}

% figures
\usepackage{graphicx}
\usepackage{tikz}
\setlength{\fboxsep}{0pt}

% colors
\usepackage{xcolor}
\definecolor{tumblue}{RGB}{0,101,189}
\definecolor{tumbluelight}{RGB}{152,198,234}

% tables
\usepackage{tabularx}
\newcolumntype{Y}{>{\raggedleft\arraybackslash}X}
\usepackage{multicol}
\newcommand{\header}[2]{\multicolumn{1}{#1}{\footnotesize #2}}
\newcommand{\headermulti}[3]{\multicolumn{#3}{#1}{\footnotesize #2}}
\newcommand{\lefthead}[1]{{\footnotesize #1}}
\newcommand{\tabsuffix}[1]{\parbox{0.8cm}{\raggedleft\footnotesize (#1)}}
\newcommand{\na}{\textemdash}
\newcommand{\best}[1]{\cellcolor{tumbluelight} #1}
\usepackage{booktabs}

% subfigures
\usepackage{subcaption}
\captionsetup{format=plain}
\setkomafont{caption}{\footnotesize}
\setkomafont{captionlabel}{\usekomafont{caption}\bfseries}

% referencing
\usepackage{hyperref}
\hypersetup{hidelinks=true}

\usepackage[
    capitalise,
    noabbrev,
  ]{cleveref}

\endinput
