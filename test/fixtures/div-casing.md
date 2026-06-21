---
title: "Test Case: Text Casing Transformations in Fenced Divs"
---

## Pure Text Character Case Conversions

This section verifies that applying casing utility classes (`.pfa-case-upper` and `.pfa-case-lower`) to a Fenced Div block successfully processes the underlying text string array, forcing all plain text elements to transform into the targeted case during compilation.

### Uppercase Transformation (`.pfa-case-upper`)

Verifies that lowercase string payloads wrapped inside the Fenced Div are fully transformed into standard uppercase text.

```markdown
::: {.pfa-case-upper}
lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-case-upper}
lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Lowercase Transformation (`.pfa-case-lower`)

Verifies that uppercase string payloads wrapped inside the Fenced Div are fully transformed into standard lowercase text.

```markdown
::: {.pfa-case-lower}
LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA.
:::
```

::: {.pfa-case-lower}
LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA.
:::

## Mixed Rich Text Structural Integrity Verification

This section ensures that when text modifications are executed across a Fenced Div, nested inline formatting elements (such as bold markers, italic styling, and hyperlinks) have their internal text cases modified perfectly without dropping, breaking, or striping out their underlying markdown formatting wrappers.

```markdown
::: {.pfa-case-upper}
This text block contains **strong elements**, *emphasized elements*, and a [hyperlink mapping block](https://example.com).
:::
```

::: {.pfa-case-upper}
This text block contains **strong elements**, *emphasized elements*, and a [hyperlink mapping block](https://example.com).
:::
