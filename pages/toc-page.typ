#import "../utils/format.typ": invisible-heading
#import "../fonts/fonts.typ": font-family, font-size

//! 目录
//! “目录”标题二字中间空2个汉字或4个半角空格，三号黑体字，居中无缩进，大纲级别为1级，段前48磅，段后24磅，1.5倍行距。

#let toc(
  two-side: false,
  fonts: (:),
  //! 其他参数
  depth: 3,
  title: "目    录",
  outlined: true,
  title-vspace: 0pt,
  title-text-args: auto,
  reference-font: auto,
  reference-size: font-size.小四,
  weight: ("bold", "regular"),
  //! 垂直间距
  above: (25pt, 14pt),
  below: (14pt, 14pt),
  indent: (0pt, 18pt, 28pt),
  font: (font-family.黑体, font-family.宋体),
  size: (font-size.小四, font-size.小四),
  //! 条目与页数之间的连线
  fill: (repeat([.], gap: 0.15em),),
  ..args,
) = {
  //! 默认参数
  fonts = font-family + fonts
  if (title-text-args == auto) {
    title-text-args = (font: fonts.黑体, size: font-size.三号, weight: "bold")
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

  //! 目录项内容一级目录项中文采用黑体，二级、三级目录项中文采用宋体，英文和数字采用Times New Roman字体，小四号，两端对齐，段前0行，段后0行，1.5倍行距。一级目录项首行无缩进，左右缩进0字符；二级目录项首行无缩进，左缩进1字符，右缩进0字符；三级目录项首行无缩进，左缩进2字符，右缩进0字符。目录宜在文档编辑软件中自动生成，并根据上述要求调整格式。

  set outline(indent: level => indent
    .slice(0, calc.min(level + 1, indent.len()))
    .sum())
  show outline.entry: entry => block(
    above: above.at(entry.level - 1, default: above.last()),
    below: below.at(entry.level - 1, default: below.last()),
    link(
      entry.element.location(),
      entry.indented(
        none,
        {
          text(
            font: font.at(entry.level - 1, default: font.last()),
            size: size.at(entry.level - 1, default: size.last()),
            {
              if entry.prefix() not in (none, []) {
                entry.prefix()
                h(.3em)
              }
              entry.body()
            },
          )
          box(
            width: 1fr,
            inset: (x: .25em),
            fill.at(entry.level - 1, default: fill.last()),
          )
          entry.page()
        },
        gap: 0pt,
      ),
    ),
  )
  //! 显示目录
  outline(title: none, depth: depth)

  // TODO 硕博论文需要显示插图与附表目录
}
