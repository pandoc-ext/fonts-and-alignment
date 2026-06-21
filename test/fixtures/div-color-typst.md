---
title: "Test Case: Typst Native Color Spaces"
---

## Native Typst Functional Color Spaces

This section tests all 9 native Typst color space expressions. These flow through raw to the Typst compiler, convert directly to modern W3C definitions for HTML/CSS, or compute exact numerical matrices for LaTeX targets.

### Perceptually Uniform Oklch Space (`pfa-color="oklch(60%, 0.15, 180deg)"`)

Verifies that native cylindrical uniform Lightness, Chroma, and Hue space properties evaluate correctly.

```markdown
::: {pfa-color="oklch(60%, 0.15, 180deg)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="oklch(60%, 0.15, 180deg)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Perceptually Uniform Oklab Space (`pfa-color="oklab(50%, -0.1, 0.2)"`)

Verifies that native rectangular uniform coordinate expressions pass securely.

```markdown
::: {pfa-color="oklab(50%, -0.1, 0.2)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="oklab(50%, -0.1, 0.2)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Cylindrical Hsl Space (`pfa-color="color.hsl(210deg, 80%, 50%)"`)

Verifies standard cylindrical Hue, Saturation, and Lightness function calls.

```markdown
::: {pfa-color="color.hsl(210deg, 80%, 50%)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="color.hsl(210deg, 80%, 50%)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Cylindrical Hsv Space (`pfa-color="color.hsv(340deg, 70%, 90%)"`)

Verifies standard Hue, Saturation, and Value formatting properties.

```markdown
::: {pfa-color="color.hsv(340deg, 70%, 90%)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="color.hsv(340deg, 70%, 90%)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Grayscale Luma Space (`pfa-color="luma(40%)"`)

Verifies grayscale brightness channel calculation performance.

```markdown
::: {pfa-color="luma(40%)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="luma(40%)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Subtractive Cmyk Space (`pfa-color="cmyk(10%, 20%, 30%, 5%)"`)

Verifies standard subtractive print channels (Cyan, Magenta, Yellow, Key).

```markdown
::: {pfa-color="cmyk(10%, 20%, 30%, 5%)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="cmyk(10%, 20%, 30%, 5%)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Linear RGB Space (`pfa-color="color.linear-rgb(30%, 50%, 80%)"`)

Verifies processing of un-gamma-corrected color coordinates.

```markdown
::: {pfa-color="color.linear-rgb(30%, 50%, 80%)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="color.linear-rgb(30%, 50%, 80%)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Spot Color Channels (`pfa-color='color.spot("typst-brand", rgb("#239dad")).tint(100%)'`)

Verifies structural handling of specialized printing channels with custom tint parameters.

```markdown
::: {pfa-color='color.spot("typst-brand", rgb("#239dad")).tint(100%)'}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color='color.spot("typst-brand", rgb("#239dad")).tint(100%)'}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Standard Functional RGB (`pfa-color="rgb(35, 157, 173)"`)

Verifies basic function parameter notation handling.

```markdown
::: {pfa-color="rgb(35, 157, 173)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="rgb(35, 157, 173)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

## Typst Native Methods & Custom Extensions

This section verifies advanced inline chained routines and programmatic ecosystem components—such as your `niram-css` package syntax wrapper block.

### Typst Darken Function (`pfa-color="blue.darken(20%)"`)

Verifies that native object utility modifications process cleanly.

```markdown
::: {pfa-color="blue.darken(20%)'}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="blue.darken(20%)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Typst Lighten Function (`pfa-color="blue.lighten(40%)"`)

Verifies native object brightness expansion parameters.

```markdown
::: {pfa-color="blue.lighten(40%)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="blue.lighten(40%)"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Typst Multi-Color Mix Engine (`pfa-color="color.mix((blue, 40%), (red, 60%))"`)

Verifies nested functional compound arrays.

```markdown
::: {pfa-color="color.mix((blue, 40%), (red, 60%))"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {pfa-color="color.mix((blue, 40%), (red, 60%))"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
