-- Preview-only Pandoc filter. Frames every pfa-* block/inline specimen in the
-- previews so live demos read as self-contained panels in PDF.
-- Loaded by the previews Makefile target only.

local function has_pfa_signal(elem)
  for _, cls in ipairs(elem.classes) do
    if cls:match('^pfa%-') then return true end
  end
  for key, _ in pairs(elem.attributes) do
    if key:match('^pfa%-') then return true end
  end
  return false
end

local function has_pfa_block_class(elem)
  for _, cls in ipairs(elem.classes) do
    if cls:match('^pfa%-block%-') then return true end
  end
  return false
end

-- Block-level wrappers
local TCOLORBOX_OPEN = '\\begin{tcolorbox}[enhanced,colback=previewbg,colframe=previewframe,boxrule=1pt,arc=3pt,left=10pt,right=10pt,top=8pt,bottom=8pt]'
local TCOLORBOX_CLOSE = '\\end{tcolorbox}'

-- Inline-level wrappers
local TCBOX_OPEN = '\\tcbox[enhanced,colback=previewbg,colframe=previewframe,boxrule=1pt,arc=2pt,left=2pt,right=2pt,top=1pt,bottom=1pt,on line]{'
local TCBOX_CLOSE = '}'

local LATEX_PREAMBLE = [[
% Wrap long lines inside highlighted code blocks
\usepackage{fvextra}
\fvset{breaklines=true,breakanywhere=true}

% Render section headings in Noto Serif SemiBold (body \textbf stays true bold).
\usepackage{titlesec}
\newfontfamily\pfaheadingfont{Noto Serif}[UprightFont={* SemiBold},ItalicFont={* SemiBold Italic}]
\titleformat*{\section}{\Large\pfaheadingfont}
\titleformat*{\subsection}{\large\pfaheadingfont}
\titleformat*{\subsubsection}{\normalsize\pfaheadingfont}
\titleformat*{\paragraph}{\normalsize\pfaheadingfont}
\titleformat*{\subparagraph}{\normalsize\pfaheadingfont}

% Demo specimen frame around each pfa-* div/span.
\usepackage[most]{tcolorbox}
\definecolor{previewframe}{HTML}{94A3B8}
\definecolor{previewbg}{HTML}{F8FAFC}

% Flat light-gray fill for tables.
\PassOptionsToPackage{table}{xcolor}
\usepackage{colortbl}
\usepackage{etoolbox}
\definecolor{pfatablebg}{gray}{0.94}
\AtBeginEnvironment{longtable}{\rowcolors{2}{pfatablebg}{pfatablebg}}

% Wrap the Shaded environment in a minipage
\BeforeBeginEnvironment{Shaded}{\par\noindent\begin{minipage}{\linewidth}}
\AfterEndEnvironment{Shaded}{\end{minipage}\par\medskip}

% Shrink-to-fit framed pfa-block-* boxes: capture multi-paragraph content into
% a savebox via varwidth, then frame it with \tcbox (macro form, genuinely
% shrink-to-fit). HTML achieves the same via display:table + auto margins.
\usepackage{varwidth}
\newsavebox{\pfablockbox}
\AtEndPreamble{%
  \ifcsdef{pfa-block-center}{%
    \renewenvironment{pfa-block-center}
      {\begin{lrbox}{\pfablockbox}\begin{varwidth}{\textwidth}}
      {\end{varwidth}\end{lrbox}\begin{center}\tcbox[enhanced,colback=previewbg,colframe=previewframe,boxrule=1pt,arc=3pt,left=10pt,right=10pt,top=8pt,bottom=8pt]{\usebox{\pfablockbox}}\end{center}}%
  }{}%
  \ifcsdef{pfa-block-left}{%
    \renewenvironment{pfa-block-left}
      {\begin{lrbox}{\pfablockbox}\begin{varwidth}{\textwidth}}
      {\end{varwidth}\end{lrbox}\begin{flushleft}\tcbox[enhanced,colback=previewbg,colframe=previewframe,boxrule=1pt,arc=3pt,left=10pt,right=10pt,top=8pt,bottom=8pt]{\usebox{\pfablockbox}}\end{flushleft}}%
  }{}%
  \ifcsdef{pfa-block-right}{%
    \renewenvironment{pfa-block-right}
      {\begin{lrbox}{\pfablockbox}\begin{varwidth}{\textwidth}}
      {\end{varwidth}\end{lrbox}\begin{flushright}\tcbox[enhanced,colback=previewbg,colframe=previewframe,boxrule=1pt,arc=3pt,left=10pt,right=10pt,top=8pt,bottom=8pt]{\usebox{\pfablockbox}}\end{flushright}}%
  }{}%
}
]]

--------------------------------------------------------------------------------
-- PASS 1: Context Tagging
-- Pandoc walks bottom-up by default. To make Spans aware they are inside a
-- table or a framed pfa-* block, we walk those parents top-down and tag their
-- descendant Spans so Pass 2 skips framing them.
--------------------------------------------------------------------------------
local function tag_descendant_spans(elem)
  return pandoc.walk_block(elem, {
    Span = function(span)
      span.attributes['data-no-pfa-frame'] = 'true'
      return span
    end
  })
end

local TagContextPass = {
  Table = function(tbl)
    return tag_descendant_spans(tbl)
  end,

  Div = function(div)
    if not has_pfa_signal(div) then return nil end
    return tag_descendant_spans(div)
  end
}

--------------------------------------------------------------------------------
-- PASS 2: Frame Generation
-- Wraps tagged elements in LaTeX tcolorbox environments, ignoring those
-- tagged by Pass 1.
--------------------------------------------------------------------------------
local ApplyFramesPass = {
  Div = function(elem)
    if not has_pfa_signal(elem) then return nil end
    -- pfa-block-* divs use shrink-to-fit varwidth + flushleft/center/flushright.
    -- A full-width tcolorbox around them hides the alignment effect entirely,
    -- so leave them unframed in the preview.
    if has_pfa_block_class(elem) then return nil end

    if FORMAT:match('latex') then
      return {
        pandoc.RawBlock('latex', TCOLORBOX_OPEN),
        elem,
        pandoc.RawBlock('latex', TCOLORBOX_CLOSE),
      }
    end
    return nil
  end,

  Span = function(elem)
    -- If this span was inside a table, remove the temporary tag and skip framing
    if elem.attributes['data-no-pfa-frame'] then
      elem.attributes['data-no-pfa-frame'] = nil
      return elem
    end

    if not has_pfa_signal(elem) then return nil end

    if FORMAT:match('latex') then
      return {
        pandoc.RawInline('latex', TCBOX_OPEN),
        elem,
        pandoc.RawInline('latex', TCBOX_CLOSE),
      }
    end
    return nil
  end,

  Meta = function(meta)
    if not FORMAT:match('latex') then return meta end

    local includes = meta['header-includes'] or pandoc.List({})
    if type(includes) ~= 'table' then includes = pandoc.List({ includes }) end

    includes:insert(pandoc.RawBlock('latex', LATEX_PREAMBLE))

    meta['header-includes'] = includes
    return meta
  end
}

-- Return the passes as a sequential list so Pandoc executes them in order
return { TagContextPass, ApplyFramesPass }
