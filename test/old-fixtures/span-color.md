---
title: Advanced Color handling in Bracketed Spans (Multi-Platform Specification)
author: Nandakumar Chandrasekhar
date: 2026-05-25
toc: true
number-sections: true
---

This file acts as a comprehensive regression test fixture for the color parsing layer within the `fonts-and-alignment` Lua filter orchestration engine. These tests ensure that standard CSS/SVG names, hexadecimal codes, and platform-specific color manipulation syntaxes (LaTeX and Typst) are correctly normalized for both LaTeX and Typst compilation targets using automated section sequencing.

## Basic & Normalized Color Specifications

### Named CSS/SVG Color (Clean)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="mediumvioletred"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="mediumvioletred"}

### Hexadecimal Color (Standard Typst Eastern Hash)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="#239dad"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="#239dad"}

### Hexadecimal Color (Shorthand normalization)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="#F00"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="#F00"}

## Legacy & Legacy Normalization Parsing

These specimens verify the normalization engine's ability to clean up messy or legacy inputs that bleed through from old LaTeX configurations or hand-edited CSS.

### Named Color Normalization (Spaces to hyphens)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="medium violet red"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="medium violet red"}

### Named Color Normalization (Hyphens to none/CamelCase)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="MEDIUM_VIOLET_RED"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="MEDIUM_VIOLET_RED"}

### Legacy Hexadecimal (No Hash Marker)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="191970"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="191970"}

## Advanced Manipulations (LaTeX Input Syntax)

These tests specify dynamic color creation using standard LaTeX **`xcolor`** exclamation syntax (`base!pct!white/black` or `c1!pct!c2`). When compiled to Typst, the filter intercepts these patterns and translates them into equivalent Typst functional expressions.

### Tinting (LaTeX syntax passthrough or translation)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="MediumVioletRed!40!white"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="MediumVioletRed!40!white"}

### Shading (LaTeX syntax passthrough or translation)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="MediumVioletRed!80!black"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="MediumVioletRed!80!black"}

### Mixing (LaTeX syntax passthrough or translation)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="RoyalBlue!50!ForestGreen"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="RoyalBlue!50!ForestGreen"}

## Advanced Manipulations (Native Typst Input Syntax)

These tests use Native Typst functional syntax for color management. The filter detects these patterns and passes them through entirely raw to the Typst compiler. When compiled to LaTeX, the filter must intercept and normalize these into standard hexadecimal expressions for compatibility.

### Native Typst Function (Eastern Hash String passthrough)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="#F0F"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="#F0F"}

### Native Typst Function (rgb passthrough/translation)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="rgb(\"#FF1493\")"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="rgb(\"#FF1493\")"}

### Native Typst Shading function (.darken() passthrough)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="MediumVioletRed.darken(20%)"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="MediumVioletRed.darken(20%)"}

### Native Typst Tinting function (.lighten() passthrough)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="MediumVioletRed.lighten(60%)"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="MediumVioletRed.lighten(60%)"}

### Native Typst Mixing function (color.mix() passthrough)

```markdown
[Grumpy wizards make toxic brew.]{pfa-font-color="color.mix((RoyalBlue, 50%), (ForestGreen, 50%))"}
```

[Grumpy wizards make toxic brew.]{pfa-font-color="color.mix((RoyalBlue, 50%), (ForestGreen, 50%))"}
