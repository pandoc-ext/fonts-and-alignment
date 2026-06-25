---
title: "Test Case: Color Modifications in Fenced Divs"
---

## 1. Standard Color Specifications

This section verifies that the filter processes standard CSS/SVG named keywords and explicit hexadecimal declarations, applying them successfully to Fenced Divs across HTML, LaTeX, and Typst.

### Named CSS/SVG Keywords (`pfa-color="mediumvioletred"`)

Verifies that standard lowercase CSS/SVG named colors are recognized and mapped correctly.

```markdown
::: {pfa-color="mediumvioletred"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="mediumvioletred"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Complete Hexadecimal Declaration (`pfa-color="#239dad"`)

Verifies that full 6-character hex values prefixed with a hash output the expected color.

```markdown
::: {pfa-color="#239dad"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="#239dad"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Shorthand Hexadecimal Declaration (`pfa-color="#F00"`)

Verifies that 3-character compressed hex strings are intercepted, expanded to their full 6-character equivalent (`#FF0000`), and applied.

```markdown
::: {pfa-color="#F00"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="#F00"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

## 2. String Normalization and Sanitation

This section tests the filter's input sanitation, ensuring variations such as spaces, underscores, uppercase letters, or omitted hash prefixes are normalized into valid color values.

### Spaces and Mixed Case (`pfa-color="medium violet red"`)

Verifies that the filter strips spaces and normalizes character casing to resolve the color.

```markdown
::: {pfa-color="medium violet red"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="medium violet red"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Underscores and Uppercase (`pfa-color="MEDIUM_VIOLET_RED"`)

Verifies that snake_case underscore patterns are removed during token resolution.

```markdown
::: {pfa-color="MEDIUM_VIOLET_RED"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="MEDIUM_VIOLET_RED"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Hexadecimal without Hash Prefix (`pfa-color="191970"`)

Verifies that raw 6-character alphanumeric hex strings are processed safely without requiring a leading hash mark.

```markdown
::: {pfa-color="191970"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="191970"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

## 3. Color Mixtures (LaTeX Syntax Engine)

This section verifies that LaTeX-style dynamic color mixing declarations using exclamation marks (`!`) work natively in LaTeX, while being parsed and translated accurately into `color-mix()` for HTML/CSS and `color.mix()` expressions for Typst.

### Tinting (`pfa-color="MediumVioletRed!40!white"`)

Verifies that a base color can be tinted by mixing it with a specified percentage of white.

```markdown
::: {pfa-color="MediumVioletRed!40!white"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="MediumVioletRed!40!white"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Shading (`pfa-color="MediumVioletRed!80!black"`)

Verifies that a base color can be shaded by mixing it with a specified percentage of black.

```markdown
::: {pfa-color="MediumVioletRed!80!black"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="MediumVioletRed!80!black"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Dual-Color Blending (`pfa-color="RoyalBlue!50!ForestGreen"`)

Verifies that two distinct colors can be blended together at a given ratio.

```markdown
::: {pfa-color="RoyalBlue!50!ForestGreen"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="RoyalBlue!50!ForestGreen"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
