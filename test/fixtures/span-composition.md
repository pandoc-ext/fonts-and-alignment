---
title: "Test Case: Multi-Class Attribute Composition in Bracketed Spans"
---

## Compound Inline Typography Configurations

This section verifies that the framework's typography style taxonomy evaluates smoothly when compiled within paragraph text flow constructs. Chained utility class sets must parse with total order-independence, isolate structural styles cleanly to the target bracket string boundaries, and strip attributes cleanly to prevent writer target output pollution.

### Bold Sans-Serif Inline Block

Verifies simultaneous application of weight (`.pfa-weight-bold`), family routing (`.pfa-family-sans`), display scale sizing (`.pfa-size-l`), and true-color assignments (`pfa-color="red"`) inside continuous prose.

```markdown
The quick brown fox [jumps over the lazy dog.]{.pfa-weight-bold .pfa-family-sans .pfa-size-l pfa-color="red"} Baseline text resumes here.
```

The quick brown fox [jumps over the lazy dog.]{.pfa-weight-bold .pfa-family-sans .pfa-size-l pfa-color="red"} Baseline text resumes here.

### Italic Monospace Token

Verifies simultaneous application of inline posture transformations (`.pfa-style-italic`), code family routing (`.pfa-family-mono`), and linear compact scale scaling (`.pfa-size-s`).

```markdown
The quick brown fox [jumps over the lazy dog.]{.pfa-style-italic .pfa-family-mono .pfa-size-s} Baseline text resumes here.
```

The quick brown fox [jumps over the lazy dog.]{.pfa-style-italic .pfa-family-mono .pfa-size-s} Baseline text resumes here.

### Small Caps Decorative Accent

Verifies the framework's ability to coordinate custom micro-typography features (`.pfa-style-smallcaps`) alongside an explicit keyword tracking token (`pfa-color="forestgreen"`) over fine inline slices.

```markdown
The quick brown fox [jumps over the lazy dog.]{.pfa-style-smallcaps pfa-color="forestgreen"} Baseline text resumes here.
```

The quick brown fox [jumps over the lazy dog.]{.pfa-style-smallcaps pfa-color="forestgreen"} Baseline text resumes here.
