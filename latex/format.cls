\usepackage[centering,paperwidth=210mm,paperheight=297mm,body={180mm,247mm}]{geometry}

\usepackage{
  array,
  booktabs,
  hyperref,
  color,
  latexsym,
  verbatim,
  url,
  ulem,
  xeCJK,
  multirow,
  enumitem,
  fancyhdr,
  fontawesome,
  xifthen,
  tikz,
  calc
}

% \usepackage{latexsym,verbatim,url,CJKutf8}
\pagestyle{empty}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\urlstyle{same}

\hypersetup{
    colorlinks,%
    citecolor=black,%
    filecolor=black,%
    linkcolor=black,%
    urlcolor=black     % can put red here to better visualize the links
}
\definecolor{mygrey}{gray}{.9}
\definecolor{mygreylink}{gray}{.30}
\definecolor{labelgrey}{gray}{.50}

\raggedbottom\raggedright\setlength{\tabcolsep}{0in}
%\linespread{1.25}

%-----------------------------------------------------------
%Custom commands
\newcommand{\resitem}[1]{\item #1 \vspace{-2pt}}
\newcommand{\resheading}[1]{{\large \colorbox{mygrey}{\begin{minipage}{\textwidth-2\fboxsep}{\textbf{#1 \vphantom{p\^{E}}}}\end{minipage}}}}
\newcommand{\reslheading}[1]{{\large \colorbox{mygrey}{\begin{minipage}{0.8\textwidth-2\fboxsep}{\textbf{#1 \vphantom{p\^{E}}}}\end{minipage}}}}
\newcommand{\ressubheading}[5]{
\begin{tabular*}{\textwidth-5mm}{l@{\extracolsep{\fill}}r}
  \textbf{#1} \quad #2 & #5 \\
  #3 & #4 \\
\end{tabular*}\vspace{-6pt}}

\newcommand{\ressubsingleline}[3]{
\begin{tabular*}{\textwidth-5mm}{ll@{\extracolsep{\fill}}r}
    \textbf{#1} & \quad\textit{#2} & #3 \\
\end{tabular*}}

\newcommand{\paint}[3]{
  \begin{minipage}{#1}
    \includegraphics[width=#1,height=#2]{#3}
  \end{minipage}
}

\newcommand{\name}[1]{
  \centerline{\Huge\scshape{#1}}
  \vspace{1.2ex}
}

% defines one's email
% usage: \email{<email>}
\newcommand{\email}[1]{\faEnvelope\ \href{mailto:#1}{#1}}
% defines one's phone
% usage: \phone{<phone>}
\newcommand{\phone}[1]{\faPhone\ {#1}}
% defines one's linkedin
% usage: \linkedin{<linkedin>}
\newcommand{\linkedin}[2][]{\faLinkedin\
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}
% defines one's GitHub
% usage: \github{<github>}
\newcommand{\github}[2][]{\faGithub\
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}
% defines one's homepage
% usage: \homepage{<homepage>}
\newcommand{\homepage}[2][]{\faLink\
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}

\newcommand{\basicInfo}[1]{
  \centerline{\sffamily\large{#1}}
  \vspace{0.20ex}
}