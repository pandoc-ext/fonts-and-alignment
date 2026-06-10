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

-- Centralized style declarations called from the LaTeX preamble style dictionary
local TCOLORBOX_OPEN = '\\begin{tcolorbox}[pfapreview]'
local TCOLORBOX_CLOSE = '\\end{tcolorbox}'

local TCBOX_OPEN = '\\tcbox[pfapreviewinline]{'
local TCBOX_CLOSE = '}'

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
    boxrule=1pt, arc=2pt, left=2pt, right=2pt, top=1pt, bottom=1pt,
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

--------------------------------------------------------------------------------
-- PASS 1: Context Tagging
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
--------------------------------------------------------------------------------
local ApplyFramesPass = {
  Div = function(elem)
    if not has_pfa_signal(elem) then return nil end
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

return { TagContextPass, ApplyFramesPass }
