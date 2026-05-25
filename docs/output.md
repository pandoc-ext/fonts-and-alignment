---
title: Fonts and Alignment Filter Demonstration
---

This document demonstrates every feature provided by the
`fonts-and-alignment` Lua filter. The syntax shown in the code blocks
directly produces the output below them, and the same Markdown source
produces faithful output in both LaTeX/PDF and HTML.

## Font Sizing Scale (Inline)

Nine sizing hooks scale relative to the document's base font size.

  ------------------------------------------------------------------------------------
  Size            Syntax                                  Output
  --------------- --------------------------------------- ----------------------------
  tiny            `[Sample]{.pfa-text-3xs}`               [Sample]{.pfa-text-3xs}

  scriptsize      `[Sample]{.pfa-text-2xs}`               [Sample]{.pfa-text-2xs}

  footnotesize    `[Sample]{.pfa-text-xs}`                [Sample]{.pfa-text-xs}

  small           `[Sample]{.pfa-text-s}`                 [Sample]{.pfa-text-s}

  normal          `[Sample]{.pfa-text-normal}`            [Sample]{.pfa-text-normal}

  large           `[Sample]{.pfa-text-l}`                 [Sample]{.pfa-text-l}

  Large           `[Sample]{.pfa-text-xl}`                [Sample]{.pfa-text-xl}

  LARGE           `[Sample]{.pfa-text-2xl}`               [Sample]{.pfa-text-2xl}

  huge            `[Sample]{.pfa-text-3xl}`               [Sample]{.pfa-text-3xl}
  ------------------------------------------------------------------------------------

## Font Sizing Scale (Block)

The same sizing classes apply to fenced div blocks. This is useful for
sidebars, captions, or callouts.

``` markdown
::: pfa-text-s
This entire paragraph renders at the `small` size. Block-level sizing ensures the content consistently shrinks or grows as a unified component.
:::
```

::: pfa-text-s
This entire paragraph renders at the `small` size. Block-level sizing
ensures the content consistently shrinks or grows as a unified
component.
:::

``` markdown
::: pfa-text-l
This entire paragraph renders at the `large` size — well suited for pull quotes or emphasized opening text.
:::
```

::: pfa-text-l
This entire paragraph renders at the `large` size --- well suited for
pull quotes or emphasized opening text.
:::

## Font Weights, Shapes, and Families (Inline)

Every supported typographic style is available as an inline span
constraint.

  ----------------------------------------------------------------------------------------
  Style          Syntax                                    Output
  -------------- ----------------------------------------- -------------------------------
  Bold           `[Sample]{.pfa-font-bold}`                [Sample]{.pfa-font-bold}

  Medium         `[Sample]{.pfa-font-medium}`              [Sample]{.pfa-font-medium}

  Italic         `[Sample]{.pfa-font-italic}`              [Sample]{.pfa-font-italic}

  Slanted        `[Sample]{.pfa-font-slanted}`             [Sample]{.pfa-font-slanted}

  Upright        `[Sample]{.pfa-font-upright}`             [Sample]{.pfa-font-upright}

  Emphasis       `[Sample]{.pfa-font-emphasis}`            [Sample]{.pfa-font-emphasis}

  Serif          `[Sample]{.pfa-font-serif}`               [Sample]{.pfa-font-serif}

  Sans-Serif     `[Sample]{.pfa-font-sans}`                [Sample]{.pfa-font-sans}

  Monospace      `[Sample]{.pfa-font-mono}`                [Sample]{.pfa-font-mono}

  Small Caps     `[Sample]{.pfa-font-smallcaps}`           [Sample]{.pfa-font-smallcaps}

  Normal Reset   `[Sample]{.pfa-font-normal}`              [Sample]{.pfa-font-normal}
  ----------------------------------------------------------------------------------------

## Font Weights, Shapes, and Families (Block)

The same classes work at the block level, applying the typographic voice
across all internal sentences without requiring inline markers.

``` markdown
::: pfa-font-sans
This paragraph is rendered using the document's sans-serif family. Block-scoped family switches are convenient for code blocks or structural sections.
:::
```

::: pfa-font-sans
This paragraph is rendered using the document's sans-serif family.
Block-scoped family switches are convenient for code blocks or
structural sections.
:::

``` markdown
::: pfa-font-smallcaps
Section headings or short callouts can be rendered entirely in small caps using the block form.
:::
```

::: pfa-font-smallcaps
Section headings or short callouts can be rendered entirely in small
caps using the block form.
:::

## Text Casing Transformations

Casing classes rewrite the underlying Abstract Syntax Tree (AST) text
nodes rather than applying CSS formatting, meaning the transformation
survives raw copy-paste operations.

### Inline Casing

  ----------------------------------------------------------------------------------
  Casing       Syntax                                    Output
  ------------ ----------------------------------------- ---------------------------
  Uppercase    `[coerced]{.pfa-uppercase}`               [COERCED]{.pfa-uppercase}

  Lowercase    `[COERCED]{.pfa-lowercase}`               [coerced]{.pfa-lowercase}
  ----------------------------------------------------------------------------------

### Block Casing

``` markdown
::: pfa-uppercase
this block is uniformly uppercased, even across paragraph boundaries.
:::
```

::: pfa-uppercase
THIS BLOCK IS UNIFORMLY UPPERCASED, EVEN ACROSS PARAGRAPH BOUNDARIES.
:::

## Inline Text Decorations

Underline and strikeout variants are routed through the `ulem` LaTeX
package and mapped to matching standard CSS.

  ---------------------------------------------------------------------------------------------------
  Decoration        Syntax                                  Output
  ----------------- --------------------------------------- -----------------------------------------
  Single Underline  `[Sample]{.pfa-text-uline}`             [[Sample]{.underline}]{.pfa-text-uline}

  Double Underline  `[Sample]{.pfa-text-uline-double}`      [Sample]{.pfa-text-uline-double}

  Dashed Underline  `[Sample]{.pfa-text-uline-dashed}`      [Sample]{.pfa-text-uline-dashed}

  Dotted Underline  `[Sample]{.pfa-text-uline-dotted}`      [Sample]{.pfa-text-uline-dotted}

  Wavy Underline    `[Sample]{.pfa-text-uline-wave}`        [Sample]{.pfa-text-uline-wave}

  Strikeout         `[Sample]{.pfa-text-strikeout}`         [~~Sample~~]{.pfa-text-strikeout}

  Marked Out        `[Sample]{.pfa-text-markout}`           [~~Sample~~]{.pfa-text-markout}
  ---------------------------------------------------------------------------------------------------

## Color Resolution

The `pfa-font-color` attribute natively parses standard CSS3 named
colors, six-digit hex codes, and three-digit hex shorthands.

  --------------------------------------------------------------------------------------------
  Input Type      Syntax                                   Output
  --------------- ---------------------------------------- -----------------------------------
  CSS Named       `[Sample]{pfa-font-color="crimson"}`     [Sample]{style="color: #DC143C;"}

  Hex Full        `[Sample]{pfa-font-color="#2E8B57"}`     [Sample]{style="color: #2E8B57;"}

  Hex Shorthand   `[Sample]{pfa-font-color="#666"}`        [Sample]{style="color: #666666;"}
  --------------------------------------------------------------------------------------------

### Flexible Spelling of Named Colors

The engine sanitizes inputs automatically. It is case-insensitive and
ignores spaces, hyphens, and underscores. All syntaxes below
successfully map to the standard `mediumvioletred`.

  ----------------------------------------------------------------------------------------------
  Variant     Syntax                                          Output
  ----------- ----------------------------------------------- ----------------------------------
  Lowercase   `[Color]{pfa-font-color="mediumvioletred"}`     [Color]{style="color: #C71585;"}

  Title Case  `[Color]{pfa-font-color="MediumVioletRed"}`     [Color]{style="color: #C71585;"}

  Spaces      `[Color]{pfa-font-color="Medium Violet Red"}`   [Color]{style="color: #C71585;"}

  Hyphens     `[Color]{pfa-font-color="medium-violet-red"}`   [Color]{style="color: #C71585;"}
  ----------------------------------------------------------------------------------------------

### Block-Level Color Constraints with Inline Overrides

Colors applied to a block automatically inherit downward, but nested
spans can explicitly override the parent value.

``` markdown
::: {pfa-font-color="#666"}
The parent block carries a default color of dark slate gray. [This inline span overrides the color to tomato red.]{pfa-font-color="tomato"} The surrounding text continues in the parent color until the block closes.
:::
```

::: {style="color: #666666;"}
The parent block carries a default color of dark slate gray. [This
inline span overrides the color to tomato red.]{style="color: #FF6347;"}
The surrounding text continues in the parent color until the block
closes.
:::

## Text Alignment within Blocks

The `.pfa-text-*` utility wraps blocks in standard directional text
environments. The blocks below are intentionally long so that the
wrapped lines reveal the edge behavior of each alignment.

``` markdown
::: pfa-text-left
This block is left-aligned. Words begin flush against the left margin and the right edge falls wherever the natural word boundaries land, producing the relaxed silhouette typically used for body prose in left-to-right scripts.
:::
```

::: pfa-text-left
This block is left-aligned. Words begin flush against the left margin
and the right edge falls wherever the natural word boundaries land,
producing the relaxed silhouette typically used for body prose in
left-to-right scripts.
:::

``` markdown
::: pfa-text-center
This block is centered horizontally within the text column. Centered prose is best reserved for short callouts, pull quotes, dedications, or titlecards — sustained reading at this alignment is difficult because the eye cannot anchor on a consistent margin.
:::
```

::: pfa-text-center
This block is centered horizontally within the text column. Centered
prose is best reserved for short callouts, pull quotes, dedications, or
titlecards --- sustained reading at this alignment is difficult because
the eye cannot anchor on a consistent margin.
:::

``` markdown
::: pfa-text-right
This block is right-aligned. The right edge stays flush against the column boundary while words spill back toward the left, an effect suited to sidenotes, attributions, and short captions placed against a column edge.
:::
```

::: pfa-text-right
This block is right-aligned. The right edge stays flush against the
column boundary while words spill back toward the left, an effect suited
to sidenotes, attributions, and short captions placed against a column
edge.
:::

## Ragged Alignment (Line-Break Honoring)

The `.pfa-align-*` utility preserves and honors explicit line breaks
(via backslash escapes), making it ideal for poetry, formal addresses,
and titles. In PDF, the two families also differ in vertical spacing:
`.pfa-text-*` mirrors LaTeX's `center`/`flushleft`/`flushright`
environments and introduces vertical separation around the block, while
`.pfa-align-*` mirrors the `\centering`/`\raggedright`/`\raggedleft`
declarations and flows inline with the surrounding content. HTML applies
only `text-align` to both families, so the vertical-spacing distinction
is PDF-only.

Choose `.pfa-text-*` when the aligned block is its own visual unit (a
callout, a centered pull quote, a standalone announcement) and
`.pfa-align-*` when the alignment is part of the surrounding paragraph
flow (a line-broken signature, a verse stanza, a captioned figure).

``` markdown
::: pfa-align-left
First left-aligned line\
Second left-aligned line\
Third left-aligned line
:::
```

::: pfa-align-left
First left-aligned line\
Second left-aligned line\
Third left-aligned line
:::

``` markdown
::: pfa-align-center
First centered line\
Second centered line\
Third centered line
:::
```

::: pfa-align-center
First centered line\
Second centered line\
Third centered line
:::

``` markdown
::: pfa-align-right
First right-aligned line\
Second right-aligned line\
Third right-aligned line
:::
```

::: pfa-align-right
First right-aligned line\
Second right-aligned line\
Third right-aligned line
:::

## Block-Level Alignment

The `.pfa-block-*` utility wraps content in an isolated bounding box and
anchors the box to the left margin, the center of the text column, or
the right margin. The box width is set by the widest single line inside
the block, so explicit line breaks (`\`) shape both the silhouette and
the horizontal footprint of the panel.

``` markdown
::: {.pfa-block-left}
A self-contained advisory hugging the left margin of the column.\
The bounding box is set by the widest line of internal content.\
Surrounding paragraphs continue without being pushed sideways.
:::
```

::: pfa-block-left
A self-contained advisory hugging the left margin of the column.\
The bounding box is set by the widest line of internal content.\
Surrounding paragraphs continue without being pushed sideways.
:::

``` markdown
::: {.pfa-block-center}
Useful for callouts, banners, or section dividers that should\
catch the reader's eye without committing to the full column.\
The panel centers itself relative to the surrounding text.
:::
```

::: pfa-block-center
Useful for callouts, banners, or section dividers that should\
catch the reader's eye without committing to the full column.\
The panel centers itself relative to the surrounding text.
:::

``` markdown
::: {.pfa-block-right}
Anchored against the right margin like a marginal sidenote.\
Ideal for attributions, version stamps, or supplementary notes\
that should sit beside the main text rather than within it.
:::
```

::: pfa-block-right
Anchored against the right margin like a marginal sidenote.\
Ideal for attributions, version stamps, or supplementary notes\
that should sit beside the main text rather than within it.
:::

## Combining Multiple Classes

Classes compose seamlessly. Sizing, family, weight, color, and
decoration definitions can stack safely on any single element.

### Inline Composition

  -------------------------------------------------------------------------------------------------------------------------------------------
  Style               Syntax                                                                         Output
  ------------------- ------------------------------------------------------------------------------ ----------------------------------------
  Bold Sans Display   `[Sample]{.pfa-font-bold .pfa-font-sans .pfa-text-l pfa-font-color="red"}`     [Sample]{.pfa-font-bold .pfa-font-sans
                                                                                                     .pfa-text-l style="color: #FF0000;"}

  Italic Mono Caption `[Sample]{.pfa-font-italic .pfa-font-mono .pfa-text-s}`                        [Sample]{.pfa-font-italic .pfa-font-mono
                                                                                                     .pfa-text-s}

  Smallcaps Underline `[Sample]{.pfa-text-uline .pfa-font-smallcaps pfa-font-color="forestgreen"}`   [[Sample]{.underline}]{.pfa-text-uline
                                                                                                     .pfa-font-smallcaps
                                                                                                     style="color: #228B22;"}
  -------------------------------------------------------------------------------------------------------------------------------------------

### Block Composition

``` markdown
::: {.pfa-text-center .pfa-font-sans .pfa-font-bold .pfa-text-l pfa-font-color="midnightblue"}
A centered, bold, sans-serif, large, midnight-blue block assembled from five utilities.
:::
```

::: {.pfa-text-center .pfa-font-sans .pfa-font-bold .pfa-text-l style="color: #191970;"}
A centered, bold, sans-serif, large, midnight-blue block assembled from
five utilities.
:::

## Legacy Short-Hand Aliases (Deprecated)

**Deprecated --- retained strictly for backward compatibility and will
be removed in the next major release.** New documents should use the
explicit `pfa-*` namespaces above to prevent global framework
collisions.

### Font Weight, Shape, and Family Aliases

  Legacy Alias   Short   Modern Class
  -------------- ------- ----------------------
  `bold`         `bf`    `pfa-font-bold`
  `emphasis`     `em`    `pfa-font-emphasis`
  `italic`       `it`    `pfa-font-italic`
  `medium`       `md`    `pfa-font-medium`
  `monospace`    `tt`    `pfa-font-mono`
  `normalfont`   `nf`    `pfa-font-normal`
  `sans`         `sf`    `pfa-font-sans`
  `serif`        `rm`    `pfa-font-serif`
  `slanted`      `sl`    `pfa-font-slanted`
  `smallcaps`    `sc`    `pfa-font-smallcaps`
  `upright`      `up`    `pfa-font-upright`

### Font Size Aliases

  Legacy Alias   Modern Class
  -------------- -------------------
  `xsmall`       `pfa-text-xs`
  `small`        `pfa-text-s`
  `normal`       `pfa-text-normal`
  `large`        `pfa-text-l`
  `xlarge`       `pfa-text-xl`
  `xxlarge`      `pfa-text-2xl`
  `huge`         `pfa-text-3xl`

### Alignment Aliases

  Legacy Alias    Modern Class
  --------------- --------------------
  `center`        `pfa-text-center`
  `flushleft`     `pfa-text-left`
  `flushright`    `pfa-text-right`
  `centering`     `pfa-align-center`
  `raggedleft`    `pfa-align-right`
  `raggedright`   `pfa-align-left`

### Underline and Strikeout Aliases

  Legacy Alias   Short   Modern Class
  -------------- ------- -------------------------
  `uline`        `u`     `pfa-text-uline`
  `uuline`       `uu`    `pfa-text-uline-double`
  `dashuline`    `dau`   `pfa-text-uline-dashed`
  `dotuline`     `dou`   `pfa-text-uline-dotted`
  `uwave`        `uw`    `pfa-text-uline-wave`
  `sout`         `so`    `pfa-text-strikeout`
  `xout`         `xo`    `pfa-text-markout`
