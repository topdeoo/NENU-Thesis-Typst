/// This template is written by [@zengls](https://github.com/zengls3186428803)
/// Improved by [@virgil](https://github.com/topdeoo)

#import "@preview/numbly:0.1.0": numbly
#import "@preview/cuti:0.2.1": fakebold

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

// 中文缩进
#let indent = h(2em)

// 选项栏
#let checkbox(checked: false) = {
  if checked {
    box(
      stroke: .05em,
      height: .8em,
      width: .8em,
      {
        box(move(dy: .48em, dx: 0.1em, rotate(45deg, reflow: false, line(length: 0.3em, stroke: .1em))))
        box(move(dy: .38em, dx: -0.05em, rotate(-45deg, reflow: false, line(length: 0.48em, stroke: .1em))))
      },
    )
  } else {
    box(
      stroke: .05em,
      height: .8em,
      width: .8em,
    )
  }
}

#let datetime-display-cn-declare(date) = {
  date.display("[year] 年  [month]  月  [day]  日")
}

#let distr(s, w: auto) = {
  block(width: w, stack(dir: ltr, ..s.clusters().map(x => [#x]).intersperse(1fr)))
}

#let cover(
  title: (school: "东北师范大学", type: "研究生学位论文开题报告"),
  author_info: (:),
) = {

  set align(center)
  set text(size: font-size.二号, font: font-family.黑体)
  v(4em)
  fakebold[#title.school #v(.5em) #title.type]

  set text(size: font-size.三号, font: font-family.楷体)
  v(3.5em)

  par(
    justify: true,
    grid(
      columns: (.35fr, 1fr),
      row-gutter: 1.3em,
      column-gutter: 0em,
      align: (center, left),
      distr("论文题目", w: 7em), [：#author_info.title],
      distr("报告人姓名", w: 7em), [：#author_info.name],
      distr("研究方向", w: 7em), [：#author_info.direction],
      distr("学历层次", w: 7em), [：#author_info.major],
      distr("年级", w: 7em), [：#author_info.grade],
      distr("学历层次", w: 7em),
      [：博士生 #checkbox(checked: author_info.level == "博士生")
        #h(1em)硕士生 #checkbox(checked: author_info.level == "硕士生")],

      distr("学位类型", w: 7em),
      [
        ：学术学位 #checkbox(checked: author_info.type == "学术学位")
        #h(1em)专业学位 #checkbox(checked: author_info.type == "专业学位")
      ],

      distr("指导教师", w: 7em), [：#author_info.supervisor],
      distr("培养单位", w: 7em), [：#author_info.unit],
    ),
  )
  set align(left)
  pagebreak()
}

#let command = {
  set page(margin: (top: 2.54cm, bottom: 2.54cm, left: 3.18cm, right: 3.18cm))
  v(1.5em)

  [
    #set align(center)
    #set text(size: font-size.三号, font: font-family.楷体)
    #set par(leading: 1em)
    #fakebold[撰写说明]
  ]

  v(1em)
  set text(size: font-size.四号)
  set par(leading: 1.5em, first-line-indent: 2em, spacing: 1.5em, justify: true)
  [
    1.文献综述应基于选题领域内具有代表性的文献进行，需满足一定的字数要求。博士生：文科不得少于10000字，理科不得少于6000字。硕士生：文科不得少于5000字，理科不得少于3000字。

    2.参考文献是指在开题报告中实际引用的文献。博士生实际引用文献须不少于 50 篇，硕士生实际引用文献须不少于 30 篇。参考文献格式参照学位论文格式要求，建议文中引用文献以脚注形式标注，并在文末按照字母顺序列出所有引用文献。

    3.博士生论文开题时间与学位论文通讯评阅时间间隔原则上不少于 1.5 年，硕士生论文开题时间与学位论文通讯评阅时间间隔原则上不少于 8 个月。
    开题报告审查小组根据开题报告情况，在相应的 #checkbox() 内打号。合格的开题报告，由学院存档并作为毕业审核材料之一。

    4.开题报告审查小组根据开题报告情况，在相应的 #checkbox() 内打 $checkmark.light$ 号。合格的开题报告，由学院存档并作为毕业审核材料之一。

    5.开题报告中的字体字号均用宋体小四，页边距上下20MM,左右25MM，用A4纸打印，于左侧装订成册。

    6.开题结束后，研究生需针对开题中所提问题与建议进行修改，并向学院提交开题报告修订花脸稿。

  ]
  pagebreak()
}

#let empty-par = par[#box()]
#let fake-par = context empty-par + v(-measure(empty-par + empty-par).height)

#let doc(it) = {
  set page(margin: (top: 2cm, bottom: 2cm, left: 2.5cm, right: 2.5cm))
  set text(size: font-size.四号, font: font-family.宋体)
  set par(leading: 1em, first-line-indent: 2em)
  set heading(
    numbering: numbly(
      "{1:一}、",
      "{1:1}.{2}",
      "{1}.{2}.{3}",
    ),
  )
  show heading: it => {

    let title = it.body.text.split("（").first()
    let content = it.body.text.split("（").last()
    if title == "参考文献" {
      content = none
    }
    // TODO 优化这部分显示
    v(0.5em)
    [
      #fake-par
      #set par(leading: 1em, first-line-indent: 2em)
      #if it.level == 1 {
        text(font: font-family.黑体, size: font-size.三号)[
          #fakebold[#counter(heading).display() #title]
        ]
        if content != none {
          text(font: font-family.楷体, size: font-size.四号)[
            （#content
          ]
        }
      } else {
        text(font: font-family.黑体, size: font-size.小三)[
          #counter(heading).display() #title
        ]
      }
    ]
  }
  it
}

#let nenu-bibliography(
  bibliography: none,
  full: false,
  style: "gb-7714-2005-numeric",
) = {
  [
    = 参考文献
  ]
  assert(bibliography != none, message: "bibliography 函数不能为空")

  set text(lang: "zh", size: font-size.四号, font: font-family.宋体)

  bibliography(
    title: none,
    full: full,
    style: style,
  )
}

// [!FIXME] 增加 dx, dy 偏移量参数，使得签名能够放在恰当的位置上
#let sign(sign_image, date: datetime) = {
  place(right + bottom)[
    指导教师签字：#box(
      sign_image, height: 1.15em
    ) \
    #datetime-display-cn-declare(date)
    #h(3em)
  ]
}

#let review_conclusion(teachers, sign_image, date: datetime) = {
  let teacher_table_rows = ()
  for teacher in teachers {
    teacher_table_rows += (teacher.name, teacher.title, teacher.workplace)
  }
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

  stack(dir: ttb)[
    #table(
      columns: (1.53fr, 1.2fr, 3.56fr),
      rows: (2.2em,) * 10,
      inset: 10pt,
      align: center,
      table.cell(colspan: 3)[审查小组意见],
      table.cell(colspan: 3)[开题报告审查小组成员名单],[姓 名],[职 称],[工 作 单 位],
      ..teacher_table_rows
    )
    #set table(stroke: (x, y) => {
      (top: 0.5pt, bottom: 0.5pt, left: 0.5pt, right: 0.5pt)
    })
    #v(-1.2em)
    #table(
      columns: (4fr)
    )[
      #v(1em)
      #set text(weight: "bold")
      审查结论
      #v(5em)

      #show table: set align(center)
      #table(
        columns: (auto, auto),
        inset: 10pt,
        stroke: none,
        align: left,
        [合格，修改后可以进入学位论文写作阶段], [#box(width: 10pt, height: 10pt, stroke: 0.5pt)],
        [ 不合格，需再次进行学位论文开题报告], [#box(width: 10pt, height: 10pt, stroke: 0.5pt)],
      )

      #v(15em)

      #place(bottom + right)[
        #grid(
          columns: 2,
          rows: 2,
          gutter: 2em,
          [组长签字：], [#box(sign_image)],
          grid.cell(colspan: 2)[
            单位公章：#h(2em)
            #datetime-display-cn-declare(date)
          ],
        )
        #v(1em)
      ]
    ]
  ]




}



//! Start with your configuration here

#cover(
  title: (school: "东北师范大学", type: "研究生学位论文开题报告"),
  author_info: (
    title: "这是开题报告的模板",
    name: "张三",
    direction: "深度学习理论",
    major: "计算机科学与技术",
    grade: "2024 级",
    level: "硕士生",
    type: "学术学位",
    supervisor: "李四",
    unit: "信息科学与技术学院",
  ),
)

#command

#show: doc

//! Start writing here

= 研究背景（分析本选题范畴内尚未得到较好解决的学术或实践难题，阐述选题的缘起与依据）
#lorem(100)

分析本选题范畴内尚未得到较好解决的学术或实践难题，
分析本选题范畴内尚未得到较好解决的学术或实践难题，
分析本选题范畴内尚未得到较好解决的学术或实践难题，
分析本选题范畴内尚未得到较好解决的学术或实践难题，

= 文献综述（系统梳理本选题相关的具有代表性的文献，分析相关研究的发展脉络与进展，评述已有研究存在的问题与不足）

== Transformer 的表达能力与通用近似能力

== Transformer 的泛化能力

=== 泛化理论

#lorem(100)

分析本选题范畴内尚未得到较好解决的学术或实践难题，
分析本选题范畴内尚未得到较好解决的学术或实践难题，
分析本选题范畴内尚未得到较好解决的学术或实践难题，
分析本选题范畴内尚未得到较好解决的学术或实践难题，

=== 大模型的泛化现象


== Transformer的训练

= 研究问题（提出本论文拟回答的核心问题及具体研究问题）

= 研究意义（阐述本研究可能的理论贡献与实践价值）

这里是引用@neyshabur2017pac @krogh1991simple @dong2022survey @kalyan2021ammus @zhang2023adalora @pmlr-v48-hardt16，单个引用@kalyan2021ammus

= 研究设计（针对研究问题，详细阐述本选题的研究内容、基本思路或总体框架、理论基础、具体研究方案等）

= 进度安排（按照时间顺序，就研究的进度做出具体的规划）

2024年11月-2025年1月：代码编写，实验验证

2025年2月-2025年3月：证明D-TF的token-coherence与收敛和泛化的关系

2025年4月-2025年5月：撰写论文

2025年6月：论文修改，准备答辩


#nenu-bibliography(bibliography: bibliography.with("references.bib"))


//! 在这里填入自己的签名文件路径
#sign(
  image("sign.svg", height: 3em),
  date: datetime.today(),
)

#pagebreak()

#review_conclusion(
  (
    (
      name: "张三",
      title: "讲师",
      workplace: "东北师范大学",
    ),
    (
      name: "李四",
      title: "教授",
      workplace: "北京大学",
    ),
    (
      name: "王五",
      title: "教授",
      workplace: "复旦大学",
    ),
    (
      name: "赵六",
      title: "副教授",
      workplace: "南京大学",
    ),
    (
      name: "孙七",
      title: "讲师",
      workplace: "浙江大学",
    ),
  ),
  image("sign.svg", height: 4em),
  date: datetime.today(),
)
