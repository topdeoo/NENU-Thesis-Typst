#let matter(
  ..args,
  it
) = {

  set heading(numbering: "1")

  show heading: it => {
    it
  }

  set page(
    numbering: "1"
  )
  it
}