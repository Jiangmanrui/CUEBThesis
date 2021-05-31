# 首都经济贸易大学博士学位论文Tex模版

本项目的目的是为了创建一个符合首都经济贸易大学研究生学位论文（博士）撰写规范的TeX模板，解决学位论文撰写时格式调整的痛点。

本项目基于中南大学研究生学位论文模板改编（https://github.com/CSUcse/CSUthesis）
参考文献采用了北京邮电大学研究生学位论文参考文献 BibTeX 样式（http://code.google.com/p/buptthesis/）

本模板依照[《首都经济贸易大学研究生学位论文写作指南（试行）》2016-11-14](https://yjs.cueb.edu.cn/glzd/gzwj/xkyxw/57066.htm)编写。

## 主要内容

1、封面（中、英文）
2、独创性声明和使用授权的说明
3、中文摘要
4、Abstract
5、目录
6、图表清单及主要符号表（不需要的可不列此部分）
7、正文
8、参考文献
9、附录
10、攻读博士/硕士学位期间取得的研究成果
11、致谢
12、作者简介


## 版本状况

支持学术学位博士论文。

其他涉密、定向等可能需要修改封面的情况，需要自行修改`CUEBthesis.cls`文件。

硕士也可按需修改`CUEBthesis.cls`文件。

以后版本会陆续改进各种bug。

## 文件介绍

### `CUEBthesis.cls`

样式文件，如果是标准的普通学术型博士，不需要管这个文件。

其他如涉密、定向之类的，目前本版本没有设计特定的设置功能，需要修改该文件。

对LaTeX有所了解的同学，也可按需修改这个文件。如果这个文件的样式设计有什么bug，欢迎在issue里提出。

### `content`目录

所有论文的编辑内容在这里。

`info.tex`：论文的各种信息，标题姓名学院之类的。添加盲审格式还没有搞。

`abstactcn.tex`和`abstracten.tex`：中英文摘要。

`chap1.tex`、`chap2.tex`：从绪论到除了结论之外的全部正文内容。`\cite`或`\upcite`的时候可能因为tex文件与主文件分离，LaTeX环境配置不到位，会有找不到bib的提示（Texlive+sublime会这样），没关系，照常插入需要的bibkey即可。

`conclusion.tex`：结论
`appdx.tex`：附录
`additional.tex`：攻读博士学位期间取得的研究成果
`thanks.tex`：致谢
`authorintro.tex`：作者简介

### `cuebthesis_main.tex`

论文主文件，增加章节时需要在这个文件增加相应的代码，最后以这个文件编译论文即可。运行时需要先运行Tex下的bibtex命令生成参考文献的bbl文件。

增加的章节需要编入content目录。

### `images`目录

放图片，模板已经配置了相对路径，所以在文中插图片时，直接用images目录下的相对路径即可，比如`images/cueb.png`，在正文中插入只需要`cueb.png`。

## 编译

请使用`xelatex`，对`cuebthesis_main.tex`文件进行编译。如果出现图表连接问题，请运行两遍。

使用高级文本编辑器，如sublime等，否则可能因为ANSI、UTF-8等编码格式问题编译失败。
