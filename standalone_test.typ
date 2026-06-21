#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#show terms.item: it => block(breakable: false)[
  #text(weight: "bold")[#it.term]
  #block(inset: (left: 1.5em, top: -0.4em))[#it.description]
]

#set table(
  inset: 6pt,
  stroke: none
)

#show figure.where(
  kind: table
): set figure.caption(position: top)

#show figure.where(
  kind: image
): set figure.caption(position: bottom)

#let content-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content-to-string).join("")
  } else if content.has("body") {
    content-to-string(content.body)
  } else if content == [ ] {
    " "
  }
}
#let conf(
  title: none,
  subtitle: none,
  authors: (),
  keywords: (),
  date: none,
  abstract-title: none,
  abstract: none,
  thanks: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: none,
  fontsize: 11pt,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  sectionnumbering: none,
  linkcolor: none,
  citecolor: none,
  filecolor: none,
  pagenumbering: "1",
  doc,
) = {
  set document(
    title: title,
    keywords: keywords,
  )
  set document(
      author: authors.map(author => content-to-string(author.name)).join(", ", last: " & "),
  ) if authors != none and authors != ()
  set page(
    paper: paper,
    margin: margin,
    numbering: pagenumbering,
    columns: cols
  )

  set par(
    justify: true,
    leading: linestretch * 0.65em
  )
  set text(lang: lang,
           region: region,
           size: fontsize)

  set text(font: font) if font != none
  show math.equation: set text(font: mathfont) if mathfont != none
  show raw: set text(font: codefont) if codefont != none

  set heading(numbering: sectionnumbering)

  show link: set text(fill: rgb(content-to-string(linkcolor))) if linkcolor != none
  show ref: set text(fill: rgb(content-to-string(citecolor))) if citecolor != none
  show link: this => {
    if filecolor != none and type(this.dest) == label {
      text(this, fill: rgb(content-to-string(filecolor)))
    } else {
      text(this)
    }
  }

  if title != none {
    place(top, float: true, scope: "parent", clearance: 4mm, block(below: 1em, width: 100%)[
      #if title != none {
        align(center, block[
            #text(weight: "bold", size: 1.5em, hyphenate: false)[#title #if thanks != none {
                footnote(thanks, numbering: "*")
                counter(footnote).update(n => n - 1)
              }]
            #(
              if subtitle != none {
                parbreak()
                text(weight: "bold", size: 1.25em, hyphenate: false)[#subtitle]
              }
             )])
      }

      #if authors != none and authors != [] {
        let count = authors.len()
        let ncols = calc.min(count, 3)
        grid(
          columns: (1fr,) * ncols,
          row-gutter: 1.5em,
          ..authors.map(author => align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ])
        )
      }

      #if date != none {
        align(center)[#block(inset: 1em)[
            #date
          ]]
      }

      #if abstract != none {
        block(inset: 2em)[
          #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
        ]
      }
    ])
  }
  doc
}
#show table: set table(fill: rgb("F4F4F4"))

#set par(leading: 0.8em, spacing: 1.8em)

#show text.where(weight: "bold"): set text(weight: "regular", size: 1.2em)

// Force Author Overrides using an absolute size to prevent compounding layout grid scales
#show grid: set text(weight: "medium", size: 11pt)

// Force Date / Modified Field Overrides (Target timestamp layout containers)
#show block.where(inset: 1em): set text(weight: "regular", size: 1.2em)

#show heading.where(level: 1): h1 => {
  set block(above: 1.925em, below: 1.265em)
  set text(size: 1.2em, weight: "semibold")
  h1
}

#show heading.where(level: 2): h2 => {
  set block(above: 1.7875em, below: 1.2em)
  set text(size: 1.0em, weight: "semibold")
  h2
}

#show heading.where(level: 3): h3 => {
  set block(above: 1.7875em, below: 0.825em)
  set text(size: 1.0em, weight: "semibold")
  h3
}

#show heading.where(level: 4): h4 => {
  set block(above: 1.7875em, below: 0.5em)
  set text(size: 1.0em, weight: "semibold")
  h4
}

// Native Typst link styling engine override rule
#show link: set text(fill: rgb("0000FF"))

#show: doc => conf(
  title: [Test Case: Font Weights, Shapes, and Families in Fenced Divs],
  abstract-title: [Abstract],
  margin: (bottom: 20mm,left: 20mm,right: 20mm,top: 20mm,),
  paper: "a4",
  pagenumbering: "1",
  linkcolor: [0000FF],
  citecolor: [0000FF],
  filecolor: [0000FF],
  cols: 1,
  doc,
)


== Typography Weights, Shapes, and Families Scale
<typography-weights-shapes-and-families-scale>
This test suite verifies that the framework's typography style taxonomy
cleanly maps to their respective design properties.

=== Font Weights
<font-weights>
==== Bold (`pfa-weight-bold`)
<bold-pfa-weight-bold>
Verifies mapping to LaTeX `\textbf` / `\bfseries` and native Typst bold
text blocks.

```markdown
::: {.pfa-weight-bold}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

#block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("94A3B8"), radius: 3pt, inset: (x: 10pt, y: 8pt), width: 100%)[
#block[
#set text(weight: 700)
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

]
]
==== Medium (`pfa-weight-medium`)
<medium-pfa-weight-medium>
Verifies mapping to LaTeX `\textmd` / `\mdseries` and native Typst
medium weight variables.

```markdown
::: {.pfa-weight-medium}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

#block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("94A3B8"), radius: 3pt, inset: (x: 10pt, y: 8pt), width: 100%)[
#block[
#set text(weight: 500)
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

]
]
==== Normal Weight (`pfa-weight-normal`)
<normal-weight-pfa-weight-normal>
Verifies explicit application of standard regular text weights.

```markdown
::: {.pfa-weight-normal}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

#block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("94A3B8"), radius: 3pt, inset: (x: 10pt, y: 8pt), width: 100%)[
#block[
#set text(weight: 400, style: "normal")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

]
]
=== Font Styles and Shapes
<font-styles-and-shapes>
==== Italic (`pfa-style-italic`)
<italic-pfa-style-italic>
Verifies explicit transformation to slanted structural italic variants.

```markdown
::: {.pfa-style-italic}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

#block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("94A3B8"), radius: 3pt, inset: (x: 10pt, y: 8pt), width: 100%)[
#block[
#set text(style: "italic")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

]
]
==== Slanted (`pfa-style-slanted`)
<slanted-pfa-style-slanted>
Verifies mapping to LaTeX oblique formatting hooks (`\textsl`) and Typst
custom transformations.

```markdown
::: {.pfa-style-slanted}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

#block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("94A3B8"), radius: 3pt, inset: (x: 10pt, y: 8pt), width: 100%)[
#block[
#set text(style: "oblique")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

]
]
==== Upright (`pfa-style-upright`)
<upright-pfa-style-upright>
Verifies overriding nested transformations back into standard vertical
postures.

```markdown
::: {.pfa-style-upright}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

#block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("94A3B8"), radius: 3pt, inset: (x: 10pt, y: 8pt), width: 100%)[
#block[
#set text(style: "normal")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

]
]
==== Emphasis (`pfa-style-emphasis`)
<emphasis-pfa-style-emphasis>
Verifies context-aware nesting rules using standard semantic markdown
emphasis routines.

```markdown
::: {.pfa-style-emphasis}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

#block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("94A3B8"), radius: 3pt, inset: (x: 10pt, y: 8pt), width: 100%)[
#block[
#set text(style: "italic")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

]
]
==== Small Capitals (`pfa-style-smallcaps`)
<small-capitals-pfa-style-smallcaps>
Verifies mapping to CSS `font-variant`, LaTeX `\textsc`, and Typst
micro-typography blocks.

```markdown
::: {.pfa-style-smallcaps}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

#block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("94A3B8"), radius: 3pt, inset: (x: 10pt, y: 8pt), width: 100%)[
#block[
#show text: smallcaps
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

]
]
=== Font Families
<font-families>
==== Serif (`pfa-family-serif`)
<serif-pfa-family-serif>
Verifies structural family font configuration maps to proportional serif
fallbacks.

```markdown
::: {.pfa-family-serif}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

#block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("94A3B8"), radius: 3pt, inset: (x: 10pt, y: 8pt), width: 100%)[
#block[
#set text(font: "Libertinus Serif")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

]
]
==== Sans-serif (`pfa-family-sans`)
<sans-serif-pfa-family-sans>
Verifies structural family routing hooks map safely to standard modern
clean typography alternatives.

```markdown
::: {.pfa-family-sans}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

#block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("94A3B8"), radius: 3pt, inset: (x: 10pt, y: 8pt), width: 100%)[
#block[
#set text(font: "DejaVu Sans Mono")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

]
]
==== Monospace (`pfa-family-mono`)
<monospace-pfa-family-mono>
Verifies spacing alignments scale perfectly into system tabular text
components across layouts.

```markdown
::: {.pfa-family-mono}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

#block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("94A3B8"), radius: 3pt, inset: (x: 10pt, y: 8pt), width: 100%)[
#block[
#set text(font: "DejaVu Sans Mono")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

]
]
