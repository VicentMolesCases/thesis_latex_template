%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      ThesisClass - Definition
% -----------------------------------------------------------------------
%               Implemented by Vicent Moles-Cases (2022)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ThesisClass provides functionalities to create a report for a thesis
% using latex. The class is based on the book native latex class. Two
% different types of document for the class are supported:
%
% bookType   -> Format more suitable for printing, with paper size 
%               240x170 mm, different margins and headers for the even 
%               and odd pages.
% reportType -> Format more suitable for pdf, with A4 paper size and 
%               same margins and headers for the even and odd pages
%
% Also, two different buidling modes are supported:
%
% fullBuild    -> Used to build whole document.
% partialBuild -> Used to build only one a part of the document
%
% If neither fullBuild nor partialBuild option is selected, the default 
% mode is fullBuild
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%% CLASS DEFINITION %%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ------------------------------ INITIALIZE -----------------------------
% Required latex version
\NeedsTeXFormat{LaTeX2e}
% Class info
\ProvidesClass{ThesisClass}[ThesisClass Vicent Moles Cases 2022]

% ---------------------------- READ PROPERTIES --------------------------

% ..................... Create options for book type ....................
\DeclareOption{bookType}{
\PassOptionsToClass{11pt}{book}
\PassOptionsToClass{twosize}{book}
\PassOptionsToClass{english}{book}
\newcommand\mode{bookType}
}
% .................... Create options for report type ...................
\DeclareOption{reportType}{
\PassOptionsToClass{11pt}{book}
\PassOptionsToClass{oneside}{book}
\PassOptionsToClass{english}{book}
\PassOptionsToClass{a4paper}{book}
\newcommand\mode{reportType}
}
% ................ Create options to build the full document ............
\DeclareOption{fullBuild}{
\newcommand\fullBuild{}
}
% .......... Create options to build only a part of the document ........
\DeclareOption{partialBuild}{
\newcommand\partialBuild{}
}
% ........................... Process options ...........................
\ProcessOptions\relax 
% ............................ Default build ............................
\ifdefined \fullBuild	
\else
\ifdefined \partialBuild
\else
\newcommand\fullBuild{}		
\fi
\fi

% --------------------------- LOAD BOOK CLASS ---------------------------
\LoadClass{book}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PACKAGES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ----------------------------- PAGE FORMAT -----------------------------
\usepackage{geometry}
% -------------------------------- MATHS --------------------------------
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{mathtools}
% ------------------------------- FIGURES -------------------------------
\usepackage{graphicx} 
\usepackage{epstopdf} 
\usepackage{float}
\usepackage[caption=true,justification=centering,labelfont=bf]{subfig}
\captionsetup{labelfont=bf}      
% -------------------------------- TABLES -------------------------------
\usepackage{longtable}   
\usepackage{multirow} 
\usepackage{array}       
\usepackage{booktabs}    
% ------------------------------ BIBLIOGRAPHY ---------------------------
\usepackage[numbers,sort]{natbib} 
\usepackage[nottoc]{tocbibind} 
\usepackage{notoccite}
% ---------------------------- HEADERS/FOOTERS --------------------------
\usepackage{fancyhdr}
% ------------------------------ HYPERLINKS -----------------------------
\usepackage[hidelinks]{hyperref}
% -------------------------------- OTHER --------------------------------
\usepackage{enumitem}
\usepackage{ragged2e} 
\raggedbottom 
\usepackage{datetime}
\usepackage{lipsum}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% COMMANDS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ----------------------------- THESIS INFO -----------------------------
% Command to set thesis title
\newcommand{\ThesisTitle}{Empty Title} 
\newcommand{\SetThesisTitle}[1]{
\renewcommand{\ThesisTitle}{#1} 
\ifpdf \hypersetup{pdfinfo = {Title = {\ThesisTitle},}} \fi 
}
% Command to set thesis author
\newcommand{\ThesisAuthor}{Empty Author} 
\newcommand{\SetThesisAuthor}[1]{
\renewcommand{\ThesisAuthor}{#1} 
\ifpdf \hypersetup{pdfinfo = {Author = {\ThesisAuthor},}} \fi 
}
% Command to set thesis type
\newcommand{\ThesisType}{Empty Type} 
\newcommand{\SetThesisType}[1]{
\renewcommand{\ThesisType}{#1} 
\ifpdf \hypersetup{pdfinfo = {Subject = {\ThesisType},}} \fi 
}
% Command to set thesis keywords
\newcommand{\ThesisKeywords}{Empty Keyword} 
\newcommand{\SetThesisKeywords}[1]{
\renewcommand{\ThesisKeywords}{#1} 
\ifpdf \hypersetup{pdfinfo = {Keywords = {\ThesisKeywords},}} \fi 
}
% Command to set thesis supervisor
\newcommand{\ThesisSupervisor}{Empty Supervisor} 
\newcommand{\SetThesisSupervisor}[1]{
\renewcommand{\ThesisSupervisor}{#1} 
}
% Command to set thesis location
\newcommand{\ThesisLocation}{Empty Location} 
\newcommand{\SetThesisLocation}[1]{
\renewcommand{\ThesisLocation}{#1} 
}
% ----------------------------- REFERENCES ------------------------------
\newcommand{\figref}[1]{Fig.~\ref{#1}}
\newcommand{\tabref}[1]{Table~\ref{#1}} 
% -------------------------------- DATE ---------------------------------
\newdateformat{monthyeardate}{\monthname[\THEMONTH], \THEYEAR}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% STYLES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ------------------------------ PAGE STYLE -----------------------------
% Select paper size according to selected mode
\ifthenelse{\equal{\mode}{bookType}}
{
% - book type
\geometry{paperheight=240mm,paperwidth=170mm,top=20mm,bottom=25mm,
	      left=25mm,right=20mm,includehead}
}{
\ifthenelse{\equal{\mode}{reportType}}
{
% - report type
\geometry{top=25mm,bottom=25mm,left=30mm,right=30mm,includehead}
}{}
}

% ----------------------------- CHAPTER STYLE ---------------------------
% ..................... Chapter header fonts/spacing ....................
\newcommand{\FontChapterID}{\fontfamily{pnc}\LARGE}
\newcommand{\FontChapterName}{\rmfamily\Huge\bfseries}
\newlength{\afterTitleSpacing}
\setlength{\afterTitleSpacing}{0.25\textheight}
\newlength{\afterTitleSpacingNoNum}
\setlength{\afterTitleSpacingNoNum}{0.005\textheight}
\newlength{\titleRuleWidth}
\setlength{\titleRuleWidth}{0.8mm}
% ..................... Heading format for \chapter{} ...................
\def\@makechapterhead#1{
{
% Set variables for generating headers
\global\def\headerChapter{\leftmark}
\global\def\headerSection{\rightmark}
% Reset font
\parindent \z@ \raggedright \reset@font
% Set the first page of the chapter to plain style
\thispagestyle{plain}
% Determine the ID of the chapter and save it in \tempnum. For example
% for Chapter X, \tempnum is defined as Chapter X
\ifnum \c@secnumdepth >\m@ne
\if@mainmatter
	\def\tempnum{\chaptername \ \thechapter}
\else
	\def\tempnum{}
\fi
\fi
% Creater Chapter header
\makectitle{\tempnum}{#1}
}}
% .................... Heading format for \chapter*{} ...................
\def\@makeschapterhead#1{%
{
% Set variables for generating headers
\global\def\headerChapter{#1}
\global\def\headerSection{}
% Reset font
\parindent \z@ \raggedright \reset@font
% Set the first page of the chapter to plain style
\thispagestyle{plain}
% Creater Chapter header
\makectitleNoNum{}{#1}
\par
\nobreak}}
% ................ Chapter identifier plot for \chapter{} ...............
\newcommand{\makectitle}[2]
{
\noindent
% Chapter identifier
{\FontChapterID #1}
\\
% Horizontal line
\rule{\textwidth}{\titleRuleWidth}%
\vspace{0.7cm}
% Chapter name
{\FontChapterName #2}
\\
% Title-text spacing
\vspace{\afterTitleSpacing}
}
% ................ Chapter identifier plot for \chapter*{} ..............
\newcommand{\makectitleNoNum}[2]
{
\noindent
% Chapter name
{\FontChapterName #2}
% Horizontal line
\rule{\textwidth}{\titleRuleWidth}
% Title-text spacing
\vspace{\afterTitleSpacingNoNum}
}

% ----------------------------- SECTION STYLE ---------------------------
% ................................ Fonts ................................
\newcommand{\FontSection}{\Large\rmfamily\bfseries}
\newcommand{\FontSubSection}{\normalsize\rmfamily\bfseries}
\newcommand{\FontSubSubSection}{\small\rmfamily\bfseries}
% ............................. Section macro ...........................
\renewcommand\section{
\@startsection{section}{1}{\z@}{-4ex}{2ex}{\reset@font\FontSection}
}
% ........................... Subsection macro ..........................
\renewcommand\subsection{
\@startsection{subsection}{2}{\z@}{-2.25ex}{0.5ex}{\reset@font \FontSubSection}
}
% .......................... Subsubsection macro ........................
\renewcommand\subsubsection{
\@startsection{subsubsection}{3}{\z@}{-1ex}{0.5ex}{\reset@font \FontSubSubSection}}

% ---------------------------- PARAGRAPH STYLE --------------------------
% ................................ Fonts ................................
\newcommand{\FontParagraph}{\normalsize\textrm}
\newcommand{\FontSubParagraph}{\normalsize\textrm}
% ........................ Spacing and indetation .......................
% Spacing between paragraphs
\parskip=1.1ex  
% Indetation size
\parindent=15pt 
% ........................... Paragraph macro ...........................
\renewcommand\paragraph{
\@startsection{paragraph}{4}{\z@}{3.25ex \@plus 1ex \@minus .2ex}{-1em}{\reset@font\FontParagraph}
}
% .......................... Subparagraph macro .........................
\renewcommand\subparagraph{
\@startsection{subparagraph}{5}{\parindent}{3.25ex \@plus 1ex \@minus .2ex} {-1em}{\reset@font\FontSubParagraph}}

% -------------------------- HEADER/FOOTER STYLE ------------------------
% ............................. Definitions .............................
% Clear previous styles
\fancyhf{}
% Define font for headers
\newcommand{\FontHeader}{\rmfamily\fontsize{10.1}{11.5}\selectfont}
\newcommand{\FontPageNumber}{\rmfamily\selectfont}
% Define the variables used to create the headers
\global\def\headerChapter{}
\global\def\headerSection{}
% % Set height of headers
\setlength{\headheight}{13.6pt}
% ......................... Style for report type ........................
\fancypagestyle{reportTypeStyle}{
% Chapter name in a left-centered header
\fancyhead[L]{{\FontHeader \nouppercase{\headerChapter}}} 
% Author name in a right-centered header
\fancyhead[R]{{\FontHeader \nouppercase{\ThesisAuthor}}} 
% Page number in a centered footer
\fancyfoot[C]{\FontPageNumber\thepage} 
% Header and footer rule properties
\renewcommand{\headrulewidth}{0.4pt} 
\renewcommand{\footrulewidth}{0pt} 
}
% ......................... Style for book type .........................
\fancypagestyle{bookTypeStyle}{
% Chapter name in a left-centered header
\fancyhead[LE]{{\FontHeader \nouppercase{\headerChapter}}} 
\fancyhead[RO]{{\FontHeader \nouppercase{\headerSection}}} 
% Page number in a centered footer
\fancyfoot[LE]{\FontPageNumber\thepage} 
\fancyfoot[RO]{\FontPageNumber\thepage} 
% Header and footer rule properties
\renewcommand{\headrulewidth}{0.4pt} 
\renewcommand{\footrulewidth}{0pt} 
}
% .................... Style for 1st page of chapter ....................
% The first page of each chapter always uses the plain style, so we 
% modify it such that only the page number is shown
\fancypagestyle{plain}{}
\fancypagestyle{plain}{
\fancyhead{} 
\ifthenelse{\equal{\mode}{bookType}}
{
% - book type 
\fancyfoot[LE]{\FontPageNumber\thepage} 
\fancyfoot[RO]{\FontPageNumber\thepage}
}{
\ifthenelse{\equal{\mode}{reportType}}
{
% - report type
\fancyfoot[C]{\FontPageNumber\thepage} 
}{}
}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
% .................. Set style according to document type ................
\ifthenelse{\equal{\mode}{bookType}}
{
% - book type
\pagestyle{bookTypeStyle}
}{
\ifthenelse{\equal{\mode}{reportType}}
{
% - report type
\pagestyle{reportTypeStyle}
}{}
}
% ........... Force headers/footers to disaper in empty pages ...........
% Force headers/footers to disaper in empty pages
\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else\hbox{}\vspace*{\fill}\begin{center}\end{center}\vspace{\fill}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother

% ------------------------------ TABLE STYLE ----------------------------
% Align long tables to the left
\setlength{\LTleft}{0pt} 
% Define new format specification for a vertically and horizontally 
% centered column with a given column width 
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}} 

% --------------------------- BIBLIOGRAPHY STYLE ------------------------
\IfFileExists{./ThesisClass/IEEEtranN_mod.bst}
{
\bibliographystyle{ThesisClass/IEEEtranN_mod}
}
{
\IfFileExists{./../ThesisClass/IEEEtranN_mod.bst}
{
\bibliographystyle{../ThesisClass/IEEEtranN_mod}
}
{
\bibliographystyle{../../ThesisClass/IEEEtranN_mod}
}
}

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%