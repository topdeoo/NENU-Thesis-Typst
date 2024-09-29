#let doc(
  info: (:),
  thesis-type: "bachelor",
  fallback: false,
  lang: "zh",
  it
) = {
  //! 初始化
  info = (
    title: "基于 Typst 的学位论文",
    author: "张三"
  ) + info

  //! 设置样式
  set text(fallback: fallback, lang: lang)

  // if thesis-type == "bachelor" {
  set page(margin: (top: 2.54cm, bottom: 2.54cm, left: 3.18cm, right: 3.18cm))
  // } else {
  //   panic("Not Imp")
  // }

  //! 设置 pdf 信息
  set document(
    title: info.title,
    author: info.author
  )

  it
}