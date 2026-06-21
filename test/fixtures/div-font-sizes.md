---
title: "Test Case: Font Sizing in Fenced Divs"
---

## Systematic Typography Sizing Scale

This test suite verifies that the framework's typography size classes cleanly translate across all backend targets.

### Extra Extra Extra Small (3xs)

Verifies mapping to LaTeX `\tiny` and Typst `0.5em` configurations.

```markdown
::: {.pfa-size-3xs}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-size-3xs}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Extra Extra Small (2xs)

Verifies mapping to LaTeX `\scriptsize` and Typst `0.6667em` configurations.

```markdown
::: {.pfa-size-2xs}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-size-2xs}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Extra Small (xs)

Verifies mapping to LaTeX `\footnotesize` and Typst `0.8333em` configurations.

```markdown
::: {.pfa-size-xs}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-size-xs}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Small (s)

Verifies mapping to LaTeX `\small` and Typst `0.9125em` configurations.

```markdown
::: {.pfa-size-s}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-size-s}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Normal (normal)

Verifies resetting to baseline LaTeX `\normalsize` and Typst `1.0em` environments.

```markdown
::: {.pfa-size-normal}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-size-normal}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Large (l)

Verifies mapping to LaTeX `\large` and Typst `1.2em` scaling factors.

```markdown
::: {.pfa-size-l}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-size-l}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Extra Large (xl)

Verifies mapping to LaTeX `\Large` and Typst `1.44em` scaling factors.

```markdown
::: {.pfa-size-xl}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-size-xl}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Extra Extra Large (2xl)

Verifies mapping to LaTeX `\LARGE` and Typst `1.728em` scaling factors.

```markdown
::: {.pfa-size-2xl}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-size-2xl}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Extra Extra Extra Large (3xl)

Verifies mapping to LaTeX `\huge` and Typst `2.0736em` typographic parameters.

```markdown
::: {.pfa-size-3xl}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-size-3xl}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
