---
title: |
  | Demonstration of
  | Fonts and Alignment Filter
  | for Pandoc
---

This document demonstrates every feature provided by the
`fonts-and-alignment` Lua filter for Pandoc. Each code block shows the
exact Markdown syntax used to generate the rendered output that follows,
ensuring consistent results across both LaTeX/PDF and HTML formats.[^1]

The filter relies on Pandoc's `fenced_divs` and `bracketed_spans`
extensions, which are typically enabled by default. In the uncommon
event that these extensions are disabled, the Lua filter will be unable
to interpret the corresponding divs and spans correctly, causing them to
appear as raw text in the rendered output.

## Bracketed Spans and Fenced Divs Invocations

The filter may be used with Pandoc's `bracketed_spans` and `fenced_divs`
syntax extensions, as demonstrated below. Bracketed Spans are intended
for styling smaller inline portions of text, while Fenced Divs are used
for styling larger blocks of content. This follows Pandoc's standard
syntax conventions. For more information on this syntax, please refer to
the official Pandoc documentation: [Divs and Spans --- Pandoc User's
Guide](https://pandoc.org/demo/example33/8.18-divs-and-spans.html)

``` markdown
[This font is extra extra large.]{.pfa-text-2xl}
```

[This font is extra extra large.]{.pfa-text-2xl}

``` markdown
::: {.pfa-text-2xl}
This font is extra extra large.
:::
```

::: pfa-text-2xl
This font is extra extra large.
:::

## Font Sizing in Bracketed Spans

The filter provides nine predefined sizing hooks that allow text within
Bracketed Spans to be scaled relative to the document's base font size.

  ------------------------------------------------------------------------------
  Size           Syntax                             Output
  -------------- ---------------------------------- ----------------------------
  tiny           `[Sample]{.pfa-text-3xs}`          [Sample]{.pfa-text-3xs}

  scriptsize     `[Sample]{.pfa-text-2xs}`          [Sample]{.pfa-text-2xs}

  footnotesize   `[Sample]{.pfa-text-xs}`           [Sample]{.pfa-text-xs}

  small          `[Sample]{.pfa-text-s}`            [Sample]{.pfa-text-s}

  normal         `[Sample]{.pfa-text-normal}`       [Sample]{.pfa-text-normal}

  large          `[Sample]{.pfa-text-l}`            [Sample]{.pfa-text-l}

  Large          `[Sample]{.pfa-text-xl}`           [Sample]{.pfa-text-xl}

  LARGE          `[Sample]{.pfa-text-2xl}`          [Sample]{.pfa-text-2xl}

  huge           `[Sample]{.pfa-text-3xl}`          [Sample]{.pfa-text-3xl}
  ------------------------------------------------------------------------------

## Font Sizing in Fenced Divs

The same sizing classes can also be applied to Fenced Divs, allowing an
entire block of text to be rendered at a specific font size.

### Extra Small Font Size

``` markdown
::: {.pfa-text-xs}
This paragraph renders at the _extra small_ font size.
:::
```

::: pfa-text-xs
This paragraph renders at the *extra small* font size.
:::

### Normal Font Size

``` markdown
::: {.pfa-text-normal}
This paragraph renders at the _normal_ font size.
:::
```

::: pfa-text-normal
This paragraph renders at the *normal* font size.
:::

### Large Font Size

``` markdown
::: {.pfa-text-l}
This paragraph renders at the _large_ font size.
:::
```

::: pfa-text-l
This paragraph renders at the *large* font size.
:::

## Font Weights, Shapes, and Families in Bracketed Spans

The following typographic styles can be applied to Bracketed Spans to
control weight, style, and typeface.

  ----------------------------------------------------------------------------------------------
  Style            Syntax                                        Output
  ---------------- --------------------------------------------- -------------------------------
  Bold             `[Sample]{.pfa-font-bold}`                    [Sample]{.pfa-font-bold}

  Medium           `[Sample]{.pfa-font-medium}`                  [Sample]{.pfa-font-medium}

  Italic           `[Sample]{.pfa-font-italic}`                  [Sample]{.pfa-font-italic}

  Slanted          `[Sample]{.pfa-font-slanted}`                 [Sample]{.pfa-font-slanted}

  Upright          `[Sample]{.pfa-font-upright}`                 [Sample]{.pfa-font-upright}

  Emphasis         `[Sample]{.pfa-font-emphasis}`                [Sample]{.pfa-font-emphasis}

  Serif            `[Sample]{.pfa-font-serif}`                   [Sample]{.pfa-font-serif}

  Sans-Serif       `[Sample]{.pfa-font-sans}`                    [Sample]{.pfa-font-sans}

  Monospace        `[Sample]{.pfa-font-mono}`                    [Sample]{.pfa-font-mono}

  Small Caps       `[Sample]{.pfa-font-smallcaps}`               [Sample]{.pfa-font-smallcaps}

  Normal           `[Sample]{.pfa-font-normal}`                  [Sample]{.pfa-font-normal}
  ----------------------------------------------------------------------------------------------

## Font Weights, Shapes, and Families in Fenced Divs

These same typographic classes can also be applied to Fenced Divs,
allowing an entire block of text to adopt a particular visual style.

### Bold Weight

``` markdown
::: {.pfa-font-bold}
This paragraph renders in bold type.
:::
```

::: pfa-font-bold
This paragraph renders in bold type.
:::

### Sans-Serif Family

``` markdown
::: {.pfa-font-sans}
This paragraph uses a sans-serif typeface.
:::
```

::: pfa-font-sans
This paragraph uses a sans-serif typeface.
:::

### Small Caps

``` markdown
::: {.pfa-font-smallcaps}
This paragraph is rendered in small caps.
:::
```

::: pfa-font-smallcaps
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

### Casing Tranformations in Bracketed Spans

  -----------------------------------------------------------------------------------------
  Casing         Syntax                                         Output
  -------------- ---------------------------------------------- ---------------------------
  Uppercase      `[coerced]{.pfa-uppercase}`                    [COERCED]{.pfa-uppercase}

  Lowercase      `[COERCED]{.pfa-lowercase}`                    [coerced]{.pfa-lowercase}
  -----------------------------------------------------------------------------------------

### Casing Transformations in Fenced Divs

#### Lowercase

``` markdown
::: {.pfa-lowercase}
THIS PARAGRAPH IS TRANSFORMED TO LOWERCASE.
:::
```

::: pfa-lowercase
this paragraph is transformed to lowercase.
:::

#### Uppercase

``` markdown
::: {.pfa-uppercase}
this paragraph is transformed to uppercase.
:::
```

::: pfa-uppercase
THIS PARAGRAPH IS TRANSFORMED TO UPPERCASE.
:::

## Text Decorations for Bracketed Spans

Text decoration styles are implemented using the LaTeX `ulem` package,
which is automatically included via a `header-include` whenever any of
the corresponding classes are detected in the document. These styles are
also mapped to equivalent CSS properties to ensure consistent rendering
across LaTeX/PDF and HTML outputs. These decorations apply only to
**Bracketed Spans**.

  --------------------------------------------------------------------------------------------------------
  Decoration         Syntax                                      Output
  ------------------ ------------------------------------------- -----------------------------------------
  Single Underline   `[Sample]{.pfa-text-uline}`                 [[Sample]{.underline}]{.pfa-text-uline}

  Double Underline   `[Sample]{.pfa-text-uline-double}`          [Sample]{.pfa-text-uline-double}

  Dashed Underline   `[Sample]{.pfa-text-uline-dashed}`          [Sample]{.pfa-text-uline-dashed}

  Dotted Underline   `[Sample]{.pfa-text-uline-dotted}`          [Sample]{.pfa-text-uline-dotted}

  Wavy Underline     `[Sample]{.pfa-text-uline-wave}`            [Sample]{.pfa-text-uline-wave}

  Strikeout          `[Sample]{.pfa-text-strikeout}`             [~~Sample~~]{.pfa-text-strikeout}
  --------------------------------------------------------------------------------------------------------

**Note:** The `\xout{...}` marked-out text style has been removed from
this version of the package due to lack of consistent cross-format
support in HTML/CSS and limited usage in modern document workflows.

## Colors

This section describes how to apply color to text using the
`pfa-font-color` attribute in both Bracketed Spans and Fenced Divs.

### Flexible Color Terminology

The `pfa-font-color` attribute supports CSS3 named colors, full
hexadecimal values, and three-digit shorthand hexadecimal values. For
CSS3 named colors, the filter parses and normalizes the name to support
different naming conventions.

All naming conventions below resolve to the CSS3 color
`mediumvioletred`.

  -----------------------------------------------------------------------------------------------------
  Naming Convention  Syntax                                          Output
  ------------------ ----------------------------------------------- ----------------------------------
  Lowercase          `[Color]{pfa-font-color="mediumvioletred"}`     [Color]{style="color: #C71585;"}

                                                                     

  Spaces             `[Color]{pfa-font-color="Medium Violet Red"}`   [Color]{style="color: #C71585;"}

                                                                     

  Title Case         `[Color]{pfa-font-color="Medium Violet Red"}`   [Color]{style="color: #C71585;"}

                                                                     

  Kebab Case         `[Color]{pfa-font-color="medium-violet-red"}`   [Color]{style="color: #C71585;"}

                                                                     

  Snake Case         `[Color]{pfa-font-color="medium_violet_red"}`   [Color]{style="color: #C71585;"}

                                                                     

  Camel Case         `[Color]{pfa-font-color="mediumVioletRed"}`     [Color]{style="color: #C71585;"}

                                                                     

  Pascal Case        `[Color]{pfa-font-color="MediumVioletRed"}`     [Color]{style="color: #C71585;"}

                                                                     

  Screaming Snake    `[Color]{pfa-font-color="MEDIUM_VIOLET_RED"}`   [Color]{style="color: #C71585;"}
  Case                                                               

                                                                     

  Uppercase          `[Color]{pfa-font-color="MEDIUMVIOLETRED"}`     [Color]{style="color: #C71585;"}
  -----------------------------------------------------------------------------------------------------

### Colors in Bracketed Spans

  ---------------------------------------------------------------------------------------------------
  Input Type       Syntax                                         Output
  ---------------- ---------------------------------------------- -----------------------------------
  CSS3 Named       `[Sample]{pfa-font-color="crimson"}`           [Sample]{style="color: #DC143C;"}

  Hex Full         `[Sample]{pfa-font-color="#2E8B57"}`           [Sample]{style="color: #2E8B57;"}

  Hex              `[Sample]{pfa-font-color="#666"}`              [Sample]{style="color: #666666;"}
  Shorthand[^2]                                                   
  ---------------------------------------------------------------------------------------------------

### Colors in Fenced Divs

When applied to a fenced Div, the `pfa-font-color` attribute defines the
default text color for the entire block. All enclosed content inherits
this color unless explicitly overridden by a Bracketed Span.

``` markdown
::: {pfa-font-color="DarkSlateGrey"}
The fenced Div defines _DarkSlateGrey_ as the default text color for this block.
:::
```

::: {style="color: #2F4F4F;"}
The fenced Div defines *DarkSlateGrey* as the default text color for
this block.
:::

``` markdown
::: {pfa-font-color="DarkSlateGrey"}
The fenced Div defines _DarkSlateGrey_ as the default text color for this block.

[This Bracketed Span overrides the inherited color to _tomato_.]{pfa-font-color="tomato"}

The remaining text continues using _DarkSlateGrey_ for the remainder of the Div.
:::
```

::: {style="color: #2F4F4F;"}
The fenced Div defines *DarkSlateGrey* as the default text color for
this block.

[This Bracketed Span overrides the inherited color to
*tomato*.]{style="color: #FF6347;"}

The remaining text continues using *DarkSlateGrey* for the remainder of
the Div.
:::

**Note:** The `pfa-font-color` utility is an attribute, not a class, and
should not be prefixed with a period (`.`).

## Text Alignment within Fenced Divs

The `.pfa-align-*` classes may be used to align text within a fenced
Div. These classes map to LaTeX alignment commands (`\raggedright`,
`\centering`, and `\raggedleft`) in PDF output while producing
equivalent behavior in HTML.

These classes also preserve explicit line breaks introduced with the
backslash (`\`) character, which is useful for poetry, lyrics, and other
text where line structure must be preserved.

### Left-aligned Text

``` markdown
::: {.pfa-align-left}
This block of text is _left-aligned_.
:::
```

::: pfa-align-left
This block of text is *left-aligned*.
:::

### Center-aligned Text

``` markdown
::: {.pfa-align-center}
This block of text is _center-aligned_.
:::
```

::: pfa-align-center
This block of text is *center-aligned*.
:::

### Right-aligned Text

``` markdown
::: {.pfa-align-right}
This block of text is _right-aligned_.
:::
```

::: pfa-align-right
This block of text is *right-aligned*.
:::

### Explicit Line Break Preservation

The alignment classes preserve explicit line breaks introduced with the
backslash (`\`) character.

``` markdown
::: {.pfa-align-center}
This block of text \
is _center-aligned_ \
while preserving explicit line breaks.
:::
```

::: pfa-align-center
This block of text\
is *center-aligned*\
while preserving explicit line breaks.
:::

## Block-Level Alignment

The `.pfa-block-*` utilities control the horizontal positioning of a
fenced Div as a whole, without affecting the internal text alignment of
its contents. This allows the block itself to be positioned
independently of how text is arranged within it.

### Left-Aligned Block

``` markdown
::: {.pfa-block-left}
The entire block is _left-aligned_.
:::
```

::: pfa-block-left
The entire block is *left-aligned*.
:::

### Center-Aligned Block

``` markdown
::: {.pfa-block-center}
The entire block is _center-aligned_.
:::
```

::: pfa-block-center
The entire block is *center-aligned*.
:::

### Right-Aligned Block

``` markdown
::: {.pfa-block-right}
The entire block is _right-aligned_.
:::
```

::: pfa-block-right
The entire block is *right-aligned*.
:::

## Combining Multiple Classes

Multiple typographic utilities can be combined within the same element.
Font, size, color, alignment, and decoration classes are designed to
compose independently and can be applied together to both Bracketed
Spans and Fenced Divs.

Class names are space-separated within `{}` following Pandoc attribute
syntax. In addition to classes, key-value attributes such as
`pfa-font-color` may be included alongside class definitions.

### Bracketed Span Composition

  ----------------------------------------------------------------------------------------------------------------------------------------------
  Style              Syntax                                                                         Output
  ------------------ ------------------------------------------------------------------------------ --------------------------------------------
  Bold Sans-serif    `[Sample]{.pfa-font-bold .pfa-font-sans .pfa-text-l pfa-font-color="red"}`     [Sample]{.pfa-font-bold .pfa-font-sans
                                                                                                    .pfa-text-l style="color: #FF0000;"}

                                                                                                    

  Italic Monospace   `[Sample]{.pfa-font-italic .pfa-font-mono .pfa-text-s}`                        [Sample]{.pfa-font-italic .pfa-font-mono
                                                                                                    .pfa-text-s}

                                                                                                    

  Small Caps,        `[Sample]{.pfa-font-smallcaps .pfa-text-uline pfa-font-color="forestgreen"}`   [[Sample]{.underline}]{.pfa-font-smallcaps
  Underlined,                                                                                       .pfa-text-uline style="color: #228B22;"}
  Colored                                                                                           
  ----------------------------------------------------------------------------------------------------------------------------------------------

### Fenced Div Composition

Multiple utilities can also be applied to Fenced Divs to control
alignment, typography, and color simultaneously. The resulting block
inherits all specified styles while preserving Pandoc's standard
attribute behavior.

``` markdown
::: {.pfa-align-center .pfa-font-sans .pfa-font-bold .pfa-text-l pfa-font-color="midnightblue"}
A centered, bold, sans-serif, large, midnight-blue Fenced Div demonstrating multiple combined utilities from the filter.
:::
```

::: {.pfa-align-center .pfa-font-sans .pfa-font-bold .pfa-text-l style="color: #191970;"}
A centered, bold, sans-serif, large, midnight-blue Fenced Div
demonstrating multiple combined utilities from the filter.
:::

## Legacy Short-Hand Aliases (Deprecated)

**Warning:** Legacy aliases are deprecated. They are retained strictly
for backward compatibility and will be entirely removed in the next
major release. New documents should use the `.pfa-*` namespaces going
forward.

### Font Weight, Shape, and Family Aliases

  Legacy Classes   Short-Hand   New Classes
  ---------------- ------------ -----------------------
  `.bold`          `.bf`        `.pfa-font-bold`
  `.emphasis`      `.em`        `.pfa-font-emphasis`
  `.italic`        `.it`        `.pfa-font-italic`
  `.medium`        `.md`        `.pfa-font-medium`
  `.monospace`     `.tt`        `.pfa-font-mono`
  `.normalfont`    `.nf`        `.pfa-font-normal`
  `.sans`          `.sf`        `.pfa-font-sans`
  `.serif`         `.rm`        `.pfa-font-serif`
  `.slanted`       `.sl`        `.pfa-font-slanted`
  `.smallcaps`     `.sc`        `.pfa-font-smallcaps`
  `.upright`       `.up`        `.pfa-font-upright`

### Font Size Aliases

  Legacy Classes   Modern Classes
  ---------------- --------------------
  `.xsmall`        `.pfa-text-xs`
  `.small`         `.pfa-text-s`
  `.normal`        `.pfa-text-normal`
  `.large`         `.pfa-text-l`
  `.xlarge`        `.pfa-text-xl`
  `.xxlarge`       `.pfa-text-2xl`
  `.huge`          `.pfa-text-3xl`

### Alignment Aliases

  Legacy Classes   New Classes
  ---------------- --------------------------
  `.center`        Removed in version 1.0.3
  `.flushleft`     Removed in version 1.0.3
  `.flushright`    Removed in version 1.0.3
  `.centering`     `.pfa-align-center`
  `.raggedleft`    `.pfa-align-right`
  `.raggedright`   `.pfa-align-left`

### Underline and Strikeout Aliases

  Legacy Classes   Short-Hand   New Classes
  ---------------- ------------ --------------------------
  `.uline`         `.u`         `.pfa-text-uline`
  `.uuline`        `.uu`        `.pfa-text-uline-double`
  `.dashuline`     `.dau`       `.pfa-text-uline-dashed`
  `.dotuline`      `.dou`       `.pfa-text-uline-dotted`
  `.uwave`         `.uw`        `.pfa-text-uline-wave`
  `.sout`          `.so`        `.pfa-text-strikeout`
  `.xout`          `.xo`        Removed in version 1.0.3

[^1]: To enable equivalent styling in HTML output, include the
    `fonts-and-alignment.css` stylesheet distributed with this filter.

[^2]: Three-digit shorthand expands by repeating each hexadecimal digit
    per RGB channel (e.g., `#666` becomes `#666666`, `#F0A` becomes
    `#FF00AA`). This only applies when each channel consists of a single
    repeated hexadecimal digit. Full hexadecimal values without
    per-channel repetition (e.g., `#2E8B57`) are not eligible for
    shorthand expansion.
