---
title: "Test Case: Background Color Modifications in Bracketed Spans"
---

## Standard Background Color Specifications

This section verifies that the filter processes named CSS/SVG keywords and explicit hexadecimal declarations for background fills on inline Bracketed Spans. We include `pfa-padding="0.2em 0.4em"` to ensure the background fill renders with proper spacing around inline text.

### Named CSS/SVG Keywords (`pfa-bg-color="mediumvioletred"`)

Verifies that named color keywords are correctly mapped to inline background highlights.

```markdown
The quick [brown fox jumps]{pfa-bg-color="mediumvioletred" pfa-padding="0.2em 0.4em"} over the lazy dog.
```

The quick [brown fox jumps]{pfa-bg-color="mediumvioletred" pfa-padding="0.2em 0.4em"} over the lazy dog.

### Complete Hexadecimal Declaration (`pfa-bg-color="#239dad"`)

Verifies that full 6-character hex values output the expected background highlight.

```markdown
The quick [brown fox jumps]{pfa-bg-color="#239dad" pfa-padding="0.2em 0.4em"} over the lazy dog.
```

The quick [brown fox jumps]{pfa-bg-color="#239dad" pfa-padding="0.2em 0.4em"} over the lazy dog.

### Shorthand Hexadecimal Declaration (`pfa-bg-color="#F00"`)

Verifies that 3-character hex strings are expanded to their 6-character equivalent and applied as an inline fill.

```markdown
The quick [brown fox jumps]{pfa-bg-color="#F00" pfa-padding="0.2em 0.4em"} over the lazy dog.
```

The quick [brown fox jumps]{pfa-bg-color="#F00" pfa-padding="0.2em 0.4em"} over the lazy dog.

## String Normalization and Sanitation

This section tests the filter's inline token validation, ensuring that variations in string formatting are normalized.

### Spaces and Mixed Case (`pfa-bg-color="medium violet red"`)

Verifies that the filter strips internal spaces and standardizes character casing.

```markdown
The quick [brown fox jumps]{pfa-bg-color="medium violet red" pfa-padding="0.2em 0.4em"} over the lazy dog.

```

The quick [brown fox jumps]{pfa-bg-color="medium violet red" pfa-padding="0.2em 0.4em"} over the lazy dog.

### Underscores and Uppercase (`pfa-bg-color="MEDIUM_VIOLET_RED"`)

Verifies that snake_case underscore patterns are removed during token resolution.

```markdown
The quick [brown fox jumps]{pfa-bg-color="MEDIUM_VIOLET_RED" pfa-padding="0.2em 0.4em"} over the lazy dog.
```

The quick [brown fox jumps]{pfa-bg-color="MEDIUM_VIOLET_RED" pfa-padding="0.2em 0.4em"} over the lazy dog.

### Hexadecimal without Hash Prefix (`pfa-bg-color="191970"`)

Verifies that raw 6-character alphanumeric hex strings resolve safely.

```markdown
The quick [brown fox jumps]{pfa-bg-color="191970" pfa-padding="0.2em 0.4em"} over the lazy dog.
```

The quick [brown fox jumps]{pfa-bg-color="191970" pfa-padding="0.2em 0.4em"} over the lazy dog.

## Background Color Mixtures (LaTeX Syntax Engine)

This section specifies dynamic inline color mixing for backgrounds using exclamation marks (`!`).

### Tinting (`pfa-bg-color="MediumVioletRed!40!white"`)

Verifies inline background mixing with white components to execute relative tinting effects.

```markdown
The quick [brown fox jumps]{pfa-bg-color="MediumVioletRed!40!white" pfa-padding="0.2em 0.4em"} over the lazy dog.
```

The quick [brown fox jumps]{pfa-bg-color="MediumVioletRed!40!white" pfa-padding="0.2em 0.4em"} over the lazy dog.

### Shading (`pfa-bg-color="MediumVioletRed!80!black"`)

Verifies inline background mixing with black components to execute shading properties.

```markdown
The quick [brown fox jumps]{pfa-bg-color="MediumVioletRed!80!black" pfa-padding="0.2em 0.4em"} over the lazy dog.
```

The quick [brown fox jumps]{pfa-bg-color="MediumVioletRed!80!black" pfa-padding="0.2em 0.4em"} over the lazy dog.

### Dual-Color Blending (`pfa-bg-color="RoyalBlue!50!ForestGreen"`)

Verifies cross-compilation execution when blending two named colors for the inline background fill.

```markdown
The quick [brown fox jumps]{pfa-bg-color="RoyalBlue!50!ForestGreen" pfa-padding="0.2em 0.4em"} over the lazy dog.
```

The quick [brown fox jumps]{pfa-bg-color="RoyalBlue!50!ForestGreen" pfa-padding="0.2em 0.4em"} over the lazy dog.

## Framework-Specific Palette Targeting

### Typst Named Palette Override (`pfa-bg-color="typstmaroon"`)

Verifies that a `typst-` prefixed color string correctly uses the Typst framework hex mapping (`#85144B`) as an inline background.

```markdown
The quick [brown fox jumps]{pfa-bg-color="typstmaroon" pfa-padding="0.2em 0.4em" pfa-color="white"} over the lazy dog.
```

The quick [brown fox jumps]{pfa-bg-color="typstmaroon" pfa-padding="0.2em 0.4em" pfa-color="white"} over the lazy dog.

## Border and Radius Modifications

This section verifies the filter's ability to apply stroke/border widths, border colors, and corner radii to inline background containers.

### Standard Border Styling (`pfa-bg-border-width`, `pfa-bg-border-color`)

Verifies that a solid border is applied around the inline box using absolute point units (`pt`) and standard color names.

```markdown
The quick [brown fox jumps]{pfa-bg-color="ghostwhite" pfa-padding="0.2em 0.4em" pfa-bg-border-width="1pt" pfa-bg-border-color="navy"} over the lazy dog.
```

The quick [brown fox jumps]{pfa-bg-color="ghostwhite" pfa-padding="0.2em 0.4em" pfa-bg-border-width="1pt" pfa-bg-border-color="navy"} over the lazy dog.

### Rounded Corners (`pfa-bg-radius`)

Verifies that corner radii apply evenly to all four corners of the inline box using relative typography units (`em`).

```markdown
The quick [brown fox jumps]{pfa-bg-color="lightgray" pfa-padding="0.2em 0.4em" pfa-bg-radius="0.4em"} over the lazy dog.
```

The quick [brown fox jumps]{pfa-bg-color="lightgray" pfa-padding="0.2em 0.4em" pfa-bg-radius="0.4em"} over the lazy dog.

### Combined Badge/Pill Effect

Verifies the simultaneous processing of background fill, text color, padding, border width, border color, and a large border radius to create a unified "pill" badge effect.

```markdown
The quick [brown fox jumps]{pfa-bg-color="aliceblue" pfa-color="navy" pfa-padding="0.2em 0.6em" pfa-bg-border-width="0.5pt" pfa-bg-border-color="steelblue" pfa-bg-radius="1em"} over the lazy dog.
```

The quick [brown fox jumps]{pfa-bg-color="aliceblue" pfa-color="navy" pfa-padding="0.2em 0.6em" pfa-bg-border-width="0.5pt" pfa-bg-border-color="steelblue" pfa-bg-radius="1em"} over the lazy dog.
