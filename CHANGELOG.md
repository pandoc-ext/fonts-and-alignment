# Changelog

<!-- markdownlint-disable MD024 -->

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.0.0] 2026-07-29

### Removed

- **BREAKING CHANGE:** Completely removed all legacy, un-namespaced utility classes and shorthand aliases from both the Lua filter and the CSS stylesheet. The engine now operates exclusively on the unified `pfa-*` namespace.

### Migration Guide

To upgrade older documents, replace the removed legacy classes with their modern namespaced equivalents:

* **Font Weights & Shapes:**
  * `.bold`, `.bf` → `.pfa-font-bold`
  * `.medium`, `.md` → `.pfa-font-medium`
  * `.italic`, `.it` → `.pfa-font-italic`
  * `.slanted`, `.sl` → `.pfa-font-slanted`
  * `.emphasis` → `.pfa-font-emphasis`
  * `.normalfont`, `.nf`, `.upright`, `.up` → `.pfa-font-normal` / `.pfa-font-upright`
* **Font Families:**
  * `.monospace`, `.tt` → `.pfa-font-mono`
  * `.sans`, `.sf` → `.pfa-font-sans`
  * `.serif`, `.rm` → `.pfa-font-serif`
  * `.smallcaps`, `.sc` → `.pfa-font-smallcaps`
* **Text Sizing & Casing:**
  * `.xsmall` → `.pfa-text-xs`
  * `.small` → `.pfa-text-s`
  * `.normal` → `.pfa-text-normal`
  * `.large` → `.pfa-text-l`
  * `.xlarge` → `.pfa-text-xl`
  * `.xxlarge` → `.pfa-text-2xl`
  * `.huge` → `.pfa-text-3xl`
  * `.upper` / `.lower` → `.pfa-uppercase` / `.pfa-lowercase`
* **Inline Text Decorations (Spans Only):**
  * `.uline`, `.u` → `.pfa-text-uline`
  * `.uuline`, `.uu` → `.pfa-text-uline-double`
  * `.dashuline`, `.dau` → `.pfa-text-uline-dashed`
  * `.dotuline`, `.dou` → `.pfa-text-uline-dotted`
  * `.uwave`, `.uw` → `.pfa-text-uline-wave`
  * `.sout`, `.so` → `.pfa-text-strikeout`

## [2.0.1] — 2026-06-12

### Fixed

- Removed global HTML `table` element style overrides from the companion stylesheet to prevent layout conflicts and style pollution in client implementations.

---

## [2.0.0] — 2026-06-10

### Added

- Support installation through Quarto with automatic asset registration.
- Support for coloring text via the `pfa-font-color` attribute in both Bracketed Spans and Fenced Divs.
- Support for native cross-backend percentage-based color mixing (`xcolor` mixing syntax for LaTeX and `color-mix()` for HTML).
- Support for horizontal positioning of Fenced Divs using the `pfa-block-left`, `pfa-block-center`, and `pfa-block-right` classes.
- Prerequisite check that emits a `stderr` terminal warning if required reader extensions are disabled.
- Validation of utility class names with user-facing warnings for unrecognized classes.

### Changed

- Replaced the previous CSS generation approach with a single stylesheet based on CSS custom properties.
- Standardized all examples and documentation to use Pandoc's Bracketed Span and Fenced Div terminology.
- Expanded and reorganized the README and specimen documents.
- Improved HTML and PDF parity for colors, sizing, alignment, and text decoration rendering.

### Deprecated

- Legacy class names are now deprecated in favor of the `pfa-*` namespaced equivalents and will be removed in a future major release.

### Removed

- Legacy alignment classes `center`, `flushleft`, and `flushright`.
- Legacy strikeout class `xout` and shorthand alias `xo`.

---

## [1.0.2] — 2024-06-30

### Changed

- Improved specimen documents and README examples.

---

## [1.0.1] — 2024-06-30

### Fixed

- Corrected errors in specimen documents.
- Corrected the Lua filter download URL in the README.

---

## [1.0.0] — 2024-06-30

Initial public release of the `fonts-and-alignment` Pandoc Lua filter.

### Added

- Support for font sizing, weight, shape, and family controls in LaTeX/PDF output.
- Support for text alignment utilities.
- CSS stylesheet providing equivalent HTML rendering.
- Support for hyperlink styling.
- Support for underlined text via document metadata.
- Font-size and font-family helper utilities.
- Legacy LaTeX-inspired shorthand aliases.
- Documentation for Pandoc defaults file integration.

[3.0.0]: https://github.com/pandoc-ext/fonts-and-alignment/compare/v2.0.1...v3.0.0
[2.0.1]: https://github.com/pandoc-ext/fonts-and-alignment/compare/v2.0.0...v2.0.1
[2.0.0]: https://github.com/pandoc-ext/fonts-and-alignment/compare/v1.0.2...v2.0.0
[1.0.2]: https://github.com/pandoc-ext/fonts-and-alignment/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/pandoc-ext/fonts-and-alignment/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/pandoc-ext/fonts-and-alignment/releases/tag/v1.0.0
