---
title: Fonts and Alignment Filter Demonstration
author: Nandakumar Chandrasekhar
date: 2026-05-22
papersize: A4
geometry:
  - margin=25mm
linestretch: 1.25
header-includes:
  - |
    ```{=latex}
    \usepackage{fvextra}
    \fvset{breaklines=true,breakanywhere=true}
    ```
---

This document demonstrates every feature provided by the `fonts-and-alignment` Lua filter. The syntax shown in the code blocks directly produces the output below them, and the same Markdown source produces faithful output in both LaTeX/PDF and HTML.

## 1. Font Sizing Scale (Inline)

Nine sizing hooks scale relative to the document's base font size.

| Size         |   Syntax                       |   Output                     |
| :----------- | :----------------------------- | :----------- |
| tiny         |   `[Sample]{.pfa-text-3xs}`    |   [Sample]{.pfa-text-3xs}    |
| scriptsize   |   `[Sample]{.pfa-text-2xs}`    |   [Sample]{.pfa-text-2xs}    |
| footnotesize |   `[Sample]{.pfa-text-xs}`     |   [Sample]{.pfa-text-xs}     |
| small        |   `[Sample]{.pfa-text-sm}`     |   [Sample]{.pfa-text-sm}     |
| normal       |   `[Sample]{.pfa-text-normal}` |   [Sample]{.pfa-text-normal} |
| large        |   `[Sample]{.pfa-text-lg}`     |   [Sample]{.pfa-text-lg}     |
| Large        |   `[Sample]{.pfa-text-xl}`     |   [Sample]{.pfa-text-xl}     |
| LARGE        |   `[Sample]{.pfa-text-2xl}`    |   [Sample]{.pfa-text-2xl}    |
| huge         |   `[Sample]{.pfa-text-3xl}`    |   [Sample]{.pfa-text-3xl}    |

## 2. Font Sizing Scale (Block)

The same sizing classes apply to fenced div blocks. This is useful for sidebars, captions, or callouts.

```markdown
::: pfa-text-sm
This entire paragraph renders at the `small` size. Block-level sizing ensures the content consistently shrinks or grows as a unified component.
:::
```

::: pfa-text-sm
This entire paragraph renders at the `small` size. Block-level sizing ensures the content consistently shrinks or grows as a unified component.
:::

```markdown
::: pfa-text-lg
This entire paragraph renders at the `large` size — well suited for pull quotes or emphasized opening text.
:::
```

::: pfa-text-lg
This entire paragraph renders at the `large` size — well suited for pull quotes or emphasized opening text.
:::

## 3. Font Weights, Shapes, and Families (Inline)

Every supported typographic style is available as an inline span constraint.

| Style        |   Syntax                          |   Output                        |
| :----------- | :-------------------------------- | :----------- |
| Bold         |   `[Sample]{.pfa-font-bold}`      |   [Sample]{.pfa-font-bold}      |
| Medium       |   `[Sample]{.pfa-font-medium}`    |   [Sample]{.pfa-font-medium}    |
| Italic       |   `[Sample]{.pfa-font-italic}`    |   [Sample]{.pfa-font-italic}    |
| Slanted      |   `[Sample]{.pfa-font-slanted}`   |   [Sample]{.pfa-font-slanted}   |
| Upright      |   `[Sample]{.pfa-font-upright}`   |   [Sample]{.pfa-font-upright}   |
| Emphasis     |   `[Sample]{.pfa-font-emphasis}`  |   [Sample]{.pfa-font-emphasis}  |
| Serif        |   `[Sample]{.pfa-font-serif}`     |   [Sample]{.pfa-font-serif}     |
| Sans-Serif   |   `[Sample]{.pfa-font-sans}`      |   [Sample]{.pfa-font-sans}      |
| Monospace    |   `[Sample]{.pfa-font-mono}`      |   [Sample]{.pfa-font-mono}      |
| Small Caps   |   `[Sample]{.pfa-font-smallcaps}` |   [Sample]{.pfa-font-smallcaps} |
| Normal Reset |   `[Sample]{.pfa-font-normal}`    |   [Sample]{.pfa-font-normal}    |

## 4. Font Weights, Shapes, and Families (Block)

The same classes work at the block level, applying the typographic voice across all internal sentences without requiring inline markers.

```markdown
::: pfa-font-sans
This paragraph is rendered using the document's sans-serif family. Block-scoped family switches are convenient for code blocks or structural sections.
:::


::: pfa-font-sans
This paragraph is rendered using the document's sans-serif family. Block-scoped family switches are convenient for code blocks or structural sections.
:::

```markdown
::: pfa-font-smallcaps
Section headings or short callouts can be rendered entirely in small caps using the block form.
:::
```

::: pfa-font-smallcaps
Section headings or short callouts can be rendered entirely in small caps using the block form.
:::

## 5. Text Casing Transformations

Casing classes rewrite the underlying Abstract Syntax Tree (AST) text nodes rather than applying CSS formatting, meaning the transformation survives raw copy-paste operations.

### Inline Casing

| Casing    |   Syntax                      |   Output                    |
| :-------- | :---------------------------- | :----------- |
| Uppercase |   `[coerced]{.pfa-uppercase}` |   [coerced]{.pfa-uppercase} |
| Lowercase |   `[COERCED]{.pfa-lowercase}` |   [COERCED]{.pfa-lowercase} |

### Block Casing

```markdown
::: pfa-uppercase
this block is uniformly uppercased, even across paragraph boundaries.
:::
```

::: pfa-uppercase
this block is uniformly uppercased, even across paragraph boundaries.
:::

## 6. Inline Text Decorations

Underline and strikeout variants are routed through the `ulem` LaTeX package and mapped to matching standard CSS.

| Decoration       |   Syntax                             |   Output                           |
| :--------------- | :----------------------------------- | :----------- |
| Single Underline |   `[Sample]{.pfa-text-uline}`        |   [Sample]{.pfa-text-uline}        |
| Double Underline |   `[Sample]{.pfa-text-uline-double}` |   [Sample]{.pfa-text-uline-double} |
| Dashed Underline |   `[Sample]{.pfa-text-uline-dashed}` |   [Sample]{.pfa-text-uline-dashed} |
| Dotted Underline |   `[Sample]{.pfa-text-uline-dotted}` |   [Sample]{.pfa-text-uline-dotted} |
| Wavy Underline   |   `[Sample]{.pfa-text-uline-wave}`   |   [Sample]{.pfa-text-uline-wave}   |
| Strikeout        |   `[Sample]{.pfa-text-strikeout}`    |   [Sample]{.pfa-text-strikeout}    |
| Marked Out       |   `[Sample]{.pfa-text-markout}`      |   [Sample]{.pfa-text-markout}      |

## 7. Color Resolution

The `pfa-color` attribute natively parses standard CSS3 named colors, six-digit hex codes, and three-digit hex shorthands.

| Input Type    |   Syntax                          |   Output                        |
| :------------ | :-------------------------------- | :----------- |
| CSS Named     |   `[Sample]{pfa-color="crimson"}` |   [Sample]{pfa-color="crimson"} |
| Hex Shorthand |   `[Sample]{pfa-color="#333"}`    |   [Sample]{pfa-color="#333"}    |
| Hex Full      |   `[Sample]{pfa-color="#2E8B57"}` |   [Sample]{pfa-color="#2E8B57"} |

### Flexible Spelling of Named Colors

The engine sanitizes inputs automatically. It is case-insensitive and ignores spaces, hyphens, and underscores. All syntaxes below successfully map to the standard `mediumvioletred`.

| Variant    |   Syntax                                   |   Output                                 |
| :--------- | :----------------------------------------- | :----------- |
| Lowercase  |   `[Color]{pfa-color="mediumvioletred"}`   |   [Color]{pfa-color="mediumvioletred"}   |
| Title Case |   `[Color]{pfa-color="MediumVioletRed"}`   |   [Color]{pfa-color="MediumVioletRed"}   |
| Spaces     |   `[Color]{pfa-color="Medium Violet Red"}` |   [Color]{pfa-color="Medium Violet Red"} |
| Hyphens    |   `[Color]{pfa-color="medium-violet-red"}` |   [Color]{pfa-color="medium-violet-red"} |

### Block-Level Color Constraints with Inline Overrides

Colors applied to a block automatically inherit downward, but nested spans can explicitly override the parent value.

```markdown
::: {pfa-color="darkslategray"}
The parent block carries a default color of dark slate gray. [This inline span overrides the color to tomato red.]{pfa-color="tomato"} The surrounding text continues in the parent color until the block closes.
:::
```

::: {pfa-color="darkslategray"}
The parent block carries a default color of dark slate gray. [This inline span overrides the color to tomato red.]{pfa-color="tomato"} The surrounding text continues in the parent color until the block closes.
:::

## 8. Text Alignment within Blocks

The `.pfa-text-*` utility wraps blocks in standard directional text environments.

```markdown
::: pfa-text-left
This block is left-aligned. The remaining width on the right is left ragged.
:::
```

::: pfa-text-left
This block is left-aligned. The remaining width on the right is left ragged.
:::

```markdown
::: pfa-text-center
This block is centered horizontally within the text column.
:::
```

::: pfa-text-center
This block is centered horizontally within the text column.
:::

```markdown
::: pfa-text-right
This block is right-aligned, flush against the right margin.
:::
```

::: pfa-text-right
This block is right-aligned, flush against the right margin.
:::

## 9. Ragged Alignment (Line-Break Honoring)

The `.pfa-align-*` utility preserves and honors explicit line breaks (via backslash escapes), making it ideal for poetry, formal addresses, and titles.

```markdown
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

## 10. Shrink-to-Fit Block Alignment

The `.pfa-block-*` utility creates an isolated bounding box that shrinks dynamically to match its internal content before positioning itself in the document flow.

```markdown
::: {.pfa-block-left}
**Left-Aligned Shrink Block**
Wraps tightly around its content.
:::
```

::: {.pfa-block-left}
**Left-Aligned Shrink Block**
Wraps tightly around its content.
:::

```markdown
::: {.pfa-block-center}
**Centered Shrink Block**
Wraps tightly around its content.
:::
```

::: {.pfa-block-center}
**Centered Shrink Block**
Wraps tightly around its content.
:::

```markdown
::: {.pfa-block-right}
**Right-Aligned Shrink Block**
Wraps tightly around its content.
:::
```

::: {.pfa-block-right}
**Right-Aligned Shrink Block**
Wraps tightly around its content.
:::

## 11. Combining Multiple Classes

Classes compose seamlessly. Sizing, family, weight, color, and decoration definitions can stack safely on any single element.

### Inline Composition

| Style                |   Syntax                                                                  |   Output                                                                |
| :--------------------------- | :------------------------------------------------------------ | :----------- |
| Bold Sans Display    |   `[Sample]{.pfa-font-bold .pfa-font-sans .pfa-text-lg pfa-color="red"}`  |   [Sample]{.pfa-font-bold .pfa-font-sans .pfa-text-lg pfa-color="red"}  |
| Italic Mono Caption  |   `[Sample]{.pfa-font-italic .pfa-font-mono .pfa-text-sm}`                |   [Sample]{.pfa-font-italic .pfa-font-mono .pfa-text-sm}                |
| Smallcaps Underline  |   `[Sample]{.pfa-text-uline .pfa-font-smallcaps pfa-color="forestgreen"}` |   [Sample]{.pfa-text-uline .pfa-font-smallcaps pfa-color="forestgreen"} |

### Block Composition

```markdown
::: {.pfa-text-center .pfa-font-sans .pfa-font-bold .pfa-text-lg pfa-color="midnightblue"}
A centered, bold, sans-serif, large, midnight-blue block — assembled from five utilities.
:::
```

::: {.pfa-text-center .pfa-font-sans .pfa-font-bold .pfa-text-lg pfa-color="midnightblue"}
A centered, bold, sans-serif, large, midnight-blue block — assembled from five utilities.
:::

## 12. Legacy Short-Hand Aliases (Deprecated)

**Deprecated — retained strictly for backward compatibility.** New documents should use the explicit `pfa-*` namespaces above to prevent global framework collisions.

### 12.1 Font Weight, Shape, and Family Aliases

| Legacy Alias |   Short |   Modern Class         |
| :----------- | :------ | :--------------------- |
| `bold`       |   `bf`  |   `pfa-font-bold`      |
| `emphasis`   |   `em`  |   `pfa-font-emphasis`  |
| `italic`     |   `it`  |   `pfa-font-italic`    |
| `medium`     |   `md`  |   `pfa-font-medium`    |
| `monospace`  |   `tt`  |   `pfa-font-mono`      |
| `normalfont` |   `nf`  |   `pfa-font-normal`    |
| `sans`       |   `sf`  |   `pfa-font-sans`      |
| `serif`      |   `rm`  |   `pfa-font-serif`     |
| `slanted`    |   `sl`  |   `pfa-font-slanted`   |
| `smallcaps`  |   `sc`  |   `pfa-font-smallcaps` |
| `upright`    |   `up`  |   `pfa-font-upright`   |

### 12.2 Font Size Aliases

| Legacy Alias |   Modern Class      |
| :----------- | :------------------ |
| `xsmall`     |   `pfa-text-xs`     |
| `small`      |   `pfa-text-sm`     |
| `normal`     |   `pfa-text-normal` |
| `large`      |   `pfa-text-lg`     |
| `xlarge`     |   `pfa-text-xl`     |
| `xxlarge`    |   `pfa-text-2xl`    |
| `huge`       |   `pfa-text-3xl`    |

### 12.3 Alignment Aliases

| Legacy Alias  |   Modern Class       |
| :------------ | :------------------- |
| `center`      |   `pfa-text-center`  |
| `flushleft`   |   `pfa-text-left`    |
| `flushright`  |   `pfa-text-right`   |
| `centering`   |   `pfa-align-center` |
| `raggedleft`  |   `pfa-align-right`  |
| `raggedright` |   `pfa-align-left`   |

### 12.4 Underline and Strikeout Aliases

| Legacy Alias |   Short |   Modern Class            |
| :----------- | :------ | :------------------------ |
| `uline`      |   `u`   |   `pfa-text-uline`        |
| `uuline`     |   `uu`  |   `pfa-text-uline-double` |
| `dashuline`  |   `dau` |   `pfa-text-uline-dashed` |
| `dotuline`   |   `dou` |   `pfa-text-uline-dotted` |
| `uwave`      |   `uw`  |   `pfa-text-uline-wave`   |
| `sout`       |   `so`  |   `pfa-text-strikeout`    |
| `xout`       |   `xo`  |   `pfa-text-markout`      |
