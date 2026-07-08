---
title: |
  | Demonstration of
  | Fonts and Alignment Filter
  | for Pandoc
---

## Introduction

This document showcases the features of the `fonts-and-alignment` Pandoc
Lua filter. Each example displays the required Markdown syntax alongside
its rendered output, ensuring consistent typography across LaTeX, Typst,
and HTML formats.[^1]

The extension leverages Pandoc's `fenced_divs` and `bracketed_spans`
extensions. If these are disabled, the filter will issue a terminal
warning and render the elements as raw text instead of applying the
styles.

## Bracketed Spans and Fenced Divs Invocations

This filter follows Pandoc's standard conventions for container-based
styling: use Bracketed Spans for inline text and Fenced Divs for
block-level content. For further details on these syntax standards,
please refer to [Pandoc User's Guide: Divs and
Spans](https://pandoc.org/demo/example33/8.18-divs-and-spans.html).

``` markdown
[This is a line of text in extra extra large font.]{.pfa-size-2xl}
```

This is a line of text in extra extra large font.

``` markdown
::: {.pfa-size-2xl}
This multiline block showcases the filters's capability to apply extra extra large font to an entire section of text by wrapping the content in a Fenced Div.
:::
```

::: {}
This multiline block showcases the filters's capability to apply extra
extra large font to an entire section of text by wrapping the content in
a Fenced Div.
:::

## Font Sizing in Bracketed Spans

The extension provides nine predefined sizing hooks to scale text
relative to the document's base/normal font size. The *LaTeX Reference*
column is provided for descriptive purposes, as these labels are not
native to Typst or HTML/CSS.

  -----------------------------------------------------------------------
  LaTeX Reference   Syntax                           Output
  ----------------- -------------------------------- --------------------
  tiny              `[Sample]{.pfa-size-3xs}`        Sample

  scriptsize        `[Sample]{.pfa-size-2xs}`        Sample

  footnotesize      `[Sample]{.pfa-size-xs}`         Sample

  small             `[Sample]{.pfa-size-s}`          Sample

  normal            `[Sample]{.pfa-size-normal}`     Sample

  large             `[Sample]{.pfa-size-l}`          Sample

  Large             `[Sample]{.pfa-size-xl}`         Sample

  LARGE             `[Sample]{.pfa-size-2xl}`        Sample

  huge              `[Sample]{.pfa-size-3xl}`        Sample
  -----------------------------------------------------------------------

## Font Sizing in Fenced Divs

The same sizing classes can also be applied to Fenced Divs, allowing an
entire block of text to be rendered at a specific font size.

### Extra Small Font Size

``` markdown
::: {.pfa-size-xs}
This paragraph renders at the *extra small* font size.
:::
```

::: {}
This paragraph renders at the *extra small* font size.
:::

### Normal Font Size

``` markdown
::: {.pfa-size-normal}
This paragraph renders at the *normal* font size.
:::
```

::: {}
This paragraph renders at the *normal* font size.
:::

### Large Font Size

``` markdown
::: {.pfa-size-l}
This paragraph renders at the *large* font size.
:::
```

::: {}
This paragraph renders at the *large* font size.
:::

## Font Weights, Shapes, and Families in Bracketed Spans

The extension provides predefined typographic styles for Bracketed
Spans. These styles are mapped to equivalent rendering properties across
all formats to ensure consistent output, regardless of the underlying
engine.

  ------------------------------------------------------------------------
  Typographic Style       Syntax                                 Output
  ----------------------- -------------------------------------- ---------
  Normal (weight)         `[Sample]{.pfa-weight-normal}`         Sample

  Medium (weight)         `[Sample]{.pfa-weight-medium}`         Sample

  Bold (weight)           `[Sample]{.pfa-weight-bold}`           Sample

  Emphasis (style)        `[Sample]{.pfa-style-emph}`            Sample

  Upright (style)         `[Sample]{.pfa-style-upright}`         Sample

  Italic (style)          `[Sample]{.pfa-style-italic}`          Sample

  Slanted (style)         `[Sample]{.pfa-style-slanted}`         Sample

  Small Caps (style)      `[Sample]{.pfa-style-smallcaps}`       Sample

  Serif (family)          `[Sample]{.pfa-family-serif}`          Sample

  Sans-Serif (family)     `[Sample]{.pfa-family-sans}`           Sample

  Monospace (family)      `[Sample]{.pfa-family-mono}`           Sample
  ------------------------------------------------------------------------

## Font Weights, Shapes, and Families in Fenced Divs

These same typographic classes can also be applied to Fenced Divs,
allowing an entire block of text to adopt a particular visual style.

### Bold Weight

``` markdown
::: {.pfa-weight-bold}
This paragraph is in bold weight.
:::
```

::: {}
This paragraph is in bold weight.
:::

### Small Caps

``` markdown
::: {.pfa-style-smallcaps}
This paragraph is in small caps.
:::
```

::: {}
This paragraph is in small caps.
:::

### Sans-Serif Family

``` markdown
::: {.pfa-family-sans}
This paragraph is in sans-serif.
:::
```

::: {}
This paragraph is in sans-serif.
:::

## Text Casing Transformations

Unlike purely visual styling in HTML/CSS---where
[`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform)
only changes how text is rendered---these casing transformations operate
at the [Pandoc Abstract Syntax Tree
(AST)](https://pandoc.org/MANUAL.html#abstract-syntax-tree) level and
modify the actual document content. This ensures that uppercase and
lowercase conversions are preserved consistently across all output
formats and remain intact when copied into other applications.

### Casing Transformations in Bracketed Spans

  -----------------------------------------------------------------------
  Casing         Syntax                                         Output
  -------------- ---------------------------------------------- ---------
  Uppercase      `[Sample]{.pfa-case-upper}`                    SAMPLE

  Lowercase      `[SAMPLE]{.pfa-case-lower}`                    sample
  -----------------------------------------------------------------------

### Casing Transformations in Fenced Divs

#### Lowercase

``` markdown
::: {.pfa-case-lower}
THIS PARAGRAPH IS TRANSFORMED TO LOWERCASE.
:::
```

::: {}
this paragraph is transformed to lowercase.
:::

#### Uppercase

``` markdown
::: {.pfa-case-upper}
this paragraph is transformed to uppercase.
:::
```

::: {}
THIS PARAGRAPH IS TRANSFORMED TO UPPERCASE.
:::

## Colors

This section describes how to apply color and spacing using the
`pfa-color`, `pfa-bg-color`, and `pfa-padding` attributes within
Bracketed Spans and Fenced Divs.

### Color Fundamentals

The filter normalizes color inputs to ensure they render identically
across LaTeX, Typst, and HTML.

#### Flexible Color Terminology

For solid colors, the filter is case-insensitive and accepts most naming
conventions. All examples below resolve to the CSS3 `mediumvioletred`:

  -----------------------------------------------------------------------------------------------------
  Naming Convention       Syntax                                     Output
  ----------------------- ------------------------------------------ ----------------------------------
  Lowercase               `[Color]{pfa-color="mediumvioletred"}`     [Color]{style="color: #C71585;"}

  Title Case              `[Color]{pfa-color="Medium Violet Red"}`   [Color]{style="color: #C71585;"}

  Kebab Case              `[Color]{pfa-color="medium-violet-red"}`   [Color]{style="color: #C71585;"}

  Snake Case              `[Color]{pfa-color="medium_violet_red"}`   [Color]{style="color: #C71585;"}

  Camel Case              `[Color]{pfa-color="mediumVioletRed"}`     [Color]{style="color: #C71585;"}

  Pascal Case             `[Color]{pfa-color="MediumVioletRed"}`     [Color]{style="color: #C71585;"}

  Screaming Snake Case    `[Color]{pfa-color="MEDIUM_VIOLET_RED"}`   [Color]{style="color: #C71585;"}
  -----------------------------------------------------------------------------------------------------

#### Input Types

  ---------------------------------------------------------------------------------------------------
  Input Type        Syntax                                        Output
  ----------------- --------------------------------------------- -----------------------------------
  CSS3 Named        `[Sample]{pfa-color="crimson"}`               [Sample]{style="color: #DC143C;"}

  Hex Full          `[Sample]{pfa-color="#2E8B57"}`               [Sample]{style="color: #2E8B57;"}

  Hex Shorthand[^2] `[Sample]{pfa-color="#666"}`                  [Sample]{style="color: #666666;"}
  ---------------------------------------------------------------------------------------------------

**Compatibility Note:** To ensure cross-platform stability, use standard
CSS3 named colors or hex codes. Avoid LaTeX-specific numbered variants
(e.g., `LightBlue3`), as these are not supported in web browsers or CSS.

### Color Mixing

The extension supports LaTeX's `xcolor` percentage-mixing syntax for
tints, shades, and blends. This is the standardized syntax for this
extension because it maps reliably across Typst, LaTeX, and HTML (which
leverages the native CSS `color-mix()` function).

#### Supported Mixing Methods

- **Tinting (Blending with White):**
  - Syntax: `BaseColor!Percentage`
  - Example: `Maroon!40` (Yields 40% Maroon and 60% white)
- **Shading (Blending with Black):**
  - Syntax: `BaseColor!Percentage!black`
  - Example: `MediumVioletRed!80!black` (Yields 80% MediumVioletRed and
    20% black)
- **Two-Color Mix:**
  - Syntax: `BaseColor!Percentage!MixColor`
  - Example: `RoyalBlue!50!ForestGreen` (Yields a 50/50 mix of both
    colors)

#### Syntax Examples

  ----------------------------------------------------------------------------------------------------------------------------------------------
  Mixing Type        Syntax                                                 Output
  ------------------ ------------------------------------------------------ --------------------------------------------------------------------
  Tint (40% Base)    `[Tinted]{pfa-color="Maroon!40"}`                      [Tinted]{style="color: color-mix(in srgb, #800000 40%, #FFFFFF);"}

  Shade (80% Base)   `[Shaded]{pfa-color="MediumVioletRed!80!black"}`       [Shaded]{style="color: color-mix(in srgb, #C71585 80%, #000000);"}

  Mix (50/50)        `[Mixed]{pfa-font-color="RoyalBlue!50!ForestGreen"}`   [Mixed]{style="color: color-mix(in srgb, #4169E1 50%, #228B22);"}
  ----------------------------------------------------------------------------------------------------------------------------------------------

#### Important Compatibility Rules

- **Strictly Use LaTeX Syntax:** Always use the `BaseColor!Percentage`
  pattern. This is the only syntax guaranteed to translate correctly
  across all three output formats.

- **Avoid Typst Native Syntax:** If you use native Typst color syntax
  (e.g., `color.mix()`), the filter will pass it directly to Typst. It
  will not be translated for LaTeX or HTML, and those formats will
  likely receive a fallback color.

- **Binary Mixing Only:** You may blend a maximum of two colors.
  Multi-color mixing (e.g., Red!30!Blue!30!Green) is not supported.

- **Casing Matters:** Because mixing strings are passed directly to
  LaTeX, casing must be exact:

  - Use lowercase for [core LaTeX
    colors](https://www.overleaf.com/learn/latex/Using_colours_in_LaTeX#Reference_guide)
    (e.g., `black`, `red`).
  - Use PascalCase for [CSS3 named
    colors](https://developer.mozilla.org/en-US/docs/Web/CSS/named-color)
    (e.g., `RoyalBlue`, `MediumVioletRed`).

### Styling Elements

#### Foreground and Background

Use `pfa-color` for text and `pfa-bg-color` for container backgrounds.

``` markdown
::: {pfa-color="DarkSlateGrey" pfa-bg-color="lightsteelblue" pfa-padding="1em"}
This block has a default text color and a background fill.
[This span overrides the text color.]{pfa-color="tomato"}
:::
```

::: {style="color: #2F4F4F;background-color: #B0C4DE;padding: 1em;"}
This block has a default text color and a background fill. [This span
overrides the text color.]{style="color: #FF6347;"}
:::

#### Layout Spacing (`pfa-padding`)

The pfa-padding attribute controls internal spacing using standard CSS
shorthand.

- **One value (`1em`):** Applied to all four sides evenly.

- **Two values (`1em 0.5em`):** The first value applies to the top and
  bottom; the second applies to the left and right.

- **Three values (`1em 0.5em 2em`):** The first value is the top, the
  second applies to both the left and right, and the third is the
  bottom.

- **Four values (`1em 0.5em 2em 0.2em`):** Applied in clockwise order:
  top, right, bottom, and left.

**Supported Units:** Only `pt`, `em`, and `ex` are supported to
guarantee stability.

### Typst Named Palette

You can access Typst's native predefined colors by prefixing the color
name with typst.

- **Syntax:**
  `[Sample]{pfa-bg-color="typstmaroon" pfa-color="white" pfa-padding="0.2em"}`

- **Output:**
  [Sample]{style="color: #FFFFFF;background-color: #85144B;padding: 0.2em;"}

## Text Alignment within Fenced Divs

The `pfa-align-*` classes control text alignment within a Fenced Div
while explicitly preserving hard line breaks (`\`). These utilities map
directly to native LaTeX commands (`\raggedright`, `\centering`, and
`\raggedleft`) in PDF output and equivalent CSS behaviors in HTML,
making them ideal for formatting poetry, lyrics, or multi-line blocks.

### Left-aligned Text

``` markdown
::: {.pfa-align-left}
This block of text is *left-aligned*.
:::
```

::: {}
This block of text is *left-aligned*.
:::

### Center-aligned Text

``` markdown
::: {.pfa-align-center}
This block of text is *center-aligned*.
:::
```

::: {}
This block of text is *center-aligned*.
:::

### Right-aligned Text

``` markdown
::: {.pfa-align-right}
This block of text is *right-aligned*.
:::
```

::: {}
This block of text is *right-aligned*.
:::

### Line Break Preservation

``` markdown
::: {.pfa-align-center}
This block of text\
is *center-aligned*\
while preserving explicit line breaks.
:::
```

::: {}
This block of text\
is *center-aligned*\
while preserving explicit line breaks.
:::

## Combining Multiple Classes

Multiple typographic utilities can be combined within the same element.
Font, size, color, alignment, and decoration classes are designed to
compose independently and can be applied together to both Bracketed
Spans and Fenced Divs.

Class names are space-separated within `{}` following Pandoc attribute
syntax. In addition to classes, key-value attributes such as `pfa-color`
may be included alongside class definitions.

### Bracketed Span Composition

  -----------------------------------------------------------------------------------------------------------------------------------
  Style                Syntax                                                                     Output
  -------------------- -------------------------------------------------------------------------- -----------------------------------
  Bold Sans-Serif      `[Sample]{.pfa-wight-bold .pfa-family-sans .pfa-size-l pfa-color="red"}`   [Sample]{style="color: #FF0000;"}

  Italic Monospace     `[Sample]{.pfa-style-italic .pfa-family-mono .pfa-size-s}`                 Sample

  Small Caps, Colored  `[Sample]{.pfa-style-smallcaps pfa-color="forestgreen"}`                   [Sample]{style="color: #228B22;"}
  -----------------------------------------------------------------------------------------------------------------------------------

### Fenced Div Composition

Multiple utilities can also be applied to Fenced Divs to control
alignment, typography, and color simultaneously. The resulting block
inherits all specified styles while preserving Pandoc's standard
attribute behavior.

``` markdown
::: {.pfa-align-center .pfa-family-sans .pfa-weight-bold .pfa-size-l pfa-color="midnightblue"}
A centered, bold, sans-serif, large, midnight-blue Fenced Div demonstrating multiple combined utilities from the filter.
:::
```

::: {style="color: #191970;"}
A centered, bold, sans-serif, large, midnight-blue Fenced Div
demonstrating multiple combined utilities from the filter.
:::

## Legacy Aliases (Deprecated)

**Warning:** Legacy aliases are deprecated. They are retained strictly
for backward compatibility and will be entirely removed in the next
major release. New documents should use the `pfa-*` namespaces going
forward.

### Font Sizing Aliases

  Legacy Class   Modern Class
  -------------- -------------------
  `xsmall`       `pfa-text-xs`
  `small`        `pfa-text-s`
  `normal`       `pfa-text-normal`
  `large`        `pfa-text-l`
  `xlarge`       `pfa-text-xl`
  `xxlarge`      `pfa-text-2xl`
  `huge`         `pfa-text-3xl`

### Font Weight, Shape, and Family Aliases

  Legacy Class   Shorthand   Modern Class
  -------------- ----------- ----------------------
  `bold`         `bf`        `pfa-font-bold`
  `emphasis`     `em`        `pfa-font-emphasis`
  `italic`       `it`        `pfa-font-italic`
  `medium`       `md`        `pfa-font-medium`
  `monospace`    `tt`        `pfa-font-mono`
  `normalfont`   `nf`        `pfa-font-normal`
  `sans`         `sf`        `pfa-font-sans`
  `serif`        `rm`        `pfa-font-serif`
  `slanted`      `sl`        `pfa-font-slanted`
  `smallcaps`    `sc`        `pfa-font-smallcaps`
  `upright`      `up`        `pfa-font-upright`

### Alignment Aliases

  Legacy Class    Modern Class
  --------------- --------------------
  `centering`     `pfa-align-center`
  `raggedleft`    `pfa-align-right`
  `raggedright`   `pfa-align-left`

### Text Decoration Aliases

  Legacy Class   Shorthand   Modern Class
  -------------- ----------- -------------------------
  `uline`        `u`         `pfa-text-uline`
  `uuline`       `uu`        `pfa-text-uline-double`
  `dashuline`    `dau`       `pfa-text-uline-dashed`
  `dotuline`     `dou`       `pfa-text-uline-dotted`
  `uwave`        `uw`        `pfa-text-uline-wave`
  `sout`         `so`        `pfa-text-strikeout`

## Removed Classes

The following legacy classes were removed in version 2.0.0 and are no
longer recognized by the filter. Existing documents should be updated to
use the replacement classes shown below.

  Removed Class   Shorthand   Removed In   Replacement
  --------------- ----------- ------------ ----------------------
  `center`        ---         2.0.0        `pfa-align-center`
  `flushleft`     ---         2.0.0        `pfa-align-left`
  `flushright`    ---         2.0.0        `pfa-align-right`
  `xout`          `xo`        2.0.0        `pfa-text-strikeout`

[^1]: HTML output requires the companion fonts-and-alignment.css
    stylesheet.

[^2]: Three-digit shorthand expands by duplicating each single
    hexadecimal digit per RGB channel (e.g., '#666' expands to
    '#666666').
