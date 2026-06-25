--- preview-styles-and-framing.lua
---
--- Preview-only Pandoc filter. Orchestrates style preambles for both
--- LaTeX and Typst preview outputs without applying example frames.
--- Loaded by the previews Makefile target only.
---
--- @copyright © 2026 Nandakumar Chandrasekhar

PANDOC_VERSION:must_be_at_least('3.2')

-- ==============================================================================
-- LATEX CONFIGURATIONS & PREAMBLE
-- ==============================================================================
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
-- CORE PASS: Preamble Injection & Document Adjustments
--------------------------------------------------------------------------------
local StyleOrchestrationPass = {
  Meta = function(meta)
    local includes = meta['header-includes'] or pandoc.List({})
    if type(includes) ~= 'table' then includes = pandoc.List({ includes }) end

    if FORMAT:match('latex') or FORMAT:match('beamer') or FORMAT:match('pdf') then
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

return { StyleOrchestrationPass }
