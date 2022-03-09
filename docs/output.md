---
author: Nandakumar Chandrasekhar
date: 2022-02-22
fontsize: 12pt
geometry:
- margin=25mm
linestretch: 1.25
linkcolor: blue
mainfont: Noto Serif
monofont: Fira Mono
papersize: A4
sansfont: Noto Sans
title: Fonts and Alignment Lua Filter Sample Outputs
---

## Font Styles for Inline Elements

### Bold Font Inline

[`\textbf{`{=latex}This text should be in bold.`}`{=latex}]{.bold} Lorem
ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Emphasis Inline

[`\emph{`{=latex}This text should have emphasis.`}`{=latex}]{.emphasis}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Italic Font Inline

[`\textit{`{=latex}This text should be in italic.`}`{=latex}]{.italic}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Lowercase Inline

[`\lowercase{`{=latex}This text should be in
lowercase.`}`{=latex}]{.lower} Lorem ipsum dolor sit amet, consectetur
adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
magna aliqua.

### Medium Font Inline

::: bold
```{=latex}
\begin{bfseries}
```
[`\textmd{`{=latex}This text should be in medium
weight.`}`{=latex}]{.medium} Lorem ipsum dolor sit amet, consectetur
adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
magna aliqua

```{=latex}
\end{bfseries}
```
:::

### Monospace Font Inline

[`\texttt{`{=latex}This text should be in
monospace.`}`{=latex}]{.monospace} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Normal Font Inline

::: italic
```{=latex}
\begin{itshape}
```
[`\textnormal{`{=latex}This text should be in normal
font.`}`{=latex}]{.normalfont} Lorem ipsum dolor sit amet, consectetur
adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
magna aliqua.

```{=latex}
\end{itshape}
```
:::

### Sans-serif Font Inline

[`\textsf{`{=latex}This text should be in sans-serif.`}`{=latex}]{.sans}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Serif Font Inline

[`\textrm{`{=latex}This text should be in serif.`}`{=latex}]{.serif}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Slanted Font Inline

[`\textsl{`{=latex}This text should be slanted.`}`{=latex}]{.slanted}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Small Capitals Font Inline

[This text should be in small capitals.]{.smallcaps} Lorem ipsum dolor
sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua.

### Uppercase Font Inline

[`\uppercase{`{=latex}This text should be in
uppercase.`}`{=latex}]{.upper} Lorem ipsum dolor sit amet, consectetur
adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
magna aliqua.

### Upright Font Inline

::: italic
```{=latex}
\begin{itshape}
```
[`\textup{`{=latex}This text should be upright.`}`{=latex}]{.upright}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

```{=latex}
\end{itshape}
```
:::

### Font Style for Links

  Font Styles           Output
  --------------------- -------------------------------------------------------------------------------
  Bold Font             [`\textbf{`{=latex}GitHub Homepage`}`{=latex}](https://github.com){.bf}
  Emphasis Font         [`\emph{`{=latex}GitHub Homepage`}`{=latex}](https://github.com){.em}
  Italic Font           [`\textit{`{=latex}GitHub Homepage`}`{=latex}](https://github.com){.it}
  Lowercase Font        [`\lowercase{`{=latex}GitHub Homepage`}`{=latex}](https://github.com){.lower}
  Medium Font           [`\textmd{`{=latex}GitHub Homepage`}`{=latex}](https://github.com){.md}
  Monospace Font        [`\texttt{`{=latex}GitHub Homepage`}`{=latex}](https://github.com){.tt}
  Normal Font           [`\textnormal{`{=latex}GitHub Homepage`}`{=latex}](https://github.com){.nf}
  Sans-serif Font       [`\textsf{`{=latex}GitHub Homepage`}`{=latex}](https://github.com){.sf}
  Serif Font            [`\textrm{`{=latex}GitHub Homepage`}`{=latex}](https://github.com){.rm}
  Slanted Font          [`\textsl{`{=latex}GitHub Homepage`}`{=latex}](https://github.com){.sl}
  Small Capitals Font   [`\textsc{`{=latex}GitHub Homepage`}`{=latex}](https://github.com){.sc}
  Uppercase Font        [`\uppercase{`{=latex}GitHub Homepage`}`{=latex}](https://github.com){.upper}
  Upright Font          [`\textup{`{=latex}GitHub Homepage`}`{=latex}](https://github.com){.up}

## Font sizes for Inline Elements

### Tiny Size Font Inline

[`\tiny `{=latex}This text should be in tiny size.]{.tiny} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Extra Extra Small Size Font Inline

[`\scriptsize `{=latex}This text should be in extra extra small
size.]{.xxsmall} Lorem ipsum dolor sit amet, consectetur adipiscing
elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### Extra Small Size Font Inline

[`\footnotesize `{=latex}This text should be in extra small
size.]{.xsmall} Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### Small Size Font Inline

[`\small `{=latex}This text should be in small size.]{.small} Lorem
ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Normal Size Font Inline

[`\normalsize `{=latex}This text should be in normal size.]{.normal}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Large Size Font Inline

[`\large `{=latex}This text should be in large size.]{.large} Lorem
ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Extra Large Size Font Inline

[`\Large `{=latex}This text should be in extra large size.]{.xlarge}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Extra Extra Large Size Font Inline

[`\LARGE `{=latex}This text should be in extra extra large
size.]{.xxlarge} Lorem ipsum dolor sit amet, consectetur adipiscing
elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### Huge Size Font Inline

[`\huge `{=latex}This text should be in huge size.]{.huge} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

## Combination Styles for Inline Elements

### Small Capitals, Bold and Italic for Inline

[`\textsc{`{=latex}`\textbf{`{=latex}`\textit{`{=latex}This text should
be small capitals, bold and
italic.`}`{=latex}`}`{=latex}`}`{=latex}]{.sc .bf .it} Lorem ipsum dolor
sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua.

### Monospace, Extra Small Text and Bold for Inline

[`\texttt{`{=latex}`\footnotesize `{=latex}`\textbf{`{=latex}This text
should be in monospace, extra small size and
bold.`}`{=latex}`}`{=latex}]{.tt .xsmall .bf} Lorem ipsum dolor sit
amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua.

### Sans-serif and Italic for Inline

[`\textsf{`{=latex}`\textit{`{=latex}This text should be in sans-serif
and italic.`}`{=latex}`}`{=latex}]{.sf .it} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

## Styles Provided by the `ulem` LaTeX Package

### Dashed Underline Text

[This text should be dashed underlined.]{.dashuline} Lorem ipsum dolor
sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua.

### Dotted Underline Text

[This text should be dotted underlined.]{.dotuline} Lorem ipsum dolor
sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua.

### Underlined Text

[This text should be underlined.]{.uline} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Double Underlined Text

[This text should be double underlined.]{.uuline} Lorem ipsum dolor sit
amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua.

### Wavy Underlined Text

[This text should be wavy underlined.]{.uwave} Lorem ipsum dolor sit
amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua.

### Stricken Out Text

[This text should be stricken out.]{.sout} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Marked Over Text (not supported in HTML)

[This text should be marked over.]{.xout} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

## Font Styles for Block Elements

### Bold Font Block

::: .bold
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Emphasis Font Block

::: emphasis
```{=latex}
\begin{em}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{em}
```
:::

### Italic Font Block

::: italic
```{=latex}
\begin{itshape}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{itshape}
```
:::

### Medium Font Block

::: medium
```{=latex}
\begin{mdseries}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{mdseries}
```
:::

### Monospace Font Block

::: monospace
```{=latex}
\begin{ttfamily}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{ttfamily}
```
:::

### Normal Font Block

::: normalfont
```{=latex}
\begin{normalfont}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{normalfont}
```
:::

### Sans-serif Font Block

::: sans
```{=latex}
\begin{sffamily}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{sffamily}
```
:::

### Serif Font Block

::: serif
```{=latex}
\begin{rmfamily}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{rmfamily}
```
:::

### Slanted Font Block

::: slanted
```{=latex}
\begin{slshape}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{slshape}
```
:::

### Small Capitals Font Block

::: smallcaps
```{=latex}
\begin{scshape}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{scshape}
```
:::

### Upright Font Block

::: upright
```{=latex}
\begin{upshape}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{upshape}
```
:::

## Font sizes for Block Elements

### Tiny Size Font Block

::: tiny
```{=latex}
\begin{tiny}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{tiny}
```
:::

### Extra Extra Small Size Font Block

::: xxsmall
```{=latex}
\begin{scriptsize}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{scriptsize}
```
:::

### Extra Small Size Font Block

::: xsmall
```{=latex}
\begin{footnotesize}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{footnotesize}
```
:::

### Small Size Font Block

::: small
```{=latex}
\begin{small}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{small}
```
:::

### Normal Size Font Block

::: normal
```{=latex}
\begin{normalsize}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{normalsize}
```
:::

### Large Size Font Block

::: large
```{=latex}
\begin{large}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{large}
```
:::

### Extra Large Size Font Block

::: xlarge
```{=latex}
\begin{Large}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident

```{=latex}
\end{Large}
```
:::

### Extra Extra Large Size Font Block

::: xxlarge
```{=latex}
\begin{LARGE}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex.

```{=latex}
\end{LARGE}
```
:::

### Huge Size Font Block

::: huge
```{=latex}
\begin{huge}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex.

```{=latex}
\end{huge}
```
:::

## Combination Styles for Block Elements

### Small Capitals, Bold and Italic for Blocks

::: {.sc .bf .it}
```{=latex}
\begin{scshape}
```
```{=latex}
\begin{bfseries}
```
```{=latex}
\begin{itshape}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident

```{=latex}
\end{itshape}
```
```{=latex}
\end{bfseries}
```
```{=latex}
\end{scshape}
```
:::

### Monospace, Extra Small Text and Bold for Blocks

::: {.tt .xsmall .bf}
```{=latex}
\begin{ttfamily}
```
```{=latex}
\begin{footnotesize}
```
```{=latex}
\begin{bfseries}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident

```{=latex}
\end{bfseries}
```
```{=latex}
\end{footnotesize}
```
```{=latex}
\end{ttfamily}
```
:::

### Right Justified, Sans-serif and Italic for Blocks

::: {.flushright .sf .it}
```{=latex}
\begin{flushright}
```
```{=latex}
\begin{sffamily}
```
```{=latex}
\begin{itshape}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident

```{=latex}
\end{itshape}
```
```{=latex}
\end{sffamily}
```
```{=latex}
\end{flushright}
```
:::

## Layouts for Block Elements

### Centered Block

::: center
```{=latex}
\begin{center}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{center}
```
:::

### Left Justified Block

::: flushleft
```{=latex}
\begin{flushleft}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{flushleft}
```
:::

### Right Justified Block

::: flushright
```{=latex}
\begin{flushright}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{flushright}
```
:::

### Centered Block with User-defined Line Breaks

::: centering
```{=latex}
\begin{centering}
```
Lorem ipsum dolor sit amet, consectetur\
adipiscing elit, sed do eiusmod\
tempor incididunt ut labore et dolore\
magna aliqua. Ut enim ad minim\
veniam, quis nostrud exercitation ullamco\
laboris nisi ut aliquip ex ea\
commodo consequat. Duis aute irure\
dolor in reprehenderit in voluptate\
velit esse cillum dolore eu fugiat\
nulla pariatur. Excepteur sint\
occaecat cupidatat non proident,\
sunt in culpa qui officia deserunt\
mollit anim id est laborum.

```{=latex}
\end{centering}
```
:::

### Left Justified Block with User-defined Line Breaks

::: raggedright
```{=latex}
\begin{raggedright}
```
Lorem ipsum dolor sit amet, consectetur\
adipiscing elit, sed do eiusmod\
tempor incididunt ut labore et dolore\
magna aliqua. Ut enim ad minim\
veniam, quis nostrud exercitation ullamco\
laboris nisi ut aliquip ex ea\
commodo consequat. Duis aute irure\
dolor in reprehenderit in voluptate\
velit esse cillum dolore eu fugiat\
nulla pariatur. Excepteur sint\
occaecat cupidatat non proident,\
sunt in culpa qui officia deserunt\
mollit anim id est laborum.

```{=latex}
\end{raggedright}
```
:::

### Right Justified Block with User-defined Line Breaks

::: raggedleft
```{=latex}
\begin{raggedleft}
```
Lorem ipsum dolor sit amet, consectetur\
adipiscing elit, sed do eiusmod\
tempor incididunt ut labore et dolore\
magna aliqua. Ut enim ad minim\
veniam, quis nostrud exercitation ullamco\
laboris nisi ut aliquip ex ea\
commodo consequat. Duis aute irure\
dolor in reprehenderit in voluptate\
velit esse cillum dolore eu fugiat\
nulla pariatur. Excepteur sint\
occaecat cupidatat non proident,\
sunt in culpa qui officia deserunt\
mollit anim id est laborum.

```{=latex}
\end{raggedleft}
```
:::
