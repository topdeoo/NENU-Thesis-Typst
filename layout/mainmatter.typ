#import "../fonts/fonts.typ": font-family, font-size
#import "@preview/i-figured:0.2.4"
#import "@preview/numbly:0.1.0": numbly
#import "../utils/format.typ": fake-par


/// 正文部分设置
#let mainmatter(
  fonts: (:),
  // TODO 支持硕士论文的书写规范要求
  text-args: auto,
  heading-font: auto,
  heading-size: (font-size.四号, font-size.小四, font-size.五号),
  leading: 1.25 * font-size.五号 - 0.7em,
  spacing: 1.25 * font-size.五号 - 0.7em,
  justify: true,
  first-line-indent: 2em,
  figure-sep: " ",
  figure-caption-style: strong,
  ..args,
  it,
) = {

  //! 设置字体与字号
  fonts = font-family + fonts

  if text-args == auto {
    text-args = (font: fonts.宋体, size: font-size.五号)
  }

  if heading-font == auto {
    heading-font = (fonts.宋体,)
  }

  let array-at(arr, pos) = {
    arr.at(calc.min(pos, arr.len()) - 1)
  }

  //! 设置正文样式

  //! 1. 文字与段落（文字大小，间距，段落行间距，缩进，代码块）
  set text(..text-args)
  set par(
    leading: leading,
    justify: justify,
    first-line-indent: first-line-indent,
  )

  show par: set block(spacing: spacing)
  show raw: set text(font: fonts.等宽)

  //! 2. 脚注
  show footnote.entry: set text(font: fonts.宋体, size: font-size.五号)

  //! 3. 图片&表格设置
  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure

  show figure.where(kind: table): set figure.caption(position: top)
  set figure.caption(separator: figure-sep)
  show figure.caption: figure-caption-style
  show figure.caption: set text(..text-args)

  //! 4. 公式编号
  show math.equation.where(block: true): i-figured.show-equation

  //! 5. 列表显示（专业名词不缩进）
  show terms: set par(first-line-indent: 0pt)

  //! 标题
  set heading(
    numbering: numbly(
      "第{1:一}章",
      "{1:1}.{2}",
      "{1}.{2}.{3}",
    ),
  )
  show heading: it => {
    set text(
      font: array-at(heading-font, it.level),
      size: array-at(heading-size, it.level),
      weight: "bold",
    )
    it
    fake-par
  }

  it
}