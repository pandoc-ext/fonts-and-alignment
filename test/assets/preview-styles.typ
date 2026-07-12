#set par(leading: 0.8em, spacing: 1.8em)

// Heading metrics explicitly calibrated to LaTeX's 12pt document standard scale
#show heading.where(level: 1): set block(above: 1.925em, below: 1.265em)
#show heading.where(level: 1): set text(size: 17.28pt, weight: "semibold")

#show heading.where(level: 2): set block(above: 1.7875em, below: 1.2em)
#show heading.where(level: 2): set text(size: 14.4pt, weight: "semibold")

#show heading.where(level: 3): set block(above: 1.7875em, below: 1em)
#show heading.where(level: 3): set text(size: 12pt, weight: "semibold")

#show heading.where(level: 4): set block(above: 1.7875em, below: 1em)
#show heading.where(level: 4): set text(size: 12pt, weight: "semibold")

// Set a consistent color for links and footnotes to improve visibility
#show link: set text(fill: blue)
#show footnote: set text(blue)

// Remove the default justification from lists and enums to avoid awkward spacing
#show list: set par(justify: false)
#show enum: set par(justify: false)

// Add a subtle background to tables to help them pop from the page
#show table: set table(fill: rgb("F4F4F4"))

// The Brutal Reset: Strip all default grid strokes globally
#set table(stroke: none)

// The Interception & Rebuild
#show table: it => {
  // Neutralize any hardcoded horizontal lines Pandoc injects
  show table.hline: none

  // Define the internal structure: Draw ONLY a line under the header (row 0)
  set table(stroke: (x, y) => if y == 0 { (bottom: 0.5pt + black) } else { none })

  // Wrap the now-naked table in our crisp, single outer borders
  box(
    stroke: (top: 1pt + black, bottom: 1pt + black),
    outset: (y: 0.3em),
    it
  )
}

// Set font globally for all code
#show raw: set text(font: "Fira Mono", size: 1.25em, spacing: 100%)
