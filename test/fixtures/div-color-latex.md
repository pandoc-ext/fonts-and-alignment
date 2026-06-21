---
title: "Test Case: LaTeX Color Mixing in Fenced Divs"
---

## Color Mixtures (LaTeX Syntax Engine)

This section verifies that LaTeX-style dynamic color mixing declarations using exclamation marks (`!`) work natively in LaTeX, while being parsed and translated accurately into `color-mix()` for HTML/CSS and `color.mix()` expressions for Typst.

### Tinting (`pfa-color="MediumVioletRed!40!white"`)

Verifies that a base color can be tinted by mixing it with a specified percentage of white.

```markdown
::: {pfa-color="MediumVioletRed!40!white"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="MediumVioletRed!40!white"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Shading (`pfa-color="MediumVioletRed!80!black"`)

Verifies that a base color can be shaded by mixing it with a specified percentage of black.

```markdown
::: {pfa-color="MediumVioletRed!80!black"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="MediumVioletRed!80!black"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Dual-Color Blending (`pfa-color="RoyalBlue!50!ForestGreen"`)

Verifies that two distinct colors can be blended together at a given ratio.

```markdown
::: {pfa-color="RoyalBlue!50!ForestGreen"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="RoyalBlue!50!ForestGreen"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
