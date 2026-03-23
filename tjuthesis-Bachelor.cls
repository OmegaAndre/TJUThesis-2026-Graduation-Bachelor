\def\usewhat{xelatex}
\ProvidesClass{tjuthesis-Bachelor}
\LoadClass[12pt,openany,oneside]{ctexbook}

\RequirePackage[a4paper,
            left=3.57cm,right=2.77cm,
            top=2.75cm,bottom=2.54cm,
            footskip=7.9mm,
            headheight=5mm,headsep=7.5mm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc} % 用于设置目录样式的包
\RequirePackage{graphicx} % 支持插图处理
\RequirePackage{pdfpages}
\RequirePackage{pifont}
\RequirePackage{booktabs} % 用于绘制三线表的横线
\RequirePackage{amsmath} % 基础数学包
\RequirePackage{amsfonts} % 支持公式中使用特殊字体
\RequirePackage[hidelinks]{hyperref} % 将交叉引用设置为超链接
\RequirePackage{newtxmath}
\RequirePackage{caption}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage[style=gb7714-2015]{biblatex}
% \RequirePackage{mathtools} % 基础数学包基础上增加额外命令
% \RequirePackage{tabularx} % 用于绘制表格
% \RequirePackage{multirow} % 支持在表格中横跨多列

\setmainfont{Times New Roman} 
\setsansfont{SimSun} %邪修大法修改参考文件序号为宋体之定义无衬线字体为宋体

\addbibresource{reference.bib}

\DeclareFieldFormat{labelnumberwidth}{
  {\sffamily\mkbibbrackets{#1}}%  使用自定义的无衬线字体命令
} %邪修大法修改参考文件序号为宋体之使用无衬线字体命令

% 定义一个新的分隔符：使用 \quad（1em 空格）
\DeclareCaptionLabelSeparator{quadspace}{\quad}

% 设置图注：字体为 small，分隔符用刚刚定义的 quadspace
\captionsetup[figure]{
  font=small,
  labelsep=quadspace
}

% 同样设置表格注
\captionsetup[table]{
  font=small,
  labelsep=quadspace
}

\lstset{
    basicstyle=\ttfamily\small,
    numbers=left,
    numberstyle=\tiny,
    stepnumber=1,
    numbersep=8pt,
    frame=single,
    framerule=0.5pt,
    breaklines=true,
    breakatwhitespace=false,
    tabsize=4,
    showstringspaces=false,
    showspaces=false,
    showtabs=false,
    columns=flexible,
    keepspaces=true,
    keywordstyle=\color{blue},
    commentstyle=\color{green!50!black},
    stringstyle=\color{red!60!black},
    backgroundcolor=\color{gray!5},
    captionpos=b
}

% 宋体、黑体伪粗体
\setCJKfamilyfont{son}[AutoFakeBold={3.17}]{SimSun} 
\renewcommand*{\songti}{\CJKfamily{son}}
\setCJKfamilyfont{hei}[AutoFakeBold={3.17}]{SimHei}
\renewcommand*{\heiti}{\CJKfamily{hei}}

\makeatletter
\fancypagestyle{plain}{
    \fancyhf{} % 清除所有页眉页脚重新设置
    \fancyhead[C]{\songti\zihao{5}\@cheading} % 页眉，宋体五号
    \fancyfoot[C]{\songti\zihao{-5} \thepage} % 页脚，宋体小五号，\thepage 代指页码
    \renewcommand{\headrulewidth}{0.5bp} % 页眉横线粗细
    \renewcommand{\footrulewidth}{0bp} % 页脚横线粗细
}
\makeatother

\fancypagestyle{noheader}{
    \fancyhf{} % 清除所有页眉页脚重新设置
    \fancyfoot[C]{\songti\zihao{-5} \thepage} % 页脚，宋体小五号，\thepage 代指页码
    \renewcommand{\headrulewidth}{0bp} % 页眉横线粗细
    \renewcommand{\footrulewidth}{0bp} % 页脚横线粗细
}

\makeatletter

\renewcommand\frontmatter{
    \@mainmatterfalse
    \clearpage
    \pagestyle{noheader} % 使用页眉页脚样式 noheader
    \pagenumbering{Roman} % 大写罗马数字页码（会重置页码）
    \setlength{\baselineskip}{20bp plus 2bp minus 2bp} % 设置弹性行高为 20±2bp （optional）
} 
\renewcommand\mainmatter{
    \@mainmattertrue
    \clearpage
    \pagestyle{plain} % 使用页眉页脚样式 plain 
    \pagenumbering{arabic} % 使用阿拉伯数字页码（会重置页码）
} 

\makeatother

\ctexset{
    contentsname={目\quad 录}, % 目录的标题 
    secnumdepth=3, % 标题编号深度
    chapter={
        format={\centering\zihao{-3}\heiti},   % 小三，黑体，居中
        number={\chinese{chapter}}, % 章节编号黑体中文数字
        name={第,章},   % 章前缀
        aftername=\quad, 
        beforeskip=30bp, % 段前间距 （规定 30~36 bp 之间）
        afterskip=30bp, % 段后间距 （规定 30~36 bp 之间）
    },
    section={
        format={\zihao{4}\heiti}, % 四号黑体
        beforeskip=20bp, % 段前间距 （规定 18~24 bp 之间）
        afterskip=20bp, % 段后间距 （规定 18~24 bp 之间）
        aftername=\quad, % 编号与标题之间空格
    },
    subsection={
        format={\zihao{4}\heiti}, % 四号黑体
        beforeskip=12bp, % 段前间距 （规定 12~15 bp 之间）
        afterskip=12bp, % 段后间距 （规定 12~15 bp 之间）
        aftername=\quad,
    }
}

\addtocontents{toc}{\protect\thispagestyle{noheader}} % 设置目录页的页眉页脚样式为 noheader 
\setcounter{tocdepth}{2} % 设置 tocdepth 目录深度 （2 = subsection，即三级标题）
\titlecontents{chapter}
    [0em] % 缩进为 0em = 0 字符
    {\heiti\zihao{-4}}
    {\thecontentslabel\quad}{}
    {\hspace{.5em}\titlerule*[5bp]{.}\zihao{-4}\contentspage} %
\titlecontents{section}
    [2em] % 缩进为 2em = 4 字符
    {\zihao{-4}}
    {\thecontentslabel\quad}{}
    {\hspace{.5em}\titlerule*[5bp]{.}\zihao{-4}\contentspage}
\titlecontents{subsection}
    [4em] % 缩进为 4em = 4 字符
    {\zihao{-4}}
    {\thecontentslabel\quad}{}
    {\hspace{.5em}\titlerule*[5bp]{.}\zihao{-4}\contentspage}

\renewcommand{\tablename}{表}                                     % 插表题头
\renewcommand{\figurename}{图}                                    % 插图题头
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}       % 使图编号为 7-1 的格式 %\protect{~}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}         % 使表编号为 7-1 的格式
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}   % 使公式编号为 7-1 的格式
% \newcommand{\ud}{\mathrm{d}} % 定义微分符号的命令，使用 upright 字体

\newcommand{\figuremacro}[4]{
  \begin{figure}[#1]
    \centering
    \includegraphics[width=#4\textwidth]{#2}
    \caption{\zihao{5}#3}
    \label{fig:\thefigure}
  \end{figure}
}

\makeatletter

\newlength{\@title@width}

\def\ctitle#1{\def\@ctitle{#1}}\def\@ctitle{}
\def\caffil#1{\def\@caffil{#1}}\def\@caffil{}
\def\csubject#1{\def\@csubject{#1}}\def\@csubject{}
\def\cgrade#1{\def\@cgrade{#1}}\def\@cgrade{}
\def\cauthor#1{\def\@cauthor{#1}}\def\@cauthor{}
\def\cnumber#1{\def\@cnumber{#1}}\def\@cnumber{}
\def\csupervisor#1{\def\@csupervisor{#1}}\def\@csupervisor{}
\def\cheading#1{\def\@cheading{#1}}\def\@cheading{}

\def\makecover{
    \begin{titlepage}
        \thispagestyle{empty}
        \vspace*{31.5pt}
        \begin{center}
            \begin{figure}[h]
                \centering
                \includegraphics[width=0.4\textwidth]{figures/tjuname.eps}
            \end{figure}
            
            \vspace*{21pt}
            \zihao{2}{\heiti\textbf{本科生毕业论文}}
            \vspace*{52.5pt}

            \begin{figure}[h]
                \centering
                \includegraphics[width=0.3\textwidth]{figures/tjulogo.eps}
            \end{figure}

            \vspace*{5pt}
            \zihao{3}{\heiti\textbf{题目：\@ctitle}}
            \vspace*{16pt}

            \vspace*{24pt}
            \renewcommand\arraystretch{1.5}

            {\zihao{3}\songti{
                \textbf{
                    \begin{tabular}{lc} 
                        学\qquad 院 &  \underline{\makebox[\@title@width][c]{\@caffil}}     \\
                        专\qquad 业 &  \underline{\makebox[\@title@width][c]{\@csubject}}   \\
                        年\qquad 级 &  \underline{\makebox[\@title@width][c]{\@cgrade}}     \\
                        姓\qquad 名 &  \underline{\makebox[\@title@width][c]{\@cauthor}}    \\
                        学\qquad 号 &  \underline{\makebox[\@title@width][c]{\@cnumber}}    \\
                        指导教师 &  \underline{\makebox[\@title@width][c]{\@csupervisor}}   \\
                    \end{tabular}
                    }
                }
            }
            \vspace*{21pt}

        \end{center}
    \end{titlepage}
}

\def\cabstractcn#1{\def\@cabstractcn{#1}}\def\@cabstractcn{}
\def\cabstracten#1{\def\@cabstracten{#1}}\def\@cabstracten{}
\def\ckeywordcn#1{\def\@ckeywordcn{#1}}\def\@ckeywordcn{}
\def\ckeyworden#1{\def\@ckeyworden{#1}}\def\@ckeyworden{}

\def\makeabstract{
    % 中文摘要页

    \chapter*{\zihao{2}\textbf{\songti 摘 \qquad 要}}
    \thispagestyle{noheader}

    \@cabstractcn

    \bigskip % 空一行

    \noindent {\songti\zihao{4}\textbf{关键词：}} 
    \@ckeywordcn

    % 英文摘要页

    \chapter*{\zihao{2}\textbf{ABSTRACT}}
    \thispagestyle{noheader}

    \@cabstracten

    \bigskip 
    \noindent {\zihao{4}\textbf{KEY WORDS:} }
    \@ckeyworden
    % 很奇怪这里用的是中文全角分号
}

\makeatother