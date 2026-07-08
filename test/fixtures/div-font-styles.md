---
title: "Test Case: Font Weights, Shapes, and Families in Fenced Divs"
---

## Typography Weights, Shapes, and Families Scale

This test suite verifies that the framework's typography style taxonomy cleanly maps to their respective design properties.

### Font Weights

#### Bold (`pfa-weight-bold`)

Verifies mapping to LaTeX `\textbf` / `\bfseries` and native Typst bold text blocks.

```markdown
::: {.pfa-weight-bold}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-weight-bold}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

#### Medium (`pfa-weight-medium`)

Verifies mapping to LaTeX `\textmd` / `\mdseries` and native Typst medium weight variables.

```markdown
::: {.pfa-weight-medium}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-weight-medium}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

#### Normal Weight (`pfa-weight-normal`)

Verifies explicit application of standard regular text weights.

```markdown
::: {.pfa-weight-normal}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-weight-normal}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Font Styles and Shapes

#### Italic (`pfa-style-italic`)

Verifies explicit transformation to slanted structural italic variants.

```markdown
::: {.pfa-style-italic}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-style-italic}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

#### Slanted (`pfa-style-slanted`)

Verifies mapping to LaTeX oblique formatting hooks (`\textsl`) and Typst custom transformations.

```markdown
::: {.pfa-style-slanted}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-style-slanted}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

#### Upright (`pfa-style-upright`)

Verifies overriding nested transformations back into standard vertical postures.

```markdown
::: {.pfa-style-upright}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-style-upright}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

#### Emphasis (`pfa-style-emph`)

Verifies context-aware nesting rules using standard semantic markdown emphasis routines.

```markdown
::: {.pfa-style-emph}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-style-emph}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

#### Small Capitals (`pfa-style-smallcaps`)

Verifies mapping to CSS `font-variant`, LaTeX `\textsc`, and Typst micro-typography blocks.

```markdown
::: {.pfa-style-smallcaps}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-style-smallcaps}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Font Families

#### Serif (`pfa-family-serif`)

Verifies structural family font configuration maps to proportional serif fallbacks.

```markdown
::: {.pfa-family-serif}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-family-serif}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

#### Sans-serif (`pfa-family-sans`)

Verifies structural family routing hooks map safely to standard modern clean typography alternatives.

```markdown
::: {.pfa-family-sans}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-family-sans}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

#### Monospace (`pfa-family-mono`)

Verifies spacing alignments scale perfectly into system tabular text components across layouts.

```markdown
::: {.pfa-family-mono}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-family-mono}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
