---
title: "Test Case: Text Casing Transformations in Bracketed Spans"
---

## Pure Text Character Case Conversions

This section verifies that applying casing utility classes (`.pfa-case-upper` and `.pfa-case-lower`) to a Bracketed Span successfully processes the underlying text string array, forcing all plain text elements to transform into the targeted case during compilation.

### Uppercase Transformation (`.pfa-case-upper`)

Verifies that lowercase string payloads wrapped inside the Bracketed Span are fully transformed into standard uppercase text.

```markdown
[grumpy wizards make toxic brew.]{.pfa-case-upper}
```

[grumpy wizards make toxic brew.]{.pfa-case-upper}

### Lowercase Transformation (`.pfa-case-lower`)

Verifies that uppercase string payloads wrapped inside the Bracketed Span are fully transformed into standard lowercase text.

```markdown
[GRUMPY WIZARDS MAKE TOXIC BREW.]{.pfa-case-lower}
```

[GRUMPY WIZARDS MAKE TOXIC BREW.]{.pfa-case-lower}

## Mixed Rich Text Structural Integrity Verification

This section ensures that when text modifications are executed across a Bracketed Span, nested inline formatting elements (such as bold markers, italic styling, and hyperlinks) have their internal text cases modified perfectly without dropping, breaking, or striping out their underlying markdown formatting wrappers.

### Mixed-Inline Formatting Isolation (Uppercase)

```markdown
[transforming **bold text**, *italics*, and a [hyperlink](https://example.com)]{.pfa-case-upper}
```

[transforming **bold text**, *italics*, and a [hyperlink](https://example.com)]{.pfa-case-upper}

### Mixed-Inline Formatting Isolation (Lowercase)

```markdown
[TRANSFORMING **BOLD TEXT**, *ITALICS*, AND A [HYPERLINK](HTTPS://EXAMPLE.COM).]{.pfa-case-lower}
```

[TRANSFORMING **BOLD TEXT**, *ITALICS*, AND A [HYPERLINK](HTTPS://EXAMPLE.COM).]{.pfa-case-lower}
