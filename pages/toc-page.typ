#import "@preview/outrageous:0.2.0"
#import "../utils/format.typ": invisible-heading
#import "../fonts/fonts.typ": font-family, font-size

// 目录生成
#let toc(
  two-side: false,
  fonts: (:),
  //! 其他参数
  depth: 3,
  title: "目  录",
  outlined: true,
  title-vspace: 0pt,
  title-text-args: auto,
  reference-font: auto,
  reference-size: font-size.小四,
  weight: ("bold", "regular",),
  //! 垂直间距
  vspace: (25pt, 14pt),
  indent: (0pt, 18pt, 28pt),
  //! 条目与页数之间的连线
  fill: ("", auto),
  ..args,
) = {
  //! 默认参数
  fonts = font-family + fonts
  if (title-text-args == auto) {
    title-text-args = (font: fonts.宋体, size: font-size.四号, weight: "bold")
  }

  if (reference-font == auto) {
    reference-font = fonts.宋体
  }

  // TODO 优化页码索引
  set page(numbering: (..idx) => {
    text(size: font-size.五号, numbering("I", idx.pos().first()))
  })

  //! 正式渲染
  pagebreak(
    weak: true,
    to: if two-side {
      "odd"
    },
  )

  set text(font: reference-font, size: reference-size)

  {
    set align(center)
    text(..title-text-args, title)
    invisible-heading(level: 1, outlined: outlined, "目录")
  }

  v(title-vspace)

  show outline.entry: outrageous.show-entry.with(
    ..outrageous.presets.typst,
    body-transform: (level, it) => {
      // TODO 一级标题的页码需要加粗
      set text(
        font: fonts.宋体,
        size: font-size.五号,
        weight: weight.at(calc.min(level, weight.len()) - 1),
      )
      // 计算缩进
      let indent-list = indent + range(level - indent.len()).map(it => indent.last())
      let indent-length = indent-list.slice(0, count: level).sum()
      if "children" in it.fields() {
        let (number, space, ..text) = it.children
        style(styles => {
          [#h(indent-length) #number #h(.5em) #text.join()]
        })
      } else {
        h(indent-length) + it
      }
    },
    vspace: vspace,
    fill: fill,
    ..args,
  )

  //! 显示目录
  outline(title: none, depth: depth)

  // TODO 硕博论文需要显示插图与附表目录

}