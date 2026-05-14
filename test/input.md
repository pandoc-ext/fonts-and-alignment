---
title: Typographical Engine Matrix
author: Nandakumar Chandrasekhar
date: 2026-05-13
papersize: A4
geometry:
  - margin=25mm
linestretch: 1.25
---

This document acts as an integrated verification specimen for the `fonts-and-alignment` pipeline, demonstrating structural layout adjustments, color dictionaries, text-casing transformations, and inline text decorations.

## 1. Typography Sizing Scale

Standard LaTeX sizing hooks scale dynamically relative to your selected distribution targets:

* [This is the tiny 3xs scale engine.]{.pfa-text-3xs}
* [This is the scriptsize 2xs scale engine.]{.pfa-text-2xs}
* [This is the footnote xs scale engine.]{.pfa-text-xs}
* [This is the small text scale engine.]{.pfa-text-sm}
* [This is the default normal text scale engine.]{.pfa-text-normal}
* [This is the large heading scale engine.]{.pfa-text-lg}
* [This is the xlarge heading scale engine.]{.pfa-text-xl}
* [This is the xxlarge heading scale engine.]{.pfa-text-2xl}
* [This is the huge title scale engine.]{.pfa-text-3xl}

## 2. Weights, Families, and Casing Maps

Font mappings translate cleanly across print environments and browser threads:

* **Weights:** [This block renders using bold weight (700).]{.pfa-font-bold}
* **Families:** [This inline text uses standard system sans-serif metrics.]{.pfa-font-sans}
* **Families:** [This inline string uses standard fixed-width monospace metrics.]{.pfa-font-mono}
* **Casing:** [this phrase is mapped to full uppercase transformations.]{.pfa-uppercase}
* **Casing:** [THIS PHRASE IS MAPPED TO FULL LOWERCASE TRANSFORMATIONS.]{.pfa-lowercase}

## 3. Inline Text Decorations (`ulem` Equivalents)

Advanced decoration components track inline spans strictly without fracturing line loops:

* [Standard continuous underlining baseline hook.]{.pfa-text-uline}
* [Double underline typographical mapping.]{.pfa-text-uline-double}
* [Dashed underline typographical mapping.]{.pfa-text-uline-dashed}
* [Dotted underline typographical mapping.]{.pfa-text-uline-dotted}
* [Wavy underline graphical mapping element.]{.pfa-text-uline-wave}
* [Strikeout line-through processing element.]{.pfa-text-strikeout}

## 4. Color Dictionary Resolution

The dictionary parses named CSS colors and explicit hex strings interchangeably:

* [This inline text block renders in Crimson.]{pfa-color="crimson"}
* [This inline text block renders in Deep Sky Blue.]{pfa-color="deepskyblue"}
* [This inline text block renders via short three-digit hex shorthand (#333).]{pfa-color="#333"}
* [This inline text block renders via long six-digit hex code (#2E8B57).]{pfa-color="#2E8B57"}

## 5. Structural Block Alignments

Block containers leverage `varwidth` environments in LaTeX and table-shrink wrapping in CSS to handle layouts seamlessly:

::: {.pfa-block-left}
**Left-Aligned Shrink Block** This box wraps cleanly to its maximum internal line content bounds
instead of occupying the entire width of the page container.
:::

::: {.pfa-block-center}
**Centered Shrink Block** This structural component automatically centers itself on the page
while preserving left-aligned text justification inside its bounds.
:::

::: {.pfa-block-right}
**Right-Aligned Shrink Block** This component floats gracefully to the right document boundary
while maintaining normal text alignment inside the box.
:::
