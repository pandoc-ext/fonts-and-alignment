---
title: |
  | Demonstration of
  | Fonts and Alignment Filter
  | for Pandoc
header-includes:
  - |
    \renewcommand{\arraystretch}{1.3}
---

This document demonstrates every feature provided by the `fonts-and-alignment` Lua filter for Pandoc. Each code block shows the exact Markdown syntax used to generate the rendered output that follows, ensuring consistent results across both LaTeX/PDF and HTML formats.^[Requires including the companion `fonts-and-alignment.css` stylesheet in your HTML compilation.]

The filter relies on Pandoc’s `fenced_divs` and `bracketed_spans` extensions, which are typically enabled by default. In the unlikely event that these extensions are disabled, the Lua filter will display a terminal warning and pass over the corresponding divs and spans, causing them to appear as raw text in the rendered output.

## Bracketed Spans and Fenced Divs Invocations

The filter may be used with Pandoc’s `bracketed_spans` and `fenced_divs` syntax extensions, as demonstrated below. Bracketed Spans are intended for styling smaller inline portions of text, while Fenced Divs are used for styling larger blocks of content. This follows Pandoc’s standard syntax conventions. For more information on this syntax, please refer to the official Pandoc documentation: [Divs and Spans — Pandoc User’s Guide](https://pandoc.org/demo/example33/8.18-divs-and-spans.html).

```markdown
[This font is extra extra large.]{.pfa-size-2xl}
```

[This font is extra extra large.]{.pfa-size-2xl}

```markdown
::: {.pfa-size-2xl}
This font is extra extra large.
:::
```

::: {.pfa-size-2xl}
This font is extra extra large.
:::

## Font Sizing in Bracketed Spans

The filter provides nine predefined sizing hooks that allow text within Bracketed Spans to be scaled relative to the document’s base font size.

| Size         | Syntax                         | Output              |
| :----------- | :----------------------------- | :------------------ |
| tiny         | `[Sample]{.pfa-size-3xs}`      | [Sample]{.pfa-size-3xs} |
| scriptsize   | `[Sample]{.pfa-size-2xs}`      | [Sample]{.pfa-size-2xs} |
| footnotesize | `[Sample]{.pfa-size-xs}`       | [Sample]{.pfa-size-xs} |
| small        | `[Sample]{.pfa-size-s}`        | [Sample]{.pfa-size-s} |
| normal       | `[Sample]{.pfa-size-normal}`   | [Sample]{.pfa-size-normal} |
| large        | `[Sample]{.pfa-size-l}`        | [Sample]{.pfa-size-l} |
| Large        | `[Sample]{.pfa-size-xl}`       | [Sample]{.pfa-size-xl} |
| LARGE        | `[Sample]{.pfa-size-2xl}`      | [Sample]{.pfa-size-2xl} |
| huge         | `[Sample]{.pfa-size-3xl}`      | [Sample]{.pfa-size-3xl} |

## Font Sizing in Fenced Divs

The same sizing classes can also be applied to Fenced Divs, allowing an entire block of text to be rendered at a specific font size.

### Extra Small Font Size

```markdown
::: {.pfa-size-xs}
This paragraph renders at the _extra small_ font size.
:::
```

::: {.pfa-size-xs}
This paragraph renders at the _extra small_ font size.
:::

### Normal Font Size

```markdown
::: {.pfa-size-normal}
This paragraph renders at the _normal_ font size.
:::
```

::: {.pfa-size-normal}
This paragraph renders at the _normal_ font size.
:::

### Large Font Size

```markdown
::: {.pfa-size-l}
This paragraph renders at the _large_ font size.
:::
```

::: {.pfa-size-l}
This paragraph renders at the _large_ font size.
:::

## Font Weights, Shapes, and Families in Bracketed Spans

The following typographic styles can be applied to Bracketed Spans to control weight, style, and typeface.

| Style        | Syntax                            | Output |
| :----------- | :----------------------------- | :----- |
| Normal       | `[Sample]{.pfa-weight-normal}`      | [Sample]{.pfa-weight-normal} |
| Medium       | `[Sample]{.pfa-weight-medium}`      | [Sample]{.pfa-weight-medium} |
| Bold         | `[Sample]{.pfa-weight-bold}`        | [Sample]{.pfa-weight-bold} |
| Emphasis     | `[Sample]{.pfa-style-emphasis}`    | [Sample]{.pfa-style-emphasis} |
| Upright      | `[Sample]{.pfa-style-upright}`     | [Sample]{.pfa-style-upright} |
| Italic       | `[Sample]{.pfa-style-italic}`      | [Sample]{.pfa-style-italic} |
| Slanted      | `[Sample]{.pfa-style-slanted}`     | [Sample]{.pfa-style-slanted} |
| Small Caps   | `[Sample]{.pfa-style-smallcaps}`   | [Sample]{.pfa-style-smallcaps} |
| Serif        | `[Sample]{.pfa-family-serif}`       | [Sample]{.pfa-family-serif} |
| Sans-Serif   | `[Sample]{.pfa-family-sans}`        | [Sample]{.pfa-family-sans} |
| Monospace    | `[Sample]{.pfa-family-mono}`        | [Sample]{.pfa-family-mono} |

## Font Weights, Shapes, and Families in Fenced Divs

These same typographic classes can also be applied to Fenced Divs, allowing an entire block of text to adopt a particular visual style.

### Bold Weight

```markdown
::: {.pfa-weight-bold}
This paragraph renders in bold type.
:::
```

::: {.pfa-weight-bold}
This paragraph renders in bold type.
:::

### Sans-Serif Family

```markdown
::: {.pfa-family-sans}
This paragraph uses a sans-serif typeface.
:::
```

::: {.pfa-family-sans}
This paragraph uses a sans-serif typeface.
:::

### Small Caps

```markdown
::: {.pfa-style-smallcaps}
This paragraph is rendered in small caps.
:::
```

::: {.pfa-style-smallcaps}
This paragraph is rendered in small caps.
:::

## Text Casing Transformations

Unlike purely visual styling in HTML/CSS—where [`text-transform`](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform) only changes how text is rendered—these casing transformations operate at the [Pandoc Abstract Syntax Tree (AST)](https://pandoc.org/MANUAL.html#abstract-syntax-tree) level and modify the actual document content. This ensures that uppercase and lowercase conversions are preserved consistently across all output formats and remain intact when copied into other applications.

### Casing Transformations in Bracketed Spans

| Casing    | Syntax                        | Output |
| :-------- | :---------------------------- | :----- |
| Uppercase | `[Sample]{.pfa-case-upper}`   | [Sample]{.pfa-case-upper} |
| Lowercase | `[SAMPLE]{.pfa-case-lower}`   | [SAMPLE]{.pfa-case-lower} |

### Casing Transformations in Fenced Divs

#### Lowercase

```markdown
::: {.pfa-case-lower}
THIS PARAGRAPH IS TRANSFORMED TO LOWERCASE.
:::
```

::: {.pfa-case-lower}
THIS PARAGRAPH IS TRANSFORMED TO LOWERCASE.
:::

#### Uppercase

```markdown
::: {.pfa-case-upper}
this paragraph is transformed to uppercase.
:::
```

::: {.pfa-case-upper}
this paragraph is transformed to uppercase.
:::

## Colors

This section describes how to apply color to text using the `pfa-color` attribute in both Bracketed Spans and Fenced Divs.

### Solid Colors

The `pfa-color` attribute supports [CSS3 named colors](https://www.w3.org/TR/css-color-3/#svg-color), full hexadecimal values, and three-digit shorthand hexadecimal values.

#### Flexible Color Terminology

For standard solid colors, the filter automatically normalizes CSS3 color names. This means solid colors are completely case-insensitive and support various naming conventions. All examples below resolve perfectly to the CSS3 color `mediumvioletred` in both HTML and PDF formats:

| Naming Convention    | Syntax                                        | Output |
| :------------------- | :-------------------------------------------- | :---------- |
| Lowercase            | `[Color]{pfa-color="mediumvioletred"}`   | [Color]{pfa-color="mediumvioletred"} |
| Title Case           | `[Color]{pfa-color="Medium Violet Red"}` | [Color]{pfa-color="Medium Violet Red"} |
| Kebab Case           | `[Color]{pfa-color="medium-violet-red"}` | [Color]{pfa-color="medium-violet-red"} |
| Snake Case           | `[Color]{pfa-color="medium_violet_red"}` | [Color]{pfa-color="medium_violet_red"} |
| Camel Case           | `[Color]{pfa-color="mediumVioletRed"}`   | [Color]{pfa-color="mediumVioletRed"} |
| Pascal Case          | `[Color]{pfa-color="MediumVioletRed"}`   | [Color]{pfa-color="MediumVioletRed"} |
| Screaming Snake Case | `[Color]{pfa-color="MEDIUM_VIOLET_RED"}` | [Color]{pfa-color="MEDIUM_VIOLET_RED"} |

#### Applying Solid Colors

| Input Type    | Syntax                               | Output |
| :------------ | :-------------------------------- | :----- |
| CSS3 Named    | `[Sample]{pfa-color="crimson"}` | [Sample]{pfa-color="crimson"} |
| Hex Full      | `[Sample]{pfa-color="#2E8B57"}` | [Sample]{pfa-color="#2E8B57"} |
| Hex Shorthand^[Three-digit shorthand expands by duplicating each single hexadecimal digit per RGB channel (e.g., '#666' expands to '#666666').] | `[Sample]{pfa-color="#666"}` | [Sample]{pfa-color="#666"} |

**Note:** While Pandoc's default LaTeX template loads `x11names` (which includes numbered variants like `LightBlue3`), CSS and web browsers do not recognize these. To ensure your colors render perfectly across both PDF and HTML formats, you must stick strictly to the standard CSS3 Named Colors or Hexadecimal codes.

### Color Mixing

The filter natively supports LaTeX's `xcolor` percentage mixing syntax, allowing you to tint, shade or mix colors on the fly. This translates perfectly into both PDF and HTML outputs.^[HTML output utilizes the native CSS `color-mix()` function to achieve the same blend.]

The mixing syntax uses the exclamation mark (`!`) to separate values:

| Mixing Type | Syntax Pattern | Description & Example |
| :-- | :----- | :---- |
| Tinting | `BaseColor!Percentage` | Blends with white. `Maroon!40` keeps 40% Maroon and 60% white. |
| Shading | `BaseColor!Percentage!black` | Blends with black. `MediumVioletRed!80!black` keeps 80% MediumVioletRed and 20% black. |
| Two-Color Mix | `BaseColor!Percentage!MixColor` | Blends two specific colors. `RoyalBlue!50!ForestGreen` yields a 50/50 mix of both colors. |

**[Warning] Strict Casing Rule:** Because mixed colors are passed directly to the LaTeX compiler, the flexible terminology rules do not apply here. You must use the exact casing expected by the LaTeX `xcolor` package, otherwise your PDF generation will break:

* **Base Colors:** The [19 core LaTeX colors](https://www.overleaf.com/learn/latex/Using_colours_in_LaTeX#Reference_guide) must be strictly **lowercase**.

* **Extended Web Colors:** The [CSS3 named colors](https://developer.mozilla.org/en-US/docs/Web/CSS/named-color) must be strictly **PascalCase**.

| Mixing Type | Syntax | Output |
| :-------| :------------------ | :--- |
| Tint (40% Base) | `[Tinted]{pfa-color="Maroon!40"}` | [Tinted]{pfa-color="Maroon!40"} |
| Shade (80% Base) | `[Shaded]{pfa-color="MediumVioletRed!80!black"}` | [Shaded]{pfa-color="MediumVioletRed!80!black"} |
| Mix (50/50) | `[Mixed]{pfa-font-color="RoyalBlue!50!ForestGreen"}` | [Mixed]{pfa-color="RoyalBlue!50!ForestGreen"} |

### Inheriting Colors in Fenced Divs

When applied to a Fenced Div, the `pfa-color` attribute defines the default text color for the entire block. All enclosed content inherits this color unless explicitly overridden by an inner Bracketed Span.

```markdown
::: {pfa-color="DarkSlateGrey"}
The Fenced Div defines _DarkSlateGrey_ as the default text color for this block.

[This Bracketed Span overrides the inherited color to _tomato_.]{pfa-color="tomato"}

The remaining text continues using _DarkSlateGrey_ for the remainder of the Div.
:::
```

::: {pfa-color="DarkSlateGrey"}
The Fenced Div defines _DarkSlateGrey_ as the default text color for this block.

[This Bracketed Span overrides the inherited color to _tomato_.]{pfa-color="tomato"}

The remaining text continues using _DarkSlateGrey_ for the remainder of the Div.
:::

**Note:** The `pfa-color` utility is an attribute, not a class, and should not be prefixed with a period (`.`).

## Background Colors

The `pfa-bg-color` attribute allows you to define a background fill for Fenced Divs and Bracketed Spans. This attribute supports the same color naming conventions as `pfa-color`, including CSS3 named colors, hex codes, and mixing syntax.

### Background Colors in Fenced Divs

When applied to a Fenced Div, `pfa-bg-color` fills the entire container. We recommend using this alongside `pfa-padding` to prevent text from colliding with the container edges.

```markdown
::: {pfa-bg-color="lightsteelblue" pfa-padding="1em"}
This block has a _lightsteelblue_ background and 1em of padding on all sides.
:::
```

::: {pfa-bg-color="lightsteelblue" pfa-padding="1em"}
This block has a _lightsteelblue_ background and 1em of padding on all sides.
:::

### Background Highlights in Bracketed Spans

When applied to a Bracketed Span, `pfa-bg-color` acts as an inline highlight.

```markdown
The [quick brown fox]{pfa-bg-color="gold" pfa-padding="0.2em 0.4em"} jumps over the lazy dog.
```

The quick [brown fox jumps]{pfa-bg-color="gold" pfa-padding="0.2em 0.4em"} over the lazy dog.

## Padding and Layout Spacing

The `pfa-padding` attribute provides fine-grained control over the internal spacing of containers. It supports CSS-style shorthand syntax to apply padding to individual edges.

### Shorthand Padding Logic

The `pfa-padding` attribute supports the standard CSS shorthand rules, ensuring consistent spacing across HTML, LaTeX, and Typst:

* **1 Value (`1em`):** Applied to all four sides.
* **2 Values (`1em 0.5em`):** First value for Top/Bottom, second for Left/Right.
* **3 Values (`1em 0.5em 2em`):** Top, Left/Right, Bottom.
* **4 Values (`1em 0.5em 2em 0.2em`):** Top, Right, Bottom, Left.

**Supported Units:** To guarantee cross-platform stability, only typographic units are supported: `pt`, `em`, and `ex`.

### Individual Edge Control (Fenced Divs)

```markdown
::: {pfa-bg-color="lavender" pfa-padding="0.5em 2em 1em 0.5em"}
This block uses asymmetric padding: 0.5em top, 2em right, 1em bottom, and 0.5em left.
:::
```

::: {pfa-bg-color="lavender" pfa-padding="0.5em 2em 1em 0.5em"}
This block uses asymmetric padding: 0.5em top, 2em right, 1em bottom, and 0.5em left.
:::

### Inline Bounding Boxes (Bracketed Spans)

When `pfa-padding` is applied to a Bracketed Span, the filter dynamically upgrades the element to a structural box, ensuring the background fill and padding respect the inline bounding area correctly.

```markdown
[Highlighted with padding]{pfa-bg-color="cyan" pfa-padding="0.2em 0.5em"}
```

[Highlighted with padding]{pfa-bg-color="cyan" pfa-padding="0.2em 0.5em"}

## Typst Named Palette

In addition to standard CSS colors, the filter provides access to the [19 predefined named colors](https://typst.app/docs/reference/visualize/color/#predefined-colors) from the Typst palette. To use these, prefix the color name with `typst`.

| Syntax | Output |
| --- | --- |
| `[Sample]{pfa-bg-color="typstmaroon" pfa-color="white" pfa-padding="0.2em"}` | [Sample]{pfa-bg-color="typstmaroon" pfa-color="white" pfa-padding="0.2em"} |
| `[Sample]{pfa-bg-color="typsteastern" pfa-color="white" pfa-padding="0.2em"}` | [Sample]{pfa-bg-color="typsteastern" pfa-color="white" pfa-padding="0.2em"} |
| `[Sample]{pfa-bg-color="typstorange" pfa-padding="0.2em"}` | [Sample]{pfa-bg-color="typstorange" pfa-padding="0.2em"} |

## Text Alignment within Fenced Divs

The `pfa-align-*` classes control text alignment within a Fenced Div while explicitly preserving hard line breaks (`\`). These utilities map directly to native LaTeX commands (`\raggedright`, `\centering`, and `\raggedleft`) in PDF output and equivalent CSS behaviors in HTML, making them ideal for formatting poetry, lyrics, or multi-line blocks.

### Left-aligned Text

```markdown
::: {.pfa-align-left}
This block of text is _left-aligned_.
:::
```

::: {.pfa-align-left}
This block of text is _left-aligned_.
:::

### Center-aligned Text

```markdown
::: {.pfa-align-center}
This block of text is _center-aligned_.
:::
```

::: {.pfa-align-center}
This block of text is _center-aligned_.
:::

### Right-aligned Text

```markdown
::: {.pfa-align-right}
This block of text is _right-aligned_.
:::
```

::: {.pfa-align-right}
This block of text is _right-aligned_.
:::

### Line Break Preservation

```markdown
::: {.pfa-align-center}
This block of text\
is _center-aligned_\
while preserving explicit line breaks.
:::
```

::: {.pfa-align-center}
This block of text\
is _center-aligned_\
while preserving explicit line breaks.
:::

## Combining Multiple Classes

Multiple typographic utilities can be combined within the same element. Font, size, color, alignment, and decoration classes are designed to compose independently and can be applied together to both Bracketed Spans and Fenced Divs.

Class names are space-separated within `{}` following Pandoc attribute syntax. In addition to classes, key-value attributes such as `pfa-color` may be included alongside class definitions.

### Bracketed Span Composition

| Style                               | Syntax                                                                       | Output |
| :-------------------------- | :---------------------------------------------------- | :------------- |
| Bold Sans-Serif                     | `[Sample]{.pfa-wight-bold .pfa-family-sans .pfa-size-l pfa-color="red"}`   | [Sample]{.pfa-weight-bold .pfa-family-sans .pfa-size-l pfa-color="red"} |
| Italic Monospace                    | `[Sample]{.pfa-style-italic .pfa-family-mono .pfa-size-s}`                    | [Sample]{.pfa-style-italic .pfa-family-mono .pfa-size-s} |
| Small Caps, Colored     | `[Sample]{.pfa-style-smallcaps pfa-color="forestgreen"}` | [Sample]{.pfa-style-smallcaps pfa-color="forestgreen"} |

### Fenced Div Composition

Multiple utilities can also be applied to Fenced Divs to control alignment, typography, and color simultaneously. The resulting block inherits all specified styles while preserving Pandoc’s standard attribute behavior.

```markdown
::: {.pfa-align-center .pfa-family-sans .pfa-weight-bold .pfa-size-l pfa-color="midnightblue"}
A centered, bold, sans-serif, large, midnight-blue Fenced Div demonstrating multiple combined utilities from the filter.
:::
```

::: {.pfa-align-center .pfa-family-sans .pfa-weight-bold .pfa-size-l pfa-color="midnightblue"}
A centered, bold, sans-serif, large, midnight-blue Fenced Div demonstrating multiple combined utilities from the filter.
:::

## Legacy Aliases (Deprecated)

**Warning:** Legacy aliases are deprecated. They are retained strictly for backward compatibility and will be entirely removed in the next major release. New documents should use the `pfa-*` namespaces going forward.

### Font Sizing Aliases

| Legacy Class | Modern Class |
| :----------- | :---------------- |
| `xsmall`     | `pfa-text-xs`     |
| `small`      | `pfa-text-s`      |
| `normal`     | `pfa-text-normal` |
| `large`      | `pfa-text-l`      |
| `xlarge`     | `pfa-text-xl`     |
| `xxlarge`    | `pfa-text-2xl`    |
| `huge`       | `pfa-text-3xl`    |

### Font Weight, Shape, and Family Aliases

| Legacy Class | Shorthand | Modern Class |
| :----------- | :--------- | :------------------- |
| `bold`       | `bf`       | `pfa-font-bold`      |
| `emphasis`   | `em`       | `pfa-font-emphasis`  |
| `italic`     | `it`       | `pfa-font-italic`    |
| `medium`     | `md`       | `pfa-font-medium`    |
| `monospace`  | `tt`       | `pfa-font-mono`      |
| `normalfont` | `nf`       | `pfa-font-normal`    |
| `sans`       | `sf`       | `pfa-font-sans`      |
| `serif`      | `rm`       | `pfa-font-serif`     |
| `slanted`    | `sl`       | `pfa-font-slanted`   |
| `smallcaps`  | `sc`       | `pfa-font-smallcaps` |
| `upright`    | `up`       | `pfa-font-upright`   |

### Alignment Aliases

| Legacy Class | Modern Class |
| :------------ | :------------------ |
| `centering`   | `pfa-align-center` |
| `raggedleft`  | `pfa-align-right`  |
| `raggedright` | `pfa-align-left`   |

### Text Decoration Aliases

| Legacy Class | Shorthand | Modern Class |
| :----------- | :--------- | :---------------------- |
| `uline`      | `u`        | `pfa-text-uline`        |
| `uuline`     | `uu`       | `pfa-text-uline-double` |
| `dashuline`  | `dau`      | `pfa-text-uline-dashed` |
| `dotuline`   | `dou`      | `pfa-text-uline-dotted` |
| `uwave`      | `uw`       | `pfa-text-uline-wave`   |
| `sout`       | `so`       | `pfa-text-strikeout`    |

## Removed Classes

The following legacy classes were removed in version 2.0.0 and are no longer recognized by the filter. Existing documents should be updated to use the replacement classes shown below.

| Removed Class | Shorthand | Removed In | Replacement |
| :------------ | :-------- | :--------- | :---------- |
| `center`     | —         | 2.0.0      | `pfa-align-center` |
| `flushleft`  | —         | 2.0.0      | `pfa-align-left` |
| `flushright` | —         | 2.0.0      | `pfa-align-right` |
| `xout`       | `xo`     | 2.0.0      | `pfa-text-strikeout` |
