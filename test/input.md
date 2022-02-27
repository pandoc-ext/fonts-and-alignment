---
title: Fonts and Alignment Lua Filter Sample Outputs
author: Nandakumar Chandrasekhar
date: 2022-02-22
papersize: A4
geometry:
  - margin=25mm
fontsize: 12pt
mainfont: Noto Serif
sansfont: Noto Sans
monofont: Fira Mono
linkcolor: blue
linestretch: 1.25
---
## Font Styles for Inline Elements

### Bold Font Inline

[This text should be in bold.]{.bold} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Emphasis Inline

[This text should have emphasis.]{.emphasis} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Italic Font Inline

[This text should be in italic.]{.italic} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Lowercase Inline

[This text should be in lowercase.]{.lower} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Medium Font Inline

::: bold
[This text should be in medium weight.]{.medium} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua
:::

### Monospace Font Inline

[This text should be in monospace.]{.monospace} Lorem ipsum dolor sit
amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua.

### Normal Font Inline

::: italic
[This text should be in normal font.]{.normalfont} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.
:::

### Sans-serif Font Inline

[This text should be in sans-serif.]{.sans} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Serif Font Inline

[This text should be in serif.]{.serif} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Slanted Font Inline

[This text should be slanted.]{.slanted} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Small Capitals Font Inline

[This text should be in small capitals.]{.smallcaps} Lorem ipsum dolor
sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua.

### Uppercase Font Inline

[This text should be in uppercase.]{.upper} Lorem ipsum dolor
sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua.

### Upright Font Inline

:::italic
[This text should be upright.]{.upright} Lorem ipsum dolor
sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua.
:::

### Font Style for Links

Font Styles           Output
-------------------   -------------------------------------------
Bold Font             [GitHub Homepage](https://github.com){.bf}
Emphasis Font         [GitHub Homepage](https://github.com){.em}
Italic Font           [GitHub Homepage](https://github.com){.it}
Lowercase Font        [GitHub Homepage](https://github.com){.lower}
Medium Font           [GitHub Homepage](https://github.com){.md}
Monospace Font        [GitHub Homepage](https://github.com){.tt}
Normal Font           [GitHub Homepage](https://github.com){.nf}
Sans-serif Font       [GitHub Homepage](https://github.com){.sf}
Serif Font            [GitHub Homepage](https://github.com){.rm}
Slanted Font          [GitHub Homepage](https://github.com){.sl}
Small Capitals Font   [GitHub Homepage](https://github.com){.sc}
Uppercase Font        [GitHub Homepage](https://github.com){.upper}
Upright Font          [GitHub Homepage](https://github.com){.up}

## Font sizes for Inline Elements

### Tiny Size Font Inline

[This test should be in tiny size.]{.tiny} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Extra Extra Small Size Font Inline

[This text should be in extra extra small size.]{.xxsmall} Lorem ipsum dolor
sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua.

### Extra Small Size Font Inline

[This text should be in extra small size.]{.xsmall} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Small Size Font Inline

[This text should be in small size.]{.small} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Normal Size Font Inline

[This text should be in normal size.]{.normal} Lorem ipsum dolor sit
amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua.

### Large Size Font Inline

[This text should be in large size.]{.large} Lorem ipsum dolor sit amet,
consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua.

### Extra Large Size Font Inline

[This text should be in extra large size.]{.xlarge} Lorem ipsum dolor
sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua.

### Extra Extra Large Size Font Inline

[This text should be in extra extra large size.]{.xxlarge} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Huge Size Font Inline

[This text should be in huge size.]{.huge} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

## Combination Styles for Inline Elements

### Small Capitals, Bold and Italic for Inline

[This text should be small capitals, bold and italic.]{.sc .bf .it}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.

### Monospace, Extra Small Text and Bold for Inline

[This text should be in monospace, extra small size and bold.]{.tt
.xsmall .bf} Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### Sans-serif and Italic for Inline

[This text should be in sans-serif and italic.]{.sf .it} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

## Styles Provided by the `ulem` LaTeX Package

### Dashed Underline Text

[This text should be dashed underlined.]{.dashuline} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Dotted Underline Text

[This text should be dotted underlined.]{.dotuline} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Underlined Text

[This text should be underlined.]{.uline} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Double Underlined Text

[This text should be double underlined.]{.uuline} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Wavy Underlined Text

[This text should be wavy underlined.]{.uwave} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Stricken Out Text

[This text should be stricken out.]{.sout} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

### Marked Over Text (not supported in HTML)

[This text should be marked over.]{.xout} Lorem ipsum
dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua.

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
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Italic Font Block

::: italic
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Medium Font Block

::: medium
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Monospace Font Block

::: monospace
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Normal Font Block

::: normalfont
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Sans-serif Font Block

::: sans
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Serif Font Block

::: serif
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Slanted Font Block

::: slanted
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Small Capitals Font Block

::: smallcaps
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Upright Font Block

::: upright
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

## Font sizes for Block Elements

### Tiny Size Font Block

::: tiny
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Extra Extra Small Size Font Block

::: xxsmall
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Extra Small Size Font Block

::: xsmall
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Small Size Font Block

::: small
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Normal Size Font Block

::: normal
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Large Size Font Block

::: large
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Extra Large Size Font Block

::: xlarge
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident
:::

### Extra Extra Large Size Font Block

::: xxlarge
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex.
:::

### Huge Size Font Block

::: huge
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex.
:::

## Combination Styles for Block Elements

### Small Capitals, Bold and Italic for Blocks

::: {.sc .bf .it}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident
:::

### Monospace, Extra Small Text and Bold for Blocks

::: {.tt .xsmall .bf}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident
:::

### Right Justified, Sans-serif and Italic for Blocks

::: {.flushright .sf .it}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident
:::

## Layouts for Block Elements

### Centered Block

::: center
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Left Justified Block

::: flushleft
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Right Justified Block

::: flushright
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia deserunt
mollit anim id est laborum.
:::

### Centered Block with User-defined Line Breaks

::: centering
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
:::

### Left Justified Block with User-defined Line Breaks

::: raggedright
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
:::

### Right Justified Block with User-defined Line Breaks

::: raggedleft
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
:::
