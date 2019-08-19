%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[10pt,letterpaper]{article} % Font size and paper type

% Set the font to Tex Gyre Pagella
\usepackage{tgpagella}

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements

\pagestyle{empty} % Suppress page numbers

\usepackage[none]{hyphenat}

\usepackage{hyperref} % Hyperlinks
\hypersetup{
    colorlinks=false
}


% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\bigskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section
\def\subsectionskip{\medskip}


%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\vert$} % Set default address separator to a vertical line

% One or two info lines can be specified
\let \@info1 \relax
\let \@info2 \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \info #1{
    \@ifundefined{@infoone}{
        \def \@infoone {#1}
    }{
        \def \@infotwo {#1}
    }
}

% \printaddress is used to style an address line (given as input)
\def \printinfo #1{
    \begingroup
        \def \\ {\addressSep\ }
        \centerline{#1}
    \endgroup
    \par
    \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
    \begingroup
        \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
        \nameskip\break
    \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
    \ori@document  % Begin document
    \printname % Print the name specified with \name
    \@ifundefined{@infoone}{nah}{\printinfo{\@infoone}}
    \@ifundefined{@infotwo}{nah}{\printinfo{\@infotwo}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
    \sectionskip
    \MakeUppercase{\bf #1} % Section title
    \sectionlineskip
    \hrule % Horizontal line
    \begin{list}{}{\leftmargin=1em}
        \item[]
}{
    \end{list}
}

%----------------------------------------------------------------------------------------
%	LIST SUBSECTION FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
    {\bf #1} \hfill {#2} % Bold company name and date on the right
    \ifthenelse{\equal{#3}{}}{}{\\ {\em #3} \hfill {\em #4}} % Italic job title and location
    \smallskip
    \begin{flushleft}
    \begin{list}{-}{\leftmargin=1em} % Options for bullet symbol and subsection indentation
        \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
}{
    \end{list}
    \end{flushleft}
}

%----------------------------------------------------------------------------------------
%	COLUMN LIST SUBSECTION FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rFreeSubsection}[6]{ % 6 input arguments - school, grad date, major, GPA, list title, num cols
    {\bf #1} \hfill {#2} % Bold school name and graduation date on the right
    \ifthenelse{\equal{#3}{}}{\\}{\\ {\em #3} \hfill {\em #4}} % Italic major and GPA on the right
    \begin{flushleft}
}{
    \end{flushleft}
}