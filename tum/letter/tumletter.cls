%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TUM-Vorlage: Brief
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Rechteinhaber:
%     Technische Universität München
%     https://www.tum.de
% 
% Gestaltung:
%     ediundsepp Gestaltungsgesellschaft, München
%     http://www.ediundsepp.de
% 
% Technische Umsetzung:
%     eWorks GmbH, Frankfurt am Main
%     http://www.eworks.de
%
% Modifictations 24.02.2018 by marc.russwurm@tum.de:
%      - Code reorganized and packaged to tumletter class
%      - spacing and style unchanged

\ProvidesClass{tumletter}
\NeedsTeXFormat{LaTeX2e}[1995/06/01]

% Inherit from scrlttr2
\LoadClassWithOptions{scrlttr2}

\RequirePackage[utf8]{inputenc} % Textkodierung: UTF-8
\RequirePackage[T1]{fontenc} % Zeichensatzkodierung

\RequirePackage{calc}


\RequirePackage[absolute]{textpos} % Positionierung

\RequirePackage[gen]{eurosym}
\DeclareUnicodeCharacter{20AC}{\euro{}}

% Schriftart Helvetica:
\RequirePackage[scaled]{helvet}
\renewcommand{\familydefault}{\sfdefault}

\RequirePackage{mathptmx} % skalierbare Formelschriften
\RequirePackage{tabto} % Tabulatoren
\RequirePackage{lastpage} % Letzte Seitenzahl auslesen
\RequirePackage{xstring} % Textmanipulation
\RequirePackage{setspace} % anpassbare Zeilenabstände

% Allgemein:
\newcommand{\AllgemeinGestalter}{ediundsepp Gestaltungsgesellschaft}
\newcommand{\AllgemeinErsteller}{eWorks GmbH}

% Universität:
%\newcommand{\UniversitaetName}{Technische Universität München}
%\newcommand{\UniversitaetAbkuerzung}{TUM}
%\newcommand{\UniversitaetWebseite}{www.tum.de}
\newcommand{\UniversitaetLogoBreite}{19mm}
\newcommand{\UniversitaetLogoHoehe}{1cm}


% Seitenränder:
\newcommand{\SeitenrandOben}{20mm}
\newcommand{\SeitenrandRechts}{20mm}
\newcommand{\SeitenrandLinks}{25mm}
\newcommand{\SeitenrandUnten}{10mm}

% Falzmarken:
\newcommand{\FalzmarkeOben}{87mm}
\newcommand{\FalzmarkeMitte}{148.5mm}
\newcommand{\FalzmarkeUnten}{192mm}
\newcommand{\FalzmarkeBreite}{2mm}
\newcommand{\FalzmarkeDicke}{0.3pt}
\newcommand{\FalzmarkePositionLinks}{7mm}


% Adressfeld:
\newcommand{\AdressfeldHoehe}{45mm}
\newcommand{\AdressfeldBreite}{85mm}
\newcommand{\AdressfeldAbsenderSchriftgroesse}{7.5pt}
\newcommand{\AdressfeldEmpfaengerSchriftgroesse}{11pt}
\newcommand{\AdressfeldEmpfaengerZeilenabstand}{15pt}

% Text:
\newcommand{\TextOben}{77.5mm}
\newcommand{\TextSchriftgroesse}{11pt}
\newcommand{\TextZeilenabstand}{15pt}

% Fusszeile:
\newcommand{\FusszeilePositionOben}{271mm}
\newcommand{\FusszeileBreite}{165mm}
\newcommand{\FusszeileHoehe}{16.5mm}
\newcommand{\FusszeileHoeheFoot}{15.5mm}
\newcommand{\FusszeileZwischenabstand}{2mm}
\newcommand{\FusszeileBreiteGross}{44mm}
\newcommand{\FusszeileBreiteKlein}{35.5mm}
\newcommand{\FusszeileSeitennummerAbstand}{7.7mm}
\newcommand{\FusszeileSchriftgroesse}{7.5pt}
\newcommand{\FusszeileZeilenabstand}{8pt}

\RequirePackage[a4paper,
top=\SeitenrandOben,
bottom=\SeitenrandUnten,
inner=\SeitenrandLinks,
outer=\SeitenrandRechts,
foot=\FusszeileHoeheFoot,
head=0cm,
includefoot
]{geometry}

\textblockorigin{\SeitenrandLinks}{\SeitenrandOben} % Ursprung für Positionierung

\RequirePackage[pdftex]{hyperref}

\renewcommand*{\raggedsignature}{\raggedright}

\makeatletter
\@setplength{bfoldmarklength}{\FalzmarkeBreite}
\@setplength{bfoldmarkvpos}{\FalzmarkeUnten}
\@setplength{firstfoothpos}{\SeitenrandLinks - 2pt}
\@setplength{firstfootvpos}{\FusszeilePositionOben}
\@setplength{firstfootwidth}{\FusszeileBreite}
\@setplength{foldmarkhpos}{\FalzmarkePositionLinks}
\@setplength{foldmarkthickness}{\FalzmarkeDicke}
\@setplength{mfoldmarklength}{\FalzmarkeBreite}
\@setplength{mfoldmarkvpos}{\FalzmarkeMitte}

\@setplength{refaftervskip}{\TextZeilenabstand}
\@setplength{refvpos}{\TextOben}
\@setplength{sigbeforevskip}{\baselineskip}
\@setplength{sigindent}{0mm}
\@setplength{subjectaftervskip}{\baselineskip + \baselineskip + 1pt}

\@setplength{tfoldmarklength}{\FalzmarkeBreite}
\@setplength{tfoldmarkvpos}{\FalzmarkeOben}
\makeatother

\KOMAoptions{
	fontsize=\TextSchriftgroesse,
	foldmarks=BMpTv,
	firsthead=false,
	backaddress=no,
	addrfield=no,
	fromalign=false
}

\newcommand{\RuecksendeadresseTrenner}{~| \ignorespaces}

\AtBeginLetter{%
	% Logo:
	\begin{textblock*}{\UniversitaetLogoBreite}[1,0](\textwidth, 0cm)%
		\raggedleft%
		\includegraphics{Universitaet_Logo_RGB.pdf}%
	\end{textblock*}%
	\setlength{\baselineskip}{\TextZeilenabstand}%
	\setlength{\parindent}{0mm} % keine Einrückung am Absatzanfang
	\setlength{\parskip}{\baselineskip} % einzeiliger Abstand nach Absätzen
	% Empfängerfenster:
	\begin{textblock*}{\AdressfeldBreite}[0,0](0cm, 15mm)%
		\raggedbottom\raggedright
		\begin{spacing}{.85}%
			{
				\usekomafont{backaddress}%
				\let\\\RuecksendeadresseTrenner% Umdefinieren von "\\" zu "~| "
				\Absender%
			} \\
		\end{spacing}
		\vspace*{5.5pt}
		\usekomafont{toaddress}%
		\EmpfaengerAdresse
	\end{textblock*}
}

\KOMAoptions{firstfoot=true}
\setkomafont{pagefoot}{\sffamily\fontsize{7.5pt}{8pt}\selectfont}
\renewcommand{\pagemark}{%
	\begin{textblock*}{3em}[1,1](\paperwidth - \SeitenrandLinks - \SeitenrandRechts + \FusszeileSeitennummerAbstand + 3mm, \paperheight - \SeitenrandOben - \SeitenrandUnten)%
		\raggedleft\hfill\usekomafont{pagefoot}\thepage\,/\,\pageref*{LastPage}%
	\end{textblock*}%
}

\addtokomafont{backaddress}{\fontsize{\AdressfeldAbsenderSchriftgroesse}{\AdressfeldAbsenderSchriftgroesse}\selectfont}
\addtokomafont{toaddress}{\fontsize{\AdressfeldEmpfaengerSchriftgroesse}{\AdressfeldEmpfaengerZeilenabstand}\selectfont}

\KOMAoptions{refline=dateleft}


\setkomafont{subject}{\bfseries}

