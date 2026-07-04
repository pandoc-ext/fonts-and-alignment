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
