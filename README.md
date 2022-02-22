Fonts and Alignment Lua Filter
==============================================================================

[![GitHub build status][CI badge]][CI workflow]

Fonts and Alignment is a Lua filter designed to style fonts and align text in Pandoc generated LaTeX documents.

The filter defines a number of classes that when specified correspond to LaTeX commands which in turn provide the requisite styling.

You may preview a specimen PDF document that uses these styles [here](https://github.com/nandac/fonts-and-alignment/blob/main/specimens/specimen.pdf).

The same classes may be used when generating HTML but you will need to provide a stylesheet to define the required styles. To aid in the creation of a stylesheet a [specimen CSS file](https://github.com/nandac/fonts-and-alignment/blob/main/specimens/specimen.css) and a [specimen SASS file](https://github.com/nandac/fonts-and-alignment/blob/main/specimens/specimen.sass) have been provided.

You may view the HTML version [here](https://htmlpreview.github.io/?https://github.com/nandac/fonts-and-alignment/blob/main/specimens/specimen.html).

[CI badge]: https://img.shields.io/github/workflow/status/nandac/fonts-and-alignment/CI?logo=github
[CI workflow]: https://github.com/nandac/fonts-and-alignment/actions/workflows/ci.yaml

Prerequisites
-----------------------------------------------------------------

Before starting to use this filter we recommend that you set up the fonts you wish to use either in a [Pandoc defaults file](https://pandoc.org/MANUAL.html#defaults-files) like so:

```yaml
variables:
  fontsize: <font-size>
  mainfont: <serif-font>
  sansfont: <sans-serif-font>
  monofont: <monospace-font>
```

Or in a YAML block at the beginning of your source document:

```yaml
---
fontsize: <font-size>
mainfont: <serif-font>
sansfont: <sans-serif-font>
monofont: <monospace-font>
---

```

Replace the placeholders above with your choices for Serif, Sans-serif and Monospace fonts.

Classes Defined in the Filter
-----------------------------------------------------------------

The filter defines several classes for styling fonts and text alignment.

The following classes have been defined for various font styles and supports both inline and block elements:

| Class       | Short Hand | Inline LaTeX   | Block LaTeX                         | Description               |
|-------------|------------|----------------|-------------------------------------|---------------------------|
| `bold`      | `bf`       | `\textbf{...}` | `\begin{bfseries}...\end{bfseries}` | Bold font series/weight.          |
| `italic`    | `it`       | `\textit{...}` | `\begin{itshape}...\end{itshape}`   | Italic font shape.         |
| `monospace` | `tt`       | `\texttt{...}` | `\begin{ttfamily}...\end{ttfamily}` | Monospace font family.     |
| `sans`      | `sf`       | `\textsf{...}` | `\begin{sffamily}...\end{sffamily}` | Sans-serif font family.    |
| `serif`     | `rm`       | `\textrm{...}` | `\begin{rmfamily}...\end{rmfamily}` | Serif font family.         |
| `smallcaps` | `sc`       | `\textsc{...}` | `\begin{scshape}...\end{scshape}`   | Small capitals font shape. |

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
| `center`      | `\begin{center}...\end{center}`           | Center a block of text,                                    |
| `flushright`  | `\begin{flushright}...\end{flushright}`   | Right justify a block of text.                               |
| `flushleft`   | `\begin{flushleft}...\end{flushleft}`     | Left justify a block of text.                                |
| `centering`   | `\begin{centering}...\end{centering}`     | Center a block of text with user-defined line breaks using backslash (`\`).        |
| `raggedleft`  | `\begin{raggedleft}...\end{raggedleft}`   | Right justify a block of text with user-defined line breaks using backslash (`\`). |
| `raggedright` | `\begin{raggedright}...\end{raggedright}` | Left justify a block of text with user-defined line breaks using backslash (`\`).  |

Styling Inline Elements
-----------------------------------------------------------------

To style an inline element in your document use the syntax below:

```markdown
[<inline-text>]{.<class-name>}
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
::: <class-name>
<block-of-text>
:::
```

Therefore, to center a block of text you would do:

```markdown
::: center # Curly brackets not required when specifying only a single class
This is some text that is centered.
:::
```

You may also combine styles like so:

```markdown
::: {.center .bold} # Curly brackets required when specifying more than one class
This is some text that is centered and in bold font.
:::
```

Refer to the [Pandoc documentation](https://pandoc.org/MANUAL.html#extension-fenced_divs) for more information on styling block elements.

Usage
------------------------------------------------------------------

To use this filter in your projects follow the steps below:

1. Download the filter from the repository:

    ```bash
    wget https://raw.githubusercontent.com/nandac/fonts-and-alignment/main/fonts-and-alignment.lua
    ```

1. Move the filter to a location of your choosing.

1. You may add the filter to your defaults file like so:

    ```yaml
    filters:
      - fonts-and-alignment.lua
    ```

    or specify it as an option on the command line:

    ```bash
    pandoc --from markdown --to latex --lua-filter fonts-and-alignment.lua \
    --pdf-engine lualatex --output <output.pdf> <input.md>
    ```

    Take care to replace the placeholder above with your output and input files.

Acknowledgements
------------------------------------------------------------------

Special thanks to [Albert Krewinkel](https://github.com/tarleb) and [Benct Philip Jonsson](https://github.com/bpj) for their valuable feedback and suggestions during the development of this filter.

License
------------------------------------------------------------------

This pandoc Lua filter is published under the MIT license, see
file `LICENSE` for details.
