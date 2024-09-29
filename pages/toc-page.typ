#import "@preview/outrageous:0.1.0"
#import "../utils/format.typ": invisible-heading
#import "../fonts/fonts.typ": font-family, font-size

// 目录生成
#let toc(
  two-side: false,
  fonts: (:),
  // 其他参数
  depth: 3,
  title: "目　　录",
  outlined: false,
  title-vspace: 0pt,
  title-text-args: auto,
  // 引用页数的字体，这里用于显示 Times New Roman
  reference-font: auto,
  reference-size: font-size.小四,
  font: auto,
  size: (font-size.四号, font-size.小四),
  // 垂直间距
  vspace: (25pt, 14pt),
  indent: (0pt, 18pt, 28pt),
  // 全都显示点号
  fill: (auto,),
  ..args,
) = {
  // 1.  默认参数
  fonts = font-family + fonts
  if (title-text-args == auto) {
    title-text-args = (font: fonts.宋体, size: font-size.三号, weight: "bold")
  }
  // 引用页数的字体，这里用于显示 Times New Roman
  if (reference-font == auto) {
    reference-font = fonts.宋体
  }
  // 字体与font-size
  if (font == auto) {
    font = (fonts.宋体, fonts.黑体)
  }

  let weight = ("regular", "bold")

  // 2.  正式渲染
  pagebreak(weak: true, to: if two-side { "odd" })

  // 默认显示的字体
  set text(font: reference-font, size: reference-size)

  {
    set align(center)
    text(..title-text-args, title)
    // 标记一个不可见的标题用于目录生成
    invisible-heading(level: 1, outlined: outlined, title)
  }

  v(title-vspace)

  show outline.entry: outrageous.show-entry.with(
    // 保留 Typst 基础样式
    ..outrageous.presets.typst,
    body-transform: (level, it) => {
      // 设置字体和font-size
      set text(
        font: font.at(calc.min(level, font.len()) - 1),
        size: size.at(calc.min(level, size.len()) - 1),
        weight: weight.at(calc.min(level, size.len() - 1))

      )
      // 计算缩进
      let indent-list = indent + range(level - indent.len()).map((it) => indent.last())
      let indent-length = indent-list.slice(0, count: level).sum()
      h(indent-length) + it
    },
    vspace: vspace,
    fill: fill,
    ..args,
  )

  // 显示目录
  outline(title: none, depth: depth)

}