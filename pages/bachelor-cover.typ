#import "../fonts/fonts.typ": font-family, font-size
#import "../utils/color.typ": colorize
#import "../utils/datetime.typ": datetime-display-cn-cover
#import "../utils/format.typ": fakebold

#let bachelor-cover(
  //! 从 `thesis` 中传入的参数
  two-side: false,
  fonts: (:),
  info: (:),
  //! 封面的其余参数
  stoke-width: 0.5pt,
  info-inset: (x: 0pt, bottom: 1pt),
  info-key-width: 72pt,
  info-key-font: "宋体",
  info-value-font: "宋体",
  info-col-gutter: -3pt,
  info-row-gutter: 5pt

) = {
  fonts = font-family + fonts
  info = (
    title: ("毕业论文中文题目"),
    title-en: ("毕业论文英文题目"),
    student-id: "123456",
    author: "张三",
    department: "信息科学与技术学院",
    major: "计算机科学与技术",
    supervisor: "李四",
    submit-date: datetime.today(),
  ) + info

  if type(info.submit-date) == datetime {
    info.submit-date = datetime-display-cn-cover(info.submit-date)
  }

  let info-key(body) = {
    rect(
      width: 100%,
      inset: info-inset,
      stroke: none,
      text(
        font: fonts.at(info-key-font, default: "宋体"),
        size: font-size.小三,
        body
      )
    )
  }

  let info-value(key, body) = {
    set align(center)
    rect(
      width: 100%,
      inset: info-inset,
      stroke: (bottom: stoke-width + black),
      text(
        font: fonts.at(info-value-font, default: "宋体"),
        size: font-size.三号,
        bottom-edge: "descender",
        body,
      ),
    )
  }

  let info-long-value(key, body) = {
    grid.cell(colspan: 2,
      info-value(
        key,
        body
      )
    )
  }

  //! 渲染

  pagebreak(weak: true, to: if two-side {"odd"})

  pad[
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 9em,
      text(size: font-size.小四, font: fonts.宋体, weight: "medium")[
          学校代码：10200
      ],
      text(size: font-size.小四, font: fonts.宋体, weight: "medium")[
      学号：#info.student-id
      ]
    )
  ]

  v(22pt)

  set align(center)

  //! 校徽 & 校名 & 类型
  let nenu-logo = read("../assets/nenu-logo.svg")
  nenu-logo = colorize(nenu-logo, blue.darken(30%))
  image.decode(nenu-logo, width: 90pt)

  pad(image("../assets/nenu-title.svg", width: 126pt), top: 0cm, bottom: -0.8cm)


  text(size: font-size.小一, font: fonts.黑体, weight: "medium")[本科毕业论文]

  v(30pt)

  //! 标题
  // TODO 长标题填充
  text(size: font-size.二号, font: fonts.隶书, stroke: .5pt)[
    #fakebold[#info.title]
  ]

  v(3pt)

  text(size: font-size.三号, font: fonts.宋体, weight: "medium")[
    #info.title-en
  ]

  v(40pt)

  //! 作者信息
  pad(
    left: 20pt,
    block(
      width: 318pt,
      grid(
        columns: (info-key-width, info-key-width, 1fr),
        column-gutter: info-col-gutter,
        row-gutter: info-row-gutter,
        info-key("学生姓名："),
        info-long-value("author", info.author),
        info-key("指导教师："),
        info-long-value("major", info.major),
        info-key("所在学院："),
        info-long-value("department", info.department),
        info-key("所在专业："),
        info-long-value("major", info.major)
      )
    )
  )

  v(100pt)

grid(
rows: 2, row-gutter: 10pt,
text(size: font-size.小三, font: fonts.宋体)[
东北师范大学
],
text(size: font-size.小三, font: fonts.宋体)[
#info.submit-date
]
)


}
