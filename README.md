Fonts and Alignment a Lua Filter for styling fonts and aligning text
==============================================================================

[![GitHub build status][CI badge]][CI workflow]

Fonts and Alignment is a Lua filter designed to style fonts and align text in Pandoc generated LaTeX documents.

The filter defines a number of classes that when specified correspond to LaTeX commands which in turn provide the requisite styling.

The same classes can be used when generating HTML but you will need to provide a stylesheet to define the required styles.

[CI badge]: https://img.shields.io/github/workflow/status/tarleb/lua-filter-template/CI?logo=github
[CI workflow]: https://github.com/tarleb/lua-filter-template/actions/workflows/ci.yaml

Basic Usage
-----------------------------------------------------------------

The fonts and alignment filter supports the styling and aligning of both inline and block elements in LaTeX documents.

### Styling for Block and Inline elements

### Styling for Block elements only

License
------------------------------------------------------------------

This pandoc Lua filter is published under the MIT license, see
file `LICENSE` for details.
