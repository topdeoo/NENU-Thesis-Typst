#import "@preview/numbly:0.1.0": numbly
#let checkbox(checked: false) = {
  if checked {
    "✔"
  } else {
    "□"
  }
}
#let heading_style = (..nums) => {
  nums = nums.pos()
  if nums.len() == 1 {
    return numbering("一、", ..nums)
  } else {
    return numbering("1.1.", ..nums)
  }
}

#let cover(
  title: (school: "东北师范大学", type: "研究生学位论文开题报告"),
  author_info: (:),
  doc: [],
  bibliography: [],
) = {
  [\ \ \ \ ]
  set align(center)
  [ #set text(size: 22pt, weight: "bold")
    #title.school

    #title.type
  ]
  let ncols = 2
  set text(16pt)
  [\ \ \ \ \ \ ]
  grid(
    columns: (8em, 1fr),
    row-gutter: 1.3em,
    column-gutter: 0em,
    align: (center, left),
    [#"论  文  题   目："], [#author_info.title],
    [#"报 告 人 姓 名："], [#author_info.name],
    [#"研  究  方  向："], [#author_info.direction],
    [#"学  科  专  业："], [#author_info.major],
    [#"年              级："], [#author_info.grade],
    [#"学  历  层  次："],
    [#"博士生" #checkbox(checked: author_info.level == "博士生")
      #"硕士生" #checkbox(checked: author_info.level == "硕士生")],

    [#"学  位  类  型："],
    [
      #"学术学位" #checkbox(checked: author_info.type == "学术学位")
      #"专业学位" #checkbox(checked: author_info.type == "专业学位")
    ],

    [#"指  导  教  师："], [#author_info.supervisor],
    [#"培  养  单  位："], [#author_info.unit],
  )
  set align(left)
  doc
  pagebreak()
}

#let empty-par = par[#box()]
#let fake-par = context empty-par + v(-measure(empty-par + empty-par).height)

#let main_body(doc: []) = {
  set text(
  // font: ("SimSun", "Source Han Serif SC"),
  size: 14pt
)
  set par(leading: 1em, first-line-indent: 2em)
  set page(
    paper: "a4",
    margin: (
      top: 20mm,
      bottom: 20mm,
      left: 25mm,
      right: 25mm,
    ),
  )

  set heading(numbering: heading_style)
  show heading: head => {
    set text(size: 16pt, weight: "bold")

    v(0.5em)
    [
      #fake-par
      #set par(leading: 1em, first-line-indent: 2em)
      #context counter(heading).display()
      #head.body
    ]
    v(0.5em)
  }
  show bibliography: set heading(numbering: heading_style)
  doc
}

#let command = {
  v(0.5em)
  [
    #set align(center)
    #set text(size: 16pt, weight: "bold")
    #set par(leading: 1em)
    撰写说明
  ]
  v(0.5em)
  set text(size: 14pt)
  set par(leading: 2em, first-line-indent: 2em, spacing: 2em)
  [
    1.文献综述应基于选题领域内具有代表性的文献进行，需满足一定的字数要求。博士生：文科不得少于 10000 字，理科不得少于 6000 字。

    2.参考文献是指在开题报告中实际引用的文献。博士生实际引用文献须不少于 50 篇，硕士生实际引用文献须不少于 30 篇。参考文献格式参照学位论文格式要求，建议文中引用文献以脚注形式标注，并在文末按照字母顺序列出所有引用文献。

    3.博士生论文开题时间与学位论文通讯评阅时间间隔原则上不少于 1.5 年，硕士生论文开题时间与学位论文通讯评阅时间间隔原则上不少于 8 个月。
    开题报告审查小组根据开题报告情况，在相应的 □ 内打号。合格的开题报告，由学院存档并作为毕业审核材料之一。

    4.开题报告中的字体字号均用宋体小四，页边距上下 20MM,左右 25MM，用 A4 纸打印，于左侧装订成册。
    开题结束后，研究生需针对开题中所提问题与建议进行修改，并向学院提交开题报告修订花脸稿。
  ]
  pagebreak()
}

#let sign(sign_image, data: (:)) = {
  [
    #set align(right)
    指导教师签字：#box(
      sign_image, height: 1.15em
    ) \
    #data.year
    年
    #data.month
    月
    #data.day
    日
    #h(2.5em)
  ]
}

#let review_conclusion(teachers, sign_image, date: (year: "", month: "", day: "")) = {
  set table(stroke: (x, y) => {
    if y == 0 {
      (
        top: (
          dash: "dashed",
          thickness: 0.5pt,
        ),
        left: (
          thickness: 0.5pt,
        ),
        right: (
          thickness: 0.5pt,
        ),
      )
    } else {
      (top: 0.5pt, bottom: 0.5pt, left: 0.5pt, right: 0.5pt)
    }
  })
  let teacher_table_rows = ()
  for teacher in teachers {
    teacher_table_rows += (teacher.name, teacher.title, teacher.workplace)
  }
  table(
    columns: (1.53fr, 1.2fr, 3.56fr),
    rows: (2.2em,) * 10,
    inset: 10pt,
    align: center,
    table.cell(colspan: 3)[审查小组意见],
    table.cell(colspan: 3)[开题报告审查小组成员名单],
    ..teacher_table_rows
  )

  [
    #v(1em)
    #set text(weight: "bold")
    审查结论
    #v(2em)
  ]

  show table: set align(center)
  table(
    columns: (auto, auto),
    inset: 10pt,
    stroke: none,
    align: left,
    [合格，修改后可以进入学位论文写作阶段], [#box(width: 10pt, height: 10pt, stroke: 0.5pt)],
    [ 不合格，需再次进行学位论文开题报告], [#box(width: 10pt, height: 10pt, stroke: 0.5pt)],
  )

  set align(bottom + right)
  grid(
    columns: (auto, auto),
    gutter: 2em,
    [组长签字：], [#box(sign_image)],
    grid.cell(colspan: 2)[
      单位公章：
      #date.year 年 #date.month 月 #date.day 日
    ],
  )
}