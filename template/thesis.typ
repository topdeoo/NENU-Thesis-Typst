#import "../lib.typ": thesis, kouhu
#import "@preview/subpar:0.1.1": grid as subfigure

#let (doc, cover, declare, abstract-cn, abstract-en, mainmatter, toc, nenu-bibliography) = thesis(
  thesis-type: "bachelor",
  degree: "academic",
  two-side: false,
  bibliography: bibliography.with("ref.bib"),
  fonts: (:),
  info: (
    title: ("基于 Typst 的东北师范大学学士学位论文"),
    title-en: ("My Thesis in English"),
    student-id: "2024123456",
    author: "张三",
    department: "信息科学与技术学院",
    major: "计算机科学与技术",
    supervisor: "李四",
    submit-date: datetime.today(),
  ),
  keywords-cn: ("Typst", "学士学位论文", "东北师范大学", "计算机科学与技术"),
  keywords-en: ("Typst", "Bachelor Thesis", "NENU", "Computer Science"),
)

#show: doc

#cover()

#declare()

#abstract-cn[
  论文第一页为中文内容摘要。应说明目的、研究方法、成果和结论。要突出本论文新的见解，语言力求精练，一般 200 字左右。为了便于文献检索，应在本页下方另起一行注明本文的关键词（三至五个）。

  论文第一页为中文内容摘要。应说明目的、研究方法、成果和结论。要突出本论文新的见解，语言力求精练，一般 200 字左右。为了便于文献检索，应在本页下方另起一行注明本文的关键词（三至五个）。
  论文第一页为中文内容摘要。应说明目的、研究方法、成果和结论。要突出本论文新的见解，语言力求精练，一般 200 字左右。为了便于文献检索，应在本页下方另起一行注明本文的关键词（三至五个）。
]

#abstract-en[
  The first page of the paper should contain an abstract in Chinese. It should state the purpose, research methods, results, and conclusions. The new insights of this paper should be highlighted, and the language should be concise, generally around 200 words. To facilitate literature retrieval, keywords (three to five) should be provided on a new line below the abstract on this page.

  The first page of the paper should contain an abstract in Chinese. It should state the purpose, research methods, results, and conclusions. The new insights of this paper should be highlighted, and the language should be concise, generally around 200 words. To facilitate literature retrieval, keywords (three to five) should be provided on a new line below the abstract on this page.
  The first page of the paper should contain an abstract in Chinese. It should state the purpose, research methods, results, and conclusions. The new insights of this paper should be highlighted, and the language should be concise, generally around 200 words. To facilitate literature retrieval, keywords (three to five) should be provided on a new line below the abstract on this page.
]

#toc()

#show: mainmatter

= 绪 论

== 列表

=== 有序列表

+ #kouhu(builtin-text: "aspirin", length: 10)
+ #kouhu(builtin-text: "aspirin", offset: 2, length: 10)
  + #kouhu(builtin-text: "aspirin", offset: 3, length: 5)
  + #kouhu(builtin-text: "aspirin", offset: 3, length: 10)
  + #kouhu(builtin-text: "aspirin", offset: 3, length: 15)

=== 无序列表

- #kouhu(builtin-text: "zhufu", length: 15)
- #kouhu(builtin-text: "zhufu", offset: 2, length: 15)
  - #kouhu(builtin-text: "zhufu", offset: 3, length: 15)
  - #kouhu(builtin-text: "zhufu", offset: 3, length: 15)
  - #kouhu(builtin-text: "zhufu", offset: 6, length: 15)

=== 术语（`Latex` 中的段落）

/ simp: #kouhu(builtin-text: "simp", length: 15)
/ 阿司匹林: #kouhu(builtin-text: "aspirin", length: 60)

== 图表

=== 表格

在这里引用表格，例如同一页中的表格：@tbl:usual-table，以及不同页中的表格，例如三线表：@tbl:three-line-table

我们使用 `@tbl:<label>` 来进行表的引用，其中 `<label>` 是跟在表格后的标签，使用尖括号括起来，例如下面的 `usual-table`。

#align(
  center,
  (
    stack(dir: ltr)[
      #figure(
        table(
          align: center + horizon,
          columns: 4,
          [x], [1], [2], [3],
          [y], [5 ms], [6 ms], [0.7 ms],
        ),
        caption: [常用表格示例],
      )<usual-table>
    ]
  ),
)

#pagebreak()

#align(
  center,
  (
    stack(dir: ltr)[
      #figure(
        table(
          align: center + horizon,
          columns: 4,
          stroke: none,
          table.hline(),
          [x], [y], [z], [t],
          table.hline(stroke: .5pt),
          [11], [5 ms], [3], [0.7],
          [3000], [80 ms], [1111], [0.9],
          table.hline()
        ),
        caption: [三线表示例],
      )<three-line-table>
    ]
  ),
)

=== 图片

我们可以插入图片，也可以修改图片的展示大小，引用图片，例如@fig:ida-star-50, @fig:ida-star-20

#figure(
  image("fig/ida-star-1.png", width: 50%),
  caption: [IDA\* 算法示例， 50% 比例缩放],
)<ida-star-50>

#figure(
  image("fig/ida-star-1.png", width: 20%),
  caption: [IDA\* 算法示例， 20% 比例缩放],
)<ida-star-20>

=== 子图

// FIXME: 子图的标号显示错误，可能与 i-figured & subpar 不兼容有关

// 子图可以使用 #link("https://typst.app/universe/package/subpar")[subpar] 包进行绘制，例如@fig:ida-star-1, @fig:ida-star-2

// #subfigure(
//   kind: "subfigure",
//   figure(
//     image("fig/ida-star-1.png", width: 50%),
//     caption: [第一步],
//   ),
//   <ida-star-1>,
//   figure(
//     image("fig/ida-star-2.png", width: 50%),
//     caption: [第二步],
//   ),
//   <ida-star-2>,
//   columns: (1fr, 1fr),
//   caption: [子图的使用],
//   numbering-sub: "a",
//   label: <ida-star>,
// )

#highlight(fill: red)[TODO]

=== 引用

我们通过 `.bib` 文件来创建参考文献，文件名可以任意选择，通过选项：`bibliography: bibliography.with("ref.bib")` 进行导入。

随后，通过 `#cite(<key>)` 进行引用，其中 `key` 是在 `.bib` 中设置的键。

在示例中，我们可以引用 `ref.bib` 文件中的内容，例如《Deep Learning》#cite(<goodfellow2016deep>)，引用2#cite(<丁文祥2000>)


== 数学公式


#nenu-bibliography(full: true)

