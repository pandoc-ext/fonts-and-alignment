---
title: "Test Case: Font Weights, Shapes, and Families in Bracketed Spans"
---

## Typography Weights, Shapes, and Families Scale

This test suite verifies that the framework's typography style taxonomy cleanly maps to their respective design properties for inline elements.

### Font Weights

#### Bold (`pfa-weight-bold`)

Verifies mapping to LaTeX `\textbf` / `\bfseries` and native Typst bold text blocks.

```markdown
[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-weight-bold}
```

[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-weight-bold}

#### Medium (`pfa-weight-medium`)

Verifies mapping to LaTeX `\textmd` / `\mdseries` and native Typst medium weight variables.

```markdown
[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-weight-medium}
```

[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-weight-medium}

#### Normal Weight (`pfa-weight-normal`)

Verifies explicit application of standard regular text weights.

```markdown
[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-weight-normal}
```

[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-weight-normal}

### Font Styles and Shapes

#### Italic (`pfa-style-italic`)

Verifies explicit transformation to slanted structural italic variants.

```markdown
[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-style-italic}
```

[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-style-italic}

#### Slanted (`pfa-style-slanted`)

Verifies mapping to LaTeX oblique formatting hooks (`\textsl`) and Typst custom transformations.

```markdown
[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-style-slanted}
```

[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-style-slanted}

#### Upright (`pfa-style-upright`)

Verifies overriding nested transformations back into standard vertical postures.

```markdown
[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-style-upright}
```

[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-style-upright}

#### Emphasis (`pfa-style-emphasis`)

Verifies context-aware nesting rules using standard semantic markdown emphasis routines.

```markdown
[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-style-emphasis}
```

[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-style-emphasis}

#### Small Capitals (`pfa-style-smallcaps`)

Verifies mapping to CSS `font-variant`, LaTeX `\textsc`, and Typst micro-typography blocks.

```markdown
[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-style-smallcaps}
```

[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-style-smallcaps}

### Font Families

#### Serif (`pfa-family-serif`)

Verifies structural family font configuration maps to proportional serif fallbacks.

```markdown
[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-family-serif}
```

[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-family-serif}

#### Sans-serif (`pfa-family-sans`)

Verifies structural family routing hooks map safely to standard modern clean typography alternatives.

```markdown
[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-family-sans}
```

[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-family-sans}

#### Monospace (`pfa-family-mono`)

Verifies spacing alignments scale perfectly into system tabular text components across layouts.

```markdown
[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-family-mono}
```

[Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.]{.pfa-family-mono}
