
%% This is file `xduthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% xduthesis.dtx  (with options: `cls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2008-2014 by Fei Qi <fred.qi@ieee.org>
%% 
%% This file may be distributed and/or modified under the conditions of the LaTeX
%% Project Public License, either version 1.3a of this license or (at your option)
%% any later version. The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%% 
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%% 
%% \iffalse
%%  Local Variables:
%%  mode: doctex
%%  TeX-master: t
%%  End:
%% \fi
%% \iffalse meta-comment
%%
%% Copyright (C) 2008-2014 by Fred Qi <fred.qi@gmail.com>
%%
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%%
%% http://www.latex-project.org/lppl.txt
%%
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%%
%% \fi

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{xduthesis}
[2009/06/06 0.2 Xidian University Thesis Template]
\hyphenation{XD-Thesis}
\def\xduthesis{\textsc{Xduthesis}}
\def\version{0.9.9}
\newif\ifxdu@bachelor\xdu@bachelorfalse
\newif\ifxdu@master\xdu@masterfalse
\newif\ifxdu@doctor\xdu@doctorfalse
\newif\ifxdu@secret\xdu@secretfalse
\newif\ifxdu@mkabstract\xdu@mkabstractfalse
\newif\ifxdu@print\xdu@printfalse
\newif\ifxdu@msfonts\xdu@msfontsfalse
\DeclareOption{bachelor}{\xdu@bachelortrue}
\DeclareOption{master}{\xdu@mastertrue}
\DeclareOption{doctor}{\xdu@doctortrue}
\DeclareOption{secret}{\xdu@secrettrue}
\DeclareOption{print}{\xdu@printtrue}
\DeclareOption{msfonts}{\xdu@msfontstrue}
\DeclareOption{adobefonts}{\xdu@msfontsfalse}
\AtEndOfClass{%
  \ifxdu@bachelor\relax\else
    \ifxdu@master\relax\else
      \ifxdu@doctor\relax\else
        \ClassError{xduthesis}%
                   {Please specify a thesis option: bachelor, master or doctor.}{}
      \fi
    \fi
  \fi}
\ExecuteOptions{}
\ProcessOptions
\ifxdu@print
\LoadClass[12pt, a4paper, openright]{book}
\else
\LoadClass[12pt, a4paper, openany]{book}
\fi
\RequirePackage{calc}
\RequirePackage[numbers,super,sort&compress]{natbib}
\ifxdu@print
\RequirePackage[xetex,colorlinks=true,allcolors=black]{hyperref}
\else
\RequirePackage[xetex,colorlinks=true]{hyperref}
\fi
\RequirePackage{indentfirst}
\RequirePackage[neverdecrease]{paralist}
\RequirePackage{amsmath, amssymb}
\RequirePackage{graphicx}
\RequirePackage{subfig}
\RequirePackage[normalem]{ulem}
\RequirePackage{ifthen}
\RequirePackage{titlesec,titletoc}
\RequirePackage[CJKnumber,BoldFont]{xeCJK}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{clrscode3e}
\RequirePackage{multirow}
\RequirePackage{multicol}
\punctstyle{quanjiao}
\def\CJK@null{\kern\CJKnullspace\Unicode{48}{7}\kern\CJKnullspace}
\defaultfontfeatures{Mapping=tex-text} % after fontspec
\ifxdu@msfonts
\setCJKmainfont{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{KaiTi_GB2312}
\setCJKfamilyfont{song}{SimSun}
\setCJKfamilyfont{hei}{SimHei}
\setCJKfamilyfont{fs}{FangSong_GB2312}
\setCJKfamilyfont{kai}{KaiTi_GB2312}
\setCJKfamilyfont{li}{Adobe Kaiti Std}
\setCJKfamilyfont{you}{LiSu}
\else
\setCJKmainfont{Adobe Song Std}
\setCJKsansfont{Adobe Heiti Std}
\setCJKfamilyfont{song}{Adobe Song Std}
\setCJKfamilyfont{hei}{Adobe Heiti Std}
\fi
\setmainfont{Times New Roman}
\setsansfont{Arial}
\RequirePackage{xunicode,metalogo}
%\setmonofont{Courier Std}
\setmonofont{Times New Roman}
\renewcommand\frontmatter{%
  \xdu@clearpage%
  \@mainmatterfalse
  \ifxdu@doctor\pagenumbering{Roman}\else\pagenumbering{Roman}\fi
  \pagestyle{xdu@front}}
\renewcommand\mainmatter{%
  \xdu@clearpage
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{xdu@headings}}
\renewcommand\backmatter{%
  \xdu@clearpage
  \@mainmattertrue}
\newcommand{\song}{\CJKfamily{song}} % 宋体
\def\songti{\song}
\newcommand{\hei}{\CJKfamily{hei}} % 黑体
\def\heiti{\hei}
\newlength\xdu@linespace
\newcommand{\xdu@choosefont}[2]{%
   \setlength{\xdu@linespace}{#2*\real{#1}}%
   \fontsize{#2}{\xdu@linespace}\selectfont}
\def\xdu@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \xdu@choosefont{##1}{#2}}}
\xdu@define@fontsize{chuhao}{42bp}
\xdu@define@fontsize{xiaochu}{36bp}
\xdu@define@fontsize{yihao}{26bp}
\xdu@define@fontsize{xiaoyi}{24bp}
\xdu@define@fontsize{erhao}{22bp}
\xdu@define@fontsize{xiaoer}{18bp}
\xdu@define@fontsize{sanhao}{16bp}
\xdu@define@fontsize{xiaosan}{15bp}
\xdu@define@fontsize{sihao}{14bp}
\xdu@define@fontsize{banxiaosi}{13bp}
\xdu@define@fontsize{xiaosi}{12bp}
\xdu@define@fontsize{dawu}{11bp}
\xdu@define@fontsize{wuhao}{10.5bp}
\xdu@define@fontsize{xiaowu}{9bp}
\xdu@define@fontsize{liuhao}{7.5bp}
\xdu@define@fontsize{xiaoliu}{6.5bp}
\xdu@define@fontsize{qihao}{5.5bp}
\xdu@define@fontsize{bahao}{5bp}
\renewcommand\normalsize{\@setfontsize\normalsize{12bp}{18bp}}
 \setlength{\baselineskip}{20pt}
%\renewcommand\baselinestretch{1.2}
\setlength{\textwidth}{\paperwidth}
\setlength{\textheight}{\paperheight}
\setlength\marginparwidth{0cm}
\setlength\marginparsep{0cm}
\addtolength{\textwidth}{-5.2cm}
\setlength{\oddsidemargin}{0pt}
\setlength{\evensidemargin}{0pt}
\setlength{\voffset}{2cm-1in}
\setlength{\topmargin}{2mm}
\setlength{\headheight}{6mm}
\setlength{\headsep}{4mm}
\setlength{\topskip}{0pt}
\setlength{\footskip}{0.7cm}
%\setlength{\skip\footins}{15pt}
\ifxdu@doctor
\addtolength{\textheight}{-5.0cm}
\else
\addtolength{\textheight}{-6.1cm}
\fi
\def\xdu@clearpage{%
  \clearpage%
  \if@openright%
    \ifodd\c@page\relax\else%
      \null\thispagestyle{xdu@headings}\newpage%
    \fi%
  \fi}
\def\ps@xdu@empty{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty}
\def\ps@xdu@foot@doctor{\vbox{\vskip10pt\rule{\textwidth}{1mm}%
    \vskip1pt\rule{\textwidth}{0.5pt}\vskip1pt%
    \hbox to\textwidth{\hfil{\xiaowu\ps@xdu@pagefoot}\hfil}}}
\def\ps@xdu@foot@doctor{\vbox{\vskip10pt\rule{\textwidth}{1mm}%
    \vskip1pt\rule{\textwidth}{0.5pt}\vskip1pt%
    \hbox to\textwidth{\hfil{\xiaowu\ps@xdu@pagefoot}\hfil}}}
\def\ps@xdu@front{%
  \def\@oddhead{\vbox{\hbox to\textwidth{%
        \hfil{\wuhao\noindent\leftmark}%
        \hfil{\ifxdu@doctor\xiaowu\thepage\fi}\hskip1pt}%
      \vskip2pt\ifxdu@doctor\rule{\textwidth}{1mm}\vskip1pt\fi%
      \rule{\textwidth}{0.5pt}\vskip1pt%上面线为1pt粗
  \rule{\textwidth}{0.5pt}}}%
  \def\@evenhead{\vbox{\hbox to\textwidth{%
        \hskip1pt{\ifxdu@doctor\xiaowu\thepage\fi}%
        \hfil{\let\\=\relax\wuhao{西安电子科技大学硕士学位论文}}\hfil}%
      \vskip2pt\ifxdu@doctor\rule{\textwidth}{1mm}\vskip1bp\fi%
      \rule{\textwidth}{0.5pt}\vskip1pt%上面线为1pt粗
  \rule{\textwidth}{0.5pt}}}%
  \def\@oddfoot{\vbox{\hbox to\textwidth{\hfil\xiaowu\thepage\hfil}}}%
  \def\@evenfoot{\vbox{\hbox to\textwidth{\hfil\xiaowu\thepage\hfil}}}}%
\def\ps@xdu@headings{%
  \def\@oddhead{\vbox{\hbox to\textwidth{%
        \hfil{\wuhao\noindent\leftmark}\hfil{\xiaowu}\hskip1pt}%
      \vskip2pt\ifxdu@doctor\rule{\textwidth}{1mm}\vskip1bp\fi%
      \rule{\textwidth}{0.5pt}\vskip1pt%上面线为1pt粗
  \rule{\textwidth}{0.5pt}}}%
  \def\@evenhead{\vbox{\hbox to\textwidth{%
        \hskip1pt{\xiaowu}\hfil{\let\\=\relax\wuhao{西安电子科技大学硕士学位论文}}\hfil}%
      \vskip2pt\ifxdu@doctor\rule{\textwidth}{1mm}\vskip1bp\fi%
       \rule{\textwidth}{0.5pt}\vskip1pt%上面线为1pt粗
   \rule{\textwidth}{0.5pt}}}%
  \def\@oddfoot{\vbox{\hbox to\textwidth{\hfil\xiaowu\thepage\hfil}}}%
  \def\@evenfoot{\vbox{\hbox to\textwidth{\hfil\xiaowu\thepage\hfil}}}}
\renewcommand{\chaptermark}[1]{%
  \ifodd\c@page%
    \markboth{#1}{\xdu@ctitle}%
  \else%
    \markboth{\xdu@ctitle}{#1}%
  \fi}
\renewcommand{\sectionmark}[1]{}
\newlength\xdu@CJK@twochars
\newcommand{\xdu@unicode}[2]{\char\numexpr#1*256+#2\relax}
\def\xdu@CJK@space{\xdu@unicode{48}{7}}
\def\CJKindent{%
  \settowidth\xdu@CJK@twochars{\xdu@CJK@space\xdu@CJK@space}%
  \parindent\xdu@CJK@twochars}
\setlength{\parskip}{0pt \@plus2pt \@minus0pt}
\def\xdu@item@space{%
  \let\itemize\compactitem
  \let\enditemize\endcompactitem
  \let\enumerate\compactenum
  \let\endenumerate\endcompactenum
  \let\description\compactdesc
  \let\enddescription\endcompactdesc}
  % \dashuline{\hbox to #1{\hfill#2\hfill}}}
\def\xddashuline[#1]#2{%
  \dashuline{\hbox to #1{\hfill#2\hfill}}
}
\def\xduline[#1]#2{%
  \uline{\hbox to #1{\hfill#2\hfill}}
}
\newcommand\boldhei{%
\fontspec[BoldFont={Adobe Heiti Std},BoldFeatures={RawFeature={embolden=2}}]{Adobe Heiti Std}
}
\newcommand\boldsong{%
\fontspec[BoldFont={Adobe Song Std},BoldFeatures={RawFeature={embolden=2}}]{Adobe Song Std}
}

\def\xdu@daihao{10701}
\def\xdu@xuehao{0911120728}
\def\xdu@leihao{TP391.41}
\def\xdu@miji{公开}

\def\xdu@timuI{论文题目}
\def\xdu@timuII{}
\def\xdu@timuIII{}
\def\xdu@timuIIII{}
\def\xdu@xingming{作者姓名}
\def\xdu@jiaoshi{教师姓名职称}
\def\xdu@menglei{学科门类}
\def\xdu@zhuanye{学科专业}
\def\xdu@riqi{日期}

\newcommand\daihao[1]{\def\xdu@daihao{#1}}
\newcommand\xuehao[1]{\def\xdu@xuehao{#1}}
\newcommand\leihao[1]{\def\xdu@leihao{#1}}
\newcommand\miji[1]{\def\xdu@miji{#1}}

\newcommand\timuI[1]{\def\xdu@timuI{#1}}
\newcommand\timuII[1]{\def\xdu@timuII{#1}}
\newcommand\timuIII[1]{\def\xdu@timuIII{#1}}
\newcommand\timuIIII[1]{\def\xdu@timuIIII{#1}}
\newcommand\xingming[1]{\def\xdu@xingming{#1}}
\newcommand\jiaoshi[1]{\def\xdu@jiaoshi{#1}}
\newcommand\menglei[1]{\def\xdu@menglei{#1}}
\newcommand\zhuanye[1]{\def\xdu@zhuanye{#1}}
\newcommand\riqi[1]{\def\xdu@riqi{#1}}

\newcommand{\xdcover}{%

\ifxdu@master
{
\cleardoublepage
\thispagestyle{empty}
{
\bfseries\heiti\dawu
\makebox[1cm]{}\vspace{4mm}

\hspace{2mm}{代~~~~~~号}\xddashuline[4.3cm]{\boldhei\xdu@daihao} \hspace*{1.4cm}
{学~~~~~~号}\xddashuline[4.3cm]{\boldhei\xdu@xuehao} \vspace{3mm}

\hspace{2mm}{分~类~号}\xddashuline[4.3cm]{\boldhei\xdu@leihao} \hspace*{1.4cm}
{密~~~~~~级}\xddashuline[4.3cm]{\xdu@miji} \vspace{13.8cm}

\bfseries\sihao
\noindent\makebox[3.2cm][s]{\heiti 题{\xiaowu(中、英文)}目}\xddashuline[12cm]{\boldsong\songti\xdu@timuI} \vspace{-3mm}

\noindent\makebox[3.2cm][s]{}\xddashuline[12cm]{\boldsong\songti\xdu@timuII} \vspace{-3mm}

\noindent\makebox[3.2cm][s]{}\xddashuline[12cm]{\boldsong\xdu@timuIII} \vspace{-3mm}

\noindent\makebox[3.2cm][s]{}\xddashuline[12cm]{\boldsong\xdu@timuIIII}

\noindent\makebox[3.2cm][s]{\heiti 作者姓名}\xddashuline[3cm]{\songti\sanhao\xdu@xingming}
\makebox[4.4cm][s]{\heiti 指导教师姓名、职务}\xddashuline[4.46cm]{\songti\sanhao\xdu@jiaoshi}\vspace{-3mm}%\vspace{5mm}

\noindent\makebox[3.2cm][s]{\heiti 学科门类}\xddashuline[3cm]{\songti\sanhao\xdu@menglei}
\makebox[2.5cm][s]{\heiti 学科、专业}\xddashuline[6.3cm]{\songti\sanhao\xdu@zhuanye}\vspace{-1mm}%\vspace{7mm}

\noindent\makebox[3.2cm][s]{\heiti 提交论文日期}\xddashuline[12cm]{\songti\sanhao\xdu@riqi}
\makebox[1cm]{}

}

\cleardoublepage
\thispagestyle{empty}
{
\begin{center}
\bfseries \sanhao
西安电子科技大学

学位论文独创性（或创新性）声明
\end{center}

\xiaosi \setlength{\baselineskip}{20pt}
秉承学校严谨的学风和优良的科学道德，本人声明所呈交的论文是我个人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢中所罗列的内容以外，论文中不包含其他人已经发表或撰写过的研究成果；也不包含为获得西安电子科技大学或其它教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中做了明确的说明并表示了谢意。

申请学位论文与资料若有不实之处，本人承担一切的法律责任。\\

本人签名：\xduline[3cm]{} \hspace{2.5cm} 日期：\xduline[3cm]{} \\

\vspace{2cm}
\begin{center}
\bfseries \sanhao
西安电子科技大学

关于论文使用授权的说明
\end{center}

\xiaosi \setlength{\baselineskip}{20pt}
本人完全了解西安电子科技大学有关保留和使用学位论文的规定，即：研究生在校攻读学位期间论文工作的知识产权单位属西安电子科技大学。学校有权保留送交论文的复印件，允许查阅和借阅论文；学校可以公布论文的全部或部分内容，可以允许采用影印、缩印或其它复制手段保存论文。同时本人保证，毕业后结合学位论文研究课题再撰写的文章一律署名单位为西安电子科技大学。

本人授权西安电子科技大学图书馆保存学位论文，本学位论文属于\xdu@miji（保密级别），在
\xduline[1cm]{}年解密后适用本授权书，并同意将论文在互联网上发布。\\\\

本人签名：\xduline[3cm]{} \hspace{2.5cm} 日期：\xduline[3cm]{}  \\

导师签名：\xduline[3cm]{} \hspace{2.5cm} 日期：\xduline[3cm]{}
}
}
\fi
}


\renewcommand\chapter{%
  \xdu@clearpage%
  \if@mainmatter\thispagestyle{xdu@headings}%
  \else\thispagestyle{xdu@front}\fi%
  \phantomsection%
  \global\@topnum\z@%
  \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
  \if@mainmatter\refstepcounter{chapter}\fi
  \addcontentsline{toc}{chapter}{\xiaosi\song\bfseries\@chapapp\hskip1ex#1}%
  \chaptermark{\@chapapp\hskip2ex#1}%
  \@makechapterhead{#2}}
\def\@makechapterhead#1{\noindent%
  \parbox[b]{\textwidth}{\vskip0mm}%
  {\centering \sanhao\boldsong\bfseries%
    \ifnum \c@secnumdepth > \m@ne%
      \@chapapp\hskip1ex%
    \fi%
   \interlinepenalty\@M%
   #1\par\nobreak%
   \vskip4ex%
   \nointerlineskip}}
\def\@schapter#1{%
  \addcontentsline{toc}{chapter}{\xiaosi\song\bfseries#1}%
  \chaptermark{#1}%
  \@makeschapterhead{#1}
  \@afterheading}
\def\@makeschapterhead#1{\noindent%
  \parbox[b]{\textwidth}{\vskip0mm}%
  {\sanhao\song\bf\centering%
   \interlinepenalty\@M
   #1\par\nobreak%
   \vskip4ex%
   \nointerlineskip}}
\renewcommand\section{%
  \ifdim\prevdepth=-1000pt\dimen0=1ex%
  \else\dimen0=3ex\fi%
  \@startsection {section}{1}{\z@}%
  {\dimen0}%
  {1pt}%
  {\xiaosan[1.429]}}
\renewcommand\subsection{%
  \@startsection {subsection}{2}{2.0em}%
  {0pt}%
  {1pt}%
  {\sihao[1.429]}}
%\titleformat{\subsection}[block]%
%            {\sihao}{\thesubsection}%
%            {1ex}{}
%\titlespacing{\subsection}%
%    {2.1em}{1.5ex plus .1ex minus .2ex}{\wordsep}
\renewcommand{\tableofcontents}{%
  \xdu@clearpage%
  \phantomsection%
  \@makeschapterhead{\contentsname}%
  \chaptermark{\contentsname}%
  \@starttoc{toc}}
\newlength\xdu@dot@space
\setlength\xdu@dot@space{0.6pc}
\titlecontents{chapter}[0pt]{}%
              {\contentslabel{0pt}}%
              {\hspace*{0pt}}%
              {\titlerule*[\xdu@dot@space]{.}\bfseries\contentspage}
\dottedcontents{section}[5.8em]{}{2.1em}{\xdu@dot@space}
\dottedcontents{subsection}[8.8em]{}{2.7em}{\xdu@dot@space}
\def\xdu@define@term#1{
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname xdu@#1\endcsname{##1}}
  \csname #1\endcsname{}}
\xdu@define@term{subjectcode}
\xdu@define@term{catelognumber}
\xdu@define@term{classid}
\xdu@define@term{studentid}
\xdu@define@term{secretlevel}
\xdu@define@term{ctitle}
\xdu@define@term{cschool}
\xdu@define@term{cmajor}
\xdu@define@term{cfirstdiscipline}
\xdu@define@term{cseconddiscipline}
\xdu@define@term{cauthor}
\xdu@define@term{csupervisor}
\xdu@define@term{cassosupervisor}
\xdu@define@term{cdate}
\xdu@define@term{etitle}
\ifxdu@bachelor
\def\xdu@urule#1#2{\hskip2pt\underline{\hb@xt@#1{\hss#2\hss}}\hskip3pt}
\else
\def\xdu@urule#1#2{\hskip2pt\dashuline{\hb@xt@#1{\hss#2\hss}}\hskip3pt}
\fi
\def\xdu@put@prefix#1#2{\makebox[#1][s]{#2}}
\def\xdu@titlepage{%
  \ifxdu@bachelor%
    \xdu@titlepage@bachelor%
  \else%
    \xdu@titlepage@graduate%
  \fi}
\newcommand{\xdu@titlepage@bachelor}{
  \parbox[b]{0.9\linewidth}{%
    \xiaosi[1.5]\song\bf\ignorespaces\flushright%
    \xdu@put@prefix{3em}{\xdu@classid@prefix}\enskip%
    \xdu@urule{32mm}{\xdu@classid}\par%
    \xdu@put@prefix{3em}{\xdu@studentid@prefix}\enskip%
    \xdu@urule{32mm}{\xdu@studentid}}
  \begin{center}
    \ifxdu@print\vspace{132mm}\else\vspace{18mm}
    \includegraphics[width=77mm]{xdubadge}\par
    \vspace{15mm}
    \parbox[t]{\linewidth}{\chuhao\hei\centering\xdu@thesis@str}\par
    \vspace{15mm}
    \includegraphics[width=44mm]{xdulogo}\par
    \vspace{18mm}\fi
    \begin{minipage}{122mm}
      \flushleft\xiaosan[2.5]\song%
      \xdu@put@prefix{25mm}{\bf\xdu@ctitle@prefix}
      \xdu@urule{95mm}{}\par
      \xdu@put@prefix{25mm}{}\xdu@urule{95mm}{}\par
      \xdu@put@prefix{25mm}{\bf\xdu@cschool@prefix}
      \xdu@urule{95mm}{\xdu@cschool}\par
      \xdu@put@prefix{25mm}{\bf\xdu@cmajor@prefix}
      \xdu@urule{95mm}{\xdu@cmajor}\par
      \xdu@put@prefix{25mm}{\bf\xdu@cauthor@prefix}
      \xdu@urule{95mm}{\xdu@cauthor}\par
      \xdu@put@prefix{25mm}{\bf\xdu@csupervisor@prefix}
      \xdu@urule{95mm}{\xdu@csupervisor}
    \end{minipage}
    \vskip-87mm\hskip25mm
    \begin{minipage}{85mm}
      \xiaosan[2.5]\song\centering\ignorespaces\xdu@ctitle
    \end{minipage}
  \end{center}
}
\newcommand{\xdu@titlepage@graduate}{
  \parbox[b]{0.9\linewidth}{
    \dawu\heiti\bfseries\ignorespaces\flushright
    \xdu@put@prefix{14mm}{\xdu@subjectcode@prefix}%
    \xdu@urule{45mm}{\sf\bfseries\xdu@subjectcode}%
    \hspace{14mm}%
    \xdu@put@prefix{14mm}{\xdu@studentid@prefix}%
    \xdu@urule{45mm}{\sf\bfseries\xdu@studentid}\\[3mm]
    \xdu@put@prefix{14mm}{\xdu@catelognumber@prefix}%
    \xdu@urule{45mm}{\sf\bfseries\xdu@catelognumber}%
    \hspace{14mm}%
    \xdu@put@prefix{14mm}{\xdu@secretlevel@prefix}%
    \xdu@urule{45mm}{\xdu@secretlevel}}
  \ifxdu@print\vspace{135mm}\else\vspace{18mm}
  \begin{center}
    \includegraphics[width=77mm]{xdubadge-gr}\par
    \vspace{15mm}
    \parbox[t]{\linewidth}{\chuhao\hei\centering\xdu@thesis@str}\par
    \vspace{15mm}
    \includegraphics[width=44mm]{xdulogo}\par
    \vspace{18mm}
  \end{center}
  \fi
  \renewcommand{\baselinestretch}{1.5}
  \begin{flushleft}
    \bfseries\heiti\sihao%
    \xdu@put@prefix{32mm}{\xdu@ctitle@prefix}%
    \xdu@urule{114mm}{}\par\vskip1pt%
    \xdu@put@prefix{32mm}{}\xdu@urule{114mm}{}\par\vskip1pt%
    \xdu@put@prefix{32mm}{}\xdu@urule{114mm}{}\par\vskip1pt%
    \xdu@put@prefix{32mm}{}\xdu@urule{114mm}{}
  \end{flushleft}
  \vskip3mm
  \xdu@put@prefix{32mm}{\bfseries\heiti\sihao\xdu@cauthor@prefix}
  \xdu@urule{30mm}{\song\bf\sihao\xdu@cauthor}
  \xdu@put@prefix{42mm}{\bfseries\heiti\sihao\xdu@csupervisor@prefix}
  \xdu@urule{37mm}{\song\bf\sihao\xdu@csupervisor}\par\vskip5pt\noindent
  \xdu@put@prefix{32mm}{\bfseries\heiti\sihao\xdu@cfirstdiscipline@prefix}
  \xdu@urule{30mm}{\song\bf\sihao\xdu@cfirstdiscipline}
  \xdu@put@prefix{23mm}{\bfseries\heiti\sihao\xdu@cseconddiscipline@prefix}
  \xdu@urule{57mm}{\song\bf\sihao\xdu@cseconddiscipline}\par\vskip5mm\noindent
  \xdu@put@prefix{32mm}{\bfseries\heiti\sihao\xdu@cdate@prefix}
  \xdu@urule{114mm}{\song\bf\sihao\xdu@cdate}
  \noindent\vskip-77mm\hskip27mm
  \begin{minipage}{110mm}
    \centering\song\bf\sihao
    \xdu@ctitle\par
    \xdu@etitle
  \end{minipage}
  \renewcommand{\baselinestretch}{1.2}
}
\long\@xp\def\@xp\collect@@body\@xp#\@xp1\@xp\end\@xp#\@xp2\@xp{%
  \collect@@body{#1}\end{#2}}
\long\@xp\def\@xp\push@begins\@xp#\@xp1\@xp\begin\@xp#\@xp2\@xp{%
  \push@begins{#1}\begin{#2}}
\long\@xp\def\@xp\addto@envbody\@xp#\@xp1\@xp{%
  \addto@envbody{#1}}
\newcommand{\xdu@@cauthorbio}[1]{\long\gdef\xdu@cauthorbio{#1}}
\newenvironment{cauthorbio}[1]{\long\gdef\xdu@bio@photo{#1}%
  \collect@body\xdu@@cauthorbio}{}
\newcommand{\xdu@@eauthorbio}[1]{\long\gdef\xdu@eauthorbio{#1}}
\newenvironment{eauthorbio}{\collect@body\xdu@@eauthorbio}{}
\def\xdu@bio@photowidth{1.00in}   % width of the biography photo area
\def\xdu@bio@photodepth{1.25in}   % depth (height) of the biography photo area
\def\xdu@bio@hangwidth{1.15in}    % width cleared for the biography photo area
\def\xdu@bio@hangdepth{1.25in}    % depth cleared for the biography photo area
\newdimen\@xdtmpdimenA
\newdimen\@xdtmpdimenB
\newcount\@xdtmpcountA
\def\xdu@make@authorbio{%
  \begin{center}
    \sanhao[2]\hei{\xdu@authorbio@title}
  \end{center}
  \vskip2ex%
  \def\xdu@temp@photobox{\mbox{%
      \begin{minipage}[b][\xdu@bio@photodepth][c]{\xdu@bio@photowidth}%
        \centering \xdu@bio@photo%
      \end{minipage}}}
  \settoheight{\@xdtmpdimenA}{\xdu@temp@photobox}
  \@xdtmpdimenB=\xdu@bio@hangdepth%
  % countA has the hang depth
  \@xdtmpcountA=\@xdtmpdimenB
  % calculates lines needed to produce the hang depth
  \divide\@xdtmpcountA by \baselineskip
  \advance\@xdtmpcountA by 1% ensure we overestimate
  % reference the top of the photo area to the top of a capital T
  \settoheight{\@xdtmpdimenB}{\mbox{T}}%
  \noindent\makebox[0pt][l]{\hspace{-\xdu@bio@hangwidth}%
    \raisebox{\@xdtmpdimenB}[0pt][0pt]{%
      \raisebox{-\xdu@bio@photodepth}[0pt][0pt]{\xdu@temp@photobox}}}%
  \hangindent\xdu@bio@hangwidth%
  \hangafter-\@xdtmpcountA%
  \indent\xdu@cauthorbio\par
  \ifnum \prevgraf <\@xdtmpcountA\relax% detect when the biography text is shorter than the photo
  \advance\@xdtmpcountA by -\prevgraf% calculate how many lines we need to pad
  \advance\@xdtmpcountA by -1\relax% we compensate for the fact that we indented an extra line
  \@xdtmpdimenA=\baselineskip% calculate the length of the padding
  \multiply\@xdtmpdimenA by \@xdtmpcountA%
  \noindent\rule{0pt}{\@xdtmpdimenA}% insert an invisible support strut
  \fi%
  \xdu@eauthorbio\par%
}
\def\xdu@make@declaration{%
  \song\xiaosi[1.5]
  {\centering\bfseries\sanhao%
    \xdu@xidian@str\par\xdu@declaration@title\par}
  \vskip5pt\xdu@declaration@str\vskip15mm
  \xdu@put@prefix{5em}{\xdu@author@presig}\underline{\hskip30mm}\hskip25mm
  \xdu@put@prefix{2em}{\xdu@date@presig}\underline{\hskip30mm}\par
  \vskip20mm
  \ifxdu@bachelor{}\else
  {\centering\bfseries\sanhao%
    \xdu@xidian@str\par\xdu@authorization@title\par}
  \vskip5pt\xdu@authorization@str\par
  \vskip20mm
  \xdu@put@prefix{5em}{\xdu@author@presig}\underline{\hskip30mm}\hskip25mm
  \xdu@put@prefix{5em}{\xdu@supervisor@presig} \underline{\hskip30mm}\par
  \vskip10mm
  \xdu@put@prefix{4em}{\xdu@date@presig}
  \underline{\hskip1em\hskip30mm}\hskip25mm
  \xdu@put@prefix{4em}{\xdu@date@presig}
  \underline{\hskip1em\hskip30mm}
  \fi
}
\newcommand{\makecover}{
  \begin{titlepage}
    \xdu@titlepage
  \end{titlepage}
  \xdu@clearpage
  \addtolength{\topmargin}{15pt}
  \ifxdu@doctor
    \thispagestyle{xdu@empty}
    \xdu@make@authorbio
    \xdu@clearpage
  \fi
  \thispagestyle{xdu@empty}
  \xdu@make@declaration
  \xdu@clearpage
  \addtolength{\topmargin}{-15pt}
  \setcounter{page}{1}
  \xdu@makeabstract
}
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter%
                          -\fi\@arabic\c@equation}
\let\old@tabular\@tabular
\def\xdu@tabular{\wuhao\old@tabular}
\DeclareCaptionLabelFormat{xdu@cap}{{\wuhao#1\rmfamily#2}}
\DeclareCaptionLabelSeparator{xdu@sep}{\hspace{1em}}
\DeclareCaptionFont{xdu@capfont}{\wuhao}
\captionsetup{labelformat=xdu@cap,
              labelsep=xdu@sep,
              font=xdu@capfont,
              justification=centering}
\captionsetup[table]{position=top, belowskip={12bp-\intextsep}, aboveskip=3bp}
\captionsetup[figure]{position=bottom, belowskip={12bp-\intextsep}, aboveskip=3bp}
\captionsetup[subfloat]{font=xdu@capfont,captionskip=6bp,%
                        nearskip=6bp,farskip=0bp,topadjust=0bp}
\renewenvironment{table}{%
  \renewcommand* {\@floatboxreset}{%
    \reset@font\@setminipage}
  \dawu\@float{table}%
}{%
  \end@float\normalsize
}

\newcommand{\xdu@@cabstract}[1]{\long\gdef\xdu@cabstract{#1}}
\newenvironment{cabstract}{\collect@body\xdu@@cabstract}{}
\newcommand{\xdu@@eabstract}[1]{\long\gdef\xdu@eabstract{#1}}
\newenvironment{eabstract}{\collect@body\xdu@@eabstract}{}
\newcommand{\xdu@@ckeywords}[1]{\long\gdef\xdu@ckeywords{#1}}
\newenvironment{ckeywords}{\collect@body\xdu@@ckeywords}{}
\newcommand{\xdu@@ekeywords}[1]{\long\gdef\xdu@ekeywords{#1}}
\newenvironment{ekeywords}{\collect@body\xdu@@ekeywords}{}
\newcommand{\xdu@@cthesistype}[1]{\long\gdef\xdu@cthesistype{#1}}
\newenvironment{cthesistype}{\collect@body\xdu@@cthesistype}{}
\newcommand{\xdu@@ethesistype}[1]{\long\gdef\xdu@ethesistype{#1}}
\newenvironment{ethesistype}{\collect@body\xdu@@ethesistype}{}

\newcommand{\xdu@makeabstract}{%
  \xdu@mkabstracttrue%
  \chapter*{\cabstractname}%
  \normalsize\par\xdu@cabstract\vskip12bp%
  \setbox0=\hbox{\wuhao\song\bf\xdu@ckeywords@title}%
  \noindent\hangindent\wd0\hangafter1
  \box0{\wuhao\song\xdu@ckeywords}\vskip0bp%
  \setbox0=\hbox{\wuhao\song\bf\xdu@cthesistype@title}%
  \noindent\hangindent\wd0\hangafter1
  \box0{\wuhao\song\xdu@cthesistype}%

  \chapter*{\bfseries\eabstractname}%
  \normalsize\par\xdu@eabstract\vskip12bp%
  \setbox0=\hbox{\wuhao\bfseries Keywords:\ }%
  \noindent\hangindent\wd0\hangafter1
  \box0{\wuhao\xdu@ekeywords}\vskip0bp%
  \setbox0=\hbox{\wuhao\bf\xdu@ethesistype@title}%
  \noindent\hangindent\wd0\hangafter1
  \box0{\wuhao\xdu@ethesistype}%


  \xdu@mkabstractfalse%
}
\bibpunct{[}{]}{,}{s}{}{,}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
\unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
   \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
\DeclareRobustCommand\onlinecite{\@onlinecite}
\def\@onlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\renewenvironment{thebibliography}[1]{%
  \chapter*{\bibname}%
  \wuhao[1.5]%
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\renewcommand{\makelabel}[1]{##1\hfill}
    \settowidth\labelwidth{1.1cm}
    \setlength{\labelsep}{0.6em}
    \setlength{\itemindent}{0pt}
    \setlength{\leftmargin}{\labelwidth+\labelsep}
    \addtolength{\itemsep}{-0.7em}
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \interlinepenalty4000%
  \sfcode`\.\@m}
{\def\@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist}
\newenvironment{acknowledgments}{\chapter*{\xdu@ackname}}{}
\let\xdu@appendix\appendix
\renewenvironment{appendix}{
  \xdu@appendix
  \gdef\@chapapp{\appendixname~\thechapter}
}{}
\AtEndOfClass{\input{xduthesis.cfg}}%
\AtBeginDocument{\CJKindent}
\AtEndOfClass{\sloppy\xdu@item@space}
\endinput
%%
%% End of file `xduthesis.cls'.
