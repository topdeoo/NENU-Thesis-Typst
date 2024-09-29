#import "fonts/fonts.typ": font-size, font-family
#import "pages/bachelor-cover.typ": bachelor-cover
#import "pages/bachelor-declare.typ": bachelor-declare

#let thesis(
  // TODO 新增 "master" 和 "phd" 类型
  thesis-type: "bachelor",
  // TODO 新增学位类型的选项（只在硕士和博士学位生效）
  degree: "academic",
  // TODO 双面模式，在封面与封底插入空白页
  two-side: false,
  // 参考文献函数
  bibliography: none,
  // 字体
  fonts: (:),
  // 额外信息
  info: (:),
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

  (
    thesis-type: thesis-type,
    degree: degree,
    two-side: two-side,
    fonts: fonts,
    info: info,


    //TODO 分发更多函数

    cover: (..args) => {
      if thesis-type == "bachelor" {
        bachelor-cover(
          two-side: two-side,
          fonts: fonts + args.named().at("fonts", default: (:)),
          info: info + args.named().at("info", default: (:)),
          ..args
        )
      } else {
        panic("Not Implemented Yet!")
      }
    },

    declare: (..args) => {
      if thesis-type == "bachelor" {
        bachelor-declare(
          two-side: two-side,
          fonts: fonts + args.named().at("fonts", default: (:)),
          ..args
        )
      } else {
        panic("Not Implemented Yet!")
      }
    },

  )

}