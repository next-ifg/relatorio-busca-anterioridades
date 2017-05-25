
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{RelatorioCITE}[2017/05/25 v0.2]

\usepackage{ifpdf}

%%%%%%%%%% Classe base
\LoadClass[11pt,onecolumn,a4paper,twoside,openright]{report} %% essencial

\RequirePackage[utf8]{inputenc} %% essencial
\RequirePackage[T1]{fontenc}
\RequirePackage[brazilian]{babel} %% essencial %% docs em vários idiomas

\RequirePackage{ifthen} %% essencial %% operador de condicionais
\RequirePackage{calc} %% essencial %% operações matemáticas
\RequirePackage{graphicx} %% essencial %% para inserir figuras
\RequirePackage{color} %% essencial %% aplicar cores no texto
\RequirePackage{array} %% essencial %% variante para arranjos e tabelas 
\RequirePackage{setspace} %% essencial %% define espaços entre linhas no texto
\RequirePackage{multirow} %% essencial %% para uso de tabelas
\RequirePackage{supertabular} %% essencial %% para uso de tabelas
\RequirePackage{tabularx} %% essencial %% para uso de tabelas
\RequirePackage{longtable} %% essencial %% para uso de tabelas
\RequirePackage{amsmath,amssymb,amsthm} %% essencial %% para linguagem matemática
\RequirePackage{indentfirst}
\RequirePackage[explicit]{titlesec}
\RequirePackage{chngcntr}       % Altera contadores

\usepackage{fancyhdr}
%\usepackage{showframe}


\fancypagestyle{RelatorioBuscaAnt}{
  \fancyhead{}
  \fancyfoot{}
  \lhead{%
    \includegraphics[height=35px]{./logo-ifg}%
  }%
  \rhead{%
    \includegraphics[height=40px]{./logo-cite-completo}%
  }%
  \cfoot{}%
  \rfoot{\thepage}%
}


\DeclareGraphicsExtensions{.pdf,.png,.jpg}

%% opcoes de cores
%% linkcolor=blue,citecolor=gray,urlcolor=cyan
\definecolor{gray}{rgb}{0.4,0.4,0.4}
\definecolor{bblue}{rgb}{0,0,.8} %% tom azul mais escuro

\RequirePackage[%
breaklinks,%
bookmarksopen=true,%
colorlinks=true,%
linkcolor=bblue,%
citecolor=bblue,%
urlcolor=bblue,%
bookmarksnumbered=true,%
hyperindex=true,%
verbose=true%
]{hyperref} %% essential %% gera pdf/dvi com links

\RequirePackage{url}
\RequirePackage[num, overcite]{abntex2cite}
\citebrackets[]


\DeclareOption*{} %

% Padrão para esta classe de documetnos
\gdef\@CapituloSemFormat{true}
\gdef\@tipocitacao{num}

\DeclareOption{RelatorioAnterioridade}{%
  \typeout{>> Opcao: RelatorioAnterioridade}
  % Opções padrão definidas acima
  \let\include\input
}

\ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% configuracao das margens 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\normalsize

%%% usa o package geometry para definir as dimensões do documento
\usepackage[%
a4paper,%
margin=2cm,%
bindingoffset=1cm,%
includehead,%
includefoot,%
headheight=1.5cm,%
headsep=5mm,%
]{geometry}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\newlength{\linha}
\newlength{\baselsdefault}
\newlength{\parsdefault}
\newlength{\baselinespace}
\newlength{\parspace}

\setlength{\linha}{11pt} %! o mesmo valor passado para a classe report
\setlength{\baselsdefault}{\baselineskip}
\setlength{\parsdefault}{\parskip}
\setlength{\baselinespace}{1.5\linha} %% distancia entre linhas
\setlength{\parspace}{\linha}%  distancia a mais entre paragrafos

% setspace
\AtBeginDocument{%
  \setlength{\baselineskip}{\baselinespace}%
}%
\onehalfspacing%
\AtBeginDocument{%
  \setlength{\parskip}{\parspace}%
}%
\setlength{\parindent}{1.25cm}
\frenchspacing % Não põe um espaco adicional após ponto final.
\sloppy % força que todas as linhas fiquem dentro das margens.

% footnoterule 	
\renewcommand{\footnoterule}{\vspace*{-3pt}%
  \rule{3cm}{0.4pt}\vspace*{2.6pt}%
}

% - Define contadores e quais serao numerados:
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}
% limites para o posicionamento de objetos flutuantes
\setcounter{topnumber}{3}
\renewcommand{\topfraction}{0.85}
\setcounter{bottomnumber}{2}
\renewcommand{\bottomfraction}{0.65}
\setcounter{totalnumber}{5}
\renewcommand{\textfraction}{0.15}
\renewcommand{\floatpagefraction}{0.60}

% Distancias entre objetos flutuantes e texto:
\setlength{\floatsep}{\baselinespace}\addtolength{\floatsep}{\parspace}
\setlength{\textfloatsep}{\parspace}\addtolength{\textfloatsep}{2\parspace}
\setlength{\intextsep}{\baselinespace}\addtolength{\intextsep}{\parspace}

% - Parametros gerais.
\newlength{\seistoques}
\newlength{\lrotulo}
\newlength{\sepitem}
\settowidth{\seistoques}{\ \ \ \ \ \ }
\settowidth{\lrotulo}{xx}
\setlength{\sepitem}{0.5em}
\setlength{\leftmargini}{\seistoques+2\lrotulo}
\setlength{\leftmarginii}{2\lrotulo}
\setlength{\leftmarginiii}{2\lrotulo}
\setlength{\labelsep}{\sepitem}
\setlength{\labelwidth}{\lrotulo}
\setlength{\partopsep}{0pt}
\setlength{\topsep}{0pt}
\setlength{\rightmargin}{0pt}
\setlength{\itemindent}{0pt}
\setlength{\listparindent}{0pt}
\setlength{\parsep}{0pt}
\setlength{\itemsep}{10pt}
\setlength{\LTcapwidth}{\textwidth}

% - Listas enumeradas:
\renewcommand{\theenumi}{\alph{enumi}}
% \renewcommand{\theenumii}{\arabic{enumii}}
\renewcommand{\theenumii}{\bfseries--}
% \renewcommand{\theenumiii}{\roman{enumiii}}
\renewcommand{\labelenumi}{\theenumi)}
\renewcommand{\labelenumii}{\theenumii}
% \renewcommand{\labelenumiii}{\theenumiii}

\AtBeginDocument{%
  \renewcommand{\refname}{REFERÊNCIAS BIBLIOGRÁFICAS}
  \renewcommand{\figurename}{Figura}% %awss
  \renewcommand{\tablename}{Tabela}% %awss
  \renewcommand{\indexname}{ÍNDICE}%
  \renewcommand{\appendixname}{APÊNDICE}
  \renewcommand{\contentsname}{SUMÁRIO} %awss
  \renewcommand{\listtablename}{LISTA DE TABELAS} %awss
  \renewcommand{\listfigurename}{LISTA DE FIGURAS} %awss
  \newcommand{\nomeanexo}{ANEXO}
  \newcommand\anexoautorefname{Anexo}%
  \newcommand{\listsimbname}{LISTA DE SÍMBOLOS}
  \newcommand{\FONTEname}{Fonte}
}


% 
% Variaveis
% 
\newcommand*{\nomeInventor}[1]{\gdef\@nomeInventor{#1}}
\newcommand*{\emailInventor}[1]{\gdef\@emailInventor{#1}}
\newcommand*{\nomeAutor}[1]{\gdef\@nomeAutor{#1}}
\newcommand*{\emailAutor}[1]{\gdef\@emailAutor{#1}}
\newcommand*{\instituicao}[2]{\gdef\@instituicao{#1}\gdef\@instituicaob{#2}}
\newcommand*{\cidade}[1]{\gdef\@cidade{#1}}
\newcommand*{\tipoRelatorio}[1]{\gdef\@tipoRelatorio{#1}}
\newcommand*{\descRelatorio}[1]{\gdef\@descRelatorio{#1}}
\newcommand*{\tituloProjeto}[1]{\gdef\@tituloProjeto{#1}}

%% 
%% Redefinição do maketitle
%% 
\renewcommand{\maketitle}{%
  \thispagestyle{empty}
  \begin{titlepage}%
    \begin{center}
      \begin{minipage}[c]{.45\linewidth}
        \centering%
        \includegraphics[width=\linewidth]{./logo-ifg.png}%
      \end{minipage}%
      \hfill%
      \begin{minipage}[c]{.45\linewidth}
        \centering%
        \includegraphics[width=.9\linewidth]{./logo-cite-completo.png}%
      \end{minipage}
      %% 
      {%
        \null%
        \vspace*{\stretch{2}}
        {\bfseries\LARGE\MakeUppercase\@tipoRelatorio}%
        \vspace*{\stretch{1}}
      }%
      {%
        \par\@descRelatorio%
      }%
      {%
        \par\text{Projeto:~}\@tituloProjeto%
      }%
      {\par\vspace*{\stretch{2}}{\normalfont\normalsize\@cidade, \@date}}
    \end{center}
  \end{titlepage}%
  \pagestyle{empty}%
  \orgcleardoublepage{}%
} %% renew maketitle


%% 
%% Novos comandos
%% 

% 
% inicioRelatorio
% 

% Comando para avisar do inicio do texto do documento
\newcommand{\inicioRelatorio}{%
  \newpage{}
  \setcounter{page}{1}
  \pagestyle{RelatorioBuscaAnt}%
  {\par\noindent\normalsize\bfseries\MakeUppercase\@tipoRelatorio\\}
  {\normalsize\@descRelatorio\\}
  {\normalsize\textbf{Nome do inventor:~}\@nomeInventor\\}
  {\normalsize\textbf{Nome do autor da pesquisa:~}\@nomeAutor\\}

  \FormataCapitulo
  \assignpagestyle{\chapter}{RelatorioBuscaAnt}
}

% 
% inicioApendice
% 
% Indica o inicio do Apêndice
\newcommand{\inicioApendice}{
  \setlength{\labelsep}{\sepitem}
  \renewcommand{\chaptername}{\appendixname}
  
  \appendix
}

% comando para avisar do inicio do Anexo
\newcommand{\inicioAnexo}{%
  \orgcleardoublepage
  \setlength{\labelsep}{\sepitem}
  \appendix
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \renewcommand{\appendixname}{\nomeanexo}

  \newcounter{patentcounter}

  %% Redefine os Capitulos para centralizar verticalmente

  \titleformat{\chapter}[display]
  {\normalfont\bfseries\large\filcenter}
  {\vspace*{\fill}
    \titlerule[1pt]%
    \vspace{1em}%
    \MakeUppercase{\chaptertitlename~\thechapter~---~##1}}
  {1em}
  {\titlerule}
  [\vspace*{\fill}\newpage]

  \titlespacing*{\chapter}{0pt}{0pt}{0pt}

  \FormataSecoes
}

\newcommand{\novoAnexo}{%
  \orgcleardoublepage%
  \setcounter{patentcounter}{0}
}%

\newcommand{\inicioReferencias}{%
  \orgcleardoublepage%
  \FormataCapitulo%
}%


%% Redefinicoes de comandos

\AtBeginDocument{
  %% codigo para possiveis problemas de caption e float
  %% testar melhor
  \makeatletter
  \newcommand{\@ldtable}{}
  \let\@ldtable\table
  \renewcommand{\table}{%
    \setlength{\@tempdima}{\abovecaptionskip}%
    \setlength{\abovecaptionskip}{\belowcaptionskip}%
    \setlength{\belowcaptionskip}{\@tempdima}%
    \@ldtable}
  \makeatother 
}

%% 
%% Capitulos, Seções e Subseções
%% 

\AtBeginDocument{
  \newcommand*{\orgcleardoublepage}{}
  \let\orgcleardoublepage\cleardoublepage
  \let\cleardoublepage\relax
}

\newcommand*{\FormataCapitulo}{
  \titleformat{\chapter}[display]
  {\normalfont\large\bfseries} % The style of the section title
  {} % a prefix
  {0pt} % How much space exists between the prefix and the title
  {\MakeUppercase{##1}} % How the section is represented
  \titlespacing*{\chapter}{0pt}{-12pt}{24pt}
  
}

\newcommand*{\FormataSecoes}{
  \titleformat{\section}[display]
  {\normalfont\large\bfseries} % The style of the section title
  {} % a prefix
  {0pt} % How much space exists between the prefix and the title
  {##1} % How the section is represented
  [\setcounter{patentcounter}{0}]
  \titlespacing*{\section}{0pt}{-0pt}{12pt}

  \titleformat{\subsection}[display]
  {\normalfont\normalsize\bfseries} % The style of the section title
  {} % a prefix
  {0pt} % How much space exists between the prefix and the title
  {##1} % How the section is represented
  [\setcounter{patentcounter}{0}]
  \titlespacing*{\subsection}{0pt}{-0pt}{12pt}
}

\newcommand*{\itemBaseDados}[2]{\item \textbf{#1} --- #2.}
\newenvironment{BaseDados}{
  \begin{itemize}%
  }{%
  \end{itemize}
}

\newcommand*{\itemCodigoClassIPC}[2]{\item \textbf{#1}: #2.}
\newenvironment{CodigoClassIPC}{
  \begin{itemize}%
  }{%
  \end{itemize}
}

\newcommand*{\itemPalavrasChave}[2]{\item \textbf{#1}: #2.}
\newenvironment{PalavrasChave}{
  \begin{itemize}%
  }{%
  \end{itemize}
}

\newcommand*{\itemResultado}[2]{\item \textbf{#1} --- #2.}
\newenvironment{Resultados}{
  \begin{singlespace}
    \begin{itemize}%
    }{%
    \end{itemize}
  \end{singlespace}
}


\newcommand{\CampoAssinatura}[3]{%
  \begin{center}
    {\makebox[#1][c]{\hrulefill}}\\
    {#2}\\
    {#3}
  \end{center}
}

\newcommand{\AssinaturasResultado}{%
  \vfill
  \CampoAssinatura{14cm}{\@nomeAutor}%
  {Resposável pela pesquisa}
  \vspace*{5em}
  \CampoAssinatura{14cm}{\@nomeInventor}%
  {Resposável pela projeto}
  \vfill
}



\newcommand{\PatenteINPI}[6]{%
  %% incrementa o contador
  \stepcounter{patentcounter}
  %% Titulo
  {\vspace*{\baselsdefault}}
  {\par\noindent{\bfseries\arabic{patentcounter}. \MakeUppercase{#1}}}
  %% Numero do pedido
  {\par\noindent\normalsize\text{Número do pedido: }#2}
  %% Data de Depósito e Publicação
  {\par\noindent\normalsize%
    \makebox[.45\linewidth][l]{\text{Data do Depósito: }#3}%
    \makebox[.45\linewidth][r]{\text{Data da Publicação: }#4}%
  }
  %% Figura
  \ifthenelse{\equal{#6}{}}{%
    % Argumento Vazio
  }{ %else
  \begin{figure}[!h]
    \centering
    {\includegraphics[width=.9\linewidth]{#6}}
  \end{figure}
  }
  %% Resumo
  {\par\noindent{\bfseries\text{Resumo: }}%
    \normalsize\rmfamily#5} 
}

\newcommand{\PatenteESPACENET}[5]{%
  %% incrementa o contador
  \stepcounter{patentcounter}
  %% Titulo
  {\vspace*{\baselsdefault}}
  {\par\noindent{\bfseries\arabic{patentcounter}. \MakeUppercase{#1}}}
  %% Numero do pedido
  {\par\noindent\normalsize\text{Bibliographic data: }#2\;%
    ---\;#3}
  %% Figura
  \ifthenelse{\equal{#5}{}}{%
    % Argumento Vazio
  }{ %else
  \begin{figure}[!h]
    \centering
    {\includegraphics[width=.9\linewidth]{#5}}
  \end{figure}
  }
  %% Resumo
  {\par\noindent{\bfseries\text{Abstract: }}% 
    \normalsize\rmfamily#4} 
}

\newcommand{\ArtigoWEBOFSCIENCE}[8]{%
  %% incrementa o contador (utiliza o mesmo contador de patentes para artigos)
  \stepcounter{patentcounter}
  %% Titulo
  {\vspace*{\baselsdefault}}
  {\par\noindent{\bfseries\arabic{patentcounter}. \MakeUppercase{#1}}}
  %% Autor(es) separados por virgula
  {\par\noindent\normalsize\text{Por:~}#2}%
  %% Periódico (Revista)
  {\par\noindent\normalsize\MakeUppercase{#3}%
    %% Volume
    \ifthenelse{\equal{#4}{}}{%
      % Argumento Vazio
    }{ %else
      \qquad\text{Volume:~}\mbox{#4}%
    }
    %% Edição
    \ifthenelse{\equal{#5}{}}{%
      % Argumento Vazio
    }{ %else
      \qquad\text{Edição:~}\mbox{#5}%
    }
    %% Paginas
    \ifthenelse{\equal{#6}{}}{%
      % Argumento Vazio
    }{ %else
      \qquad\text{Páginas:~}\mbox{#6}%
    }
    %% Data Publicação
    \ifthenelse{\equal{#7}{}}{%
      % Argumento Vazio
    }{ %else
      \qquad\text{Publicado:~}\mbox{#7}%
    }
  }%
  %% Resumo
  {\par\noindent{\bfseries\text{Resumo: }}% 
    \normalsize#8}
}