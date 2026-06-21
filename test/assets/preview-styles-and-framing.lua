--- preview-styles-and-framing.lua
---
--- Preview-only Pandoc filter. Orchestrates style preambles and frames every
--- pfa-* block/inline specimen for both LaTeX and Typst preview outputs.
--- Loaded by the previews Makefile target only.
---
--- @copyright © 2026 Nandakumar Chandrasekhar

local function has_pfa_signal(elem)
  -- 1. Check standard class targets
  for _, cls in ipairs(elem.classes) do
    if cls:match('^pfa%-') then return true end
  end
  -- 2. Check active attribute targets
  for key, _ in pairs(elem.attributes) do
    if key:match('^pfa%-') then return true end
  end
  -- 3. Intercept raw color markers left behind by consumed color attributes
  if elem.content and #elem.content > 0 then
    local first = elem.content[1]
    if first and first.text then
      local t = first.text
      if t:find('\\textcolor') or t:find('\\color') or t:find('#text%s*%(%s*fill') or t:find('#set%s+text%s*%(%s*fill') then
        return true
      end
    end
  end
  return false
end

local function has_pfa_block_class(elem)
  for _, cls in ipairs(elem.classes) do
    if cls:match('^pfa%-block%-') then return true end
  end
  return false
end

-- ==============================================================================
-- LATEX CONFIGURATIONS & PREAMBLE
-- ==============================================================================
local LATEX_BLOCK_OPEN  = '\\begin{tcolorbox}[pfapreview]'
local LATEX_BLOCK_CLOSE = '\\end{tcolorbox}'
local LATEX_INLINE_OPEN  = '\\tcbox[pfapreviewinline]{'
local LATEX_INLINE_CLOSE = '}'

local LATEX_PREAMBLE = [[
% Wrap long lines inside highlighted code blocks
\usepackage{fvextra}
\fvset{breaklines=true,breakanywhere=true}

% Render standard headings in Noto Serif SemiBold safely
\usepackage{titlesec}
\newfontfamily\pfaheadingfont{Noto Serif}[UprightFont={* SemiBold},ItalicFont={* SemiBold Italic}]
\titleformat*{\section}{\Large\pfaheadingfont}
\titleformat*{\subsection}{\large\pfaheadingfont}
\titleformat*{\subsubsection}{\normalsize\pfaheadingfont}

% Explicitly convert level-4 paragraph headings into display block headings
\titleformat{\paragraph}[hang]{\normalsize\bfseries\pfaheadingfont}{\theparagraph}{1em}{}
\titlespacing*{\paragraph}{0pt}{3.25ex plus 1ex minus .2ex}{0.5em}

% Dynamic template frame styles around each pfa-* div/span
\usepackage[most]{tcolorbox}
\definecolor{previewframe}{HTML}{94A3B8}
\definecolor{previewbg}{HTML}{F8FAFC}

% Centralized component style dictionary declaration
\tcbset{
  pfapreview/.style={
    enhanced, colback=previewbg, colframe=previewframe,
    boxrule=1pt, arc=3pt, left=10pt, right=10pt, top=8pt, bottom=8pt
  },
  pfapreviewinline/.style={
    enhanced, colback=previewbg, colframe=previewframe,
    boxrule=1pt, arc=2pt, left=4pt, right=4pt, top=3pt, bottom=3pt,
    on line
  }
}

% Flat light-gray fill for tables
\PassOptionsToPackage{table}{xcolor}
\usepackage{colortbl}
\usepackage{etoolbox}
\definecolor{pfatablebg}{gray}{0.94}
\AtBeginEnvironment{longtable}{\rowcolors{2}{pfatablebg}{pfatablebg}}

% Wrap the Shaded environment in a minipage
\BeforeBeginEnvironment{Shaded}{\par\noindent\begin{minipage}{\linewidth}}
\AfterEndEnvironment{Shaded}{\end{minipage}\par\medskip}

% Shrink-to-fit framed pfa-block-* boxes using centralized styling
\usepackage{varwidth}
\newsavebox{\pfablockbox}
\AtEndPreamble{%
  \ifcsdef{pfa-block-center}{%
    \renewenvironment{pfa-block-center}
      {\begin{lrbox}{\pfablockbox}\begin{varwidth}{\textwidth}}
      {\end{varwidth}\end{lrbox}\begin{center}\tcbox[pfapreview]{\usebox{\pfablockbox}}\end{center}}%
  }{}%
  \ifcsdef{pfa-block-left}{%
    \renewenvironment{pfa-block-left}
      {\begin{lrbox}{\pfablockbox}\begin{varwidth}{\textwidth}}
      {\end{varwidth}\end{lrbox}\begin{flushleft}\tcbox[pfapreview]{\usebox{\pfablockbox}}\end{flushleft}}%
  }{}%
  \ifcsdef{pfa-block-right}{%
    \renewenvironment{pfa-block-right}
      {\begin{lrbox}{\pfablockbox}\begin{varwidth}{\textwidth}}
      {\end{varwidth}\end{lrbox}\begin{flushright}\tcbox[pfapreview]{\usebox{\pfablockbox}}\end{flushright}}%
  }{}%
}
]]

-- ==============================================================================
-- TYPST CONFIGURATIONS & PREAMBLE (Calibrated to absolute LaTeX pt scales)
-- ==============================================================================
local TYPST_BLOCK_OPEN  = '#block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("94A3B8"), radius: 3pt, inset: (x: 10pt, y: 8pt), width: 100%)[\n'
local TYPST_BLOCK_CLOSE = ']\n'
local TYPST_INLINE_OPEN  = '#box(fill: rgb("F8FAFC"), stroke: 0.06em + rgb("94A3B8"), radius: 0.25em, inset: (x: 0.6em, y: 0.45em), baseline: 0%)['
local TYPST_INLINE_CLOSE = ']'

local TYPST_PREAMBLE     = [[
#show table: set table(fill: rgb("F4F4F4"))

#set par(leading: 0.8em, spacing: 1.8em)

// Enforce author text configurations and override the template's trailing grid margin to a tight space
#show grid: set text(weight: "medium", size: 14.4pt)
#show grid: block.with(below: 0.3em)

// Calibrate the date block container to tightly hug the author box above and push the body layout generously below
#show block.where(inset: 1em): set text(weight: "regular", size: 14.4pt)
#show block.where(inset: 1em): set block(above: 0.3em, below: 4.5em, inset: 0pt)

// Heading metrics explicitly calibrated to LaTeX's 12pt document standard scale
#show heading.where(level: 1): set block(above: 1.925em, below: 1.265em)
#show heading.where(level: 1): set text(size: 17.28pt, weight: "semibold")

#show heading.where(level: 2): set block(above: 1.7875em, below: 1.2em)
#show heading.where(level: 2): set text(size: 14.4pt, weight: "semibold")

#show heading.where(level: 3): set block(above: 1.7875em, below: 0.825em)
#show heading.where(level: 3): set text(size: 12pt, weight: "semibold")

#show heading.where(level: 4): set block(above: 1.7875em, below: 0.5em)
#show heading.where(level: 4): set text(size: 12pt, weight: "semibold")

// Native Typst link styling engine override rule
#show link: set text(fill: rgb("0000FF"))
]]

--------------------------------------------------------------------------------
-- PASS 1: Context Tagging
--------------------------------------------------------------------------------
local function tag_descendant_elements(elem)
  return pandoc.walk_block(elem, {
    Span = function(span)
      span.attributes['data-no-pfa-frame'] = 'true'
      return span
    end,
    Div = function(div)
      div.attributes['data-no-pfa-frame'] = 'true'
      return div
    end
  })
end

local TagContextPass = {
  Table = function(tbl)
    return tag_descendant_elements(tbl)
  end,
  Div = function(div)
    if not has_pfa_signal(div) then return nil end
    return tag_descendant_elements(div)
  end
}

--------------------------------------------------------------------------------
-- PASS 2: Frame Generation
--------------------------------------------------------------------------------
local ApplyFramesPass = {
  Div = function(elem)
    if elem.attributes['data-no-pfa-frame'] then
      elem.attributes['data-no-pfa-frame'] = nil

      -- Intercept and strip redundant LaTeX nested environments
      -- generated by the core filter to prevent concentric double borders
      if FORMAT:match('latex') or FORMAT:match('pdf') then
        local new_content = pandoc.List({})
        for _, block in ipairs(elem.content) do
          local is_redundant_macro = false
          if block.tag == 'RawBlock' and block.format == 'latex' then
            if block.text:find('\\begin{pfa%-block%-') or block.text:find('\\end{pfa%-block%-') then
              is_redundant_macro = true
            end
          end
          if not is_redundant_macro then
            new_content:insert(block)
          end
        end
        elem.content = new_content
      end

      return elem
    end

    if not has_pfa_signal(elem) then return nil end

    -- Only skip block-level alignment framing when compiling for LaTeX
    if has_pfa_block_class(elem) and (FORMAT:match('latex') or FORMAT:match('pdf')) then
      return nil
    end

    if FORMAT:match('latex') then
      return {
        pandoc.RawBlock('latex', LATEX_BLOCK_OPEN),
        elem,
        pandoc.RawBlock('latex', LATEX_BLOCK_CLOSE),
      }
    elseif FORMAT:match('typst') then
      if has_pfa_block_class(elem) then
        local block_align = 'left'
        local inner_align = 'left'

        -- Dynamically extract absolute positioning state targets from the production content bounds
        if elem.content[1] and elem.content[1].tag == 'RawBlock' and elem.content[1].text:find('#block') then
          local core_text = elem.content[1].text
          local cap_block = core_text:match('#align%((%a+)%)')
          local cap_inner = core_text:match('#set%s+align%((%a+)%)')
          if cap_block then block_align = cap_block end
          if cap_inner then inner_align = cap_inner end
          elem.content:remove(1)
        end
        local last_idx = #elem.content
        if elem.content[last_idx] and elem.content[last_idx].tag == 'RawBlock' and elem.content[last_idx].text:find('%]%]%]') then
          elem.content:remove(last_idx)
        end

        return {
          pandoc.RawBlock('typst', '#block(width: 100%)[\n#align(' .. block_align .. ')[\n#block(fill: rgb("F8FAFC"), stroke: 1pt + rgb("94A3B8"), radius: 3pt, inset: (x: 10pt, y: 8pt), width: auto)[\n#set align(' .. inner_align .. ')\n'),
          elem,
          pandoc.RawBlock('typst', ']]]\n')
        }
      else
        return {
          pandoc.RawBlock('typst', TYPST_BLOCK_OPEN),
          elem,
          pandoc.RawBlock('typst', TYPST_BLOCK_CLOSE),
        }
      end
    end
    return nil
  end,

  Span = function(elem)
    if elem.attributes['data-no-pfa-frame'] then
      elem.attributes['data-no-pfa-frame'] = nil
      return elem
    end

    if not has_pfa_signal(elem) then return nil end

    if FORMAT:match('latex') then
      return {
        pandoc.RawInline('latex', LATEX_INLINE_OPEN),
        elem,
        pandoc.RawInline('latex', LATEX_INLINE_CLOSE),
      }
    elseif FORMAT:match('typst') then
      return {
        pandoc.RawInline('typst', TYPST_INLINE_OPEN),
        elem,
        pandoc.RawInline('typst', TYPST_INLINE_CLOSE),
      }
    end
    return nil
  end,

  Meta = function(meta)
    local includes = meta['header-includes'] or pandoc.List({})
    if type(includes) ~= 'table' then includes = pandoc.List({ includes }) end

    if FORMAT:match('latex') then
      includes:insert(pandoc.RawBlock('latex', LATEX_PREAMBLE))
      meta['header-includes'] = includes
    elseif FORMAT:match('typst') then
      includes:insert(pandoc.RawBlock('typst', TYPST_PREAMBLE))
      meta['header-includes'] = includes

      -- Overrides document title weight to Regular and sizes it to LaTeX \LARGE (20.74pt)
      if meta.title then
        if type(meta.title) ~= 'table' then
          meta.title = pandoc.List({ meta.title })
        end
        table.insert(meta.title, 1, pandoc.RawInline('typst', '#text(weight: "regular", size: 20.74pt)['))
        table.insert(meta.title, pandoc.RawInline('typst', ']'))
      end
    end
    return meta
  end
}

return { TagContextPass, ApplyFramesPass }
