---
author: Nandakumar Chandrasekhar
date: 2022-02-09
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
- BoldFont=\* Semibold
monofont: Fira Mono
monofontoptions:
- BoldFont=\* Bold
papersize: letter
sansfont: Noto Sans
sansfontoptions:
- BoldFont=\* Semibold
title: Fonts and Alignment for Pandoc Generated Documents
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

### Centered Block with User-defined Line Breaks

::: centering
```{=latex}
\begin{centering}
```
Three Rings for the Elven-kings under the sky,\
Seven for the Dwarf-lords in their halls of stone,\
Nine for Mortal Men doomed to die,\
One for the Dark Lord on his dark throne\
In the Land of Mordor where the Shadows lie.\
One Ring to rule them all, One Ring to find them,\
One Ring to bring them all, and in the darkness bind them,\
In the Land of Mordor where the Shadows lie.\

```{=latex}
\end{centering}
```
:::

### Right Justified Block with User-defined Line Breaks

::: raggedleft
```{=latex}
\begin{raggedleft}
```
Three Rings for the Elven-kings under the sky,\
Seven for the Dwarf-lords in their halls of stone,\
Nine for Mortal Men doomed to die,\
One for the Dark Lord on his dark throne\
In the Land of Mordor where the Shadows lie.\
One Ring to rule them all, One Ring to find them,\
One Ring to bring them all, and in the darkness bind them,\
In the Land of Mordor where the Shadows lie.\

```{=latex}
\end{raggedleft}
```
:::

### Left Justified Block with User-defined Line Breaks

::: raggedright
```{=latex}
\begin{raggedright}
```
Three Rings for the Elven-kings under the sky,\
Seven for the Dwarf-lords in their halls of stone,\
Nine for Mortal Men doomed to die,\
One for the Dark Lord on his dark throne\
In the Land of Mordor where the Shadows lie.\
One Ring to rule them all, One Ring to find them,\
One Ring to bring them all, and in the darkness bind them,\
In the Land of Mordor where the Shadows lie.\

```{=latex}
\end{raggedright}
```
:::

## Font Styles for Block Elements

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

### Sans-serif Font Inline

[`\sffamily `{=latex}This text should be in sans-serif font even if that
is not the default font.]{.sans} Lorem ipsum dolor sit amet, consectetur
adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
magna aliqua.

### Serif Font Inline

[`\rmfamily `{=latex}This text should be in serif font even if that is
not the default font.]{.serif} Lorem ipsum dolor sit amet, consectetur
adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
magna aliqua.

### Monospace Font Inline

[`\ttfamily `{=latex}This text should be in monospace.]{.monospace}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Slanted Font Inline

[`\slshape `{=latex}This text should be slanted.]{.slanted} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Italic Font Inline

[`\itshape `{=latex}This text should be in italic.]{.italic} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Bold Weight Inline

[`\bfseries `{=latex}This text should be in Bold.]{.bold} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

**Pandoc already provides and inline smallcaps font style hence, it is
not implemented by this plugin.**

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
