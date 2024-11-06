#import "template.typ": cover, command, main_body, empty-par, fake-par, heading_style, sign, review_conclusion
#let author_info = (
  title: lorem(10),
  name: "张三",
  direction: "深度学习理论",
  major: "计算机科学与技术",
  grade: "2024 级",
  level: "硕士生",
  type: "学术学位",
  supervisor: lorem(3),
  unit: "信息科学与技术学院",
)

#cover(title: (school: "东北师范大学", type: "研究生学位论文开题报告"), author_info: author_info)

#command
#show: it => {
  main_body(doc: it)
}

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

= 研究设计（针对研究问题，详细阐述本选题的研究内容、基本思路或总体框架、理论基础、具体研究方案等）

= 进度安排（按照时间顺序，就研究的进度做出具体的规划）

2024年11月-2025年1月：代码编写，实验验证

2025年2月-2025年3月：证明D-TF的token-coherence与收敛和泛化的关系

2025年4月-2025年5月：撰写论文

2025年6月：论文修改，准备答辩

#bibliography("references.bib", full: true, title: "参考文献")
#sign(image("image/sign_teacher.png"), data: (year: 2024, month: 11, day: 5))
#pagebreak()
#review_conclusion(
  (
    (name: "张三", title: "讲师", workplace: "东北师范大学"),
    (name: "李四", title: "教授", workplace: "北京大学"),
    (name: "王五", title: "教授", workplace: "复旦大学"),
    (name: "赵六", title: "副教授", workplace: "南京大学"),
    (name: "孙七", title: "讲师", workplace: "浙江大学"),
  ),
  image("image/sign_teacher.png", height: 1em),
  date: (year: 2024, month: 11, day: 5),
)