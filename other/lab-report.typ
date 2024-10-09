#let font-size = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)

#let font-family = (
  // 宋体，属于「有衬线字体」，一般可以等同于英文中的 Serif Font
  // 这一行分别是「新罗马体（有衬线英文字体）」、「思源宋体（简体）」、「思源宋体」、「宋体（Windows）」、「宋体（MacOS）」
  宋体: ("Times New Roman", "Source Han Serif SC", "Source Han Serif", "Noto Serif CJK SC", "SimSun", "Songti SC", "STSongti"),
  // 黑体，属于「无衬线字体」，一般可以等同于英文中的 Sans Serif Font
  // 这一行分别是「Arial（无衬线英文字体）」、「思源黑体（简体）」、「思源黑体」、「黑体（Windows）」、「黑体（MacOS）」
  黑体: ("Arial", "Source Han Sans SC", "Source Han Sans", "Noto Sans CJK SC", "SimHei", "Heiti SC", "STHeiti"),
  // 楷体
  楷体: ("Times New Roman", "KaiTi", "Kaiti SC", "STKaiti", "FZKai-Z03S"),
  // 仿宋
  仿宋: ("Times New Roman", "FangSong", "FangSong SC", "STFangSong", "FZFangSong-Z02S"),
  // 等宽字体，用于代码块环境，一般可以等同于英文中的 Monospaced Font
  // 这一行分别是「Courier New（Windows 等宽英文字体）」、「思源等宽黑体（简体）」、「思源等宽黑体」、「黑体（Windows）」、「黑体（MacOS）」
  等宽: ("Courier New", "Menlo", "IBM Plex Mono", "Source Han Sans HW SC", "Source Han Sans HW", "Noto Sans Mono CJK SC", "SimHei", "Heiti SC", "STHeiti"),
)

#let colorize(svg, color) = {
  let blk = black.to-hex()
  // You might improve this prototypical detection.
  if svg.contains(blk) {
    // Just replace
    svg.replace(blk, color.to-hex())
  } else {
    // Explicitly state color
    svg.replace("<svg ", "<svg fill=\"" + color.to-hex() + "\" ")
  }
}

#let datetime-display-cn-cover(date) = {
  date.display("[year]    年   [month]  月")
}

#let report-cover(
  fonts: (:),
  info: (:),
  stoke-width: 0.5pt,
  info-inset: (x: 0pt, bottom: 1pt),
  info-key-width: 72pt,
  info-key-font: "宋体",
  info-value-font: "宋体",
  info-col-gutter: -3pt,
  info-row-gutter: 5pt,
) = {

  fonts = fonts + font-family
  info = (
    year: "2024",
    season: "春",
    lesson: "人工智能导论",
    teacher: "李四",
    author: "张三",
    student-id: "123456",
    grade: "2024",
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
        body,
      ),
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
    grid.cell(
      colspan: 2,
      info-value(
        key,
        body,
      ),
    )
  }


  pagebreak(weak: true)

  v(50pt)

  set align(center)

  let nenu-logo = read("../assets/nenu-logo.svg")
  nenu-logo = colorize(nenu-logo, blue.darken(30%))
  image.decode(nenu-logo, width: 7.28cm)

  pad(image("../assets/nenu-title.svg", width: 6.14cm), top: 0cm, bottom: 0cm)

  text(font: fonts.黑体, size: font-size.小二, "信  息  科  学  与  技  术  学  院\n\n")

  text(font: fonts.黑体, size: font-size.小初, weight: "medium", "实    验    报    告\n")
  text(font: fonts.宋体, size: font-size.四号, weight: "medium")[

    （ #info.year 年 #info.season 季 学期 ）
  ]

  v(20pt)

  pad(
    left: 20pt,
    block(
      width: 318pt,
      grid(
        columns: (info-key-width, info-key-width, 1fr),
        column-gutter: info-col-gutter,
        row-gutter: info-row-gutter,
        info-key("课程名称："), info-long-value("lession", info.lesson), info-key("指导教师："),
        info-long-value("major", info.teacher), info-key("学生姓名："), info-long-value("author", info.author),
        info-key("学   号："), info-long-value("student-id", info.student-id), info-key("年   级："),
        info-long-value("grade", info.grade),
      ),
    ),
  )

  v(80pt)

  text(size: font-size.四号, font: fonts.宋体)[
    #info.submit-date
  ]

}

#let report-content(
  fonts: (:),
  lab-info: (:),
  body,
) = {

  fonts = font-family + fonts

  lab-info = (
    lab-title: "A*算法",
    lab-for: "理解A*算法",
    lab-dev: "Intel 13th i5",
    lab-requirement: "实验要求实验要求",
    lab-result: "实验结果与结论，简要概括",
  ) + lab-info

  pagebreak(weak: true)

  set page(margin: (left: 2.5cm, right: 2cm))

  {
    set align(center)
    text(font: fonts.宋体, size: font-size.小初, weight: "medium")[
      实验报告
    ]
  }

  {

    set text(font: fonts.宋体, size: font-size.小三)
    table(
      columns: (120pt, 1fr, 90pt, 1fr),
      stroke: .5pt,
      align: center + horizon,
      [#text(weight: "medium")[实验题目]], table.cell(colspan: 3)[#lab-info.lab-title],
      [#text(weight: "medium")[实验目的]], table.cell(colspan: 3)[#lab-info.lab-for],
      [#text(weight: "medium")[实验设备]], table.cell(colspan: 3)[#lab-info.lab-dev],
      [#text(weight: "medium")[实验基本要求]], table.cell(colspan: 3)[#lab-info.lab-requirement],
    )
    v(-1.2em)
    table(
      columns: 1fr,
      stroke: .5pt,
      inset: 10pt
    )[
      #v(1em)
      #pad(left: 1.5em, right: 1em)[
        #set align(left)
        #body
      ]
      #v(22em)
    ]
    v(-1.2em)
    table(
      columns: (.5fr, 1fr),
      stroke: .5pt,
      align: center + horizon,
      [#text(weight: "medium")[实验结果或结论]], [#lab-info.lab-result],
    )
  }
}

#let report(
  fonts: (:),
  info: (:),
  lab-info: (:),
) = {

  fonts = font-family + fonts

  return (
    info: info,
    cover: (..args) => {
      report-cover(
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
        info: info + args.named().at("info", default: (:)),
      )
    },
    ctx: (..args) => {
      report-content(
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
        lab-info: lab-info + args.named().at("lab-info", default: (:)),
      )
    },
  )

}

#let (info, cover, ctx) = report(
  fonts: (:),
  info: (
    year: "2024",
    season: "春",
    lesson: "算法设计与分析",
    teacher: "李四",
    author: "张三",
    student-id: "123456",
    grade: "2022",
    submit-day: datetime.today(),
  ),
  lab-info: (
    lab-title: "SVM",
    lab-for: "理解SVM算法",
    lab-dev: "RTX 4080 Super",
    lab-requirement: "实验要求实验要求",
    lab-result: "实验结果与结论，简要概括",
  ),
)

#cover()


#ctx()[
  实验实验实验实验实验实验

  实验实验实验

  实验实验实验

  实验实验实验实验实验实验实验实验实验实验实验实验实验实验实验
  实验实验实验实验实验实验

  实验实验实验实验实验实验
]

