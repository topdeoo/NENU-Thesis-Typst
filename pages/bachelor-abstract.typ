#import "../fonts/fonts.typ": font-family, font-size
#import "../utils/format.typ": invisible-heading, indent, fake-par, fakebold

#let bachelor-abstract(
  //! 固定参数
  two-side: false,
  fonts: (:),
  //! 摘要参数
  display-lang: "cn",
  keywords: (),
  leading: 1em,
  spacing: 1em,
  //! 目录参数
  toc-enable: true,
  //! 摘要内容
  body
) = {

  //! 参数处理
  fonts = font-family + fonts

  //! 渲染
  pagebreak(
    weak: true,
    to: if two-side {
      "odd"
    },
  )

  set text(font: fonts.宋体, size: font-size.五号)
  set par(leading: leading, justify: true)
  show par: set block(spacing: spacing)

  // TODO 优化页码索引
  set page(numbering: (..idx) => {
    text(size: font-size.五号, numbering("I", idx.pos().first()))
  })

  if display-lang == "cn" {
    [
      #invisible-heading(level: 1, outlined: toc-enable, "摘要")

      #align(center)[
        #set text(font: fonts.宋体, weight: "bold", size: font-size.四号)
        #v(1em)
        摘#h(1em)要
        #v(1em)
      ]

      #[
        #set par(first-line-indent: 2em)

        #fake-par

        #body
      ]

      #v(1em)


      #fakebold[关键词：]#(("",) + keywords.intersperse("；")).sum()
    ]
  } else {
    [
      #invisible-heading(level: 1, outlined: toc-enable, "Abstract")

      #align(center)[
        #set text(font: fonts.宋体, weight: "bold", size: font-size.四号)
        #v(1em)
        Abstract
        #v(1em)
      ]

      #[
        #set par(first-line-indent: 2em)

        #fake-par

        #body
      ]

      #v(1em)

      #fakebold[Keywords: ]#(("",) + keywords.intersperse("; ")).sum()
    ]
  }

}