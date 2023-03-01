%
% 本模版根据中南大学研究生学位论文撰写规范创建
% 参考源：http://gra.its.csu.edu.cn/yjsy/pygl/wjtzxq54858_3_6.html
% 论文内容一般应由十一个主要部分组成，依次为：
% 1.封面、扉页；
% 2.学位论文原创性声明和版权使用授权书；
% 3.中文摘要；
% 4.英文摘要；
% 5.目录；
% 6.符号说明（必要时）；
% 7.论文正文；
% 8.参考文献；
% 9.附录（必要时）；
% 10.攻读博（硕）士学位期间主要研究成果；
% 11.致谢。
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CUEBthesis}[2018/12/30 v1.1 Standard LaTeX document class]
\ProcessOptions\relax
%% 读取基类
\LoadClass[twoside,a4paper,12pt]{ctexbook} \RequirePackage{ifxetex}
%\newcommand{\clearemptydoublepage}{
%\clearpage {\pagestyle{empty}
%\origdoublepage}}

\RequireXeTeX \ifxetex\else
\ClassError{CUEBthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi
% 相关宏包 %
% ------------------------------------%
% 支持中文的 ctex 宏包
\RequirePackage{ctex}
% 页面布局
\RequirePackage{geometry}
% 数学宏包
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
% 自定义关键词
\RequirePackage{pgfkeys}
% 设置目录
\RequirePackage{tocloft} %目录样式设置
\RequirePackage{titletoc}
% 设置字体
\RequirePackage{fontenc}
% 设置颜色
\RequirePackage{xcolor}
% 设置页眉和页脚
\RequirePackage{fancyhdr}
% 设置标题格式
\RequirePackage{titlesec}
% 超链接 hyperref 的设置
\RequirePackage{hyperref}
\hypersetup{pdfencoding=auto}
\hypersetup{colorlinks,linkcolor=black,anchorcolor=black,citecolor=black,urlcolor=black}
% 插入图片
\RequirePackage{graphicx}
% 表格
\RequirePackage{array}
% 长表格
\RequirePackage{longtable}
% % 弹性表格
% \RequirePackage{tabularx}
% booktabs 提供了\toprule 等命令.
\RequirePackage{booktabs}
% multirow 支持在表格中跨行
\RequirePackage{multirow}
% 调整间隔, 让表格更好看些
%表格脚注
\RequirePackage{threeparttable}
\RequirePackage{bigstrut}
%在跨行表格中输入定界符
\RequirePackage{bigdelim}
% 保护脆落命令
\RequirePackage{cprotect}
% 设置代码环境
\RequirePackage{listings}
% 首行缩进
\RequirePackage{indentfirst}
% jing: ccaption宏包不能出现在 caption 宏包之后
% % 设置中英文标题
% \RequirePackage{ccaption}
% 设置浮动体的标题
\RequirePackage{caption}
\RequirePackage{subcaption}
% 定制列表环境
\RequirePackage{enumitem}
% 提供\AtBeginEnvironment以方便全局调整一些结构的设置
\RequirePackage{etoolbox}
% % 下划线
% \RequirePackage{ulem}
% % 尺寸计算
% \RequirePackage{calc}
\RequirePackage{booktabs}
% 参考文献格式 GBT7714-2005
% 来自https://github.com/CTeX-org/gbt7714-bibtex-style
% \RequirePackage{natbib} % gbt7714.sty已经包含了natbib宏包
%\RequirePackage[numbers,2005]{gbt7714}
% 参考文献标记为上标
\RequirePackage[numbers,sort&compress]{natbib}
\newcommand{\upcite}[1]{\textsuperscript{\textsuperscript{\cite{#1}}}}
% 设置脚注
\RequirePackage{pifont}
\RequirePackage[perpage,symbol]{footmisc}
\DefineFNsymbols{circled}{{\ding{192}}{\ding{193}}{\ding{194}}
{\ding{195}}{\ding{196}}{\ding{197}}{\ding{198}}{\ding{199}}{\ding{200}}{\ding{201}}}
\setfnsymbol{circled}
\RequirePackage{scrextend}
\deffootnote[1.5em]{1.5em}{1.5em}{\zihao{-5}\songti\thefootnotemark \space}

\RequirePackage[ruled,linesnumbered,algochapter]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}
% 页面布局 %
% -------------------------------------------------------%
\geometry{top=25mm,bottom=25mm,left=30mm,right=20mm}
% 给页眉留足空间（否则会有 \headheight is too small的warning）
\setlength{\headheight}{14.5pt}
% “磅”是衡量印刷字体大小的单位,约等于七十二分之一英寸。
% 而 1英寸＝25.4毫米，则1磅＝25.4/72≈0.353毫米。
% 磅和 LaTeX的 pt- points (大约 1/72 inch) 是一致的。
\renewcommand*{\baselinestretch}{1.0}   % 几倍行间距
\setlength{\baselineskip}{20pt}         % 基准行间距

% 设置字体 %
% -------------------------------------------------------%
\setmainfont{Times New Roman}
% 标题按模板是方正大标宋简体(但是没有这个字体，所以用黑体替代)
% 重定义ctex定义好的宋体和黑体，以支持伪加粗AutoFakeBold
% 即支持类似word里的给黑体、宋体等中文字体加粗的操作，用\bfseries
\let\heiti\relax
\newCJKfontfamily[hei]\heiti{SimHei}[AutoFakeBold]
\let\songti\relax
\newCJKfontfamily[song]\songti{SimSun}[AutoFakeBold]
%\let\kaiti\relax
\newCJKfontfamily[kai]\kaiti{华文楷体}


% 每行缩进两个汉字
\setlength{\parindent}{2em}

%  中文标题名称
\newcommand*{\cueb@cap@contentsname}{目录}
\newcommand*{\cueb@cap@listfigurename}{插图清单}
\newcommand*{\cueb@cap@listtablename}{附表清单}
\newcommand*{\cueb@cap@refname}{参考文献}
\newcommand*{\cueb@cap@indexname}{索引}
\newcommand*{\cueb@cap@figurename}{图}
\newcommand*{\cueb@cap@tablename}{表}
\newcommand*{\cueb@cap@appendixname}{附录}
\newcommand*{\cueb@cap@abstractname}{摘要}
 %%%  中文关键字
\newcommand*{\cueb@cap@keywordsname}{关键字}


% 定制titlepage
% 定义命令和定义相应的宏。
%----------------------------------------------------------------------%
% 预定义全局使用的文字，如姓名、专业等信息，在content/info.tex中定义
%----------------------------------------------------------------------%
% 以下定义封面相关命令和相应的宏，以titleen为例，\titleen为实际在源码中使用的命令，一旦执行就会因为\gdef\@titleen{#1}使得其产生一个\@titleen的宏，而该宏能够在后续的环境中使用。
\newcommand*{\titlecn}[1]{\gdef\@titlecn{#1}}                           % 中文标题
\newcommand*{\titleen}[1]{\gdef\@titleen{#1}}                           % 英文标题
\newcommand*{\minormajor}[1]{\gdef\@minormajor{#1}}                     % 专业名称
\newcommand*{\department}[1]{\gdef\@department{#1}}                     % 培养单位
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}                     % 导师
\newcommand*{\supervisoren}[1]{\gdef\@supervisoren{#1}}                 % 导师
\newcommand*{\authoren}[1]{\gdef\@authoren{#1}}                         % 英文姓名
\newcommand*{\subsupervisor}[1]{\gdef\@subsupervisor{#1}}               % 副导师

% 1. 封面、扉页%
%-----------------------------------------------------------------------------------------------------------%

% 封面 %
% -------------------------------------------------------------%
% 学位论文封面格式分为公开学位论文（学术学位）、公开学位论文（专业学位）、涉密学位论文（学术学位）、涉密学位论文（专业学位）等四种形式（具体见样例1-4）。
% 封面正面上填写论文题名、学科专业（一级学科或专业学位类别）、学科方向或专业领域、作者姓名、指导教师姓名等内容。在书脊上方印“博（或硕）士学位论文”，下方印“中南大学”。
% 涉密学位论文须在封面右上角标注密级、定密日期，由校保密办公室审批、盖章。


% 论文日期
% 采用key-value对的方式来制定存储信息的pgf路径
\pgfkeys{/thesisdate/pgf/.cd, % 定义pgf路径
    year/.store in = \year, % 指定关键词year的存储位置为\year
    month/.store in = \month % 指定关键词month的存储位置为\month
}
% 利用上述的pgf的key-value定制论文日期命令
\newcommand{\thesisdate}[1] {
    \pgfkeys{/thesisdate/pgf/.cd,#1} % 指定使用/thesisdate/pgf/.cd来解释参数，然后在后文能直接使用存储位置来指定解释的内容
    \gdef\@thesisdate{\year{} 年 \month{} 月} % 将构建好的日期存储到宏（\@thesisdate）中
}

% 以下为公开学位论文（学术）的封面内容

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义 \makecoverpage 实现封面的重新绘制
% -----------------------------------------------%
%中文封面
\newcommand{\makecoverpage} {
    \thispagestyle{empty}
    {
        \centering
        \linespread{1.25}
        \vspace*{3cm}
        {\includegraphics[width=9.38cm]{cueb.png}\par}
        \vspace{2cm} % 1.5个空行
        {\fontsize{50pt}{\baselineskip}\heiti 博士学位论文 \par} % 一号黑体
        \vspace{3cm} % 3个空行
        {\zihao{1} \bfseries \heiti \@titlecn \par} % 一号黑体
        \vspace{3cm} % 3个空行
        {
            \zihao{3} \kaiti
            \begin{tabular}{ll}
                \makebox[4em][s]{培养单位} & \@department \\
                \makebox[4em][s]{专业名称} & \@minormajor \\
\ifblindreview
                \makebox[4em][s]{研究方向} & \@minormajor \\
\else
                \makebox[4em][s]{作者姓名} & \@author \\
                \makebox[4em][s]{指导教师} & \@supervisor \\
\fi
            \end{tabular}
            }\par
    }
}
%英文封面
\newcommand{\makecoverpageen} {
    \thispagestyle{empty}
    {
        \centering
        \linespread{1}
        \vspace*{4cm}
        {\zihao{-2}\bfseries \@titleen \par} % 小二号，timesnewroman
        \vspace{7cm} % 7个空行
        {
            \zihao{-3}\bfseries
            \begin{tabular}{ll}
\ifblindreview
                \makebox[5em][s]{研究方向} & \@minormajor \\
\else
                \makebox[5em][s]{Candidate：\ } & \@authoren \\
                \vspace{1cm} % 空行
                \makebox[5em][s]{Supervisor：\ } & \@supervisoren \\
\fi
            \end{tabular}
        }
        \par
        \vspace{5cm}
        % \vfill
        {\zihao{-3} Capital University of Economics and Business, Beijing, China}
        \par
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. 原创性声明和学位论文版权使用授权书
% -----------------------------------------------%
% 单独设一页，排在扉页后

\newcommand{\announcement}{
    \thispagestyle{empty}
    {
    \linespread{1.5} % 这部分的行间距跟正文不一样
    \vspace*{0.5cm}

    {\centering \zihao{2} \heiti 独创性声明 \par}

    \vspace{1cm}

    \setlength{\parindent}{2em} % 首行缩进
    {
        \zihao{-4} \songti
        本人郑重声明：所呈交的论文是本人在指导教师指导下独立进行研究工作所取得的成果，论文中有关资料和数据是实事求是的。尽我所知，除文中已经加以标注和致谢外，本论文不包含其他人已经发表或撰写的研究成果，也不包含本人或他人为获得首都经济贸易大学或其它教育机构的学位或学历证书而使用过的材料。与我一同工作的同志对研究所做的任何贡献均已在论文中作出了明确的说明。

        若有不实之处，本人愿意承担相关法律责任。
    }
    \par
    \vspace{1cm}
    {
        \zihao{5} \songti
        学位论文作者签名：\underline{\makebox[8em][c]{}}\qquad\qquad
        日期：
        {\makebox[3em][c]{}} 年
        {\makebox[1.5em][c]{}} 月
        {\makebox[1.5em][c]{}} 日    \par
    }
    \vspace{3cm}

    {\centering \zihao{2} \heiti 关于论文使用授权的说明\par}

    \vspace{1cm}
    {
        \zihao{-4} \songti
        本人完全同意首都经济贸易大学有权使用本学位论文（包括但不限于其印刷版和电子版），使用方式包括但不限于：保留学位论文，按规定向国家有关部门（机构）送交学位论文，以学术交流为目的赠送和交换学位论文，允许学位论文被查阅、借阅和复印，将学位论文的全部或部分内容编入有关数据库进行检索，采用影印、缩印或其他复制手段保存学位论文。

        保密学位论文在解密后的使用授权同上。    \par
    }
    \vspace{1cm}
    {
        \zihao{5} \songti
        学位论文作者签名：\underline{\makebox[8em][c]{}}\qquad\qquad
        日期：
        {\makebox[3em][c]{}} 年
        {\makebox[1.5em][c]{}} 月
        {\makebox[1.5em][c]{}} 日    \par
    }
    {
        \zihao{5} \songti
        指导教师签名：\underline{\makebox[10em][c]{}}\qquad\qquad
        日期：
        {\makebox[3em][c]{}} 年
        {\makebox[1.5em][c]{}} 月
        {\makebox[1.5em][c]{}} 日    \par
    }
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. 中文摘要
% -----------------------------------------------%
\newcommand{\abstractcn}{
    \clearpage
    \chapter*{中文摘要}
    \songti \zihao{-4}
    \renewcommand*{\baselinestretch}{1.0}
    \setlength{\baselineskip}{20pt}
}{\clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. 英文摘要
% -----------------------------------------------%
\newcommand{\abstracten}{
    \clearpage
    \chapter*{\textbf{Abstract}}
    \zihao{-4}
    \renewcommand*{\baselinestretch}{1.0}
    \setlength{\baselineskip}{20pt}
}{\clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. 目录 %
% -----------------------------------------------%
\renewcommand{\contentsname}{\vspace*{24pt}\hfill \heiti \zihao{3} 目录\hfill \vspace{18pt}}
\setcounter{secnumdepth}{3}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{1}
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\setlength{\cftbeforechapskip}{6pt}

\renewcommand\cftchapfont{\heiti\zihao{-4}}
\renewcommand\cftsecfont{\songti\zihao{-4}}
\renewcommand\cftsubsecfont{\songti\zihao{-4}}

\setlength{\cftsecindent}{1.5em}
\setlength{\cftsubsecindent}{2.6em}

\renewcommand\cftchapdotsep{0.5}%虚线间隔
\setlength{\cftbeforetoctitleskip}{0em}
\setlength{\cftaftertoctitleskip}{0em}

% *5. 图表清单（首经贸论文很少见到） %
% -----------------------------------------------%

\renewcommand{\listfigurename}{\vspace*{-24pt}\hfill \heiti \zihao{3} 图目录\hfill\vspace{-18pt}}

\renewcommand{\listtablename}{\vspace*{-24pt}\hfill \heiti \zihao{3} 表目录\hfill\vspace{-18pt}}


% 定义作为标题的格式
% \titleformat{command}[shape]%定义标题类型和标题样式
%               {format}%定义标题格式
%               {label}%定义标题的标签，即标题的标号等
%               {sep}%定义标题和标号之间的水平距离
%               {before-code}%定义标题前的内容
%               [after-code]%定义标题后的内容
\ctexset{
    chapter={format={\centering \zihao{3}\heiti},
    name={第,章},
    beforeskip=24pt,
    afterskip=18pt,
    number={\arabic{chapter}}}
}

\ctexset{
    section={format={\raggedright \zihao{4}\heiti},
    beforeskip=24pt,
    afterskip=6pt}
}

\ctexset{
    subsection={format={\fontsize{13pt}{\baselineskip}\heiti},
    beforeskip=12pt,
    afterskip=6pt}
}

\ctexset{
    subsubsection={format={\zihao{-4}\heiti},
    beforeskip=12pt,
    afterskip=6pt}
}

% 6. 图表清单及主要符号表
% 没见有人写过，没有设置

% 7. 论文正文 %
% -------------------------------------------------------%

% 图表等浮动环境设置 %
% ----------------------------------------------------------%
% TODO %
% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
\renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起, \LaTeX{}
% 会将它们分在几个不同页，即使它们可在同一页放
% 得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮
% 动环境的最大比例.
 \renewcommand*{\topfraction}{0.9}
 \renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
 \renewcommand*{\floatpagefraction}{0.85}
% 关于图片 graphicx
 % 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png,.tif}
 % 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}%
  {picture/}{pic/}{pics/}{image/}{images/}}


% 插图格式
% ------------------------------------------------------%
% \captionsetup[subfigure]{labelfont=normalfont,textfont=normalfont,singlelinecheck=off,justification=raggedright}
% singlelinecheck=off 表示即使caption只有一行， justification 也生效
% justification=raggedright 使子图 caption 靠左对齐，而caption的上下位置由\caption标签的位置决定，以此实现了学校要求的子图标签在左上角显示。
% 这部分功能由 subcaption 这个包实现，而这个包不能和 subfigure 同时使用，所以子图的写法也与 subfigure 包的不大一样。
\captionsetup[subfigure]{singlelinecheck=off,justification=raggedright}

% 图下方描述宋体字
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{eleven}{\fontsize{11pt}{\baselineskip}}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
% \renewcommand{\thefigure} {\thesection-\arabic{figure}}
\captionsetup[figure]{
	format=plain,      % 标题从第二行开始是否缩进，plain无缩进，hang有缩进
	labelsep=quad,     % 分隔符是一个空格
	font={song,eleven},   % 图的字体, 宋体11pt
	position=bottom    % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
% 表格格式
% ------------------------------------------------------%
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
% \renewcommand {\thetable} {\thesection-\arabic{table}}
\captionsetup[table]{
	format=plain,      % 标题从第二行开始是否缩进，plain无缩进，hang有缩进
	labelsep=quad,     % 分隔符是一个空格
	font={song,eleven},   % 表的字体, 宋体小四
	position=top
}

% 列表环境设置 % 未调试
% ------------------------------------------------------------------%
% \RequirePackage{listings}
\setlist{%
	topsep=0.3em, % 列表顶端的垂直空白
	partopsep=0pt, % 列表环境前面紧接着一个空白行时其顶端的额外垂直空白
	itemsep=0ex plus 0.1ex, % 列表项之间的额外垂直空白
	parsep=0pt, % 列表项内的段落之间的垂直空白
	leftmargin=1.5em, % 环境的左边界和列表之间的水平距离
	rightmargin=0em, % 环境的右边界和列表之间的水平距离
	labelsep=0.5em, % 包含标签的盒子与列表项的第一行文本之间的间隔
	labelwidth=2em % 包含标签的盒子的正常宽度；若实际宽度更宽，则使用实际宽度。
}

% 表格 %
% ------------------------------------------------------%
% 修改tabular 环境, 设置表格中的行间距为正文行间距.
\let\cueb@oldtabular\tabular
\let\cueb@endoldtabular\endtabular
\renewenvironment{tabular} {
    \bgroup
	\renewcommand{\arraystretch}{1.38}
    \cueb@oldtabular
} {
    \cueb@endoldtabular\egroup
}

% 表格字号应比正文小，请在插入表格时设置

% 数学环境, 定理等设置 %
% -------------------------------------------------------%
\newtheorem{definition}{\cueb@cap@definition}
\newtheorem{theorem}{\cueb@cap@theorem}
\newtheorem{lemma}{\cueb@cap@lemma}
\newtheorem{corollary}{\cueb@cap@corollary}
\newtheorem{assumption}{\cueb@cap@assumption}
\newtheorem{conjecture}{\cueb@cap@conjecture}
\newtheorem{axiom}{\cueb@cap@axiom}
\newtheorem{principle}{\cueb@cap@principle}
\newtheorem{problem}{\cueb@cap@problem}
\newtheorem{example}{\cueb@cap@example}
\newtheorem{proof}{\cueb@cap@proof}
\newtheorem{solution}{\cueb@cap@solution}

% 数学定理相关的常量
\newcommand*{\cueb@cap@definition}{定义}
\newcommand*{\cueb@cap@theorem}{定理}
\newcommand*{\cueb@cap@lemma}{引理}
\newcommand*{\cueb@cap@corollary}{推论}
\newcommand*{\cueb@cap@assumption}{假设}
\newcommand*{\cueb@cap@conjecture}{猜想}
\newcommand*{\cueb@cap@axiom}{公理}
\newcommand*{\cueb@cap@principle}{定律}
\newcommand*{\cueb@cap@problem}{问题}
\newcommand*{\cueb@cap@example}{例}
\newcommand*{\cueb@cap@proof}{证明}
\newcommand*{\cueb@cap@solution}{解}

% 编号分章节。如需要连续编号，注释\makeatletter下面对应内容即可。
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
%\makeatletter
%\@addtoreset{figure}{section}
%\@addtoreset{table}{section}
%\@addtoreset{equation}{section}
%\makeatother


%------------------------此后章节无编号-----------------------

%------------------------结论 -------------------------------
\newcommand{\conclusion}{
    \chapter*{总结与展望}
    \addcontentsline{toc}{chapter}{总结与展望}
}{\clearpage}
%------------------------ reference ------------------------
\newcommand{\reference}[1] {
%    \nocite{*}
    \bibliographystyle{bstutf8}
    \phantomsection
    \addcontentsline{toc}{chapter}{参考文献}
    \songti \zihao{5}
    \setlength{\baselineskip}{16pt}
    \bibliography{#1}
}{\clearpage}
%%------------------------附录-------------------------------
%\renewenvironment{appendix}{
%    \chapter*{附录A}
%    \addcontentsline{toc}{chapter}{附录A}
%    \songti \zihao{-4}
%    \renewcommand*{\baselinestretch}{1.0}
%    \setlength{\baselineskip}{20pt}
%}{\clearpage}
\renewenvironment{appendix}{
    \songti \zihao{-4}
    \renewcommand*{\baselinestretch}{1.0}
    \setlength{\baselineskip}{20pt}
}{\clearpage}

%%------------------------研究成果----------------------------
\newcommand{\additional}{
    \chapter*{攻读博士学位期间取得的研究成果}
    \addcontentsline{toc}{chapter}{攻读博士学位期间取得的研究成果}
    \songti \zihao{-4}
    \renewcommand*{\baselinestretch}{1.0}
    \setlength{\baselineskip}{20pt}
}{\clearpage}

%%------------------------ 致谢 -----------------------------
\renewenvironment{thanks}{
    \chapter*{致谢}
    \addcontentsline{toc}{chapter}{致谢}
    \songti \zihao{-4}
    \renewcommand*{\baselinestretch}{1.0}
    \setlength{\baselineskip}{20pt}
}{\clearpage}

%%------------------------作者简介---------------------------
\newcommand{\authorintro}{
    \chapter*{作者简介}
    \addcontentsline{toc}{chapter}{作者简介}
    \songti \zihao{-4}
    \renewcommand*{\baselinestretch}{1.0}
    \setlength{\baselineskip}{20pt}
}{\clearpage}

\endinput
