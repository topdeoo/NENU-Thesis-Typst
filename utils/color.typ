//! This Snippet is used to colorize the svg image.
//! Thanks to Beiri22(https://github.com/Beiri22) provided the original version in issue#1939(https://github.com/typst/typst/issues/1939)

#let colorize(svg, color) = {
  let blk = black.to-hex()
  if svg.contains(blk) {
    svg = svg.replace(blk, color.to-hex())
  } else {
    svg = svg.replace("<svg ", "<svg fill=\"" + color.to-hex() + "\" ")
  }
  bytes(svg)
}
