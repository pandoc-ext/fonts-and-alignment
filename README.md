# Fonts and Alignment Filter

**Fonts and Alignment** is a Pandoc Lua filter that brings rich, typographic control to Markdown source documents, ensuring beautiful and consistent results across both **LaTeX/PDF** and **HTML** formats using a unified namespaced class system (`pfa-*`).

* **LaTeX/PDF Output:** The filter automatically translates your classes into the appropriate native LaTeX commands and environments.
* **HTML Output:** The filter preserves the structural classes in your generated document while a companion stylesheet applies equivalent CSS styling.

The repository includes complete specimen documents demonstrating every feature provided by the filter. Each example showcases the exact Markdown syntax used to generate the output, making the specimens useful both as a feature showcase and as a direct library of copy-and-paste examples.

* [Live HTML Specimen (Rendered Preview)](https://htmlpreview.github.io/?https://github.com/pandoc-ext/fonts-and-alignment/blob/main/docs/input.html)
* [PDF Specimen](docs/input.pdf)

## Extension Requirements

The filter relies completely on Pandoc's `bracketed_spans` and `fenced_divs` extensions, which are enabled by default in modern Pandoc distributions.

> ⚠️ **Important:** In the uncommon event that these extensions are explicitly disabled in your workflow, the Lua filter will be unable to interpret the custom divs and spans correctly, causing them to fail gracefully but appear as unformatted raw text in your rendered output.

## Feature Highlights

* **Nine-step font sizing scale** — `pfa-text-3xs` through `pfa-text-3xl`.
* **Font weights, shapes, and families** — bold, medium, italic, slanted, upright, emphasis, serif, sans, mono, small caps, and normal.
* **Text decorations** — underline, double underline, dashed underline, dotted underline, wavy underline, and strikeout.
* **Color support** — solid CSS3/hex colors with permissive parsing, plus native `xcolor` percentage-based color mixing.
* **Text casing transformations** — uppercase and lowercase conversions applied directly to the Abstract Syntax Tree (AST) text nodes.
* **Text alignment and Fenced Div positioning** — separate controls for text alignment within Fenced Divs and horizontal positioning of the Fenced Div itself.
* **Consistent PDF and HTML rendering** — equivalent styling through a shared class vocabulary.

## Installation

### Quarto

Install directly from GitHub:

```bash
quarto add pandoc-ext/fonts-and-alignment
```

The extension automatically registers:

* `fonts-and-alignment.lua` for all supported output formats
* `fonts-and-alignment.css` for HTML output

No additional filter or stylesheet configuration is required.

### Pandoc

Download the filter and stylesheet directly into your project directory:

```bash
curl -O https://raw.githubusercontent.com/pandoc-ext/fonts-and-alignment/v2.0.0/fonts-and-alignment.lua

curl -O https://raw.githubusercontent.com/pandoc-ext/fonts-and-alignment/v2.0.0/fonts-and-alignment.css
```

Unlike the Quarto installation, Pandoc requires you to explicitly declare these assets during compilation:

* Use `--lua-filter=fonts-and-alignment.lua` for all targeted output formats
* Use `--css=fonts-and-alignment.css` specifically for HTML output

*Full terminal commands and configuration templates are provided in the [Compilation and Usage](#compilation-and-usage) section below.*

## Configuration

The following examples demonstrate how to configure both PDF and HTML outputs to use a consistent set of custom typefaces (**Noto Serif**, **Noto Sans**, and **Fira Mono**).

### PDF Typography

By default, the typeface family classes (`.pfa-font-serif`, `.pfa-font-sans`, and `.pfa-font-mono`) map directly to your LaTeX engine's standard default fonts.

To use specific typefaces for PDF output, define them using Pandoc's standard font variables in a defaults file:

```yaml
variables:
  fontsize: 12pt
  mainfont: "Noto Serif"   # Customizes generic text and .pfa-font-serif
  sansfont: "Noto Sans"    # Customizes .pfa-font-sans
  monofont: "Fira Mono"    # Customizes .pfa-font-mono
```

Or on a per-document basis inside your Markdown frontmatter:

```yaml
---
fontsize: 12pt
mainfont: "Noto Serif"
sansfont: "Noto Sans"
monofont: "Fira Mono"
---
```

### HTML Typography

For HTML output, the bundled companion stylesheet automatically maps those same family classes to cross-platform, generic web fallbacks (`serif`, `sans-serif`, and `monospace`).

To load and customize these styles to match your preferred web typography, structure your project's main stylesheet as follows:

```css
/* Load custom web fonts from Google Fonts */
@import url('https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,100..900;1,100..900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Fira+Mono:wght@400;500;700&display=swap');

/* Import the filter rules to inherit your custom configuration variables */
@import url("fonts-and-alignment.css");

:root {
  /* Customize the baseline document font size (maps to .pfa-text-normal) */
  --pfa-normal-size: 1rem; /* Corresponds to your base text size, e.g., 12pt */

  /* Customize typeface selections for each family class */
  --pfa-mainfont: "Noto Serif", serif;     /* Customizes .pfa-font-serif */
  --pfa-sansfont: "Noto Sans", sans-serif;  /* Customizes .pfa-font-sans */
  --pfa-monofont: "Fira Mono", monospace;   /* Customizes .pfa-font-mono */
}
```

The `--pfa-normal-size` property acts as your typographic baseline. All other font sizing classes (`.pfa-text-3xs` through `.pfa-text-3xl`) scale up or down proportionally from whatever custom value you declare here (such as `1rem`), perfectly mimicking LaTeX's relative scaling behaviors on the web.

## Markdown Syntax

The filter uses native Pandoc elements to apply styles. Use **Bracketed Spans** for inline text adjustments and **Fenced Divs** for block-level content structures.

### Inline Text (Bracketed Spans)

Best for styling words, phrases, or short inline selections:

```markdown
[This text is bold.]{.pfa-font-bold}

[This text is italic and large.]{.pfa-font-italic .pfa-text-l}

[This text is underlined and green.]{.pfa-text-uline pfa-font-color="forestgreen"}
```

### Block Layouts (Fenced Divs)

Best for styling entire paragraphs, quotes, or multi-line sections:

```markdown
::: {.pfa-text-center}
An entire block of text centered on the page.
:::

::: {.pfa-font-sans .pfa-font-bold pfa-font-color="midnightblue"}
A complete bold, sans-serif block of content styled in midnight blue.
:::
```

## Compilation and Usage

If you are using **Quarto**, no special compilation configuration is needed—simply execute `quarto render document.qmd`. For **Pandoc**, apply the filter and assets via the command line or a defaults file configuration.

### PDF Generation

Compile using the Lua filter along with an explicit LaTeX rendering engine:

```bash
pandoc \
  --lua-filter=fonts-and-alignment.lua \
  --pdf-engine=lualatex \
  --output=document.pdf \
  document.md
```

Or declare them cleanly inside a Pandoc defaults YAML file:

```yaml
filters:
  - fonts-and-alignment.lua
pdf-engine: lualatex
```

### HTML Generation

Compile using both the Lua filter and the companion stylesheet. Use the `--standalone` flag if you need a complete, self-contained web page. If you are generating raw HTML body fragments to feed into a static site generator (like Pelican or Hugo), simply omit the standalone flag:

```bash
pandoc \
  --lua-filter=fonts-and-alignment.lua \
  --css=fonts-and-alignment.css \
  --standalone \
  --output=document.html \
  document.md
```

Or declare them cleanly inside a Pandoc defaults YAML file:

```yaml
filters:
  - fonts-and-alignment.lua
css:
  - fonts-and-alignment.css
standalone: true  # Omit or set to false if building content fragments for an SSG
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

The filter automatically loads the `ulem` package when one of these classes is detected in the document. These styles are also mapped to equivalent CSS properties for HTML output.

| Class | LaTeX | Description |
|--------|--------|--------|
| `pfa-text-uline` | `\uline{…}` | Underline |
| `pfa-text-uline-double` | `\uuline{…}` | Double underline |
| `pfa-text-uline-dashed` | `\dashuline{…}` | Dashed underline |
| `pfa-text-uline-dotted` | `\dotuline{…}` | Dotted underline |
| `pfa-text-uline-wave` | `\uwave{…}` | Wavy underline |
| `pfa-text-strikeout` | `\sout{…}` | Strikeout |

### Text Casing

Both classes work for Bracketed Spans and Fenced Divs. The transformation operates directly on AST text nodes, so the resulting case survives copy-and-paste from the rendered document.

| Class | Description |
|--------|--------|
| `pfa-uppercase` | Uppercase every letter |
| `pfa-lowercase` | Lowercase every letter |

### Color

A single attribute, `pfa-font-color`, applies colors and supports both solid values and percentage-based mixing.

#### Solid Colors

Accepts [CSS3 named colors](https://www.w3.org/TR/css-color-3/#svg-color) and hexadecimal values. Solid color names are completely case-insensitive and parsed permissively (`mediumvioletred`, `MediumVioletRed`, and `medium_violet_red` resolve identically).

```markdown
[crimson sample]{pfa-font-color="crimson"}
[hex sample]{pfa-font-color="#2E8B57"}
```

#### Color Mixing

The filter natively supports LaTeX's `xcolor` percentage syntax. This translates to cross-format blending using `color-mix()` in HTML.

The mixing syntax uses the exclamation mark (`!`) to separate values:

| Mixing Type | Syntax Pattern | Description & Example |
| :--- | :--- | :--- |
| Tinting | `BaseColor!Percentage` | Blends with white. `Maroon!30` keeps 30% Maroon and 70% white. |
| Shading | `BaseColor!Percentage!black` | Blends with black. `MediumVioletRed!80!black` darkens the base color. |
| Two-Color Mix | `BaseColor!Percentage!MixColor` | Blends two specific colors. `RoyalBlue!50!ForestGreen` splits them 50/50. |

> ⚠️ **Strict Casing Rule:** Mixed color definitions are case-sensitive. The [19 core LaTeX colors](https://www.overleaf.com/learn/latex/Using_colours_in_LaTeX#Reference_guide) must be written in **lowercase**. Conversely, [CSS3 named colors](https://developer.mozilla.org/en-US/docs/Web/CSS/named-color) must be written in **PascalCase** to maintain cross-backend compatibility.

```markdown
[Tinted]{pfa-font-color="Maroon!40"}
[Shaded]{pfa-font-color="MediumVioletRed!80!black"}
[Mixed]{pfa-font-color="RoyalBlue!50!ForestGreen"}
```

#### Inheriting Colors

When applied to a Fenced Div, all enclosed content inherits the color unless explicitly overridden.

```markdown
::: {pfa-font-color="darkslategray"}
The entire Fenced Div inherits dark slate gray.

[This span overrides to tomato.]{pfa-font-color="tomato"}

The remainder reverts to the parent color.
:::
```

### Text Alignment

The `pfa-align-*` family controls text alignment within a Fenced Div while preserving explicit line breaks.

| Class | Behavior |
|--------|--------|
| `pfa-align-left` | Left-aligned, honoring explicit line breaks (`\`) |
| `pfa-align-center` | Centered, honoring explicit line breaks |
| `pfa-align-right` | Right-aligned, honoring explicit line breaks |

```markdown
::: {.pfa-align-center}
First centered line\
Second centered line\
Third centered line
:::
```

### Fenced Div Positioning

The `pfa-block-*` family controls the horizontal positioning of an entire Fenced Div without affecting the internal text alignment of its contents.

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

When `pfa-font-color` is combined with underline or strikeout classes, the decoration inherits the specified color in both LaTeX and HTML output.

## Troubleshooting

### Colors don't appear in PDF output

The filter emits `\textcolor{…}{…}` and `\color{…}` commands, which require the `xcolor` package. Most modern Pandoc templates load it automatically. If yours does not:

```yaml
header-includes:
  - \usepackage[dvipsnames,svgnames]{xcolor}
```

### `pfa-block-*` alignment breaks the PDF build

Fenced Div positioning relies on the `varwidth` package, which the filter loads automatically when needed. If your TeX installation is minimal:

```bash
tlmgr install varwidth
```

### Font sizes don't scale as expected

The HTML stylesheet derives all typography sizes from the `--pfa-normal-size` CSS custom property.

```css
:root {
  --pfa-normal-size: 1rem;
}
```

Changing this value scales the entire typography hierarchy while preserving the relative proportions between size classes.

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
