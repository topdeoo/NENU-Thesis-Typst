#import "../lib.typ": thesis

#let (
  cover, declare
) = thesis(
  thesis-type: "bachelor",
  degree: "academic",
  two-side: false,
  bibliography: none,
  fonts: (:),
  info: (
    title: ("基于 Typst 的东北师范大学学士学位论文"),
    title-en: ("My Thesis in English"),
    student-id: "2024123456",
    author: "张三",
    department: "信息科学与技术学院",
    major: "计算机科学与技术",
    supervisor: "李四",
    submit-date: datetime.today(),
  ),
)

#cover()

#declare()
