#let colorize(svg, color) = {
  let blk = black.to-hex();
  // You might improve this prototypical detection.
  if svg.contains(blk) { 
    // Just replace
    svg.replace(blk, color.to-hex())
  } else {
    // Explicitly state color
    svg.replace("<svg ", "<svg fill=\""+color.to-hex()+"\" ")
  }
}