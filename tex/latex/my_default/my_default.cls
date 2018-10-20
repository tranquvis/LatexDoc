\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_default}[My default document class]

\usepackage{my_base_packages}

\usepackage{my_config}
\usepackage{my_layout_config}

\LoadClass[
	fontsize=\myfontsize,	%% size of the main text
	paper=\mypapersize,  	%% paper format
	parskip=\myparskip,  	%% vertical space between paragraphs (instead of indenting first par-line)
	DIV=calc,            	%% calculates a good DIV value for type area; 66 characters/line is great
	headinclude=true,    	%% is header part of margin space or part of page content?
	footinclude=false,   	%% is footer part of margin space or part of page content?
	open=right,          	%% "right" or "left": start new chapter on right or left page
	appendixprefix=true, 	%% adds appendix prefix; only for book-classes with \backmatter
	bibliography=totoc,  	%% adds the bibliography to table of contents (without number)
	draft=\mydraft,      	%% if true: included graphics are omitted and black boxes mark overfull boxes in margin space
	BCOR=\myBCOR,        	%% binding correction (depends on how you bind the resulting printout.
		\mylaterality       %% oneside: document is not printed on left and right sides, only right side
                     		%% twoside: document is printed on left and right sides
]{scrbook}  %% article class of KOMA: "scrartcl", "scrreprt", or "scrbook"

\usepackage{my_doc_packages}
\usepackage{my_doc_colors}
\usepackage{my_doc_text}
\usepackage{my_doc_typography}
\usepackage{my_doc_style}

\usepackage{my_doc_commands}

%doc%
%doc% This packages is very handy to add notes.
%doc%
\providecommand{\mytodonotesoptions}{}
\usepackage[\mytodonotesoptions]{todonotes}  %% option "disable" removes all todonotes output from resulting document

\usepackage{my_doc_pdf}
%% Set margins.
\usepackage[top=3cm, bottom=3cm, left=2.5cm, right=2.5cm]{geometry}

%% Define header and footer styles.

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\setcounter{tocdepth}{2}

%% fancyhdr
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\space#1}{}} % define chapter mark in heading (remove chapter: 1. chaptername)

\fancypagestyle{main}{
  	\fancyhf{}
	\fancyhead[LO,LE]{\mysubject}
	\fancyhead[RO,RE]{\myauthorshort, \mydate}
	\fancyhead[CO,CE]{\textbf{\mytitle}}
	\fancyfoot[CO,CE]{\thepage}
}

\fancypagestyle{plain}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt} % no line in header area
  \fancyfoot[C]{\thepage}
} 

\appto\frontmatter{\pagestyle{plain}}
\appto\mainmatter{\pagestyle{main}}