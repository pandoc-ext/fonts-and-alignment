Fonts and Alignment Lua Filter
==============================================================================

[![GitHub build status][CI badge]][CI workflow]

Fonts and Alignment is a Lua filter designed to style fonts and align text in Pandoc generated LaTeX documents.

The filter defines a number of classes that when specified correspond to LaTeX commands which in turn provide the requisite styling.

The same classes may be used when generating HTML but you will need to provide a stylesheet to define the required styles. To aid in the creation of a stylesheet a [specimen](https://github.com/nandac/fonts-and-alignment/blob/main/specimens/specimen.css) has been provided. You may view the rendered HTML [here](https://htmlpreview.github.io/?https://github.com/nandac/fonts-and-alignment/blob/main/specimens/specimen.html).

To preview the PDF document please see [here](https://github.com/nandac/fonts-and-alignment/blob/main/specimens/specimen.pdf).

[CI badge]: https://img.shields.io/github/workflow/status/nandac/fonts-and-alignment/CI?logo=github
[CI workflow]: https://github.com/nandac/fonts-and-alignment/actions/workflows/ci.yaml

Prerequisites
-----------------------------------------------------------------

Before starting to use this filter we recommend that you set up the fonts you wish to use either in a [Pandoc defaults file](https://pandoc.org/MANUAL.html#defaults-files) like so:

```yaml
variables:
  fontsize: 12pt
  mainfont: Noto Serif
  sansfont: Noto Sans
  monofont: Fira Mono
```

Or in a YAML block at the beginning of your source document:

```yaml
---
fontsize: 12pt
mainfont: Noto Serif
sansfont: Noto Sans
monofont: Fira Mono
---

```

Classes Defined in the Filter
-----------------------------------------------------------------

The filter defines several classes for styling fonts and text alignment.

The following classes have been defined for various font styles and supports both inline and block elements:

| Class       | Short Hand | Inline LaTeX   | Block LaTeX                         | Description               |
|-------------|------------|----------------|-------------------------------------|---------------------------|
| `bold`      | `bf`       | `\textbf{...}` | `\begin{bfseries}...\end{bfseries}` | Bold font weight.          |
| `italic`    | `it`       | `\textit{...}` | `\begin{itshape}...\end{itshape}`   | Italic font style.         |
| `monospace` | `tt`       | `\texttt{...}` | `\begin{ttfamily}...\end{ttfamily}` | Monospace font family.     |
| `sans`      | `sf`       | `\textsf{...}` | `\begin{sffamily}...\end{sffamily}` | Sans-serif font family.    |
| `serif`     | `rm`       | `\textrm{...}` | `\begin{rmfamily}...\end{rmfamily}` | Serif font family.         |
| `smallcaps` | `sc`       | `\textsc{...}` | `\begin{scshape}...\end{scshape}`   | Small capitals font style. |

__Please make sure that your font has support for the styles you wish to use in your document. Otherwise LaTeX will substitute the font with its default font giving you unexpected results.__

The following font sizes have also been defined for inline and block elements:

| Class     | LaTeX code          | Description                                        |
|-----------|---------------------|----------------------------------------------------|
| `xxsmall` | `\scriptsize ...`   | Extra extra small font. 9pt for a 12pt document.   |
| `xsmall`  | `\footnotesize ...` | Extra small font. 10pt for a 12pt document.        |
| `small`   | `\small ...`        | Small font. 10.95pt for a 12pt document.           |
| `normal`  | `\normal ...`       | Normal font. 12pt for a 12pt document.             |
| `large`   | `\large ...`        | Large font. 14.4pt for a 12pt document.            |
| `xlarge`  | `\Large ...`        | Extra large font. 17.28 for a 12pt document.       |
| `xxlarge` | `\LARGE ...`        | Extra extra large font. 20.74 for a 12pt document. |

The following layouts are defined for block elements exclusively:

| Class         | LaTeX code                                | Description                                                                 |
|---------------|-------------------------------------------|-----------------------------------------------------------------------------|
| `center`      | `\begin{center}...\end{center}`           | Center blocks of text like paragraphs.                                      |
| `flushright`  | `\begin{flushright}...\end{flushright}`   | Right justify blocks of text like paragraphs.                               |
| `flushleft`   | `\begin{flushleft}...\end{flushleft}`     | Left justify blocks of text like paragraphs.                                |
| `centering`   | `\begin{centering}...\end{centering}`     | Center blocks of text with manual line breaks like verses of poetry.        |
| `raggedleft`  | `\begin{raggedleft}...\end{raggedleft}`   | Right justify blocks of text with manual line breaks like verses of poetry. |
| `raggedright` | `\begin{raggedright}...\end{raggedright}` | Left justify blocks of text with manual line breaks like verses of poetry.  |

Styling Inline Elements
-----------------------------------------------------------------

To style an inline element in your document use the syntax below:

```markdown
[<inline-text>]{.<class>}
```

For example to change the font weight for some inline text into bold we do:

```markdown
[My bold text]{.bold}
```

or

```markdown
[My bold text]{.bf}
```

You may specify more than one style like so:

```markdown
[My bold and italic text]{.bold .italic}
```

or

```markdown
[My bold and italic text]{.bf .it}
```

Refer to the [Pandoc documentation](https://pandoc.org/MANUAL.html#extension-bracketed_spans) for more information on styling inline elements.

Styling Block elements
-----------------------------------------------------------------

To style a block element use the following syntax below:

```markdown
::: <class>
<block-of-text>
:::
```

Therefore, to center a block of text you would do:

```markdown
::: center
This is some text that is centered.
:::
```

You may also combine styles like so:

```markdown
::: {.center .bold}
This is some text that is centered and in bold font.
:::
```

Please note the change in syntax when combining two styles for block elements.

Refer to the [Pandoc documentation](https://pandoc.org/MANUAL.html#extension-fenced_divs) for more information on styling block elements.

Acknowledgements
------------------------------------------------------------------

Special thanks to [Albert Krewinkel](https://github.com/tarleb) and [Benct Philip Jonsson](https://github.com/bpj) for their valuable feedback and suggestions during the development of this filter.

License
------------------------------------------------------------------

This pandoc Lua filter is published under the MIT license, see
file `LICENSE` for details.
