#import "../fonts/fonts.typ": font-family, font-size
#import "@preview/i-figured:0.2.4"
#import "@preview/numbly:0.1.0": numbly
#import "../utils/format.typ": fake-par, unpack

/// 正文部分设置
#let mainmatter(
  fonts: (:),
  // TODO 支持硕士论文的书写规范要求
  text-args: auto,
  //! 标题配置
  heading-font: auto,
  heading-size: (font-size.四号, font-size.小四, font-size.五号),
  heading-pagebreak: (true, false),
  heading-align: (center, auto),
  heading-padding: (top: 2*15.6pt - .7em, bottom: (2*15.6pt - .7em, 1.5*15.6pt - .7em)),
  //! 页眉配置
  header-title: ("东北师范大学学士学位论文",),
  header-vspace: 0em,
  //! 段落配置
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

  let heading-text-args-lists = args.named().pairs().filter(pair => pair.at(0).starts-with("heading-")).map(pair => (
    pair.at(0).slice("heading-".len()),
    pair.at(1),
  ))


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
    // TODO 取消此处的硬编码
    if it.level == 1 {
      v(1em)
    }
    set text(
      font: array-at(heading-font, it.level),
      size: array-at(heading-size, it.level),
      weight: "bold",
      ..unpack(heading-text-args-lists.map(pair => (pair.at(0), array-at(pair.at(1), it.level)))),
    )
    set block(
      above: heading-padding.top,
      below: array-at(heading-padding.bottom, it.level),
    )
    it
    fake-par
  }

  show heading: it => {
    if (array-at(heading-pagebreak, it.level)) {
      if ("label" not in it.fields() or str(it.label) != "no-auto-pagebreak") {
        pagebreak(weak: true)
      }
    }
    if (array-at(heading-align, it.level) != auto) {
      set align(array-at(heading-align, it.level))
      it
    } else {
      set align(left)
      it
    }
  }

  //! 页眉与页脚
  set page(..(
    header: {
      counter(footnote).update(0)
      locate(loc => {
        // TODO 增加硕士/博士学位论文支持
        set text(font: fonts.宋体, size: font-size.五号)
        set align(center)
        stack(
          header-title.at(0),
          v(.3em),
          line(length: 100%),
        )
        v(header-vspace)

      })
    },
    numbering: (..idx) => {
      text(size: font-size.五号, numbering("1", idx.pos().first()))
    },
  ))

  counter(page).update(1)

  it
}