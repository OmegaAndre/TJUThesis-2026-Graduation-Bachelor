\newif\if@songnumber

\DeclareOption{songnumber}{\@songnumbertrue}
\ProcessOptions*    %这部分用于读取给类文件传入的参数

\ProvidesClass{tjuthesis-Bachelor}  %定义类文件名称
\LoadClass[12pt,openany,oneside]{ctexbook}  %以 ctexbook 为基础类，设置默认选项为 12pt 字体、openany（章节可以从任意页开始）和 oneside（单面打印）

\RequirePackage[a4paper,
            left=3.57cm,right=2.77cm,
            top=2.75cm,bottom=2.54cm,
            footskip=7.9mm,
            headheight=5mm,headsep=7.5mm]{geometry} %页面设置
\RequirePackage{fancyhdr}   %用于设置页眉页脚的宏包
\RequirePackage{titletoc}   %用于设置目录样式的宏包
\RequirePackage{graphicx}   %支持插图处理的宏包
\RequirePackage{pdfpages}   %用于插入pdf文件的宏包
\RequirePackage{pifont}     %提供特殊符号的宏包（如 \ding{173} 代表圈1）
\RequirePackage{booktabs}   %用于绘制三线表的横线
\RequirePackage{amsmath}    %基础数学包
\RequirePackage{amsfonts}   %支持公式中使用特殊字体
\RequirePackage[hidelinks]{hyperref}    % 将交叉引用设置为超链接
\RequirePackage{newtxmath}  % 新罗马风格数学公式字体
\RequirePackage{caption}    %用于设置图表标题样式的宏包
\RequirePackage{xcolor}     %提供颜色支持的宏包
\RequirePackage{listings}   %用于设置代码块样式的宏包
\RequirePackage[style=gb7714-2015]{biblatex}    %参考文献管理的宏包，使用GB/T 7714-2015标准
% \RequirePackage{mathtools}%基础数学包基础上增加额外命令，通常和amsmath二选一
% \RequirePackage{tabularx} %表格自动换行
% \RequirePackage{multirow} %支持在表格中横跨多列

\setmainfont{Times New Roman}   %设置西文字体为新罗马字体

\if@songnumber
    \setsansfont{SimSun} %邪修大法修改参考文件序号为宋体之定义无衬线字体为宋体
    \DeclareFieldFormat{labelnumberwidth}{
    {\sffamily\mkbibbrackets{#1}}   %使用自定义的无衬线字体命令
    } %邪修大法修改参考文件序号为宋体之使用无衬线字体命令
\fi

% 宋体、黑体伪粗体
\setCJKfamilyfont{son}[AutoFakeBold={2}]{SimSun} 
\renewcommand*{\songti}{\CJKfamily{son}}
\newcommand{\songtibf}{\songti\textbf}  %定义一个新的命令表示宋体加粗
\setCJKfamilyfont{hei}[AutoFakeBold={2}]{SimHei}
\renewcommand*{\heiti}{\CJKfamily{hei}}
\newcommand{\heitibf}{\heiti\textbf}    %定义一个新的命令表示黑体加粗

\fancypagestyle{plain}{ %修改默认页眉页脚样式
    \fancyhf{}  % 清除所有页眉页脚重新设置
    \fancyhead[C]{\songti\zihao{5}\@cheading}   % 页眉，宋体五号
    \fancyfoot[C]{\songti\zihao{-5}\thepage}    % 页脚，宋体小五号，\thepage 代指页码
    \renewcommand{\headrulewidth}{0.5bp}    % 页眉横线粗细
    \renewcommand{\footrulewidth}{0bp}      % 页脚横线粗细
}

\fancypagestyle{noheader}{ %定义一个新的页眉页脚样式 noheader，只有页脚没有页眉
    \fancyhf{}  % 清除所有页眉页脚重新设置
    \fancyfoot[C]{\songti\zihao{-5} \thepage}   % 页脚，宋体小五号，\thepage 代指页码
    \renewcommand{\headrulewidth}{0bp}  % 页眉横线粗细
    \renewcommand{\footrulewidth}{0bp}  % 页脚横线粗细
}

\renewcommand{\frontmatter}{ %改写命令 \frontmatter，使其使用 noheader 样式并设置页码为大写罗马数字
    \@mainmatterfalse
    \clearpage
    \pagestyle{noheader}    % 使用页眉页脚样式 noheader
    \pagenumbering{Roman}   % 大写罗马数字页码（会重置页码）
    \setlength{\baselineskip}{20bp plus 2bp minus 2bp}  % 设置弹性行高为 20±2bp （optional）
} 
\renewcommand{\mainmatter}{ %改写命令 \mainmatter，使其使用 plain 样式并设置页码为阿拉伯数字
    \@mainmattertrue
    \clearpage
    \pagestyle{plain}   % 使用页眉页脚样式 plain 
    \pagenumbering{arabic}  % 使用阿拉伯数字页码（会重置页码）
} 

\ctexset{   %各级标题格式设置
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

\graphicspath{{figures/}}   % 定义所有的图像文件在 figures 子目录下

\newcommand{\figuremacro}[5]{ %图片插入宏
  \begin{figure}[#1] %第一个参数是浮动体样式设置
    \centering
    \includegraphics[width=#4\textwidth]{#2}   %第2个参数是图片文件路径，第4个参数是图片占文本宽度的比例
    \caption{#3} %第三个参数是图片标题
    \label{#5} %第五个参数是图片标签
  \end{figure}
}

\newcommand{\tablemacro}[5]{ %表格插入宏
    \begin{table}[#1] %第一个参数是浮动体样式设置
    \centering
    \caption{#2}\zihao{5} %第二个参数是表格标题
    \begin{tabular}{ccc}
        \toprule
        #3 %第三个参数是表格列标题，需要手动使用\songtibf加粗
        \midrule
        #4 %第四个参数是表格内容
        \bottomrule
    \end{tabular}
    \label{#5} %第五个参数是表格标签
\end{table}
}

\addbibresource{reference.bib} %添加参考文献数据库文件

\lstset{ %一个简单的代码高亮样式设置
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

\newlength{\@info@width} %创建变量用于设置封面页信息栏横线长度
\setlength{\@info@width}{8cm} % 默认值为8cm
\newcommand{\infowidth}[1]{\setlength{\@info@width}{#1}} %定义新命令以便全局调用

\newcommand{\ctitle}[1]{\gdef\@ctitle{#1}}\def\@ctitle{} %定义文章标题命令
\newcommand{\caffil}[1]{\gdef\@caffil{#1}}\def\@caffil{} %定义学院名称命令
\newcommand{\csubject}[1]{\gdef\@csubject{#1}}\def\@csubject{} %定义专业名称命令
\newcommand{\cgrade}[1]{\gdef\@cgrade{#1}}\def\@cgrade{} %定义年级命令
\newcommand{\cauthor}[1]{\gdef\@cauthor{#1}}\def\@cauthor{} %定义作者姓名命令
\newcommand{\cnumber}[1]{\gdef\@cnumber{#1}}\def\@cnumber{} %定义学号命令
\newcommand{\csupervisor}[1]{\gdef\@csupervisor{#1}}\def\@csupervisor{} %定义指导教师命令
\newcommand{\cheading}[1]{\gdef\@cheading{#1}}\def\@cheading{} %定义页眉标题命令

\newcommand{\cabstractcn}[1]{\gdef\@cabstractcn{#1}}\def\@cabstractcn{} %定义中文摘要命令
\newcommand{\cabstracten}[1]{\gdef\@cabstracten{#1}}\def\@cabstracten{} %定义英文摘要命令
\newcommand{\ckeywordcn}[1]{\gdef\@ckeywordcn{#1}}\def\@ckeywordcn{} %定义中文关键词命令
\newcommand{\ckeyworden}[1]{\gdef\@ckeyworden{#1}}\def\@ckeyworden{} %定义英文关键词命令

\newcommand{\makecover}{ %生成封面页
    \begin{titlepage}
        \thispagestyle{empty} %封面页无页眉页脚
        \centering
        \includegraphics[width=0.4\textwidth]{tjuname.eps} %插入天津大学校名
        
        \vspace{21pt}
        \zihao{2}{\heitibf{本科生毕业论文}}
        \vfill %动态填充空隙
        \includegraphics[width=0.4\textwidth]{tjulogo.eps} %插入天津大学校徽

        \vspace{20pt}
        \zihao{3}{\heitibf{题目：\@ctitle}}

        \vspace{30pt}
        \renewcommand{\arraystretch}{1.5} %设置表格行高1.5倍
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

\newcommand{\makeabstract}{ %生成摘要页
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

\newenvironment{appendixenv}{ %附录环境，重置章节编号并修改编号格式
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
