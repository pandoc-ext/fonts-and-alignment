# Fonts and Alignment Filter

_Fonts and Alignment_ is a Pandoc Lua filter that brings rich typographic
control to Markdown source documents using a unified namespaced class system
(`pfa-*`).

The filter provides:

- Font sizing
- Font weight and shape
- Font families
- Text decorations
- Colors
- Text casing
- Text alignment
- Fenced Div positioning

For PDF output, the filter emits the appropriate LaTeX commands and
environments.

For HTML output, the filter preserves the same classes in the generated
document and a companion stylesheet applies equivalent CSS styling.

The repository also includes complete specimen documents that demonstrate
every feature provided by the filter. Each example shows both the source
Markdown and the rendered output, making the specimens useful both as a
feature showcase and as a library of copy-and-paste examples.

- [PDF specimen](docs/input.pdf)
- [HTML specimen](docs/input.html)

The filter relies on Pandoc's `bracketed_spans` and `fenced_divs`
extensions, which are enabled by default in modern Pandoc distributions.

## Feature Highlights

- **Consistent PDF and HTML rendering** using a shared class vocabulary.
- **Nine-step font sizing scale** — `pfa-text-3xs` through `pfa-text-3xl`.
- **Font weights, shapes, and families** — bold, medium, italic, slanted, upright, emphasis, serif, sans, mono, small caps, and normal.
- **Text decorations** — underline, double underline, dashed underline, dotted underline, wavy underline, and strikeout.
- **Flexible color support** — CSS3 named colors and hexadecimal colors with permissive color-name parsing.
- **Text casing transformations** — uppercase and lowercase conversions applied directly to Abstract Syntax Tree (AST) text nodes.
- **Text alignment and Fenced Div positioning** — separate controls for text alignment and horizontal positioning.
- **Consistent PDF and HTML rendering** — equivalent styling through a shared class vocabulary.

## Installation

### Quarto

Install directly from GitHub:

```bash
quarto add pandoc-ext/fonts-and-alignment
```

The extension automatically registers:

- `fonts-and-alignment.lua` for all supported output formats
- `fonts-and-alignment.css` for HTML output

No additional filter or stylesheet configuration is required.

### Pandoc

Download the filter and stylesheet:

```bash
curl -O https://raw.githubusercontent.com/pandoc-ext/fonts-and-alignment/main/fonts-and-alignment.lua
curl -O https://raw.githubusercontent.com/pandoc-ext/fonts-and-alignment/main/fonts-and-alignment.css
```

## Configuration

### PDF Fonts

Configure the fonts used by PDF output either in a Pandoc defaults file:

```yaml
variables:
  fontsize: 12pt
  mainfont: Noto Serif
  sansfont: Noto Sans
  monofont: Fira Mono
```

or in document frontmatter:

```yaml
---
fontsize: 12pt
mainfont: Noto Serif
sansfont: Noto Sans
monofont: Fira Mono
---
```

### HTML Fonts and Typography

The bundled stylesheet is configured through CSS custom properties.

```css
:root {
  --pfa-normal-size: 1rem;

  --pfa-mainfont: "Noto Serif", serif;
  --pfa-sansfont: "Noto Sans", sans-serif;
  --pfa-monofont: "Fira Mono", monospace;
}

@import url("fonts-and-alignment.css");
```

`--pfa-normal-size` defines the HTML equivalent of LaTeX's `\normalsize`.
All other sizing classes are calculated proportionally from this value using
the same relative scale as the corresponding LaTeX commands.

Examples:

```css
:root {
  --pfa-normal-size: 10pt;
}
```

```css
:root {
  --pfa-normal-size: 12pt;
}
```

```css
:root {
  --pfa-normal-size: 18px;
}
```

## Quick Start

### Bracketed Spans

Bracketed Spans are intended for styling smaller inline portions of text.

```markdown
[some text]{.pfa-font-bold}

[some text]{.pfa-font-italic .pfa-text-l}

[some text]{.pfa-text-uline pfa-font-color="forestgreen"}
```

### Fenced Divs

Fenced Divs are intended for styling larger blocks of content.

```markdown
:::
A single centered paragraph.
:::
```

When combining multiple classes or adding attributes, use standard Pandoc
attribute syntax:

```markdown
::: {.pfa-font-sans .pfa-font-bold pfa-font-color="midnightblue"}
A bold sans-serif paragraph in midnight blue.
:::
```

## Usage

### PDF

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
  --css=fonts-and-alignment.css \
  --standalone \
  --output=document.html \
  document.md
```

## Class Reference

### Font Sizing

Nine sizing hooks, applicable to both Bracketed Spans and Fenced Divs.

| Class | LaTeX Equivalent | Description |
|--------|--------|--------|
| `pfa-text-3xs` | `\tiny` | Tiny |
| `pfa-text-2xs` | `\scriptsize` | Script size |
| `pfa-text-xs` | `\footnotesize` | Footnote size |
| `pfa-text-s` | `\small` | Small |
| `pfa-text-normal` | `\normalsize` | Normal |
| `pfa-text-l` | `\large` | Large |
| `pfa-text-xl` | `\Large` | Extra large |
| `pfa-text-2xl` | `\LARGE` | Extra-extra large |
| `pfa-text-3xl` | `\huge` | Huge |

### Font Weight, Shape, and Family

| Class | LaTeX (Bracketed Span / Fenced Div) | Description |
|--------|--------|--------|
| `pfa-font-bold` | `\textbf{…}` / `{\bfseries …}` | Bold |
| `pfa-font-medium` | `\textmd{…}` / `{\mdseries …}` | Medium |
| `pfa-font-italic` | `\textit{…}` / `{\itshape …}` | Italic |
| `pfa-font-slanted` | `\textsl{…}` / `{\slshape …}` | Slanted |
| `pfa-font-upright` | `\textup{…}` / `{\upshape …}` | Upright |
| `pfa-font-emphasis` | `\emph{…}` / `{\em …}` | Emphasis |
| `pfa-font-serif` | `\textrm{…}` / `{\rmfamily …}` | Serif |
| `pfa-font-sans` | `\textsf{…}` / `{\sffamily …}` | Sans |
| `pfa-font-mono` | `\texttt{…}` / `{\ttfamily …}` | Mono |
| `pfa-font-smallcaps` | `\textsc{…}` / `{\scshape …}` | Small caps |
| `pfa-font-normal` | `\textnormal{…}` / `{\normalfont …}` | Normal |

> Make sure your selected fonts actually provide the requested shapes and weights. LaTeX may substitute alternatives when they are unavailable.

### Text Decorations (Bracketed Spans Only)

The filter automatically loads the `ulem` package when one of these classes
is detected in the document.

These styles are also mapped to equivalent CSS properties for HTML output.

| Class | LaTeX | Description |
|--------|--------|--------|
| `pfa-text-uline` | `\uline{…}` | Underline |
| `pfa-text-uline-double` | `\uuline{…}` | Double underline |
| `pfa-text-uline-dashed` | `\dashuline{…}` | Dashed underline |
| `pfa-text-uline-dotted` | `\dotuline{…}` | Dotted underline |
| `pfa-text-uline-wave` | `\uwave{…}` | Wavy underline |
| `pfa-text-strikeout` | `\sout{…}` | Strikeout |

### Text Casing

Both classes work for Bracketed Spans and Fenced Divs.

The transformation operates directly on AST text nodes, so the resulting case
survives copy-and-paste from the rendered document.

| Class | Description |
|--------|--------|
| `pfa-uppercase` | Uppercase every letter |
| `pfa-lowercase` | Lowercase every letter |

### Color

A single attribute, `pfa-font-color`, accepts:

- Any CSS3 named color
- Three-digit hexadecimal colors (`#333`)
- Six-digit hexadecimal colors (`#2E8B57`)

Examples:

```markdown
[crimson sample]{pfa-font-color="crimson"}

[hex sample]{pfa-font-color="#2E8B57"}

::: {pfa-font-color="darkslategray"}
The entire Fenced Div inherits dark slate gray.

[This span overrides to tomato.]{pfa-font-color="tomato"}

The remainder reverts to the parent color.
:::
```

Color names are parsed permissively. The following all resolve identically:

```text
mediumvioletred
Medium Violet Red
medium-violet-red
medium_violet_red
mediumVioletRed
MediumVioletRed
MEDIUM_VIOLET_RED
MEDIUMVIOLETRED
```

### Text Alignment

The `pfa-align-*` family controls text alignment within a Fenced Div while
preserving explicit line breaks.

| Class | Behavior |
|--------|--------|
| `pfa-align-left` | Left-aligned, honoring explicit line breaks (`\`) |
| `pfa-align-center` | Centered, honoring explicit line breaks |
| `pfa-align-right` | Right-aligned, honoring explicit line breaks |

```markdown
:::
First centered line\
Second centered line\
Third centered line
:::
```

### Fenced Div Positioning

The `pfa-block-*` family controls the horizontal positioning of an entire
Fenced Div without affecting the internal text alignment of its contents.

| Class | Behavior |
|--------|--------|
| `pfa-block-left` | Shrink-to-fit box, left-anchored to the margin |
| `pfa-block-center` | Shrink-to-fit box, centered in the text column |
| `pfa-block-right` | Shrink-to-fit box, right-anchored to the margin |

```markdown
::: {.pfa-block-right}
**Right-Anchored Shrink Block**

Wraps tightly around its content.
:::
```

## Combining Classes

Classes compose freely on both Bracketed Spans and Fenced Divs.

```markdown
[Sample]{.pfa-font-bold .pfa-font-sans .pfa-text-l pfa-font-color="red"}

[Sample]{.pfa-text-uline .pfa-font-smallcaps pfa-font-color="forestgreen"}

::: {.pfa-align-center .pfa-font-sans .pfa-font-bold .pfa-text-l pfa-font-color="midnightblue"}
A centered, bold, sans-serif, large, midnight-blue Fenced Div.
:::
```

When `pfa-font-color` is combined with underline or strikeout classes, the
decoration inherits the specified color in both LaTeX and HTML output.

## Troubleshooting

### Colors don't appear in PDF output

The filter emits `\textcolor{…}{…}` and `\color{…}` commands, which require
the `xcolor` package.

Most modern Pandoc templates load it automatically. If yours does not:

```yaml
header-includes:
  - \usepackage[dvipsnames,svgnames]{xcolor}
```

### `pfa-block-*` alignment breaks the PDF build

Fenced Div positioning relies on the `varwidth` package, which the filter
loads automatically when needed.

If your TeX installation is minimal:

```bash
tlmgr install varwidth
```

### Font sizes don't scale as expected

The HTML stylesheet derives all typography sizes from the
`--pfa-normal-size` CSS custom property.

```css
:root {
  --pfa-normal-size: 12pt;
}
```

Changing this value scales the entire typography hierarchy while preserving
the relative proportions between size classes.

## Legacy Aliases

**Deprecated — retained strictly for backward compatibility and scheduled for removal in the next major release. New documents should use the `pfa-*` namespace.**

### Font Weight, Shape, and Family Aliases

| Legacy Alias | Short | Modern Class |
|--------|--------|--------|
| `bold` | `bf` | `pfa-font-bold` |
| `emphasis` | `em` | `pfa-font-emphasis` |
| `italic` | `it` | `pfa-font-italic` |
| `medium` | `md` | `pfa-font-medium` |
| `monospace` | `tt` | `pfa-font-mono` |
| `normalfont` | `nf` | `pfa-font-normal` |
| `sans` | `sf` | `pfa-font-sans` |
| `serif` | `rm` | `pfa-font-serif` |
| `slanted` | `sl` | `pfa-font-slanted` |
| `smallcaps` | `sc` | `pfa-font-smallcaps` |
| `upright` | `up` | `pfa-font-upright` |

### Font Size Aliases

| Legacy Alias | Modern Class |
|--------|--------|
| `xsmall` | `pfa-text-xs` |
| `small` | `pfa-text-s` |
| `normal` | `pfa-text-normal` |
| `large` | `pfa-text-l` |
| `xlarge` | `pfa-text-xl` |
| `xxlarge` | `pfa-text-2xl` |
| `huge` | `pfa-text-3xl` |

### Alignment Aliases

| Legacy Alias | Modern Class |
|--------|--------|
| `centering` | `pfa-align-center` |
| `raggedleft` | `pfa-align-right` |
| `raggedright` | `pfa-align-left` |

### Text Decoration Aliases

| Legacy Alias | Short | Modern Class |
|--------|--------|--------|
| `uline` | `u` | `pfa-text-uline` |
| `uuline` | `uu` | `pfa-text-uline-double` |
| `dashuline` | `dau` | `pfa-text-uline-dashed` |
| `dotuline` | `dou` | `pfa-text-uline-dotted` |
| `uwave` | `uw` | `pfa-text-uline-wave` |
| `sout` | `so` | `pfa-text-strikeout` |

## Acknowledgements

Special thanks to Albert Krewinkel and Benct Philip Jonsson for their valuable feedback and suggestions during the development of this filter.

## License

MIT — see `LICENSE` for the full text.
