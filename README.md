# 天津大学2026届本科生毕业论文Latex模板

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![参考项目1](https://img.shields.io/badge/Reference-hyzhangtjnk/TJU--2024--Graduation--Thesis-green)](https://github.com/hyzhangtjnk/TJU-2024-Graduation-Thesis-latex)
[![参考项目2](https://img.shields.io/badge/Reference-haimingz/tjuthesis-green)](https://github.com/haimingz/tjuthesis)

本项目是一个非官方的、师从往年优秀模板的、尽可能符合天津大学本科生毕业设计（论文）撰写规范的 LaTeX 模板。旨在让同学们从繁琐的排版工作中解脱出来，专注于论文内容的撰写。

# 项目介绍
本模板基于ctexbook文档类构建，严格参照《【2025修订版】天津大学本科生毕业设计（论文）相关材料撰写规范》以及《【2025修订版】1-1天津大学本科生毕业论文模板》进行设计。

目前可能是功能最完善、封装最完整、条理最清晰？的天津大学本科生毕设设计（论文）Latex模板，主要特性包括：

1. 格式全自动：自动设置页眉、页脚、章节标题、字体大小、行间距等格式。

2. 封面与声明：提供了论文封面、独创性声明的封装（需要手动填写信息以及签名）。

3. 中英文支持：完美支持中英文混排，提供中英文摘要环境。

4. 参考文献：配置了符合学校要求的 BibLatex 参考文献格式即遵循 GB/T 7714-2015 之要求。

5. 图表公式：预设了图表标题格式和公式编号样式，使用简单。

6. 代码高亮：如果涉及代码，提供了简单的代码高亮环境。（本模板只提供了一个简单的代码高亮模板，由于相关文件并没有对代码的格式进行规定，所以各位可以根据自己的喜好自行修改）

7. PDF书签：生成的PDF包含完整的书签，方便导航。

# 快速开始
系统要求:

本模板只使用Windows的TeX Live编译器进行过测试，没有经过Overleaf和Mac系统的测试。

- **本模板在Overleaf上编译会超出免费编译时长，为各位省钱就不做Overleaf版本适配了**

- **作者身边也没有用Mac的同学，但是如果也是使用Tex Live进行编译的话应该只需要修改字体设置中指定的系统字体？** 

编译链：

- **首选Latexmk(xelatex)，会自动选择合适的编译链**

- 其次可以使用：XeLatex->biber->XeLatex->XeLatex

使用方法:

1. 在 Github 页面的 Release 部分下载最新的打包文件，解压后将文件夹打开至IDE即可编译。

2. 基本信息填写：在 contents/introduction.tex 文件中，找到 `\ctitle`、`\cauthor`、`\cnumber`、`\csupervisor` 等命令，填写你的论文题目、姓名、学号、导师等信息，同样在该文件中填写中英文摘要和关键词。

3. 撰写章节：在 contents/ 文件夹下对应的 chapterX.tex 文件中撰写各个章节的内容，如需对章节进行增减还需要在 tjumain.tex 文件中修改插入的章节文件。

4. 插入图片：将图片放入 figures/ 文件夹，然后在文中使用 `\figuremacro` 命令插入（该宏的参数可见 cls 文件注释），并在文中使用 `\ref{label}` 命令引用。

5. 引用参考文献：在 reference.bib 文件（模板中的bib文件是以原模板生成的伪文献信息）中，以 BibLatex 格式添加你的文献条目。在文中需要引用的地方使用 `\cite{label}` 命令。

6. 独创性声明：如需将签过字的独创性声明加入电子版文章，只需要将其命名为 独创性声明.pdf 并替换模板根目录原文件编译即可。

7. 如果您使用Latex Workshop插件进行编译并使用本模板提供的vscode配置文件的话，您可以在插件中直接 **构建Latex项目** ，并在编译完成后使用 **清除辅助文件** 功能一键删除所有中间文件。

# 如何贡献
如果你在使用过程中发现了任何问题，或者有改进的建议，非常欢迎：

- 提交 Issue 描述问题或建议。

- 或者 Fork 本仓库，修改后提交 Pull Request。

# 许可证
本项目基于 GPL-3.0 许可证开源，详情请参见 LICENSE 文件。

# 致谢
感谢所有 LaTeX 宏包的开发者和维护者。

在制作这份模板的时候对`hyzhangtjnk/TJU-2024-Graduation-Thesis`项目和`haimingz/tjuthesis`进行了参考和学习，感谢这两位作者的开源。

祝各位同学毕业顺利，论文成功！
