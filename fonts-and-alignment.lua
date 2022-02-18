--- fonts-and-alignment.lua - Enables setting font styles and text alignment in LaTex documents
---
--- Copyright: © 2021-2022 Nandakumar Chandrasekhar and Contributors
--- License: MIT - see LICENSE for details
-- Makes sure users know if their pandoc version is too old for this
-- filter.
--- fonts-and-alignment.lua - Enables setting font styles and text alignment in LaTex documents
---
--- Copyright: © 2021-2022 Nandakumar Chandrasekhar and Contributors
--- License: MIT - see LICENSE for details
-- Makes sure users know if their pandoc version is too old for this
-- filter.
PANDOC_VERSION:must_be_at_least '2.17'

-- Font styles
LATEX_CODES_FOR_TAGS = {
  Span = {
    -- Font Styles
    bold = '\\bfseries ',
    italic = '\\itshape ',
    monospace = '\\ttfamily ',
    sans = '\\sffamily ',
    serif = '\\rmfamily ',
    slanted = '\\slshape ',
    smallcaps = '\\scshape ',

    -- Font Sizes
    xxsmall = '\\scriptsize ',
    xsmall = '\\footnotesize ',
    small = '\\small ',
    normal = '\\normalsize ',
    large = '\\large ',
    xlarge = '\\Large ',
    xxlarge = '\\LARGE ',
  },
  Div = {
    -- Font Styles
    bold = '\\begin{bfseries}',
    italic = '\\begin{itshape}',
    monospace = '\\begin{ttfamily}',
    sans = '\\begin{sffamily}',
    serif = '\\begin{rmfamily}',
    slanted = '\\begin{slshape}',
    smallcaps = '\\begin{scshape}',

    -- Font Sizes
    xxsmall = '\\begin{scriptsize}',
    xsmall = '\\begin{footnotesize}',
    small = '\\begin{small}',
    normal = '\\begin{normalsize}',
    large = '\\begin{large}',
    xlarge = '\\begin{Large}',
    xxlarge = '\\begin{LARGE}',

    -- Layouts
    center = '\\begin{center}',
    flushright = '\\begin{flushright}',
    flushleft = '\\begin{flushleft}',
    centering = '\\begin{centering}',
    raggedleft = '\\begin{raggedleft}',
    raggedright = '\\begin{raggedright}'
  }
}

local raw_code_function = {
  Span = pandoc.RawInline,
  Div = pandoc.RawBlock
}

-- This function takes an element object and returns it with
-- the LaTeX codes applied based on the class attached to the element
local function handler (elem)
  local tag = elem.tag
  local code_for_class = LATEX_CODES_FOR_TAGS[tag]
  local raw = raw_code_function[tag]
  for class, code in pairs(code_for_class) do
    if elem.classes:includes(class) then
      table.insert(elem.content, 1, raw('latex', code))
      if tag == "Div" then
        table.insert(elem.content, raw('latex', code:gsub('begin', 'end')))
      end
    end
  end
  return elem
end

-- Call handler for each Span and Div element
Span = handler
Div = handler
