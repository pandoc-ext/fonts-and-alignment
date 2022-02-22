--- fonts-and-alignment.lua - Sets the fonts and alignment in LaTeX documents
---
--- Copyright: © 2021-2022 Nandakumar Chandrasekhar
--- License: MIT - see LICENSE for details
---
-- Makes sure users know if their pandoc version is too old for this filter.
PANDOC_VERSION:must_be_at_least '2.17'

-- For the tables below the first variable in the LaTeX code for an inline
-- element or Span and the second is far a block element or Div.

-- LaTeX font types
LATEX_FONT_TYPES = {
  bold = { 'textbf', 'bfseries' },
  italic = { 'textit', 'itshape' },
  medium = { 'textmd', 'mdseries' },
  monospace = { 'texttt', 'ttfamily' },
  normalfont = { 'textnormal', 'normalfont' },
  sans = { 'textsf', 'sffamily' },
  serif = { 'textrm', 'rmfamily' },
  smallcaps = { 'textsc', 'scshape' },
  bf = { 'textbf', 'bfseries' },
  it = { 'textit', 'itshape' },
  md = { 'textmd',  'mdseries' },
  tt = { 'texttt', 'ttfamily' },
  nf = { 'textnormal', 'normalfont' },
  sf = { 'textsf', 'sffamily' },
  rm = { 'textrm', 'rmfamily' },
  sc = { 'textsc', 'scshape' },
}

-- LaTeX font sizes
LATEX_FONT_SIZES = {
  xxsmall = { 'scriptsize', 'scriptsize'},
  xsmall = { 'footnotesize', 'footnotesize' },
  small = { 'small', 'small' },
  normal = { 'normalsize', 'normalsize' },
  large = { 'large', 'large' },
  xlarge = { 'Large', 'Large' },
  xxlarge = { 'LARGE', 'LARGE' },
}

-- LaTeX layouts
LATEX_LAYOUTS = {
  center = { nil, 'center' },
  flushright = { nil, 'flushright' },
  flushleft = { nil, 'flushleft' },
  centering = { nil, 'centering' },
  raggedleft = { nil, 'raggedleft' },
  raggedright = { nil, 'raggedright' },
}

-- Pandoc code to write raw inline and raw block elements
RAW_CODE_FUNCTION = {
  Span = pandoc.RawInline,
  Div = pandoc.RawBlock
}

-- Table to hold the constructed LaTeX commands
-- categorized by tag and then style
local latex_cmd_for_tags = {
  Span = {},
  Div = {}
}

-- Construct the LaTeX code based on type of element
local function construct_latex_cmd(class, span_code, div_code, span_end_code)
  -- Construct codes for span
  if span_code then
    -- Decide on the format of the LaTeX code for spans based on this variable
    if not span_end_code then
      latex_cmd_for_tags.Span[class] = {'\\' .. span_code .. ' ', nil}
    else
      latex_cmd_for_tags.Span[class] = {'\\' .. span_code .. '{', '}'}
    end
  end
  -- Consruct codes for div
  if div_code then
    latex_cmd_for_tags.Div[class] = {
      '\\begin{' .. div_code .. '}', '\\end{' .. div_code .. '}'
    }
  end
end

-- Extract the LaTeX codes for Spans and Divs to construct the LaTeX command
local function extract_latex_codes(styles_list, span_end_code)
  -- This variable helps us construct the correct LaTeX start and end code
  span_end_code = (span_end_code == nil and false) or span_end_code
  for class, latex_codes in pairs(styles_list) do
    -- Check that the table latex_codes is not empty
    if next(latex_codes) then
      local span_code = latex_codes[1]
      local div_code = latex_codes[2]
      construct_latex_cmd(class, span_code, div_code, span_end_code)
    end
  end
end

-- Construct the LaTeX commands for font types, font sizes and layouts
extract_latex_codes(LATEX_FONT_TYPES, true)
extract_latex_codes(LATEX_FONT_SIZES)
extract_latex_codes(LATEX_LAYOUTS)

-- This function takes an element object and returns it with
-- the LaTeX codes applied based on the classes attached to the element
local function handler (elem)
  local tag = elem.tag
  local raw = RAW_CODE_FUNCTION[tag]
  local code_for_class = latex_cmd_for_tags[tag]
  local classes = elem.classes

  -- Iterating over the classes in the element is more efficient.
  -- Looping backwards so that the LaTeX commands come in the
  -- same order the classes were specified in the source document.
  for i=#classes, 1, -1  do
    if code_for_class[classes[i]] then
      local code = code_for_class[classes[i]]
      local begin_code = code[1] -- LaTeX code placed in front
      local end_code = code[2] -- LaTeX code placed at the end

      -- Add LaTeX code at the beginning
      table.insert(elem.content, 1, raw('latex', begin_code))
      if end_code then
        -- Add LaTeX code at the end
        table.insert(elem.content, raw('latex', end_code))
      end
    end
  end
  return elem
end

-- Call handler for each Span and Div element
Span = handler
Div = handler
