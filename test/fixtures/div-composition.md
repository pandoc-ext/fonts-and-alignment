---
title: "Test Case: Multi-Class Attribute Composition in Fenced Divs"
---

## Compound Typography Configurations

This section verifies the filter's ability to evaluate multiple concurrent layout classes piled on a single Fenced Div block wrapper. The processing engine must handle attribute composition with total order-independence, strip matching tokens from the output node context cleanly, and preserve raw structural contents across targets.

### Bold Sans-Serif Display Block

Verifies simultaneous application of weight (`.pfa-weight-bold`), family mapping (`.pfa-family-sans`), display scale sizing (`.pfa-size-l`), and literal true-color rendering (`pfa-color="red"`).

```markdown
::: {.pfa-weight-bold .pfa-family-sans .pfa-size-l pfa-color="red"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-weight-bold .pfa-family-sans .pfa-size-l pfa-color="red"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Bold Monospace Utility Block

Verifies simultaneous application of font weight rules (`.pfa-weight-bold`) alongside monospace layout definitions (`.pfa-family-mono`) and compressed scale sizing (`.pfa-size-s`). This avoids missing-variant fallback limitations on system monospace profiles such as Fira Mono.

```markdown
::: {.pfa-weight-bold .pfa-family-mono .pfa-size-s}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-weight-bold .pfa-family-mono .pfa-size-s}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

### Small Caps Decorative Accent Block

Verifies coordinated parsing of custom micro-typography features (`.pfa-style-smallcaps`) running alongside a named CSS keyword tracking token (`pfa-color="forestgreen"`).

```markdown
::: {.pfa-style-smallcaps pfa-color="forestgreen"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::
```

::: {.pfa-style-smallcaps pfa-color="forestgreen"}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
:::

## High-Stress Layout Intersections

This section tests the structural boundary conditions of multi-class attribute handling when interacting with complex internal AST document nodes and nested block conditions.

### Concentric Structural Block Nesting

Ensures that evaluation stacks track scope context precisely when a nested block is explicitly evaluated inside an active parent container. This syntax uses a 4-colon exterior fence (`::::`) and a 3-colon interior fence (`:::`) to enforce correct hierarchical tree parsing under Pandoc Markdown rules.

```markdown
:::: {.pfa-family-sans .pfa-size-xl pfa-color="navy"}
This represents the outer parent design container level.

::: {.pfa-weight-bold .pfa-style-italic pfa-color="red"}
This represents the inner child container executing nested local overrides.
:::

Back to parent element layout properties container tracking baseline variables.
::::
```

:::: {.pfa-family-sans .pfa-size-xl pfa-color="navy"}
This represents the outer parent design container level.

::: {.pfa-weight-bold .pfa-style-italic pfa-color="red"}
This represents the inner child container executing nested local overrides.
:::

Back to parent element layout properties container tracking baseline variables.
::::
