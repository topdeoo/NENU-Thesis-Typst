#import "../fonts/fonts.typ": font-family, font-size

#let nenu-bibliography(
  bibliography: none,
  title: "参考文献",
  full: false,
  style: "gb-7714-2005-numeric",
) = {
  assert(bibliography != none, message: "bibliography 函数不能为空")

  set page(..(
    numbering: (..idx) => { },
  ))

  set text(lang: "zh", size: font-size.五号, font: font-family.宋体)

  bibliography(
    title: title,
    full: full,
    style: style,
  )
}
