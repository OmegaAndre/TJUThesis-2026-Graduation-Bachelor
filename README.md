# 天津大学2026届本科生毕业论文Latex模板

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![参考项目1](https://img.shields.io/badge/Reference-hyzhangtjnk/TJU--2024--Graduation--Thesis-green)](https://github.com/hyzhangtjnk/TJU-2024-Graduation-Thesis-latex)
[![参考项目2](https://img.shields.io/badge/Reference-haimingz/tjuthesis-green)](https://github.com/haimingz/tjuthesis)

本项目是一个非官方的、但尽可能符合天津大学本科生毕业设计（论文）撰写规范的 LaTeX 模板。它旨在让同学们从繁琐的排版工作中解脱出来，专注于论文内容的撰写。

# 项目简介
本模板基于ctexbook文档类构建，严格参照《【2025修订版】天津大学本科生毕业设计（论文）相关材料撰写规范》以及《【2025修订版】1-1天津大学本科生毕业论文模板》进行设计。主要特性包括：

格式全自动：自动设置页眉、页脚、章节标题、字体大小、行间距等格式。

封面与声明：提供了论文封面、原创性声明和授权说明页的示例（可能需要手动填写部分信息或签名）。

中英文支持：完美支持中英文混排，提供中英文摘要环境。

参考文献：配置了符合学校要求的 BibLatex 参考文献格式（GB/T 7714-2015，**并将参考文献部分的序号字体改为宋体**）。

图表公式：预设了图表标题格式和公式编号样式，使用简单。

代码高亮：如果涉及代码，提供了优雅的代码高亮环境。（本模板只提供了一个简单的代码高亮模板，由于相关文件并没有对代码的格式进行规定，所以各位可以根据自己的喜好自行修改）

PDF书签：生成的PDF包含完整的书签，方便导航。

# 快速开始
系统要求:

目前的模板只能使用Windows的TeX Live编译器，暂时没有经过Overleaf和Mac系统（作者身边也没有用Mac的同学。。。）的测试。

编译链：

XeLatex->biber->XeLatex->XeLatex。

使用方法:

1. 在 Github 页面的 Release 部分下载最新的打包文件，解压后将您的内容分别填写到对应的部分并运行编译。

2. 基本信息填写：在 cover.tex 文件中，找到 `\ctitle`、`\cauthor`、`\cnumber`、`\csupervisor` 等命令，填写你的论文题目、姓名、学号、导师等信息；在 abstract.tex 文件中填写中英文摘要和关键词。

3. 撰写章节：在 contents/ 文件夹下对应的 .tex 文件中撰写各个章节的内容。

4. 插入图片：将图片放入 figures/ 文件夹，然后在文中使用 `\figuremacro` 命令引用（该宏的参数可见 format.tex 文件定义）。

5. 引用参考文献：在 reference.bib（模板中的bib文件是以原模板生成的伪文献信息） 文件中，以 BibLatex 格式添加你的文献条目。在文中需要引用的地方使用 \cite{label} 命令。

6. 生成目录：编译后会自动生成目录。经过完整的编译链编译后才会完成更新。

# 如何贡献
如果你在使用过程中发现了任何问题，或者有改进的建议，非常欢迎：

提交 Issue 描述问题或建议。

或者 Fork 本仓库，修改后提交 Pull Request。

# 许可证
本项目基于 GPL-3.0 许可证开源，详情请参见 LICENSE 文件。

# 致谢
感谢所有 LaTeX 宏包的开发者和维护者。

在制作这份模板的时候对`hyzhangtjnk/TJU-2024-Graduation-Thesis`项目和`haimingz/tjuthesis`进行了参考和学习，感谢这两位作者的开源。

祝各位同学毕业顺利，论文成功！
