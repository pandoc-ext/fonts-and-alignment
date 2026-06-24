---
title: "Test Case: Color Modifications in Bracketed Spans"
---

## 1. Standard Color Specifications

This section verifies that the filter processes standard CSS/SVG named keywords and explicit hexadecimal declarations, applying them successfully to inline Bracketed Spans across all format outputs.

### Named CSS/SVG Keywords (`pfa-color="mediumvioletred"`)

Verifies that standard lowercase CSS/SVG named colors are recognized and mapped correctly within paragraph elements.

```markdown
[Grumpy wizards make toxic brew.]{pfa-color="mediumvioletred"}
```

[Grumpy wizards make toxic brew.]{pfa-color="mediumvioletred"}

### Complete Hexadecimal Declaration (`pfa-color="#239dad"`)

Verifies that full 6-character hex values prefixed with a hash output the expected inline color.

```markdown
[Grumpy wizards make toxic brew.]{pfa-color="#239dad"}
```

[Grumpy wizards make toxic brew.]{pfa-color="#239dad"}

### Shorthand Hexadecimal Declaration (`pfa-color="#F00"`)

Verifies that 3-character compressed hex strings are intercepted, expanded to full 6-character blocks, and rendered correctly.

```markdown
[Grumpy wizards make toxic brew.]{pfa-color="#F00"}
```

[Grumpy wizards make toxic brew.]{pfa-color="#F00"}

## 2. String Normalization and Sanitation

This section tests the filter's inline token validation rules, checking that string cleanups correctly parse alternative layouts containing spaces, separators, or missing markers.

### Spaces and Mixed Case (`pfa-color="medium violet red"`)

Verifies that the filter strips mid-string space buffers and standardizes casing formatting seamlessly[cite: 3, 4].

```markdown
[Grumpy wizards make toxic brew.]{pfa-color="medium violet red"}
```

[Grumpy wizards make toxic brew.]{pfa-color="medium violet red"}

### Underscores and Uppercase (`pfa-color="MEDIUM_VIOLET_RED"`)

Verifies that token evaluation cleans structural underscores and uppercase characters without corrupting terminal tags.

```markdown
[Grumpy wizards make toxic brew.]{pfa-color="MEDIUM_VIOLET_RED"}
```

[Grumpy wizards make toxic brew.]{pfa-color="MEDIUM_VIOLET_RED"}

### Hexadecimal without Hash Prefix (`pfa-color="191970"`)

Verifies that raw alphanumeric hex code targets are resolved safely without requiring a hard hash prefix symbol.

```markdown
[Grumpy wizards make toxic brew.]{pfa-color="191970"}
```

[Grumpy wizards make toxic brew.]{pfa-color="191970"}

## 3. Color Mixtures (LaTeX Syntax Engine)

This section specifies dynamic inline color creation using standard LaTeX exclamation syntax (`base!pct!white/black` or `c1!pct!c2`). The filter intercepts these formats and writes native outputs across LaTeX, Typst, and HTML targets.

### Tinting (`pfa-color="MediumVioletRed!40!white"`)

Verifies inline color mixing with white components to execute relative tinting effects across compilation targets.

```markdown
[Grumpy wizards make toxic brew.]{pfa-color="MediumVioletRed!40!white"}
```

[Grumpy wizards make toxic brew.]{pfa-color="MediumVioletRed!40!white"}

### Shading (`pfa-color="MediumVioletRed!80!black"`)

Verifies inline color mixing with black components to execute deep shading properties cleanly.

```markdown
[Grumpy wizards make toxic brew.]{pfa-color="MediumVioletRed!80!black"}
```

[Grumpy wizards make toxic brew.]{pfa-color="MediumVioletRed!80!black"}

### Dual-Color Blending (`pfa-color="RoyalBlue!50!ForestGreen"`)

Verifies cross-compilation execution and functional parsing when blending two standalone named colors together.

```markdown
[Grumpy wizards make toxic brew.]{pfa-color="RoyalBlue!50!ForestGreen"}
```

[Grumpy wizards make toxic brew.]{pfa-color="RoyalBlue!50!ForestGreen"}
