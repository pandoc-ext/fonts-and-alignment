---
title: "Test Case: Background Color Modifications in Fenced Divs"
---

## Standard Background Color Specifications

This section verifies that the filter processes standard CSS/SVG named keywords and explicit hexadecimal declarations, applying them successfully as structural block backgrounds across HTML, LaTeX, and Typst.

### Named CSS/SVG Keywords (`pfa-bg-color="mediumvioletred"`)

Verifies that standard lowercase CSS/SVG named colors are recognized and mapped correctly to the background container.

```markdown
::: {pfa-bg-color="mediumvioletred" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-bg-color="mediumvioletred" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Complete Hexadecimal Declaration (`pfa-bg-color="#239dad"`)

Verifies that full 6-character hex values prefixed with a hash output the expected container background fill.

```markdown
::: {pfa-bg-color="#239dad" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-bg-color="#239dad" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Shorthand Hexadecimal Declaration (`pfa-bg-color="#F00"`)

Verifies that 3-character compressed hex strings are intercepted, expanded to their full 6-character equivalent (`#FF0000`), and applied to the container.

```markdown
::: {pfa-bg-color="#F00" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-bg-color="#F00" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

## String Normalization and Sanitation

This section tests the filter's input sanitation, ensuring variations such as spaces, underscores, uppercase letters, or omitted hash prefixes are normalized into valid background color values.

### Spaces and Mixed Case (`pfa-bg-color="medium violet red"`)

Verifies that the filter strips spaces and normalizes character casing to resolve the background color.

```markdown
::: {pfa-bg-color="medium violet red" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-bg-color="medium violet red" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Underscores and Uppercase (`pfa-bg-color="MEDIUM_VIOLET_RED"`)

Verifies that snake_case underscore patterns are removed during token resolution.

```markdown
::: {pfa-bg-color="MEDIUM_VIOLET_RED" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-bg-color="MEDIUM_VIOLET_RED" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Hexadecimal without Hash Prefix (`pfa-bg-color="191970"`)

Verifies that raw 6-character alphanumeric hex strings are processed safely without requiring a leading hash mark.

```markdown
::: {pfa-bg-color="191970" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-bg-color="191970" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

## Background Color Mixtures (LaTeX Syntax Engine)

This section verifies that LaTeX-style dynamic color mixing declarations using exclamation marks (`!`) work natively in LaTeX `tcolorbox` wrappers, while being parsed and translated accurately into `color-mix()` for HTML/CSS and `color.mix()` block fills for Typst.

### Tinting (`pfa-bg-color="MediumVioletRed!40!white"`)

Verifies that a base background color can be tinted by mixing it with a specified percentage of white.

```markdown
::: {pfa-bg-color="MediumVioletRed!40!white" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-bg-color="MediumVioletRed!40!white" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Shading (`pfa-bg-color="MediumVioletRed!80!black"`)

Verifies that a base background color can be shaded by mixing it with a specified percentage of black.

```markdown
::: {pfa-bg-color="MediumVioletRed!80!black" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-bg-color="MediumVioletRed!80!black" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Dual-Color Blending (`pfa-bg-color="RoyalBlue!50!ForestGreen"`)

Verifies that two distinct background colors can be blended together at a given ratio.

```markdown
::: {pfa-bg-color="RoyalBlue!50!ForestGreen" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-bg-color="RoyalBlue!50!ForestGreen" pfa-padding="1em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

## Framework-Specific Palette Targeting

This section verifies the isolation and execution of engine-specific color dictionaries to prevent cross-standard naming collisions.

### Typst Named Palette Override (`pfa-bg-color="typstmaroon"`)

Verifies that a `typst-` prefixed color string correctly bypasses the standard CSS color definition (where CSS maroon is `#800000`) and forces the specific Typst framework hex mapping (`#85144B`) safely across all compiler targets.

```markdown
::: {pfa-bg-color="typstmaroon" pfa-padding="1em" pfa-color="white"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-bg-color="typstmaroon" pfa-padding="1em" pfa-color="white"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

## Border and Radius Modifications

This section verifies the filter's ability to apply stroke/border widths, border colors, and corner radii to structural block containers (Fenced Divs) to create modern callout cards.

### Standard Border Styling (`pfa-bg-border-width`, `pfa-bg-border-color`)

Verifies that a solid, uniform border is applied around the entire block container using absolute point units (`pt`) and standard color names.

```markdown
::: {pfa-bg-color="ghostwhite" pfa-padding="1em" pfa-bg-border-width="2pt" pfa-bg-border-color="navy"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-bg-color="ghostwhite" pfa-padding="1em" pfa-bg-border-width="2pt" pfa-bg-border-color="navy"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Rounded Corners (`pfa-bg-radius`)

Verifies that corner radii apply evenly to all four corners of the block container using relative typography units (`em`).

```markdown
::: {pfa-bg-color="lightgray" pfa-padding="1em" pfa-bg-radius="0.5em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-bg-color="lightgray" pfa-padding="1em" pfa-bg-radius="0.5em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Combined Callout Card Effect

Verifies the simultaneous processing of background fill, text color, padding, border width, border color, and border radius to create a unified structural callout card.

```markdown
::: {pfa-bg-color="aliceblue" pfa-color="navy" pfa-padding="1.5em" pfa-bg-border-width="1pt" pfa-bg-border-color="steelblue" pfa-bg-radius="0.5em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-bg-color="aliceblue" pfa-color="navy" pfa-padding="1.5em" pfa-bg-border-width="1pt" pfa-bg-border-color="steelblue" pfa-bg-radius="0.5em"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
