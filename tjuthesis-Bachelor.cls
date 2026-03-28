\newif\if@songnumber

\DeclareOption{songnumber}{\@songnumbertrue}
\ProcessOptions*

\ProvidesClass{tjuthesis-Bachelor}
\LoadClass[12pt,openany,oneside]{ctexbook}

\RequirePackage[a4paper,
            left=3.57cm,right=2.77cm,
            top=2.75cm,bottom=2.54cm,
            footskip=7.9mm,
            headheight=5mm,headsep=7.5mm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}   % 用于设置目录样式的包
\RequirePackage{graphicx}   % 支持插图处理
\RequirePackage{pdfpages}
\RequirePackage{pifont}
\RequirePackage{booktabs}   % 用于绘制三线表的横线
\RequirePackage{amsmath}    % 基础数学包
\RequirePackage{amsfonts}   % 支持公式中使用特殊字体
\RequirePackage[hidelinks]{hyperref}    % 将交叉引用设置为超链接
\RequirePackage{newtxmath}
\RequirePackage{caption}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage[style=gb7714-2015]{biblatex}
% \RequirePackage{mathtools}    % 基础数学包基础上增加额外命令
% \RequirePackage{tabularx} % 表格自动换行
% \RequirePackage{multirow} % 支持在表格中横跨多列

\setmainfont{Times New Roman}

\if@songnumber
    \setsansfont{SimSun} %邪修大法修改参考文件序号为宋体之定义无衬线字体为宋体
    \DeclareFieldFormat{labelnumberwidth}{
    {\sffamily\mkbibbrackets{#1}}%  使用自定义的无衬线字体命令
    } %邪修大法修改参考文件序号为宋体之使用无衬线字体命令
\fi

% 宋体、黑体伪粗体
\setCJKfamilyfont{son}[AutoFakeBold={2}]{SimSun} 
\renewcommand*{\songti}{\CJKfamily{son}}
\newcommand{\songtibf}{\songti\textbf}
\setCJKfamilyfont{hei}[AutoFakeBold={2}]{SimHei}
\renewcommand*{\heiti}{\CJKfamily{hei}}
\newcommand{\heitibf}{\heiti\textbf}

\fancypagestyle{plain}{
    \fancyhf{}  % 清除所有页眉页脚重新设置
    \fancyhead[C]{\songti\zihao{5}\@cheading}   % 页眉，宋体五号
    \fancyfoot[C]{\songti\zihao{-5}\thepage}    % 页脚，宋体小五号，\thepage 代指页码
    \renewcommand{\headrulewidth}{0.5bp}    % 页眉横线粗细
    \renewcommand{\footrulewidth}{0bp}      % 页脚横线粗细
}

\fancypagestyle{noheader}{
    \fancyhf{}  % 清除所有页眉页脚重新设置
    \fancyfoot[C]{\songti\zihao{-5} \thepage}   % 页脚，宋体小五号，\thepage 代指页码
    \renewcommand{\headrulewidth}{0bp}  % 页眉横线粗细
    \renewcommand{\footrulewidth}{0bp}  % 页脚横线粗细
}

\renewcommand{\frontmatter}{
    \@mainmatterfalse
    \clearpage
    \pagestyle{noheader}    % 使用页眉页脚样式 noheader
    \pagenumbering{Roman}   % 大写罗马数字页码（会重置页码）
    \setlength{\baselineskip}{20bp plus 2bp minus 2bp}  % 设置弹性行高为 20±2bp （optional）
} 
\renewcommand{\mainmatter}{
    \@mainmattertrue
    \clearpage
    \pagestyle{plain}   % 使用页眉页脚样式 plain 
    \pagenumbering{arabic}  % 使用阿拉伯数字页码（会重置页码）
} 

\ctexset{
    contentsname={目\quad 录},  % 目录的标题 
    secnumdepth=3,  % 标题编号深度
    chapter={
        format={\centering\zihao{-3}\heiti},    % 小三，黑体，居中
        number={\chinese{chapter}}, % 章节编号黑体中文数字
        name={第,章},   % 章前后缀
        aftername=\quad, 
        beforeskip=30bp,    % 段前间距 （规定 30~36 bp 之间）
        afterskip=30bp,     % 段后间距 （规定 30~36 bp 之间）
    },
    section={
        format={\zihao{4}\heiti},   % 四号黑体
        beforeskip=20bp,    % 段前间距 （规定 18~24 bp 之间）
        afterskip=20bp,     % 段后间距 （规定 18~24 bp 之间）
        aftername=\quad,    % 编号与标题之间空格
    },
    subsection={
        format={\zihao{4}\heiti},   % 四号黑体
        beforeskip=12bp,    % 段前间距 （规定 12~15 bp 之间）
        afterskip=12bp,     % 段后间距 （规定 12~15 bp 之间）
        aftername=\quad,
    },
    subsubsection={ %单纯为了附录才有这个格式的设置
        format={\zihao{4}\heiti},   % 四号黑体
        beforeskip=12bp,    % 段前间距 （规定 12~15 bp 之间）
        afterskip=12bp,     % 段后间距 （规定 12~15 bp 之间）
        aftername=\quad,
    }
}

\addtocontents{toc}{\protect\thispagestyle{noheader}}   % 设置目录页的页眉页脚样式为 noheader 
\setcounter{tocdepth}{2}    % 设置 tocdepth 目录深度 （2 = subsection，即三级标题）
\titlecontents{chapter}
    [0em]   % 缩进为 0em = 0 字符
    {\heiti\zihao{-4}}
    {\thecontentslabel\quad}{}
    {\hspace{.5em}\titlerule*[5bp]{.}\zihao{-4}\contentspage} %
\titlecontents{section}
    [2em]   % 缩进为 2em = 4 字符
    {\zihao{-4}}
    {\thecontentslabel\quad}{}
    {\hspace{.5em}\titlerule*[5bp]{.}\zihao{-4}\contentspage}
\titlecontents{subsection}
    [4em]   % 缩进为 4em = 4 字符
    {\zihao{-4}}
    {\thecontentslabel\quad}{}
    {\hspace{.5em}\titlerule*[5bp]{.}\zihao{-4}\contentspage}

% 定义一个新的分隔符：使用 \quad（1em 空格）
\DeclareCaptionLabelSeparator{quadspace}{\quad}

% 设置图注表注：字体为 small（5号字9pt），分隔符用刚刚定义的 quadspace
\captionsetup{font=small,labelsep=quadspace}

\renewcommand{\tablename}{表}                                     % 插表题头
\renewcommand{\figurename}{图}                                    % 插图题头
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}       % 使图编号为 7-1 的格式 %\protect{~}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}         % 使表编号为 7-1 的格式
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}   % 使公式编号为 7-1 的格式
% \newcommand{\ud}{\mathrm{d}} % 定义微分符号的命令，使用 upright 字体

\newcommand{\figuremacro}[5]{
  \begin{figure}[#1]
    \centering
    \includegraphics[width=#4\textwidth]{#2}
    \caption{#3}
    \label{#5}
  \end{figure}
}

\newcommand{\tablemacro}[5]{
    \begin{table}[#1]
    \centering
    \caption{#2}\zihao{5}
    \begin{tabular}{ccc}
        \toprule
        #3
        \midrule
        #4
        \bottomrule
    \end{tabular}
    \label{#5}
\end{table}
}

\addbibresource{reference.bib}

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

\newlength{\@info@width}
\setlength{\@info@width}{8cm} % 默认值
\newcommand{\infowidth}[1]{\setlength{\@info@width}{#1}}

\newcommand{\ctitle}[1]{\gdef\@ctitle{#1}}\def\@ctitle{}
\newcommand{\caffil}[1]{\gdef\@caffil{#1}}\def\@caffil{}
\newcommand{\csubject}[1]{\gdef\@csubject{#1}}\def\@csubject{}
\newcommand{\cgrade}[1]{\gdef\@cgrade{#1}}\def\@cgrade{}
\newcommand{\cauthor}[1]{\gdef\@cauthor{#1}}\def\@cauthor{}
\newcommand{\cnumber}[1]{\gdef\@cnumber{#1}}\def\@cnumber{}
\newcommand{\csupervisor}[1]{\gdef\@csupervisor{#1}}\def\@csupervisor{}
\newcommand{\cheading}[1]{\gdef\@cheading{#1}}\def\@cheading{}

\newcommand{\cabstractcn}[1]{\gdef\@cabstractcn{#1}}\def\@cabstractcn{}
\newcommand{\cabstracten}[1]{\gdef\@cabstracten{#1}}\def\@cabstracten{}
\newcommand{\ckeywordcn}[1]{\gdef\@ckeywordcn{#1}}\def\@ckeywordcn{}
\newcommand{\ckeyworden}[1]{\gdef\@ckeyworden{#1}}\def\@ckeyworden{}

\newcommand{\makecover}{
    \begin{titlepage}
        \thispagestyle{empty}
        \centering
        \includegraphics[width=0.4\textwidth]{figures/tjuname.eps}
        
        \vspace{21pt}
        \zihao{2}{\heitibf{本科生毕业论文}}
        \vfill
        \includegraphics[width=0.4\textwidth]{figures/tjulogo.eps}

        \vspace{20pt}
        \zihao{3}{\heitibf{题目：\@ctitle}}

        \vspace{30pt}
        \renewcommand{\arraystretch}{1.5}
        {\zihao{3}\songtibf{
            \begin{tabular}{lc} 
                学\qquad 院 &  \underline{\makebox[\@info@width][c]{\@caffil}}     \\
                专\qquad 业 &  \underline{\makebox[\@info@width][c]{\@csubject}}   \\
                年\qquad 级 &  \underline{\makebox[\@info@width][c]{\@cgrade}}     \\
                姓\qquad 名 &  \underline{\makebox[\@info@width][c]{\@cauthor}}    \\
                学\qquad 号 &  \underline{\makebox[\@info@width][c]{\@cnumber}}    \\
                指导教师 &  \underline{\makebox[\@info@width][c]{\@csupervisor}}   \\
            \end{tabular}
            }
        }
        \vspace{1cm}
    \end{titlepage}
}

\newcommand{\makeabstract}{
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
}

\newenvironment{appendixenv}{%
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \setcounter{figure}{0}
    \setcounter{table}{0}
    \setcounter{equation}{0}
    \def\thesection{附录\Alph{section}}
    \def\thesubsection{\Alph{section}.\arabic{subsection}}
    \def\thesubsubsection{\Alph{section}.\arabic{subsection}.\arabic{subsubsection}}
    \def\thefigure{\Alph{section}\ifnum\value{figure}<10 0\fi\arabic{figure}}
    \def\thetable{\Alph{section}-\arabic{table}}
    \def\theequation{\Alph{section}-\arabic{equation}}
    \@addtoreset{figure}{section}
    \@addtoreset{table}{section}
    \@addtoreset{equation}{section}
}{}
