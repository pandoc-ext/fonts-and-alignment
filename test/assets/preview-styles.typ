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

#show table: set table(fill: rgb("F4F4F4"))
#show link: set text(fill: rgb("0000FF"))
#show raw: set text(font: "Fira Mono", size: 1.25em)
#show raw: set text(spacing: 100%)
#show list: set par(justify: false)
#show enum: set par(justify: false)
#show raw.where(block: false): it => {
    show ".": "." + sym.zws
    show "-": "-" + sym.zws
    it
}
