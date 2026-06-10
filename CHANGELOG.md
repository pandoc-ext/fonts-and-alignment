# Changelog
<!-- markdownlint-disable MD024 -->
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

[2.0.0]: https://github.com/pandoc-ext/fonts-and-alignment/compare/v1.0.2...v2.0.0
[1.0.2]: https://github.com/pandoc-ext/fonts-and-alignment/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/pandoc-ext/fonts-and-alignment/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/pandoc-ext/fonts-and-alignment/releases/tag/v1.0.0
