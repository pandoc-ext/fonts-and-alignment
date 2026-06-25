---
header-includes:
- |
  \renewcommand{\arraystretch}{1.3}
title: |
  | Demonstration of
  | Fonts and Alignment Filter
  | for Pandoc
---

\renewcommand{\arraystretch}{1.3}

This document demonstrates every feature provided by the
`fonts-and-alignment` Lua filter for Pandoc. Each code block shows the
exact Markdown syntax used to generate the rendered output that follows,
ensuring consistent results across both LaTeX/PDF and HTML formats.[^1]

The filter relies on Pandoc's `fenced_divs` and `bracketed_spans`
extensions, which are typically enabled by default. In the unlikely
event that these extensions are disabled, the Lua filter will display a
terminal warning and pass over the corresponding divs and spans, causing
them to appear as raw text in the rendered output.

## Bracketed Spans and Fenced Divs Invocations

The filter may be used with Pandoc's `bracketed_spans` and `fenced_divs`
syntax extensions, as demonstrated below. Bracketed Spans are intended
for styling smaller inline portions of text, while Fenced Divs are used
for styling larger blocks of content. This follows Pandoc's standard
syntax conventions. For more information on this syntax, please refer to
the official Pandoc documentation: [Divs and Spans --- Pandoc User's
Guide](https://pandoc.org/demo/example33/8.18-divs-and-spans.html).

``` markdown
[This font is extra extra large.]{.pfa-size-2xl}
```

This font is extra extra large.

``` markdown
::: {.pfa-size-2xl}
This font is extra extra large.
:::
```

::: {}
This font is extra extra large.
:::

## Font Sizing in Bracketed Spans

The filter provides nine predefined sizing hooks that allow text within
Bracketed Spans to be scaled relative to the document's base font size.

  ------------------------------------------------------------------------
  Size           Syntax                             Output
  -------------- ---------------------------------- ----------------------
  tiny           `[Sample]{.pfa-size-3xs}`          Sample

  scriptsize     `[Sample]{.pfa-size-2xs}`          Sample

  footnotesize   `[Sample]{.pfa-size-xs}`           Sample

  small          `[Sample]{.pfa-size-s}`            Sample

  normal         `[Sample]{.pfa-size-normal}`       Sample

  large          `[Sample]{.pfa-size-l}`            Sample

  Large          `[Sample]{.pfa-size-xl}`           Sample

  LARGE          `[Sample]{.pfa-size-2xl}`          Sample

  huge           `[Sample]{.pfa-size-3xl}`          Sample
  ------------------------------------------------------------------------

## Font Sizing in Fenced Divs

The same sizing classes can also be applied to Fenced Divs, allowing an
entire block of text to be rendered at a specific font size.

### Extra Small Font Size

``` markdown
::: {.pfa-size-xs}
This paragraph renders at the _extra small_ font size.
:::
```

::: {}
This paragraph renders at the *extra small* font size.
:::

### Normal Font Size

``` markdown
::: {.pfa-size-normal}
This paragraph renders at the _normal_ font size.
:::
```

::: {}
This paragraph renders at the *normal* font size.
:::

### Large Font Size

``` markdown
::: {.pfa-size-l}
This paragraph renders at the _large_ font size.
:::
```

::: {}
This paragraph renders at the *large* font size.
:::

## Font Weights, Shapes, and Families in Bracketed Spans

The following typographic styles can be applied to Bracketed Spans to
control weight, style, and typeface.

  -----------------------------------------------------------------------
  Style            Syntax                                        Output
  ---------------- --------------------------------------------- --------
  Normal           `[Sample]{.pfa-weight-normal}`                Sample

  Medium           `[Sample]{.pfa-weight-medium}`                Sample

  Bold             `[Sample]{.pfa-weight-bold}`                  Sample

  Emphasis         `[Sample]{.pfa-style-emphasis}`               Sample

  Upright          `[Sample]{.pfa-style-upright}`                Sample

  Italic           `[Sample]{.pfa-style-italic}`                 Sample

  Slanted          `[Sample]{.pfa-style-slanted}`                Sample

  Small Caps       `[Sample]{.pfa-style-smallcaps}`              Sample

  Serif            `[Sample]{.pfa-family-serif}`                 Sample

  Sans-Serif       `[Sample]{.pfa-family-sans}`                  Sample

  Monospace        `[Sample]{.pfa-family-mono}`                  Sample
  -----------------------------------------------------------------------

## Font Weights, Shapes, and Families in Fenced Divs

These same typographic classes can also be applied to Fenced Divs,
allowing an entire block of text to adopt a particular visual style.

### Bold Weight

``` markdown
::: {.pfa-weight-bold}
This paragraph renders in bold type.
:::
```

::: {}
This paragraph renders in bold type.
:::

### Sans-Serif Family

``` markdown
::: {.pfa-family-sans}
This paragraph uses a sans-serif typeface.
:::
```

::: {}
This paragraph uses a sans-serif typeface.
:::

### Small Caps

``` markdown
::: {.pfa-style-smallcaps}
This paragraph is rendered in small caps.
:::
```

::: {}
This paragraph is rendered in small caps.
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

This section describes how to apply color to text using the `pfa-color`
attribute in both Bracketed Spans and Fenced Divs.

### Solid Colors

The `pfa-color` attribute supports [CSS3 named
colors](https://www.w3.org/TR/css-color-3/#svg-color), full hexadecimal
values, and three-digit shorthand hexadecimal values.

#### Flexible Color Terminology

For standard solid colors, the filter automatically normalizes CSS3
color names. This means solid colors are completely case-insensitive and
support various naming conventions. All examples below resolve perfectly
to the CSS3 color `mediumvioletred` in both HTML and PDF formats:

  ------------------------------------------------------------------------------------------------
  Naming Convention  Syntax                                     Output
  ------------------ ------------------------------------------ ----------------------------------
  Lowercase          `[Color]{pfa-color="mediumvioletred"}`     [Color]{style="color: #C71585;"}

  Title Case         `[Color]{pfa-color="Medium Violet Red"}`   [Color]{style="color: #C71585;"}

  Kebab Case         `[Color]{pfa-color="medium-violet-red"}`   [Color]{style="color: #C71585;"}

  Snake Case         `[Color]{pfa-color="medium_violet_red"}`   [Color]{style="color: #C71585;"}

  Camel Case         `[Color]{pfa-color="mediumVioletRed"}`     [Color]{style="color: #C71585;"}

  Pascal Case        `[Color]{pfa-color="MediumVioletRed"}`     [Color]{style="color: #C71585;"}

  Screaming Snake    `[Color]{pfa-color="MEDIUM_VIOLET_RED"}`   [Color]{style="color: #C71585;"}
  Case                                                          
  ------------------------------------------------------------------------------------------------

#### Applying Solid Colors

  ---------------------------------------------------------------------------------------------------
  Input Type       Syntax                                         Output
  ---------------- ---------------------------------------------- -----------------------------------
  CSS3 Named       `[Sample]{pfa-color="crimson"}`                [Sample]{style="color: #DC143C;"}

  Hex Full         `[Sample]{pfa-color="#2E8B57"}`                [Sample]{style="color: #2E8B57;"}

  Hex              `[Sample]{pfa-color="#666"}`                   [Sample]{style="color: #666666;"}
  Shorthand[^2]                                                   
  ---------------------------------------------------------------------------------------------------

**Note:** While Pandoc's default LaTeX template loads `x11names` (which
includes numbered variants like `LightBlue3`), CSS and web browsers do
not recognize these. To ensure your colors render perfectly across both
PDF and HTML formats, you must stick strictly to the standard CSS3 Named
Colors or Hexadecimal codes.

### Color Mixing

The filter natively supports LaTeX's `xcolor` percentage mixing syntax,
allowing you to tint, shade or mix colors on the fly. This translates
perfectly into both PDF and HTML outputs.[^3]

The mixing syntax uses the exclamation mark (`!`) to separate values:

  ------------------------------------------------------------------------------
  Mixing Type     Syntax Pattern                    Description & Example
  --------------- --------------------------------- ----------------------------
  Tinting         `BaseColor!Percentage`            Blends with white.
                                                    `Maroon!40` keeps 40% Maroon
                                                    and 60% white.

  Shading         `BaseColor!Percentage!black`      Blends with black.
                                                    `MediumVioletRed!80!black`
                                                    keeps 80% MediumVioletRed
                                                    and 20% black.

  Two-Color Mix   `BaseColor!Percentage!MixColor`   Blends two specific colors.
                                                    `RoyalBlue!50!ForestGreen`
                                                    yields a 50/50 mix of both
                                                    colors.
  ------------------------------------------------------------------------------

**\[Warning\] Strict Casing Rule:** Because mixed colors are passed
directly to the LaTeX compiler, the flexible terminology rules do not
apply here. You must use the exact casing expected by the LaTeX `xcolor`
package, otherwise your PDF generation will break:

- **Base Colors:** The [19 core LaTeX
  colors](https://www.overleaf.com/learn/latex/Using_colours_in_LaTeX#Reference_guide)
  must be strictly **lowercase**.

- **Extended Web Colors:** The [CSS3 named
  colors](https://developer.mozilla.org/en-US/docs/Web/CSS/named-color)
  must be strictly **PascalCase**.

  ----------------------------------------------------------------------------------------------------------------------------------------------
  Mixing Type        Syntax                                                 Output
  ------------------ ------------------------------------------------------ --------------------------------------------------------------------
  Tint (40% Base)    `[Tinted]{pfa-color="Maroon!40"}`                      [Tinted]{style="color: color-mix(in srgb, #800000 40%, #FFFFFF);"}

  Shade (80% Base)   `[Shaded]{pfa-color="MediumVioletRed!80!black"}`       [Shaded]{style="color: color-mix(in srgb, #C71585 80%, #000000);"}

  Mix (50/50)        `[Mixed]{pfa-font-color="RoyalBlue!50!ForestGreen"}`   [Mixed]{style="color: color-mix(in srgb, #4169E1 50%, #228B22);"}
  ----------------------------------------------------------------------------------------------------------------------------------------------

### Inheriting Colors in Fenced Divs

When applied to a Fenced Div, the `pfa-color` attribute defines the
default text color for the entire block. All enclosed content inherits
this color unless explicitly overridden by an inner Bracketed Span.

``` markdown
::: {pfa-color="DarkSlateGrey"}
The Fenced Div defines _DarkSlateGrey_ as the default text color for this block.

[This Bracketed Span overrides the inherited color to _tomato_.]{pfa-color="tomato"}

The remaining text continues using _DarkSlateGrey_ for the remainder of the Div.
:::
```

::: {style="color: #2F4F4F;"}
The Fenced Div defines *DarkSlateGrey* as the default text color for
this block.

[This Bracketed Span overrides the inherited color to
*tomato*.]{style="color: #FF6347;"}

The remaining text continues using *DarkSlateGrey* for the remainder of
the Div.
:::

**Note:** The `pfa-color` utility is an attribute, not a class, and
should not be prefixed with a period (`.`).

## Text Alignment within Fenced Divs

The `pfa-align-*` classes control text alignment within a Fenced Div
while explicitly preserving hard line breaks (`\`). These utilities map
directly to native LaTeX commands (`\raggedright`, `\centering`, and
`\raggedleft`) in PDF output and equivalent CSS behaviors in HTML,
making them ideal for formatting poetry, lyrics, or multi-line blocks.

### Left-aligned Text

``` markdown
::: {.pfa-align-left}
This block of text is _left-aligned_.
:::
```

::: {}
This block of text is *left-aligned*.
:::

### Center-aligned Text

``` markdown
::: {.pfa-align-center}
This block of text is _center-aligned_.
:::
```

::: {}
This block of text is *center-aligned*.
:::

### Right-aligned Text

``` markdown
::: {.pfa-align-right}
This block of text is _right-aligned_.
:::
```

::: {}
This block of text is *right-aligned*.
:::

### Line Break Preservation

``` markdown
::: {.pfa-align-center}
This block of text\
is _center-aligned_\
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

  ---------------------------------------------------------------------------------------------------------------------------------
  Style              Syntax                                                                     Output
  ------------------ -------------------------------------------------------------------------- -----------------------------------
  Bold Sans-Serif    `[Sample]{.pfa-wight-bold .pfa-family-sans .pfa-size-l pfa-color="red"}`   [Sample]{style="color: #FF0000;"}

  Italic Monospace   `[Sample]{.pfa-style-italic .pfa-family-mono .pfa-size-s}`                 Sample

  Small Caps,        `[Sample]{.pfa-style-smallcaps pfa-color="forestgreen"}`                   [Sample]{style="color: #228B22;"}
  Colored                                                                                       
  ---------------------------------------------------------------------------------------------------------------------------------

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

[^1]: Requires including the companion `fonts-and-alignment.css`
    stylesheet in your HTML compilation.

[^2]: Three-digit shorthand expands by duplicating each single
    hexadecimal digit per RGB channel (e.g., '#666' expands to
    '#666666').

[^3]: HTML output utilizes the native CSS `color-mix()` function to
    achieve the same blend.
