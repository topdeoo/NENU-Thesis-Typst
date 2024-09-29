#import "../fonts/fonts.typ": font-family, font-size
#import "../utils/format.typ": indent
#import "../utils/datetime.typ": datetime-display-cn-declare


#let bachelor-declare(
  // TODO 加入更多参数支持
  two-side: false,
  fonts: (:),
) = {
  fonts = font-family + fonts

  pagebreak(weak: true, to: if two-side { "odd" })
  
  v(80pt)

  align(
    center,
    text(
      font: fonts.宋体,
      size: font-size.三号,
      weight: "bold",
      "独   创   性   声   明\n"
    )
  )

  v(10pt)

  block(
    inset: 18pt
  )[
   #set text(font: fonts.宋体, size: font-size.四号, )
   #set par(justify: true, first-line-indent: 2em, leading: 10pt)

   #indent 本人郑重声明：所提交的毕业论文是本人在导师指导下独立进行研究工作所取得的成果。据我所知，除了特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果。对本人的研究作出重要贡献的个人和集体，均已在文中做了明确的说明。本声明的法律结果由本人承担。 
  ]

  v(-20pt)

  //TODO 加入自动识别是否存在签名的 `pdf` 或 `png`，在签名处自动填充
  set text(font: fonts.宋体, size: font-size.四号)
  [
  #h(2em)论文作者签名：#box(width: 8em, stroke: (bottom: 0.5pt), outset: 2pt)#h(1.5em)日期：#underline(offset: 2pt)[#datetime-display-cn-declare(datetime.today())]
  ]


}

