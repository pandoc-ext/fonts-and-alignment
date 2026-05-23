# Fonts and Alignment Filter

_Fonts and Alignment_ is a Pandoc Lua filter that brings rich typographic
control to Markdown source — font sizing, weight, shape, family, decoration,
color, casing, and block alignment — using a single namespaced class system
(`pfa-*`) that produces faithful output in **both LaTeX/PDF and HTML/CSS**.

Write once in Markdown and let the filter inject the correct LaTeX commands
for PDF output while emitting plain Pandoc Spans and Divs for HTML, which a
companion CSS stylesheet styles with the same class names.

A full visual specimen lives at [`test/input.md`](test/input.md), which the
build pipeline renders to both [HTML](artifacts/input.html) and [PDF](artifacts/input.pdf).

## Feature Highlights

- **Nine-step font sizing scale** — `pfa-text-3xs` through `pfa-text-3xl`,
  plus `pfa-text-normal` for explicit reset.
- **Full typographic palette** — weights (`bold`, `medium`), shapes (`italic`,
  `slanted`, `upright`), families (`serif`, `sans`, `mono`, `smallcaps`),
  and emphasis.
- **Text decorations** — single, double, dashed, dotted, and wavy underlines,
  plus strikeout and marked-out variants (auto-loads `ulem` only when used).
- **Color resolution** — `pfa-color` attribute accepts CSS3 named colors,
  3- or 6-digit hex codes, and is case- and whitespace-insensitive
  (`"Medium Violet Red"`, `medium-violet-red`, and `mediumvioletred`
  all resolve to the same color).
- **Text casing** — `pfa-uppercase` and `pfa-lowercase` rewrite the underlying
  AST text nodes so the transformation survives copy-paste.
- **Block alignment** — column-style `pfa-text-*` for paragraph alignment,
  line-break-honoring `pfa-align-*` for poetry and addresses, and
  shrink-to-fit `pfa-block-*` boxes that wrap tightly around their content.
- **Inline overrides inside colored blocks** — block-level colors inherit
  downward; nested spans may override.
- **Legacy aliases** — every short form from the original filter
  (`bold`, `bf`, `xxlarge`, `flushright`, `uwave`, …) still works so
  existing documents continue to compile unchanged, **but they are
  deprecated and will be removed in a future release**. Migrate new
  work to the `pfa-*` namespace.

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

For HTML output use one of the bundled CSS files and add the following three font variables in your own stylesheet:

```css
:root {
  --pfa-mainfont: 'Merriweather', serif;
  --pfa-sansfont: 'Open Sans',    sans-serif;
  --pfa-monofont: 'Fira Code',    monospace;
}
```

## Quick Start

### Inline elements (Spans)

Wrap the text in square brackets and attach the class(es) in braces:

```markdown
[some text]{.pfa-font-bold}
[some text]{.pfa-font-italic .pfa-text-lg}
[some text]{.pfa-text-uline pfa-color="forestgreen"}
```

### Block elements (fenced Divs)

Open the block with `:::` plus a class (curly braces only required when
combining more than one class or adding attributes):

```markdown
::: pfa-text-center
A single centered paragraph.
:::

::: {.pfa-font-sans .pfa-font-bold pfa-color="midnightblue"}
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
| `pfa-text-sm`     | `\small`            | Small                               |
| `pfa-text-normal` | `\normalsize`       | Document body size (explicit reset) |
| `pfa-text-lg`     | `\large`            | Large                               |
| `pfa-text-xl`     | `\Large`            | Extra large                         |
| `pfa-text-2xl`    | `\LARGE`            | Extra-extra large                   |
| `pfa-text-3xl`    | `\huge`             | Huge                                |

### Font Weight, Shape, and Family

| Class                | LaTeX (inline / block)                                   | Description               |
|----------------------|----------------------------------------------------------|---------------------------|
| `pfa-font-bold`      | `\textbf{…}` / `\begin{bfseries}…\end{bfseries}`         | Bold weight               |
| `pfa-font-medium`    | `\textmd{…}` / `\begin{mdseries}…\end{mdseries}`         | Medium weight             |
| `pfa-font-italic`    | `\textit{…}` / `\begin{itshape}…\end{itshape}`           | Italic shape              |
| `pfa-font-slanted`   | `\textsl{…}` / `\begin{slshape}…\end{slshape}`           | Slanted shape             |
| `pfa-font-upright`   | `\textup{…}` / `\begin{upshape}…\end{upshape}`           | Upright shape             |
| `pfa-font-emphasis`  | `\emph{…}` / `\begin{em}…\end{em}`                       | Emphasis (toggles italic) |
| `pfa-font-serif`     | `\textrm{…}` / `\begin{rmfamily}…\end{rmfamily}`         | Serif family              |
| `pfa-font-sans`      | `\textsf{…}` / `\begin{sffamily}…\end{sffamily}`         | Sans family               |
| `pfa-font-mono`      | `\texttt{…}` / `\begin{ttfamily}…\end{ttfamily}`         | Mono family               |
| `pfa-font-smallcaps` | `\textsc{…}` / `\begin{scshape}…\end{scshape}`           | Small caps                |
| `pfa-font-normal`    | `\textnormal{…}` / `\begin{normalfont}…\end{normalfont}` | Normal reset              |

> Make sure your selected fonts actually carry the requested shapes/weights.
> LaTeX will silently substitute a default if they are missing.

### Text Decorations (inline only)

Routed through the `ulem` LaTeX package — auto-loaded by the filter only when
one of these classes is detected in the document.

| Class                    | LaTeX           | Description             |
|--------------------------|-----------------|-------------------------|
| `pfa-text-uline`         | `\uline{…}`     | Underline               |
| `pfa-text-uline-double`  | `\uuline{…}`    | Double underline        |
| `pfa-text-uline-dashed`  | `\dashuline{…}` | Dashed underline        |
| `pfa-text-uline-dotted`  | `\dotuline{…}`  | Dotted underline        |
| `pfa-text-uline-wave`    | `\uwave{…}`     | Wavy underline          |
| `pfa-text-strikeout`     | `\sout{…}`      | Strikeout               |
| `pfa-text-markout`       | `\xout{…}`      | Marked out (LaTeX only) |

### Text Casing

Both work for inline spans and Div blocks. The transformation operates on
the AST text node, so the resulting case survives copy-paste from the
rendered document.

| Class           | Description            |
|-----------------|------------------------|
| `pfa-uppercase` | Uppercase every letter |
| `pfa-lowercase` | Lowercase every letter |

### Color

A single attribute, `pfa-color`, accepts:

- Any of the 147 CSS3 named colors (case- and whitespace-insensitive —
  `"Medium Violet Red"`, `medium-violet-red`, and `MEDIUMVIOLETRED`
  all resolve identically)
- Three-digit hex shorthand (`#333`)
- Six-digit full hex (`#2E8B57`)

```markdown
[crimson sample]{pfa-color="crimson"}
[hex sample]{pfa-color="#2E8B57"}

::: {pfa-color="darkslategray"}
The whole paragraph inherits dark slate gray.
[This span overrides to tomato.]{pfa-color="tomato"}
The remainder reverts to the parent color.
:::
```

### Block Alignment

Three flavors, each targeting a different use case:

| Class              | Behavior                                          |
|--------------------|---------------------------------------------------|
| `pfa-text-left`    | Standard left alignment (right edge ragged)       |
| `pfa-text-center`  | Standard centered alignment                       |
| `pfa-text-right`   | Standard right alignment (left edge ragged)       |
| `pfa-align-left`   | Left-aligned, honoring explicit line breaks (`\`) |
| `pfa-align-center` | Centered, honoring explicit line breaks           |
| `pfa-align-right`  | Right-aligned, honoring explicit line breaks      |
| `pfa-block-left`   | Shrink-to-fit box, left-anchored to the margin    |
| `pfa-block-center` | Shrink-to-fit box, centered in the text column    |
| `pfa-block-right`  | Shrink-to-fit box, right-anchored to the margin   |

The `pfa-align-*` family preserves explicit `\` line breaks — ideal for
poetry, formal addresses, and titles. The `pfa-block-*` family wraps the
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
[Sample]{.pfa-font-bold .pfa-font-sans .pfa-text-lg pfa-color="red"}

::: {.pfa-text-center .pfa-font-sans .pfa-font-bold .pfa-text-lg pfa-color="midnightblue"}
A centered, bold, sans-serif, large, midnight-blue block.
:::
```

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

**Deprecated — retained strictly for backward compatibility.** New
documents should use the explicit `pfa-*` namespace to prevent collisions
with global CSS frameworks.

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
| `small`      | `pfa-text-sm`      |
| `normal`     | `pfa-text-normal`  |
| `large`      | `pfa-text-lg`      |
| `xlarge`     | `pfa-text-xl`      |
| `xxlarge`    | `pfa-text-2xl`     |
| `huge`       | `pfa-text-3xl`     |

### Alignment Aliases

| Legacy Alias  | Modern Class       |
|---------------|--------------------|
| `center`      | `pfa-text-center`  |
| `flushleft`   | `pfa-text-left`    |
| `flushright`  | `pfa-text-right`   |
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
| `xout`       | `xo`  | `pfa-text-markout`      |

## Acknowledgements

Special thanks to [Albert Krewinkel](https://github.com/tarleb) and
[Benct Philip Jonsson](https://github.com/bpj) for their valuable feedback
and suggestions during the development of this filter.

## License

MIT — see [`LICENSE`](LICENSE) for the full text.
