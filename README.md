# Fonts and Alignment Filter

_Fonts and Alignment_ is a Pandoc Lua filter that brings rich typographic
control to Markdown source — font sizing, weights, shapes, families, text decorations,
colors, casings, and alignment — using a single namespaced class system
(`pfa-*`) that produces consistent outputs in **both LaTeX/PDF and HTML/CSS**.

Write once in Markdown and let the filter inject the correct LaTeX commands
for PDF output while emitting plain Pandoc Spans and Divs for HTML, which a
companion CSS stylesheet styles with the same class names.

For full visual specimens view the [PDF](docs/input.pdf) and [HTML](docs/input.html) both of which demonstrate all the features of the filter.

## Feature Highlights

- **Nine-step font sizing scale** — `pfa-text-3xs` through `pfa-text-3xl`.
- **Full typographic palette** — weights (`bold`, `medium`), shapes (`italic`,
  `slanted`, `upright`), families (`serif`, `sans`, `mono`, `smallcaps`),
  and `emphasis`.
- **Text decorations** — single, double, dashed, dotted, wavy underlines and strikeout.
- **Color resolution** — `pfa-font-color` attribute accepts CSS3 named colors
  and 3- or 6-digit hex codes; color names are parsed permissively across all
  common naming conventions — `"Medium Violet Red"`, `medium-violet-red`,
  `medium_violet_red`, `mediumVioletRed`, `MediumVioletRed`,
  `MEDIUM_VIOLET_RED`, and `MEDIUMVIOLETRED` all resolve identically.
- **Text casing** — `pfa-uppercase` and `pfa-lowercase` rewrite the underlying
  AST text nodes so the transformation survives copy-paste.
- **Block alignment** — `pfa-align-*` for text alignment within a block
  (preserving explicit line breaks — ideal for poetry, addresses, and titles),
  and `pfa-block-*` for controlling the horizontal positioning of a block as a
  whole without affecting its internal text alignment.
- **Inline overrides inside colored blocks** — block-level colors inherit
  downward; nested spans may override.

## Installation

### As a Quarto / Pandoc Extension

The filter ships ready-to-use under
[`_extensions/fonts-and-alignment/`](_extensions/fonts-and-alignment/),
along with two pre-compiled CSS files for HTML output:

- `fonts-and-alignment-rem.css` — sizes scale relative to the document root
- `fonts-and-alignment-em.css`  — sizes scale relative to the parent element

Drop the extension into your project's `_extensions/` directory (Quarto
users), or copy the `.lua` and one `.css` file into your project tree.

### Standalone

Download the filter and CSS directly:

```bash
curl -O https://raw.githubusercontent.com/pandoc-ext/fonts-and-alignment/main/fonts-and-alignment.lua
curl -O https://raw.githubusercontent.com/pandoc-ext/fonts-and-alignment/main/_extensions/fonts-and-alignment/fonts-and-alignment-rem.css
```

## Prerequisites

Configure the fonts used by the filter — either via a Pandoc defaults file:

```yaml
variables:
  fontsize: 12pt
  mainfont: Noto Serif
  sansfont: Noto Sans
  monofont: Fira Mono
```

or in the YAML frontmatter of your source document:

```yaml
---
fontsize: 12pt
mainfont: Noto Serif
sansfont: Noto Sans
monofont: Fira Mono
---
```

For HTML output use the `fonts-and-alignment.css` CSS file to get access to the styles defined by this filter

```css
:root {
  --pfa-mainfont: 'Noto Serif', serif;
  --pfa-sansfont: 'Noto Sans', sans-serif;
  --pfa-monofont: 'Fira Mono', monospace;
}
```

## Quick Start

### Inline elements (Bracketed Spans)

Wrap the text in square brackets and attach the class(es) in braces:

```markdown
[some text]{.pfa-font-bold}
[some text]{.pfa-font-italic .pfa-text-l}
[some text]{.pfa-text-uline pfa-font-color="forestgreen"}
```

### Block elements (Fenced Divs)

Open the block with `:::` plus a class (curly braces only required when
combining more than one class or adding attributes):

```markdown
::: pfa-align-center
A single centered paragraph.
:::

::: {.pfa-font-sans .pfa-font-bold pfa-font-color="midnightblue"}
A bold sans-serif paragraph in midnight blue.
:::
```

## Class Reference

### Font Sizing

Nine sizing hooks, applicable as both inline spans and block-level Divs.

| Class             | LaTeX Equivalent    | Description                         |
|-------------------|---------------------|-------------------------------------|
| `pfa-text-3xs`    | `\tiny`             | Tiny                                |
| `pfa-text-2xs`    | `\scriptsize`       | Script size                         |
| `pfa-text-xs`     | `\footnotesize`     | Footnote size                       |
| `pfa-text-s`     | `\small`            | Small                               |
| `pfa-text-normal` | `\normalsize`       | Document body size (explicit reset) |
| `pfa-text-l`     | `\large`            | Large                               |
| `pfa-text-xl`     | `\Large`            | Extra large                         |
| `pfa-text-2xl`    | `\LARGE`            | Extra-extra large                   |
| `pfa-text-3xl`    | `\huge`             | Huge                                |

### Font Weight, Shape, and Family

| Class                | LaTeX (inline / block)               | Description               |
|----------------------|--------------------------------------|---------------------------|
| `pfa-font-bold`      | `\textbf{…}` / `{\bfseries …}`       | Bold weight               |
| `pfa-font-medium`    | `\textmd{…}` / `{\mdseries …}`       | Medium weight             |
| `pfa-font-italic`    | `\textit{…}` / `{\itshape …}`        | Italic shape              |
| `pfa-font-slanted`   | `\textsl{…}` / `{\slshape …}`        | Slanted shape             |
| `pfa-font-upright`   | `\textup{…}` / `{\upshape …}`        | Upright shape             |
| `pfa-font-emphasis`  | `\emph{…}` / `{\em …}`               | Emphasis (toggles italic) |
| `pfa-font-serif`     | `\textrm{…}` / `{\rmfamily …}`       | Serif family              |
| `pfa-font-sans`      | `\textsf{…}` / `{\sffamily …}`       | Sans family               |
| `pfa-font-mono`      | `\texttt{…}` / `{\ttfamily …}`       | Mono family               |
| `pfa-font-smallcaps` | `\textsc{…}` / `{\scshape …}`        | Small caps                |
| `pfa-font-normal`    | `\textnormal{…}` / `{\normalfont …}` | Normal reset              |

> Make sure your selected fonts actually carry the requested shapes/weights.
> LaTeX will silently substitute a default if they are missing.

### Text Decorations (Bracketed Spans only)

Routed through the `ulem` LaTeX package — auto-loaded by the filter only when
one of these classes is detected in the document. These styles are also mapped
to equivalent CSS properties for consistent rendering in HTML output.

| Class                    | LaTeX           | Description             |
|--------------------------|-----------------|-------------------------|
| `pfa-text-uline`         | `\uline{…}`     | Underline               |
| `pfa-text-uline-double`  | `\uuline{…}`    | Double underline        |
| `pfa-text-uline-dashed`  | `\dashuline{…}` | Dashed underline        |
| `pfa-text-uline-dotted`  | `\dotuline{…}`  | Dotted underline        |
| `pfa-text-uline-wave`    | `\uwave{…}`     | Wavy underline          |
| `pfa-text-strikeout`     | `\sout{…}`      | Strikeout               |

### Text Casing

Both work for inline spans and Div blocks. The transformation operates on
the AST text node, so the resulting case survives copy-paste from the
rendered document.

| Class           | Description            |
|-----------------|------------------------|
| `pfa-uppercase` | Uppercase every letter |
| `pfa-lowercase` | Lowercase every letter |

### Color

A single attribute, `pfa-font-color`, accepts:

- Any of the 147 CSS3 named colors — the name is parsed permissively; all of
  the following resolve identically to `mediumvioletred`:
  `mediumvioletred`, `Medium Violet Red`, `medium-violet-red`,
  `medium_violet_red`, `mediumVioletRed`, `MediumVioletRed`,
  `MEDIUM_VIOLET_RED`, `MEDIUMVIOLETRED`
- Three-digit hex shorthand (`#333`)
- Six-digit full hex (`#2E8B57`)

```markdown
[crimson sample]{pfa-font-color="crimson"}
[hex sample]{pfa-font-color="#2E8B57"}

::: {pfa-font-color="darkslategray"}
The whole paragraph inherits dark slate gray.
[This span overrides to tomato.]{pfa-font-color="tomato"}
The remainder reverts to the parent color.
:::
```

### Block Alignment

Two flavors, each targeting a different use case:

| Class              | Behavior                                          |
|--------------------|---------------------------------------------------|
| `pfa-align-left`   | Left-aligned, honoring explicit line breaks (`\`) |
| `pfa-align-center` | Centered, honoring explicit line breaks           |
| `pfa-align-right`  | Right-aligned, honoring explicit line breaks      |
| `pfa-block-left`   | Shrink-to-fit box, left-anchored to the margin    |
| `pfa-block-center` | Shrink-to-fit box, centered in the text column    |
| `pfa-block-right`  | Shrink-to-fit box, right-anchored to the margin   |

The `pfa-align-*` family sets the text alignment within a block and preserves
explicit `\` line breaks — ideal for poetry, formal addresses, and titles.
The `pfa-block-*` family controls the horizontal positioning of a block as a
whole without affecting its internal text alignment; each variant wraps the
content in an isolated bounding box (LaTeX `varwidth`) that shrinks to its
content before being positioned in the document flow.

```markdown
::: pfa-align-center
First centered line\
Second centered line\
Third centered line
:::

::: {.pfa-block-right}
**Right-Anchored Shrink Block**
Wraps tightly around its content.
:::
```

## Combining Classes

Classes compose freely. Stack any combination of sizing, family, weight,
decoration, color, and alignment on a single element:

```markdown
[Sample]{.pfa-font-bold .pfa-font-sans .pfa-text-l pfa-font-color="red"}

[Sample]{.pfa-text-uline .pfa-font-smallcaps pfa-font-color="forestgreen"}

::: {.pfa-align-center .pfa-font-sans .pfa-font-bold .pfa-text-l pfa-font-color="midnightblue"}
A centered, bold, sans-serif, large, midnight-blue block.
:::
```

When `pfa-font-color` is combined with `pfa-text-uline` (or its dashed,
dotted, wavy, double, and strikeout siblings), the decoration line
inherits the requested color — `\textcolor{…}{\uline{…}}` in LaTeX, and the
default `text-decoration-color: currentColor` in CSS.

## Usage

### PDF (LaTeX)

```bash
pandoc \
  --lua-filter=fonts-and-alignment.lua \
  --pdf-engine=lualatex \
  --output=document.pdf \
  document.md
```

Or via a defaults file:

```yaml
filters:
  - fonts-and-alignment.lua

pdf-engine: lualatex
```

### HTML

```bash
pandoc \
  --lua-filter=fonts-and-alignment.lua \
  --css=fonts-and-alignment-rem.css \
  --standalone \
  --output=document.html \
  document.md
```

## Legacy Aliases

**Deprecated — retained strictly for backward compatibility and will be removed in the next major release.** New documents should use the explicit `pfa-*` namespace to prevent collisions with global CSS frameworks.

### Font Weight, Shape, and Family Aliases

| Legacy Alias | Short | Modern Class           |
|--------------|-------|------------------------|
| `bold`       | `bf`  | `pfa-font-bold`        |
| `emphasis`   | `em`  | `pfa-font-emphasis`    |
| `italic`     | `it`  | `pfa-font-italic`      |
| `medium`     | `md`  | `pfa-font-medium`      |
| `monospace`  | `tt`  | `pfa-font-mono`        |
| `normalfont` | `nf`  | `pfa-font-normal`      |
| `sans`       | `sf`  | `pfa-font-sans`        |
| `serif`      | `rm`  | `pfa-font-serif`       |
| `slanted`    | `sl`  | `pfa-font-slanted`     |
| `smallcaps`  | `sc`  | `pfa-font-smallcaps`   |
| `upright`    | `up`  | `pfa-font-upright`     |

### Font Size Aliases

| Legacy Alias | Modern Class       |
|--------------|--------------------|
| `xsmall`     | `pfa-text-xs`      |
| `small`      | `pfa-text-s`      |
| `normal`     | `pfa-text-normal`  |
| `large`      | `pfa-text-l`      |
| `xlarge`     | `pfa-text-xl`      |
| `xxlarge`    | `pfa-text-2xl`     |
| `huge`       | `pfa-text-3xl`     |

### Alignment Aliases

| Legacy Alias  | Modern Class       |
|---------------|--------------------|
| `centering`   | `pfa-align-center` |
| `raggedleft`  | `pfa-align-right`  |
| `raggedright` | `pfa-align-left`   |

### Underline and Strikeout Aliases

| Legacy Alias | Short | Modern Class            |
|--------------|-------|-------------------------|
| `uline`      | `u`   | `pfa-text-uline`        |
| `uuline`     | `uu`  | `pfa-text-uline-double` |
| `dashuline`  | `dau` | `pfa-text-uline-dashed` |
| `dotuline`   | `dou` | `pfa-text-uline-dotted` |
| `uwave`      | `uw`  | `pfa-text-uline-wave`   |
| `sout`       | `so`  | `pfa-text-strikeout`    |

## Removed Classes

The following classes were removed in version 1.0.3 and are no longer recognized by the filter.

| Removed Class | Short | Removed In |
|---------------|-------|------------|
| `center`      | —     | 1.0.3      |
| `flushleft`   | —     | 1.0.3      |
| `flushright`  | —     | 1.0.3      |
| `xout`        | `xo`  | 1.0.3      |

## Troubleshooting

### Colors don't appear in PDF output

The filter emits `\textcolor{…}{…}` and `\color{…}` commands, which
require the `xcolor` package. Most modern Pandoc templates load it
automatically, but if your template doesn't, add it to your YAML:

```yaml
header-includes:
  - \usepackage[dvipsnames,svgnames]{xcolor}
```

### `pfa-block-*` alignment breaks the PDF build

Block alignment relies on the `varwidth` LaTeX package, which the filter
auto-injects only when a `pfa-block-*` class is detected. If your TeX
distribution is minimal, install it explicitly — on TeX Live this is
`tlmgr install varwidth`.

### Colored underlines render in black in PDF

If `pfa-text-uline` (or any of its decorated variants) is combined with
`pfa-font-color` and the line still renders in black despite the text
being colored, you're on a pre-fix revision of the filter. Pull the
current version — color application now wraps the ulem decoration
(`\textcolor{…}{\uline{…}}`) so the decoration falls inside the color
scope. HTML already inherits correctly via the CSS default
`text-decoration-color: currentColor`.

### Underline variants (wavy / dashed / dotted) don't render in HTML

Plain `pfa-text-uline` and `pfa-text-strikeout` produce native Pandoc
AST nodes and work in every output format. The decorated variants
(`pfa-text-uline-wave`, `-dashed`, `-dotted`, `-double`) are routed
through the `ulem` LaTeX package and only render in LaTeX/PDF output.
In HTML, equivalent styles are applied via the bundled CSS — make sure
`fonts-and-alignment-rem.css` (or `-em.css`) is linked.

### Font sizes don't scale as expected

Pick the right CSS variant for your context:

- **`fonts-and-alignment-rem.css`** — sizes scale relative to the root
  `<html>` font size. Use when you want a single, document-wide scale.
- **`fonts-and-alignment-em.css`** — sizes scale relative to the
  parent element. Use when you want nested elements to compound (a
  small inside a small renders smaller still).

## Acknowledgements

Special thanks to [Albert Krewinkel](https://github.com/tarleb) and
[Benct Philip Jonsson](https://github.com/bpj) for their valuable feedback
and suggestions during the development of this filter.

## License

MIT — see [`LICENSE`](LICENSE) for the full text.
