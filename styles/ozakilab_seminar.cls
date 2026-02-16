% ozakilab_seminar.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ozakilab_seminar}[2025/10/01 seminar class for LuaLaTeX]

% ---- 基底クラス ----
\LoadClassWithOptions{ltjsarticle}

\makeatletter

% -----------------
% メタ情報 
% -----------------
\def\@etitle{}
\def\@eauthor{}
\def\@lab{}
% \def\@keywords{}
\newcommand{\etitle}[1]{\gdef\@etitle{#1}}
\newcommand{\eauthor}[1]{\gdef\@eauthor{#1}}
\newcommand{\lab}[1]{\gdef\@lab{[#1]}}
% \newcommand{\keywords}[1]{\gdef\@keywords{#1}}

% -----------------
% 概要
% -----------------
\newbox\@abstractbox
\renewenvironment{abstract}{%
  \global\setbox\@abstractbox\vbox\bgroup
  \begin{center}
  \begin{minipage}{0.9\textwidth}
  {\normalsize\bfseries Abstract}
  \normalsize\parindent=1\zw\relax
  \linespread{0.8}\selectfont
}{%
  \end{minipage}
  \end{center}
  \egroup
}

% -----------------
% タイトル生成
% -----------------
\renewcommand\maketitle{%
  \twocolumn[%
    \begingroup
      \setlength{\parindent}{0pt}%
      \begin{center}
        {\LARGE \bfseries \@title \par}\vskip 1em
        {\Large \@etitle \par}\vskip 2em
        {\large \@author \quad \@eauthor \quad \@lab \par}\vskip 1em
        \box\@abstractbox
      \end{center}
    \endgroup
  ]%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
}

% -----------------
% 見出し
% -----------------
\renewcommand{\section}{%
  \@startsection{section}{1}{\z@}%
  {.3\Cvs \@plus.2\Cdp \@minus.2\Cdp}%
  {.3\Cvs \@plus.2\Cdp \@minus.2\Cdp}%
  {\centering\normalsize\bfseries}%
}
\renewcommand{\subsection}{%
  \@startsection{subsection}{2}{\z@}%
  {.2\Cvs \@plus.1\Cdp \@minus.1\Cdp}%
  {.2\Cvs \@plus.1\Cdp \@minus.1\Cdp}%
  {\normalsize\bfseries}%
}
\renewcommand{\subsubsection}{%
  \@startsection{subsubsection}{3}{\z@}%
  {.1\Cvs \@plus.1\Cdp \@minus.1\Cdp}%
  {.1\Cvs \@plus.1\Cdp \@minus.1\Cdp}%
  {\normalsize}%
}
\renewcommand{\thesection}{\@arabic\c@section.}
\renewcommand{\thesubsection}{\thesection\@arabic\c@subsection}


% -----------------
% キャプション
% -----------------
\RequirePackage{amsmath, amssymb, bm}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[nameinlink,capitalise,noabbrev]{cleveref}
\RequirePackage{subcaption}

\captionsetup{font=small,labelfont=bf}
\captionsetup[subfigure]{labelformat=simple, labelsep=space}
\renewcommand{\thesubfigure}{(\alph{subfigure})}

\renewcommand{\figurename}{Fig.~}
\renewcommand{\tablename}{Table~}

\crefname{figure}{Fig.}{Figs.}
\Crefname{figure}{Fig.}{Figs.}
\crefname{subfigure}{Fig.}{Figs.}
\Crefname{subfigure}{Fig.}{Figs.}
\crefname{table}{Table}{Tables}
\Crefname{table}{Table}{Tables}
\crefname{equation}{Eq.}{Eqs.}
\Crefname{equation}{Eq.}{Eqs.}
\crefname{lstlisting}{Listing}{Listings}
\Crefname{lstlisting}{Listing}{Listings}
\crefname{section}{Sec.}{Secs.}
\Crefname{section}{Sec.}{Secs.}

\crefformat{figure}{\textbf{#2Fig.~#1#3}}
\Crefformat{figure}{\textbf{#2Fig.~#1#3}}
\crefformat{subfigure}{\textbf{#2Fig.~#1#3}}
\Crefformat{subfigure}{\textbf{#2Fig.~#1#3}}
\crefformat{table}{\textbf{#2Table~#1#3}}
\Crefformat{table}{\textbf{#2Table~#1#3}}
\crefformat{section}{\textbf{#2Sec.~#1#3}}
\Crefformat{section}{\textbf{#2Sec.~#1#3}}
\crefformat{equation}{\textbf{#2Eq.~(#1)#3}}
\Crefformat{equation}{\textbf{#2Eq.~(#1)#3}}
\crefformat{lstlisting}{\textbf{#2Listing~#1#3}}
\Crefformat{lstlisting}{\textbf{#2Listing~#1#3}}

%-------------------------------
% 参考文献
%-------------------------------
\makeatletter
\AtBeginDocument{
  \@ifpackageloaded{biblatex}{
    \ExecuteBibliographyOptions{
      % style=numeric-comp,
      % sorting=none,
      doi=false,
      isbn=false,
      url=false,
      eprint=false
    }
    \renewcommand*{\bibfont}{\footnotesize}
    % \defbibheading{bibliography}{\section*{[参考文献]}}
    \defbibheading{bibliography}{\section*{{\footnotesize\bfseries [参考文献]}}}
  }{}
}
\makeatother

%-------------------------------
% レイアウト
%-------------------------------
\RequirePackage[
  paper=a4paper,
  top=20mm, bottom=20mm,
  left=20mm, right=20mm,
  columnsep=10mm
]{geometry}
\raggedbottom

\setlength{\parindent}{1\zw}
\setlength{\parskip}{0mm}
\pagestyle{empty}

\makeatother