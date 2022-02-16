Fonts and Alignment a Lua Filter for styling fonts and aligning text
==============================================================================

[![GitHub build status][CI badge]][CI workflow]

Fonts and Alignment is a Lua filter designed to style fonts and align text through specification of classes defined by the filter.

This filter was originally written to use only with Pandoc generated LaTeX documents but can now be used for HTML and ePub documents.

For LaTeX specify your fonts and font options for your document as variables in a [Pandoc defaults file](https://pandoc.org/MANUAL.html#defaults-files) as shown below:

```yaml
variables:
  fontsize: 12pt
  mainfont:  Noto Serif
  mainfontoptions:
    - Scale=1.0
    - BoldFont=* Semibold
  sansfont: Noto Sans
  sansfontoptions:
    - BoldFont=* Semibold
  monofont: Fira Mono
  monofontoptions:
    - BoldFont=* Bold
  linestretch: 1.2
```

Alternatively, you may also specify them in a YAML header block at the beginning of your source document like so:

```yaml
fontsize: 12pt
mainfont: Noto Serif
mainfontoptions:
  - Scale=1.0
  - BoldFont=* Semibold
sansfont: Noto Sans
sansfontoptions:
  - BoldFont=* Semibold
monofont: Fira Mono
monofontoptions:
  - BoldFont=* Bold
linestretch: 1.25
```

For HTML and ePub documents you may use the [fonts-and-alignment.css](https://github.com/nandac/fonts-and-alignment/blob/main/test/fonts-and-alignment.css) as a base file which you may tweak to fit your document.


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
