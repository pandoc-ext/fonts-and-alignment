// 1. Syntax Highlighting Hijacks
#let maroon = rgb("#800000")
#let _sk-ctx = state("sk-ctx", "inline")

#let Skylighting(fill: none, number: false, start: 1, sourcelines) = {
  let code-content = for ln in sourcelines {
    ln
    linebreak()
  }
  [#_sk-ctx.update("block")#block(fill: rgb("#303030"), inset: 1em, radius: 4pt, width: 100%, code-content)#_sk-ctx.update("inline")]
}

#let NormalTok(s) = context {
  if _sk-ctx.get() == "block" { text(fill: rgb("#cccccc"), raw(s)) }
  else { text(fill: maroon, raw(s)) }
}

// 2. The Master Conf Function (Handles Layout, Frontmatter & Global Styles)
#let conf(
  title: none,
  subtitle: none,
  authors: (),
  date: none,
  paper: "us-letter",
  margin: (x: 1.25in, y: 1.25in),
  cols: 1,
  ..args, // Swallows the font arguments passed by Pandoc so they don't cause errors
  doc
) = {

  // --- PAGE GEOMETRY ---
  set page(
    paper: paper,
    margin: margin,
    columns: cols
  )

  // --- GLOBAL METRICS & STYLES ---
  // The fonts are handled by the template, but we still enforce the code block spacing
  show raw: set text(size: 1.25em, spacing: 100%)

  set par(leading: 0.8em, spacing: 1.8em)

  // Use closures to guarantee both block and text styles apply together
  show heading.where(level: 1): h => {
    set block(above: 1.925em, below: 1.265em)
    set text(size: 17.28pt, weight: "semibold")
    h
  }
  show heading.where(level: 2): h => {
    set block(above: 1.7875em, below: 1.2em)
    set text(size: 14.4pt, weight: "semibold")
    h
  }
  show heading.where(level: 3): h => {
    set block(above: 1.7875em, below: 1em)
    set text(size: 12pt, weight: "semibold")
    h
  }
  show heading.where(level: 4): h => {
    set block(above: 1.7875em, below: 1em)
    set text(size: 12pt, weight: "semibold")
    h
  }

  show link: set text(fill: blue)
  show footnote: set text(blue)
  show list: set par(justify: false)
  show enum: set par(justify: false)

  // --- TABLE RESET & STYLING ---
  set table(stroke: none)
  show table: set table(fill: rgb("F4F4F4"))
  show table: it => {
    show table.hline: none
    set table(stroke: (x, y) => if y == 0 { (bottom: 0.5pt + black) } else { none })
    box(stroke: (top: 1pt + black, bottom: 1pt + black), outset: (y: 0.3em), it)
  }

  // --- FRONTMATTER LAYOUT ---
  if title != none {
    align(center)[
      #block(below: 1.5em)[
        #text(weight: "regular", size: 20.74pt)[#title]
      ]
    ]
  }

  if subtitle != none {
    align(center)[
      #block(below: 1.5em)[
        #text(weight: "semibold", size: 1.2em, fill: gray.darken(20%))[#subtitle]
      ]
    ]
  }

  if authors != none and authors.len() > 0 {
    align(center)[
      #block(above: 3em, below: 0.3em)[
        #text(weight: "medium", size: 14.4pt)[
          #authors.map(a => a.name).join(", ")
        ]
      ]
    ]
  }

  if date != none {
    align(center)[
      #block(above: 2.5em, below: 4.5em)[
        #text(weight: "regular", size: 14.4pt)[#date]
      ]
    ]
  }

  doc
}
