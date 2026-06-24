---
title: "Test Case: Text Alignment within Fenced Divs"
---

## Systematic Text Alignment and Layout Rules

This test suite verifies that the framework's directional alignment and line preservation classes cleanly map to their respective structural block layouts across all backend engines.

### Directional Block Alignments

#### Left-Aligned (`pfa-align-left`)

Verifies block mapping to LaTeX `raggedright` environments and native Typst `#align(left)` wrappers.

```markdown
::: {.pfa-align-left}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-align-left}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

#### Center-Aligned (`pfa-align-center`)

Verifies block mapping to LaTeX `centering` environments and native Typst `#align(center)` wrappers.

```markdown
::: {.pfa-align-center}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-align-center}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

#### Right-Aligned (`pfa-align-right`)

Verifies block mapping to LaTeX `raggedleft` environments and native Typst `#align(right)` wrappers.

```markdown
::: {.pfa-align-right}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-align-right}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Advanced Layout and Line Preservation

#### Explicit Line Break Preservation

Confirms that explicit inline trailing escape breaks (`\`) preserve horizontal positioning and margin properties under forced alignment blocks without dropping structural layout bounds.

```markdown
::: {.pfa-align-center}
Lorem ipsum dolor sit amet,\
consectetur adipiscing elit, sed do eiusmod tempor\
incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-align-center}
Lorem ipsum dolor sit amet,\
consectetur adipiscing elit, sed do eiusmod tempor\
incididunt ut labore et dolore magna aliqua.
:::
