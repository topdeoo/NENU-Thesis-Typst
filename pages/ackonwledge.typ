//! 致谢页
#let acknowledgement(
  two-side: false,
  //! 本页参数
  title: "致谢",
  outlined: true,
  body,
) = {
  pagebreak(
    weak: true,
    to: if two-side {
      "odd"
    },
  )
  [
    #heading(level: 1, numbering: none, outlined: outlined, title) <no-auto-pagebreak>
    #body
  ]

}