---
title: |
  | Demonstration of
  | Fonts and Alignment Filter
  | for Pandoc
---

This document showcases every feature provided by the
`fonts-and-alignment` Lua filter for Pandoc. Each `code block`
demonstrates the exact Markdown syntax used to produce the rendered
output that follows, with consistent results for both the LaTeX/PDF and
HTML formats.

## Inline and Block Invocations

The filter may be used *inline* or in *block* mode as shown in the two
invocations below. Inline styling is used to style small portions of
text, while block styling is used to style large blocks of text. This
accords with Pandoc's syntax convention.

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

## Inline Font Sizing Scale

Nine sizing hooks are provided to scale text elements relative to the
document's base font size.

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

## Block Font Sizing Scale

The same sizing classes can be applied globally to fenced div
blocks.[^1]

### Extra Small Font Size

``` markdown
::: {.pfa-text-xs}
[This paragraph renders at the _extra small_ font size]{pfa-font-color="blue"} [compared to the normal font size.]{.pfa-text-normal pfa-font-color="red"}
:::
```

::: pfa-text-xs
[This paragraph renders at the *extra small* font
size]{style="color: #0000FF;"} [compared to the normal font
size.]{.pfa-text-normal style="color: #FF0000;"}
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
[This paragraph renders at the _large_ font size]{pfa-font-color="blue"} [compared to the normal font size.]{.pfa-text-normal pfa-font-color="red"}
:::
```

::: pfa-text-l
[This paragraph renders at the *large* font
size]{style="color: #0000FF;"} [compared to the normal font
size.]{.pfa-text-normal style="color: #FF0000;"}
:::

## Font Weights, Shapes, and Families (Inline)

Every supported typographic style is available as an inline span.

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

  Normal Reset     `[Sample]{.pfa-font-normal}`                  [Sample]{.pfa-font-normal}
  ----------------------------------------------------------------------------------------------

## Font Weights, Shapes, and Families (Block)

The same classes can also be applied at the block level, allowing the
specified typographic style to affect all enclosed sentences.

### Bold Weight

``` markdown
::: {.pfa-font-bold}
This paragraph renders using the _bold_ font weight.
:::
```

::: pfa-font-bold
This paragraph renders using the *bold* font weight.
:::

### Sans-Serif Family

``` markdown
::: {.pfa-font-sans}
This paragraph renders using the _sans-serif_ font family.
:::
```

::: pfa-font-sans
This paragraph renders using the *sans-serif* font family.
:::

### Small Caps Shape

``` markdown
::: {.pfa-font-smallcaps}
This paragraph renders using the _small caps_ font shape.
:::
```

::: pfa-font-smallcaps
This paragraph renders using the *small caps* font shape.
:::

## Text Casing Transformations

Unlike standard web styling---which only changes how text looks on the
screen---these casing classes permanently change the actual letters in
your document. This guarantees that your uppercase or lowercase styling
remains intact even if you copy and paste the text into another
application.

### Inline Casing

  -----------------------------------------------------------------------------------------
  Casing         Syntax                                         Output
  -------------- ---------------------------------------------- ---------------------------
  Uppercase      `[coerced]{.pfa-uppercase}`                    [COERCED]{.pfa-uppercase}

  Lowercase      `[COERCED]{.pfa-lowercase}`                    [coerced]{.pfa-lowercase}
  -----------------------------------------------------------------------------------------

### Block Casing

#### Lowercase

``` markdown
::: {.pfa-lowercase}
THIS PARAGRAPH IS TRANSFORMED TO _LOWERCASE_.
:::
```

::: pfa-lowercase
this paragraph is transformed to *lowercase*.
:::

#### Uppercase

``` markdown
::: {.pfa-uppercase}
this paragraph is transformed to _uppercase_.
:::
```

::: pfa-uppercase
THIS PARAGRAPH IS TRANSFORMED TO *UPPERCASE*.
:::

## Inline Text Decorations

Underline and strikeout variants are implemented through the `ulem`
LaTeX package and mapped to their equivalent standard CSS properties,
ensuring consistent rendering across output formats. These styles are
supported only for inline elements.

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

## Color Resolution

The `pfa-font-color` attribute natively parses standard CSS3 named
colors, six-digit hexadecimal codes, and three-digit shorthand hex
codes.

  ---------------------------------------------------------------------------------------------------
  Input Type       Syntax                                         Output
  ---------------- ---------------------------------------------- -----------------------------------
  CSS Named        `[Sample]{pfa-font-color="crimson"}`           [Sample]{style="color: #DC143C;"}

  Hex Full         `[Sample]{pfa-font-color="#2E8B57"}`           [Sample]{style="color: #2E8B57;"}

  Hex              `[Sample]{pfa-font-color="#666"}`              [Sample]{style="color: #666666;"}
  Shorthand[^2]                                                   
  ---------------------------------------------------------------------------------------------------

**Note:** The `pfa-font-color` utility is an attribute, not a class, and
should not be prefixed with a period (.).

### Flexible Spelling of Named Colors

The rendering engine automatically sanitizes color inputs. Parsing is
case-insensitive and ignores spaces, hyphens, and underscores. All
syntax variations shown below successfully map to the standard CSS3
color `mediumvioletred`.

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

### Block-Level Color Constraints with Inline Overrides

Colors applied to a block automatically inherit downward through the
text hierarchy, though nested spans can explicitly override parent
values.

``` markdown
::: {pfa-font-color="dark slate grey"}
The parent block carries a default color of dark slate gray. [This inline span overrides the color to tomato red.]{pfa-font-color="tomato"} The surrounding text continues in the parent color until the block closes.
:::
```

::: {style="color: #2F4F4F;"}
The parent block carries a default color of dark slate gray. [This
inline span overrides the color to tomato red.]{style="color: #FF6347;"}
The surrounding text continues in the parent color until the block
closes.
:::

## Text Alignment within Blocks

The `.pfa-text-*` utility wraps blocks in standard text environments.

### Left-Aligned Text

``` markdown
::: {.pfa-text-left}
This block of text is _left-aligned_.
:::
```

::: pfa-text-left
This block of text is *left-aligned*.
:::

### Centered Text

``` markdown
::: {.pfa-text-center}
This block of text is _centered_.
:::
```

::: pfa-text-center
This block of text is *centered*.
:::

### Right-Aligned Text

``` markdown
::: {.pfa-text-right}
This block of text is _right-aligned_.
:::
```

::: pfa-text-right
This block of text is *right-aligned*.
:::

## Ragged Alignment

The `.pfa-align-*` utility preserves and honors explicit line breaks
(via backslash escapes).

In PDF engines, the `.pfa-text-*` and `.pfa-align-*` utilities differ in
vertical spacing:

- `.pfa-text-*` mirrors LaTeX's structural `center`, `flushleft` and
  `flushright` environments, introducing distinct vertical margins
  around the block.
- `.pfa-align-*` mirrors inline `\centering`, `\raggedright` and
  `\raggedleft` declarations, flowing contextually with surrounding
  content.

Because HTML applies only `text-align` properties uniformly across both
families, this structural spacing distinction applies only to PDF
documents.

Choose `.pfa-text-*` when the aligned block operates as an isolated
visual unit (e.g., a callout banner, a standalone announcement, or a
centered pull quote). Choose `.pfa-align-*` when alignment rules should
integrate natively into surrounding paragraph streams (e.g., a
line-broken signature block, verse stanzas, or captioned figures).

### Left-Aligned Ragged Right Text

``` markdown
::: {.pfa-align-left}
This block of ragged text \
is _left-aligned_ \
while honoring explicit line breaks.
:::
```

::: pfa-align-left
This block of ragged text\
is *left-aligned*\
while honoring explicit line breaks.
:::

### Center-Aligned Ragged Both Text

``` markdown
::: {.pfa-align-center}
This block of ragged text \
is _centered_ \
while honoring explicit line breaks.
:::
```

::: pfa-align-center
This block of ragged text\
is *centered*\
while honoring explicit line breaks.
:::

### Right-Aligned Ragged Left Text

``` markdown
::: {.pfa-align-right}
This block of ragged text \
is _right-aligned_ \
while honoring explicit line breaks.
:::
```

::: pfa-align-right
This block of ragged text\
is *right-aligned*\
while honoring explicit line breaks.
:::

## Block-Level Alignment

The `.pfa-block-*` utility positions an entire block container as a
single cohesive unit while preserving the internal alignment settings of
the text within it.

### Left-Aligned Block

``` markdown
::: {.pfa-block-left}
The entire block is _left-aligned_ \
while maintaining internal text alignment.
:::
```

::: pfa-block-left
The entire block is *left-aligned*\
while maintaining internal text alignment.
:::

### Center-Aligned Block

``` markdown
::: {.pfa-block-center}
The entire block is _center-aligned_ \
while maintaining internal text alignment.
:::
```

::: pfa-block-center
The entire block is *center-aligned*\
while maintaining internal text alignment.
:::

### Right-Aligned Block

``` markdown
::: {.pfa-block-right}
The entire block is _right-aligned_ \
while maintaining internal text alignment.
:::
```

::: pfa-block-right
The entire block is *right-aligned*\
while maintaining internal text alignment.
:::

## Combining Multiple Classes

Classes can be stacked seamlessly. Sizing, family, weight, color, and
decoration definitions compose safely on both inline elements and
structural blocks.

Individual styles are space-separated and enclosed in braces `{}`, for
inline and block composition in accordance with Pandoc's syntax rules.

### Inline Composition

  --------------------------------------------------------------------------------------------------------------------------------------------
  Style            Syntax                                                                         Output
  ---------------- ------------------------------------------------------------------------------ --------------------------------------------
  Bold Sans-serif  `[Sample]{.pfa-font-bold .pfa-font-sans .pfa-text-l pfa-font-color="red"}`     [Sample]{.pfa-font-bold .pfa-font-sans
                                                                                                  .pfa-text-l style="color: #FF0000;"}

  Italic Mono      `[Sample]{.pfa-font-italic .pfa-font-mono .pfa-text-s}`                        [Sample]{.pfa-font-italic .pfa-font-mono
                                                                                                  .pfa-text-s}

  Small Caps,      `[Sample]{.pfa-font-smallcaps .pfa-text-uline pfa-font-color="forestgreen"}`   [[Sample]{.underline}]{.pfa-font-smallcaps
  Underlined and                                                                                  .pfa-text-uline style="color: #228B22;"}
  Colored                                                                                         
  --------------------------------------------------------------------------------------------------------------------------------------------

### Block Composition

``` markdown
::: {.pfa-text-center .pfa-font-sans .pfa-font-bold .pfa-text-l pfa-font-color="midnightblue"}
A centered, bold, sans-serif, large, midnight-blue block assembled from five different features of the filter.
:::
```

::: {.pfa-text-center .pfa-font-sans .pfa-font-bold .pfa-text-l style="color: #191970;"}
A centered, bold, sans-serif, large, midnight-blue block assembled from
five different features of the filter.
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
  ---------------- ---------------------
  `.center`        `.pfa-text-center`
  `.flushleft`     `.pfa-text-left`
  `.flushright`    `.pfa-text-right`
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

[^1]: As explained later, `pfa-font-color` is an attribute and should
    not be prefixed with a period `(.)`.

[^2]: Three-digit shorthand expands by doubling each digit (e.g., `#666`
    becomes `#666666`, and `#F0A` becomes `#FF00AA`). This only works if
    each color channel uses a repeated character; a full hex code like
    `#2E8B57` cannot be shortened.
