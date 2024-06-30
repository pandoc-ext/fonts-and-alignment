Fonts and Alignment
==============================================================================

_Fonts and Alignment_ is a Lua filter for styling fonts and aligning text in Pandoc-generated LaTeX documents.

The filter defines a number of classes, that when specified, correspond to LaTeX commands, which in turn provide the requisite styling.

You may preview a specimen PDF document that uses these styles [here](https://github.com/pandoc-ext/fonts-and-alignment/blob/main/specimens/specimen.pdf).

The _same_ classes may be used when generating HTML, but that requires the support of a CSS stylesheet to define the necessary styles. To aid this, a [specimen CSS file](https://github.com/pandoc-ext/fonts-and-alignment/blob/main/specimens/specimen.css) has been provided. Copy and modify it according to your preferences.

For those who prefer [Sass](https://sass-lang.com/) a [specimen Sass file](https://github.com/pandoc-ext/fonts-and-alignment/blob/main/specimens/specimen.sass) has also been provided to generate CSS. Again copy and modify it as required.

The corresponding specimen HTML document is available [here](https://htmlpreview.github.io/?https://github.com/nandac/fonts-and-alignment/blob/main/specimens/specimen.html).

Prerequisites
-----------------------------------------------------------------

Before starting to use this filter, we recommend that you specify the fonts you wish to use **either** in a [Pandoc defaults file](https://pandoc.org/MANUAL.html#defaults-files) like so:

```yaml
variables:
  fontsize: <font-size>
  mainfont: <serif-font>
  sansfont: <sans-serif-font>
  monofont: <monospace-font>
```

**or** in a YAML block at the beginning of your source document:

```yaml
---
fontsize: <font-size>
mainfont: <serif-font>
sansfont: <sans-serif-font>
monofont: <monospace-font>
---

```

Replace the placeholders above with your choices.

Classes Defined in the Filter
-----------------------------------------------------------------

The filter defines several classes for styling fonts and text alignment.

The following classes have been defined for the various _font styles_ that are supported:

| Class       | Short Hand | Inline LaTeX   | Block LaTeX                         | Description               |
|-------------|------------|----------------|-------------------------------------|---------------------------|
| `bold`      | `bf`       | `\textbf{...}` | `\begin{bfseries}...\end{bfseries}` | Bold font series/weight.|
| `emphasis`  | `em`       | `\emph{...}` | `\begin{em}...\end{em}`               | Emphasis font.       |
| `italic`    | `it`       | `\textit{...}` | `\begin{itshape}...\end{itshape}`   | Italic font shape.        |
| `lower`     | N/A        | `\lowercase{...}` | N/A                              | Lowercase font;  not available for blocks.         |
| `medium`    | `md`       | `\textmd{...}` | `\begin{mdseries}...\end{mdseries}` | Medium font series.       |
| `monospace` | `tt`       | `\texttt{...}` | `\begin{ttfamily}...\end{ttfamily}` | Monospace font family.       |
| `normalfont`| `nf`       | `\textnormal{...}` | `\begin{normalfont}...\end{normalfont}`   | Normal font.  |
| `sans`      | `sf`       | `\textsf{...}` | `\begin{sffamily}...\end{sffamily}` | Sans-serif font family.       |
| `serif`     | `rm`       | `\textrm{...}` | `\begin{rmfamily}...\end{rmfamily}` | Serif font family.       |
| `upper`     | N/A       | `\uppercase{...}` | N/A | Uppercase font; not available for blocks.
| `upright`   | `up`       | `\textup{...}` | `\begin{upshape}...\end{upshape}`   | Upright font shape.
| `smallcaps` | `sc`       | `\textsc{...}` | `\begin{scshape}...\end{scshape}`   | Small capitals font shape. |

The `\emph` command has been added purely for completeness and we encourage users to use Pandoc Markdown's built in support for emphasis whenever possible.

The light font series `\lfseries` has been omitted, as there is no standardization on the LaTeX command to specify light fonts at present.

**N.B. Please make sure that your font has support for the styles you wish to use in your document. Otherwise LaTeX will substitute the font with its default font giving you unexpected results.**

The following _font sizes_ have also been defined for inline and block elements:

| Class     | LaTeX code          | Description                                        |
|-----------|---------------------|----------------------------------------------------|
| `tiny`    | `\tiny ...`         | Tiny font. 6pt for a 12pt document.                |
| `xxsmall` | `\scriptsize ...`   | Extra extra small font. 8pt for a 12pt document.   |
| `xsmall`  | `\footnotesize ...` | Extra small font. 10pt for a 12pt document.        |
| `small`   | `\small ...`        | Small font. 10.95pt for a 12pt document.           |
| `normal`  | `\normal ...`       | Normal font. 12pt for a 12pt document.             |
| `large`   | `\large ...`        | Large font. 14.4pt for a 12pt document.            |
| `xlarge`  | `\Large ...`        | Extra large font. 17.28 for a 12pt document.       |
| `xxlarge` | `\LARGE ...`        | Extra extra large font. 20.74 for a 12pt document. |
| `huge`    | `\huge ...`         | Huge font. 24.88 for a 12pt document.              |

The `\Huge` LaTeX size has been omitted as it does not produce any significant increase in size, compared to `\huge` for 12pt documents.

The following _text-alignments_ are defined for block elements exclusively:

| Class         | LaTeX code                                | Description                                                                 |
|---------------|-------------------------------------------|-----------------------------------------------------------------------------|
| `center`      | `\begin{center}...\end{center}`           | Center a block of text,                                    |
| `flushright`  | `\begin{flushright}...\end{flushright}`   | Right justify a block of text.                               |
| `flushleft`   | `\begin{flushleft}...\end{flushleft}`     | Left justify a block of text.                                |
| `centering`   | `\begin{centering}...\end{centering}`     | Center a block of text with user-defined line breaks using backslash (`\`).        |
| `raggedleft`  | `\begin{raggedleft}...\end{raggedleft}`   | Right justify a block of text with user-defined line breaks using backslash (`\`). |
| `raggedright` | `\begin{raggedright}...\end{raggedright}` | Left justify a block of text with user-defined line breaks using backslash (`\`).  |

While not widely used, _additional font styles_ such as underlining, strikeout etc., may be required from time to time. Pandoc already directly supports strikeout, for example. For the sake of completeness the following additional font styles, provided by the `ulem` LaTeX package, are available only for inline elements:

| Class       | Short Hand | LaTeX code        | Description                                    |
|-------------|------------|-------------------|------------------------------------------------|
| `dashuline` | `dau`      | `\dashuline{...}` | Dashed underline.                              |
| `dotuline`  | `dou`      | `\dotuline{...}`  | Dotted underline like.                         |
| `uline`     | `u`        | `\uline{...}`     | Underline.                                     |
| `uuline`    | `uu`       | `\uuline{...}`    | Double underline.                              |
| `uwave`     | `uw`       | `\uwave{...}`     | Wavy underline.                                |
| `sout`      | `so`       | `\sout{...}`      | Stricken out line.                             |
| `xout`      | `xo`       | `\xout{...}`      | Marked over line; not available for HTML.     |

The `ulem` LaTeX package is not invoked by default and must be explicitly specified as a metadata attribute, in your defaults file, source document, or on the command line. In a defaults file you may specify the `ulem_styles` attribute using the `metadata` field like so:

```yaml
metadata:
  ulem_styles: true
```

Similarly, in a source document you may define this requirement in a YAML block as shown:

```yaml
---
ulem_styles: true
---
```

On the command line you may use the `--metadata` option to enable `ulem_styles` as follows:

```bash
--metadata ulem_styles
```

**N.B. with the exception of the marked out style `\xout`, the ulem styles are available by default for use with HTML documents, if you use the CSS or SASS files provided in this repository.**

Styling Inline Elements
-----------------------------------------------------------------

To style an inline element in your document use the syntax below:

```markdown
[<inline-text>]{.<class-name>}
```

For example to change the font weight for some inline text into bold you would do:

```markdown
[My bold text]{.bold}
```

or

```markdown
[My bold text]{.bf}
```

It is also possible to style [inline links](https://pandoc.org/MANUAL.html#inline-links) using the following syntax:

```markdown
[My link](https://my-link.com){.monospace}
```

or

```markdown
[My link](https://my-link.com){.tt}
```

To specify more than one style, list them one after the other as shown below:

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
::: center # Curly brackets are not required when specifying only a single class
This is some text that is centered.
:::
```

You may also combine styles like so:

```markdown
::: {.center .bold} # Curly brackets and period (.) are required when specifying more than one class
This is some text that is centered and in bold font.
:::
```

Refer to the [Pandoc documentation](https://pandoc.org/MANUAL.html#extension-fenced_divs) for more information on styling block elements.

Usage
------------------------------------------------------------------

To use this filter in your projects follow the steps below:

1. Download the filter from the repository:

    ```bash
    wget https://raw.githubusercontent.com/pandoc-ext/fonts-and-alignment/main/fonts-and-alignment.lua
    ```

1. Move the filter to a location recognized by Pandoc.

1. Generate the PDF document by executing the following command specifying the Lua filter using the `--lua-filter` option:

    ```bash
    pandoc --from markdown --to latex --lua-filter fonts-and-alignment.lua \
    --pdf-engine lualatex --output <output.pdf> <input.md>
    ```

    Replace the placeholders above with your output and input files.

    If you are using a defaults file you can also specify the filter as shown below and avoid specifying it on the command line:

    ```yaml
    filters:
      - fonts-and-alignment.lua
    ```

1. To generate the HTML document you would first download the CSS file like so:

    ```bash
    wget https://github.com/pandoc-ext/fonts-and-alignment/blob/main/specimens/specimen.css
    ```

1. Then execute the following command:

    ```bash
    pandoc --from markdown --to html5 --lua-filter fonts-and-alignment.lua \
    --css <path/to/file/specimen.css> --output <output.html> <input.md>
    ```

    Again, take care to replace the placeholders above with your output, input and CSS files.

Acknowledgements
------------------------------------------------------------------

Special thanks to [Albert Krewinkel](https://github.com/tarleb) and [Benct Philip Jonsson](https://github.com/bpj) for their valuable feedback and suggestions during the development of this filter.

License
------------------------------------------------------------------

This pandoc Lua filter is published under the MIT license, see
file `LICENSE` for details.
