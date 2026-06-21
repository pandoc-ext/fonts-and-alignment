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

#block[
#set text(weight: 700)
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

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

#block[
#set text(weight: 500)
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

]
==== Normal Weight (`pfa-weight-normal`)
<normal-weight-pfa-weight-normal>
Verifies explicit application of standard regular text weights.

```markdown
::: {.pfa-weight-normal}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

#block[
#set text(weight: 400, style: "normal")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

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

#block[
#set text(style: "italic")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

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

#block[
#set text(style: "oblique")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

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

#block[
#set text(style: "normal")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

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

#block[
#set text(style: "italic")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

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

#block[
#show text: smallcaps
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

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

#block[
#set text(font: "Libertinus Serif")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

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

#block[
#set text(font: "DejaVu Sans Mono")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

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

#block[
#set text(font: "DejaVu Sans Mono")
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

]
