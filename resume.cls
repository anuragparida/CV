%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV
% LaTeX Class
% Version 3.0 (December 17, 2022)
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
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

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\ProvidesClass{resume}[2022/12/17 v3.0 Resume class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{article} % Load the base class

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage[parfill]{parskip} % Remove paragraph indentation

\usepackage{array} % Required for bold tabular columns

\usepackage{ifthen} % Required for ifthenelse statements

\usepackage{graphicx} % Required for including images

\pagestyle{empty} % Suppress headers and footers on all pages

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	top=0.6in, % Top margin
	bottom=0.6in, % Bottom margin
	left=0.75in, % Left margin
	right=0.75in, % Right margin
	%showframe, % Uncomment to show how the type block is set on the page
}

%----------------------------------------------------------------------------------------
%	NAME AND ADDRESS COMMANDS
%----------------------------------------------------------------------------------------

\newcommand{\name}[1]{\renewcommand{\name}{#1}} % Defines the \name command to set the user's name

\newcommand{\addressSep}{$\diamond$} % Set default address separator to a diamond symbol

% One, two or three address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax
\let \@linkone \relax
\let \@linktwo \relax
\let \@linkthree \relax

% The \address command is used to set the first, second and third address lines (the last 2 are optional)
\newcommand{\address}[1]{
	\@ifundefined{@addressone}{ % If the first address line has not been set yet, set it
		\def \@addressone {#1}
	}{
		\@ifundefined{@addresstwo}{ % If the second address line has not been set yet, set it
			\def \@addresstwo {#1}
		}{ % Otherwise, set the third address line
			\def \@addressthree {#1}
		}%
	}
}

\newcommand{\link}[1]{
	\@ifundefined{@linkone}{ % If the first address line has not been set yet, set it
		\def \@linkone {#1}
	}{
		\@ifundefined{@linktwo}{ % If the second address line has not been set yet, set it
			\def \@linktwo {#1}
		}{ % Otherwise, set the third address line
			\def \@linkthree {#1}
		}%
	}
}

% \printaddress is used to style an address line (provided in the single parameter to the command)
\newcommand{\printaddress}[1]{
\begingroup
\def \\ {\addressSep\ } % Redefine newlines (\\) to the address separator symbol so multiple lines of each address are output as a single line
\leftline{#1} % Output the centered address line
%\centerline{#1}
\endgroup
\par % End the paragraph to ensure correct spacing between lines
%\smallskip % Vertical whitespace between address lines
}

% \printname is used to output the user's name in a large size
\newcommand{\printname}{
	\begingroup
	\leftline{\MakeUppercase{\Huge\bfseries\name}}\leftline % Style and output the user's name % we used hfil before
	\bigskip\break % Vertical whitespace below name
	\endgroup
}

%----------------------------------------------------------------------------------------
%	OUTPUT THE NAME & ADDRESS LINES AUTOMATICALLY
%----------------------------------------------------------------------------------------

\let\ori@document=\document % Store the original \document command
\renewcommand{\document}{
	\ori@document  % Output the original \document command but add to it below
        \noindent
        \begin{minipage}[t][\height][b]{0.7\textwidth} % Left-aligned name and address in a minipage
	\printname % Output the user's name
    	\@ifundefined{@addressone}{}{\printaddress{\@addressone}} % Output the first address if specified
    	\@ifundefined{@addresstwo}{}{\printaddress{\@addresstwo}} % Output the second address if specified
            \@ifundefined{@addressthree}{}{\printaddress{\@addressthree}} % Output the second address if specified
    	\@ifundefined{@linkone}{}         {\bigskip\printaddress{\@linkone}} % Output the first link  if specified
            \@ifundefined{@linktwo}{}{\printaddress{\@linktwo}} % Output the first link  if specified
            \@ifundefined{@linktwo}{}{\printaddress{\@linkthree}} % Output the first link  if specified
        \end{minipage}%
        \begin{minipage}[t][\height][b]{0.3\textwidth} % Right-aligned image in a minipage
		\begin{flushright}
			\includegraphics[height=3.7cm]{file.jpg} % Adjust the image path and size
		\end{flushright}
	\end{minipage}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the major sections within the CV
\newenvironment{rSection}[1]{ % The single parameter is for the section title
	\smallskip % Vertical whitespace
	\MakeUppercase{\textbf{#1}} % Section title
	\medskip % Vertical whitespace
	\hrule % Horizontal rule
	\begin{list}{}{ % List to indent the entire content of the section
			\setlength{\leftmargin}{1.5em} % Indent to the left of the list
		}
		\item[] % Empty list item to enable indentation
		      }{
	\end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 parameters: company name, year(s) employed, job title and location
	\textbf{#1} \hfill {#2} % Bold company name and date to the right
	\ifthenelse{\equal{#3}{}}{}{ % If the third parameter is empty, don't output the job title and location line
		\\ % Job title and location on a new line
		\textit{#3} \hfill \textit{#4} % Output job title and location
	}%
	\smallskip % Vertical whitespace
	\begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
		\setlength{\itemsep}{-0.5em} \vspace{-0.5em} % Reduce vertical spacing between items in the list for a tighter look
		}{
	\end{list}
	\vspace{0.5em} % Vertical whitespace after the end of the list
}

\newenvironment{achSubsection}[2]{
	\textbf{#1} \hfill {#2} % Bold company name and date to the right

	\begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
		\setlength{\itemsep}{-0.5em} \vspace{-0.5em} % Reduce vertical spacing between items in the list for a tighter look
		}{
	\end{list}
	\vspace{0.5em} % Vertical whitespace after the end of the list
}