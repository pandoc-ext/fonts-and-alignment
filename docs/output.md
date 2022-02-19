---
author: Nandakumar Chandrasekhar
date: 2022-02-19
fontsize: 12pt
geometry:
- margin=25mm
header-includes: |
  ```{=tex}
  \usepackage{hyperref}
  \defaultfontfeatures{Scale=MatchLowercase}
  ```
linestretch: 1.25
mainfont: Noto Serif
mainfontoptions:
- Scale=1.0
monofont: Fira Mono
papersize: letter
sansfont: Noto Sans
title: Fonts and Alignment Lua Filter Example Styling
---

```{=tex}
\usepackage{hyperref}
\defaultfontfeatures{Scale=MatchLowercase}
```

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
[`\Large `{=latex}Lorem Ipsum]{.xlarge}

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

### Right Justified Block with User-defined Line Breaks

::: raggedleft
```{=latex}
\begin{raggedleft}
```
[`\Large `{=latex}Lorem Ipsum]{.xlarge}

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

### Left Justified Block with User-defined Line Breaks

::: raggedright
```{=latex}
\begin{raggedright}
```
[`\Large `{=latex}Lorem Ipsum]{.xlarge}

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

## Font Styles for Block Elements

### Bold Font Block

::: bold
```{=latex}
\begin{bfseries}
```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.

```{=latex}
\end{bfseries}
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

## Font sizes for Block Elements

### Extra Extra Small Font Block

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

### Extra Small Font Block

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

### Small Font Block

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

### Normal Font Block

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

### Large Font Block

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

### Extra Large Font Block

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

### Extra Extra Large Font Block

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

## Font Styles for Inline Elements

### Bold Font Inline

[`\textbf{`{=latex}This text should be in bold.`}`{=latex}]{.bold} Lorem
ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Italic Font Inline

[`\textit{`{=latex}This text should be in italic.`}`{=latex}]{.italic}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Monospace Font Inline

[`\texttt{`{=latex}This text should be in
monospace.`}`{=latex}]{.monospace} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Sans-serif Font Inline

[`\textsf{`{=latex}This text should be in sans-serif.`}`{=latex}]{.sans}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Serif Font Inline

[`\textrm{`{=latex}This text should be in serif.`}`{=latex}]{.serif}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Small Capitals Font Inline

[This text should be in small capitals.]{.smallcaps} Lorem ipsum dolor
sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua.

## Font sizes for Inline Elements

### Extra Extra Small Font Inline

[`\scriptsize `{=latex}This test should be extra extra small
size.]{.xxsmall} Lorem ipsum dolor sit amet, consectetur adipiscing
elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### Extra Small Font Inline

[`\footnotesize `{=latex}This text should be in extra small
size.]{.xsmall} Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### Small Font Inline

[`\small `{=latex}This text should be in small size.]{.small} Lorem
ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Normal Font Inline

[`\normalsize `{=latex}This text should be in normal size.]{.normal}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Large Font Inline

[`\large `{=latex}This text should be in large size.]{.large} Lorem
ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Extra Large Font Inline

[`\Large `{=latex}This text should be in extra large size.]{.xlarge}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Extra Extra Large Font Inline

[`\LARGE `{=latex}This text should be in extra extra large
size.]{.xxlarge} Lorem ipsum dolor sit amet, consectetur adipiscing
elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
