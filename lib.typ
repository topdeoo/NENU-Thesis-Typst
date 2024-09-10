#import "fonts/fonts.typ": font-size, font-family

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
    title: ("")
  )
}