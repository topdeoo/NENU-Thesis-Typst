#import "../lib.typ": thesis

#let (
  doc, cover, declare, abstract-cn, abstract-en, matter, toc
) = thesis(
  thesis-type: "bachelor",
  degree: "academic",
  two-side: false,
  bibliography: none,
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

#show: matter
