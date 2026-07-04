--- fonts-and-alignment.lua
---
--- A Pandoc Lua Filter for advanced typography and inline layout control.
--- Translates a systematic utility class taxonomy into precise LaTeX and Typst elements.
--- Unrecognized color values pass through directly to let the target compiler handle validation.
---
--- @author    Nandakumar Chandrasekhar (nandac)
--- @copyright © 2026 Nandakumar Chandrasekhar
--- @license   MIT - see LICENSE for details
--- @version   3.0.0
--- @release   2026-07-04
---
--- @note      LaTeX Block Backgrounds and Padding (pfa-bg-color / pfa-padding) require
---            \usepackage[most]{tcolorbox} in your document preamble.

PANDOC_VERSION:must_be_at_least('3.2')

-- Ensure the fundamental Pandoc core library is present before continuing execution
local pandoc_lib = assert(pandoc, 'Cannot find the pandoc library')
if type(pandoc_lib) ~= 'table' then
  error('Expected variable pandoc to be a table')
end

local List = assert(pandoc.List, 'Cannot find the pandoc.List class')
local utils = require 'pandoc.utils'

-- Verify prerequisite markdown extension states are enabled inside the active reader configuration.
-- Both fenced_divs and bracketed_spans must be active to parse custom classes/attributes correctly.
if PANDOC_READER_OPTIONS and PANDOC_READER_OPTIONS.extensions then
  local ext = PANDOC_READER_OPTIONS.extensions
  if not (ext:includes('fenced_divs') and ext:includes('bracketed_spans')) then
    io.stderr:write('[fonts-and-alignment] Warning: Required extensions "fenced_divs" or "bracketed_spans" are disabled.\n')
  end
end

-- ==============================================================================
-- CONFIGURATION STATE (Clean String Fallbacks)
-- ==============================================================================
local typst_fonts = {
  serif = "Libertinus Serif",
  sans  = "DejaVu Sans Mono",
  mono  = "DejaVu Sans Mono"
}

-- ==============================================================================
-- SECTION 1: DATA DICTIONARIES (Constants Namespace)
-- ==============================================================================

local css_colors = {
  aliceblue            = 'F0F8FF', antiquewhite         = 'FAEBD7', aqua                 = '00FFFF',
  aquamarine           = '7FFFD4', azure                = 'F0FFFF', beige                = 'F5F5DC',
  bisque               = 'FFE4C4', black                = '000000', blanchedalmond       = 'FFEBCD',
  blue                 = '0000FF', blueviolet           = '8A2BE2', brown                = 'A52A2A',
  burlywood            = 'DEB887', cadetblue            = '5F9EA0', chartreuse           = '7FFF00',
  chocolate            = 'D2691E', coral                = 'FF7F50', cornflowerblue       = '6495ED',
  cornsilk             = 'FFF8DC', crimson              = 'DC143C', cyan                 = '00FFFF',
  darkblue             = '00008B', darkcyan             = '008B8B', darkgoldenrod        = 'B8860B',
  darkgray             = 'A9A9A9', darkgreen            = '006400', darkgrey             = 'A9A9A9',
  darkkhaki            = 'BDB76B', darkmagenta          = '8B008B', darkolivegreen       = '556B2F',
  darkorange           = 'FF8C00', darkorchid           = '9932CC', darkred              = '8B0000',
  darksalmon           = 'E9967A', darkseagreen         = '8FBC8F', darkslateblue        = '483D8B',
  darkslategray        = '2F4F4F', darkslategrey        = '2F4F4F', darkturquoise        = '00CED1',
  darkviolet           = '9400D3', deeppink             = 'FF1493', deepskyblue          = '00BFFF',
  dimgray              = '696969', dimgrey              = '696969', dodgerblue           = '1E90FF',
  firebrick            = 'B22222', floralwhite          = 'FFFAF0', forestgreen          = '228B22',
  fuchsia              = 'FF00FF', gainsboro            = 'DCDCDC', ghostwhite           = 'F8F8FF',
  gold                 = 'FFD700', goldenrod            = 'DAA520', gray                 = '808080',
  green                = '008000', greenyellow          = 'ADFF2F', grey                 = '808080',
  honeydew             = 'F0FFF0', hotpink              = 'FF69B4', indianred            = 'CD5C5C',
  indigo               = '4B0082', ivory                = 'FFFFF0', khaki                = 'F0E68C',
  lavender             = 'E6E6FA', lavenderblush        = 'FFF0F5', lawngreen            = '7CFC00',
  lemonchiffon         = 'FFFACD', lightblue            = 'ADD8E6', lightcoral           = 'F08080',
  lightcyan            = 'E0FFFF', lightgoldenrodyellow = 'FAFAD2', lightgray            = 'D3D3D3',
  lightgreen           = '90EE90', lightgrey            = 'D3D3D3', lightpink            = 'FFB6C1',
  lightsalmon          = 'FFA07A', lightseagreen        = '20B2AA', lightskyblue         = '87CEFA',
  lightslate_gray      = '778899', lightslate_grey      = '778899', lightsteelblue       = 'B0C4DE',
  lightyellow          = 'FFFFE0', lime                 = '00FF00', limegreen            = '32CD32',
  linen                = 'FAF0E6', magenta              = 'FF00FF', maroon               = '800000',
  mediumaquamarine     = '66CDAA', mediumblue           = '0000CD', mediumorchid         = 'BA55D3',
  mediumpurple         = '9370DB', mediumseagreen       = '3CB371', mediumslate_blue     = '7B68EE',
  mediumspringgreen    = '00FA9A', mediumturquoise      = '48D1CC', mediumvioletred      = 'C71585',
  midnightblue         = '191970', mintcream            = 'F5FFFA', mistyrose            = 'FFE4E1',
  moccasin             = 'FFE4B5', navajowhite          = 'FFDEAD', navy                 = '000080',
  oldlace              = 'FDF5E6', olive                = '808000', olivedrab            = '6B8E23',
  orange               = 'FFA500', orangered            = 'FF4500', orchid               = 'DA70D6',
  palegoldenrod        = 'EEE8AA', palegreen            = '98FB98', paleturquoise        = 'AFEEEE',
  palevioletred        = 'DB7093', papayawhip           = 'FFEFD5', peachpuff            = 'FFDAB9',
  peru                 = 'CD853F', pink                 = 'FFC0CB', plum                 = 'DDA0DD',
  powderblue           = 'B0E0E6', purple               = '800080', rebeccapurple        = '663399',
  red                  = 'FF0000', rosybrown            = 'BC8F8F', royalblue            = '4169E1',
  saddlebrown          = '8B4513', salmon               = 'FA8072', sandybrown           = 'F4A460',
  seagreen             = '2E8B57', seashell             = 'FFF5EE', sienna               = 'A0522D',
  silver               = 'C0C0C0', skyblue              = '87CEEB', slate_blue           = '6A5ACD',
  slategray            = '708090', slategrey            = '708090', snow                 = 'FFFAFA',
  springgreen          = '00FF7F', steelblue            = '4682B4', tan                  = 'D2B48C',
  teal                 = '008000', thistle              = 'D8BFD8', tomato               = 'FF6347',
  turquoise            = '40E0D0', violet               = 'EE82EE', wheat                = 'F5DEB3',
  white                = 'FFFFFF', whitesmoke           = 'F5F5F5', yellow               = 'FFFF00',
  yellowgreen          = '9ACD32'
}

local typst_palette = {
  typstblack   = '000000', typstgray    = 'AAAAAA', typstgrey    = 'AAAAAA',
  typstsilver  = 'DDDDDD', typstwhite   = 'FFFFFF', typstnavy    = '001F3F',
  typstblue    = '0074D9', typstaqua    = '7FDBFF', typstteal    = '39CCCC',
  typsteastern = '239DAD', typstpurple  = 'B10DC9', typstfuchsia = 'F012BE',
  typstmaroon  = '85144B', typstred     = 'FF4136', typstorange  = 'FF851B',
  typstyellow  = 'FFDC00', typstolive   = '3D9970', typstgreen   = '2ECC40',
  typstlime    = '01FF70'
}

local latex_font_styles = {
  ['pfa-weight-bold']     = { 'textbf',     'bfseries'   },
  ['pfa-weight-medium']   = { 'textmd',     'mdseries'   },
  ['pfa-weight-normal']   = { 'textnormal', 'normalfont' },
  ['pfa-style-emphasis']  = { 'emph',       'em'         },
  ['pfa-style-italic']    = { 'textit',     'itshape'    },
  ['pfa-style-slanted']   = { 'textsl',     'slshape'    },
  ['pfa-style-smallcaps'] = { 'textsc',     'scshape'    },
  ['pfa-style-upright']   = { 'textup',     'upshape'    },
  ['pfa-family-mono']     = { 'texttt',     'ttfamily'   },
  ['pfa-family-sans']     = { 'textsf',     'sffamily'   },
  ['pfa-family-serif']    = { 'textrm',     'rmfamily'   }
}

local latex_font_sizes = {
  ['pfa-size-3xs']    = { 'tiny',         'tiny'         },
  ['pfa-size-2xs']    = { 'scriptsize',   'scriptsize'   },
  ['pfa-size-xs']     = { 'footnotesize', 'footnotesize' },
  ['pfa-size-s']      = { 'small',        'small'        },
  ['pfa-size-normal'] = { 'normalsize',   'normalsize'   },
  ['pfa-size-l']      = { 'large',        'large'        },
  ['pfa-size-xl']     = { 'Large',        'Large'        },
  ['pfa-size-2xl']    = { 'LARGE',        'LARGE'        },
  ['pfa-size-3xl']    = { 'huge',         'huge'         }
}

local latex_text_alignments = {
  ['pfa-align-left']   = { nil, 'raggedright' },
  ['pfa-align-center'] = { nil, 'centering'   },
  ['pfa-align-right']  = { nil, 'raggedleft'  }
}

local typst_font_styles = {
  ['pfa-weight-bold']     = { {'#text(weight: 700)[', ']'}, {'#set text(weight: 700)\n', ''} },
  ['pfa-weight-medium']   = { {'#text(weight: 500)[', ']'}, {'#set text(weight: 500)\n', ''} },
  ['pfa-weight-normal']   = { {'#text(weight: 400, style: "normal")[', ']'}, {'#set text(weight: 400, style: "normal")\n', ''} },
  ['pfa-style-italic']    = { {'#text(style: "italic")[', ']'}, {'#set text(style: "italic")\n', ''} },
  ['pfa-style-emphasis']  = { {'#text(style: "italic")[', ']'}, {'#set text(style: "italic")\n', ''} },
  ['pfa-style-upright']   = { {'#text(style: "normal")[', ']'}, {'#set text(style: "normal")\n', ''} },
  ['pfa-style-slanted']   = { {'#text(style: "oblique")[', ']'}, {'#set text(style: "oblique")\n', ''} },
  ['pfa-style-smallcaps'] = { {'#smallcaps[', ']'}, {'#show text: smallcaps\n', ''} }
}

local typst_font_sizes = {
  ['pfa-size-3xs']    = { {'#text(size: 0.5em)[', ']'}, {'#set text(size: 0.5em)\n#set par(leading: 0.65em)\n', ''} },
  ['pfa-size-2xs']    = { {'#text(size: 0.6667em)[', ']'}, {'#set text(size: 0.6667em)\n#set par(leading: 0.65em)\n', ''} },
  ['pfa-size-xs']     = { {'#text(size: 0.8333em)[', ']'}, {'#set text(size: 0.8333em)\n#set par(leading: 0.65em)\n', ''} },
  ['pfa-size-s']      = { {'#text(size: 0.9125em)[', ']'}, {'#set text(size: 0.9125em)\n#set par(leading: 0.65em)\n', ''} },
  ['pfa-size-normal'] = { {'#text(size: 1.0em)[', ']'}, {'#set text(size: 1.0em)\n#set par(leading: 0.65em)\n', ''} },
  ['pfa-size-l']      = { {'#text(size: 1.2em)[', ']'}, {'#set text(size: 1.2em)\n#set par(leading: 0.65em)\n', ''} },
  ['pfa-size-xl']     = { {'#text(size: 1.44em)[', ']'}, {'#set text(size: 1.44em)\n#set par(leading: 0.65em)\n', ''} },
  ['pfa-size-2xl']    = { {'#text(size: 1.728em)[', ']'}, {'#set text(size: 1.728em)\n#set par(leading: 0.65em)\n', ''} },
  ['pfa-size-3xl']    = { {'#text(size: 2.0736em)[', ']'}, {'#set text(size: 2.0736em)\n#set par(leading: 0.65em)\n', ''} }
}

local typst_text_alignments = {
  ['pfa-align-left']   = { nil, {'#align(left)[\n', ']\n'} },
  ['pfa-align-center'] = { nil, {'#align(center)[\n', ']\n'} },
  ['pfa-align-right']  = { nil, {'#align(right)[\n', ']\n'} }
}

local framework_casings = {
  ['pfa-case-upper'] = true,
  ['pfa-case-lower'] = true
}

-- ==============================================================================
-- SECTION 2: INITIALIZATION & UTILITIES
-- ==============================================================================
local raw_code_function = { Span = pandoc.RawInline, Div = pandoc.RawBlock }
local latex_cmd_for_tags = { Span = {}, Div = {} }

local function create_latex_codes(styles_list, span_end_code, div_is_env)
  for class, latex_codes in pairs(styles_list) do
    if next(latex_codes) then
      local span_code, div_code = latex_codes[1], latex_codes[2]
      if span_code then
        latex_cmd_for_tags.Span[class] = span_end_code and { '\\' .. span_code .. '{', '}' } or { '\\' .. span_code .. ' ', nil }
      end
      if div_code then
        latex_cmd_for_tags.Div[class] = div_is_env and { '\\begin{' .. div_code .. '}', '\\end{' .. div_code .. '}' } or { '{\\' .. div_code .. ' ', '}' }
      end
    end
  end
end

create_latex_codes(latex_font_styles, true, false)
create_latex_codes(latex_font_sizes, false, false)
create_latex_codes(latex_text_alignments, false, true)

local known_pfa_classes = {}
local constant_dictionaries = {
  latex_font_styles, latex_font_sizes, latex_text_alignments,
  typst_font_styles, typst_font_sizes, typst_text_alignments,
  framework_casings
}

for _, dict in ipairs(constant_dictionaries) do
  for class_name in pairs(dict) do known_pfa_classes[class_name] = true end
end

-- ==============================================================================
-- SECTION 3: CORE LOGIC HANDLERS
-- ==============================================================================

local function apply_text_casing(elem, tag)
  local transform_func
  if elem.classes:includes('pfa-case-upper') then
    transform_func = function(s) return pandoc.Str(pandoc.text.upper(s.text)) end
  elseif elem.classes:includes('pfa-case-lower') then
    transform_func = function(s) return pandoc.Str(pandoc.text.lower(s.text)) end
  end

  if transform_func then
    for i = #elem.classes, 1, -1 do
      if elem.classes[i] == 'pfa-case-upper' or elem.classes[i] == 'pfa-case-lower' then
        table.remove(elem.classes, i)
      end
    end
    return (tag == 'Div') and pandoc.walk_block(elem, { Str = transform_func }) or pandoc.walk_inline(elem, { Str = transform_func })
  end
  return elem
end

local function apply_standard_classes(elem, tag, raw, is_latex, is_typst)
  local code_for_class = latex_cmd_for_tags[tag]

  for i = #elem.classes, 1, -1 do
    local class_name = elem.classes[i]
    local consumed = false

    if is_typst then
      if class_name:match('^pfa%-family%-') then
        local font_family = class_name:match('pfa%-family%-(.+)')
        local font_target = typst_fonts[font_family]
        if font_target and font_target ~= "" then
          if tag == 'Span' then
            elem.content:insert(1, raw('typst', '#text(font: "' .. font_target .. '")['))
            elem.content:insert(raw('typst', ']'))
          else
            elem.content:insert(1, raw('typst', '#set text(font: "' .. font_target .. '")\n'))
          end
        end
        consumed = true
      else
        local target_codes = typst_font_styles[class_name] or typst_font_sizes[class_name] or typst_text_alignments[class_name]
        if target_codes then
          local codes = target_codes[tag == 'Span' and 1 or 2]
          if codes then
            elem.content:insert(1, raw('typst', codes[1]))
            if codes[2] and codes[2] ~= '' then elem.content:insert(raw('typst', codes[2])) end
          end
          consumed = true
        end
      end
    elseif code_for_class[class_name] and is_latex then
      local code = code_for_class[class_name]
      elem.content:insert(1, raw('latex', code[1]))
      if code[2] then elem.content:insert(raw('latex', code[2])) end
      consumed = true
    elseif class_name:match('^pfa%-') and not known_pfa_classes[class_name] then
      io.stderr:write('[fonts-and-alignment] Warning: Unrecognized class "' .. class_name .. '" on <' .. tag .. '>\n')
    end

    if consumed or (class_name:match('^pfa%-') and known_pfa_classes[class_name]) then
      table.remove(elem.classes, i)
    end
  end
  return elem
end

-- ==============================================================================
-- SECTION 4: BOX MODEL & COLOR HANDLING
-- ==============================================================================

local function resolve_single_color(input)
  local clean_input = input:match("^%s*(.-)%s*$")
  if not clean_input then return nil, nil, false end

  local clean_name = clean_input:lower():gsub('[^%w]', '')

  if typst_palette[clean_name] then
    local hex = typst_palette[clean_name]
    return '#' .. hex, hex, true
  end
  if css_colors[clean_name] then
    local hex = css_colors[clean_name]
    return '#' .. hex, hex, true
  end

  local raw_hex = clean_input:gsub('^#', '')
  if raw_hex:match('^%x+$') then
    if #raw_hex == 6 then
      return '#' .. raw_hex:upper(), raw_hex:upper(), true
    elseif #raw_hex == 3 then
      local r, g, b = raw_hex:sub(1,1), raw_hex:sub(2,2), raw_hex:sub(3,3)
      local full_hex = (r .. r .. g .. g .. b .. b):upper()
      return '#' .. full_hex, full_hex, true
    end
  end

  if clean_input:match('^[a-zA-Z%-]+$') then
    error(string.format('\n\n[fonts-and-alignment] CRITICAL ERROR: Undefined color keyword "%s".\nColor must be a valid standard CSS keyword, a Hex code (e.g. #FF0000), or valid cross-platform mixing syntax.\nHalting compilation to prevent LaTeX engine crash.\n', clean_input))
  end

  return nil, nil, false
end

local function resolve_color(input, is_latex, is_typst)
  if not input then return nil end
  input = input:match("^%s*(.-)%s*$")
  local is_html = not (is_latex or is_typst)

  if is_latex then
    if input:find('!') then return { value = input, type = "raw" } end
    local css_val, tex_val, is_hex = resolve_single_color(input)
    if css_val then return { value = tex_val, is_hex = is_hex, type = "standard" } end
    return { value = input, type = "raw" }
  end

  if is_typst then
    if input:find('!') then
      local c1, pct, c2 = input:match('^([^!]+)!(%d+)!?([^!]*)$')
      if c1 and pct then
        c2 = (c2 == '' or not c2) and 'white' or c2
        local _, hex1, is_hex1 = resolve_single_color(c1)
        local _, hex2, is_hex2 = resolve_single_color(c2)
        local col1 = is_hex1 and 'rgb("#' .. hex1:lower() .. '")' or c1:lower()
        local col2 = is_hex2 and 'rgb("#' .. hex2:lower() .. '")' or c2:lower()
        return { value = string.format('color.mix((%s, %d%%), (%s, %d%%))', col1, tonumber(pct), col2, 100 - tonumber(pct)), type = "raw" }
      end
    end
    local css_val, tex_val, is_hex = resolve_single_color(input)
    if css_val then return { value = tex_val, is_hex = is_hex, type = "standard" } end
    return { value = input, type = "raw" }
  end

  if is_html then
    if input:find('!') then
      local c1, pct, c2 = input:match('^([^!]+)!(%d+)!?([^!]*)$')
      if c1 and pct then
        c2 = (c2 == '' or not c2) and 'white' or c2
        local css_c1 = resolve_single_color(c1) or c1
        local css_c2 = resolve_single_color(c2) or c2
        return { value = string.format("color-mix(in srgb, %s %s%%, %s)", css_c1, pct, css_c2), type = "raw" }
      end
    end
    local css_val = resolve_single_color(input)
    if css_val then return { value = css_val, type = "standard" } end
    return { value = input, type = "raw" }
  end
end

-- NEW: Parses CSS shorthand padding rules and enforces a safe-unit allowlist
local function parse_padding_shorthand(pad_str)
  if not pad_str then return nil, nil, nil, nil end

  -- Define the strictly allowed cross-platform units (Typography standards only)
  local safe_units = { pt = true, em = true, ex = true }
  local tokens = {}

  for token in pad_str:gmatch("%S+") do
    -- Allow unitless '0', otherwise validate the number and the unit suffix
    if token ~= "0" then
      local val, unit = token:match('^(%d*%.?%d+)(%a+)$')

      if not (val and unit and safe_units[unit]) then
        error(string.format(
          '\n\n[fonts-and-alignment] CRITICAL ERROR: Invalid padding value "%s".\n' ..
          'To guarantee cross-platform stability, padding must use safe typography units (pt, em, ex).\n' ..
          'Pixels (px), percentages (%%), and physical drafting units (mm, cm, in) are not supported.\n' ..
          'Halting compilation.\n', token))
      end
    end
    table.insert(tokens, token)
  end

  if #tokens == 1 then
    return tokens[1], tokens[1], tokens[1], tokens[1]
  elseif #tokens == 2 then
    return tokens[1], tokens[2], tokens[1], tokens[2]
  elseif #tokens == 3 then
    return tokens[1], tokens[2], tokens[3], tokens[2]
  elseif #tokens >= 4 then
    return tokens[1], tokens[2], tokens[3], tokens[4]
  end

  return '0pt', '0pt', '0pt', '0pt'
end

local function apply_color(elem, tag, raw, is_latex, is_typst)
  local text_color_attr = elem.attributes['pfa-color']
  local bg_color_attr   = elem.attributes['pfa-bg-color']
  local padding_attr    = elem.attributes['pfa-padding']

  if not (text_color_attr or bg_color_attr or padding_attr) then return elem end

  local tc_res = text_color_attr and resolve_color(text_color_attr, is_latex, is_typst) or nil
  local bg_res = bg_color_attr and resolve_color(bg_color_attr, is_latex, is_typst) or nil

  elem.attributes['pfa-color'] = nil
  elem.attributes['pfa-bg-color'] = nil
  elem.attributes['pfa-padding'] = nil

  if not (tc_res or bg_res or padding_attr) then return elem end

  if is_latex then
    local function get_latex_color_fmt(res)
      if not res or not res.value then return '' end
      return res.model and ('[' .. res.model .. ']{' .. res.value .. '}') or (res.is_hex and '[HTML]{' .. res.value .. '}') or ('{' .. res.value .. '}')
    end

    if tag == 'Span' then
      local open, close = '', ''
      if padding_attr and bg_res then
        local pt = parse_padding_shorthand(padding_attr)
        open = open .. '\\begingroup\\setlength{\\fboxsep}{' .. pt .. '}'
        close = '\\endgroup' .. close
      end
      if bg_res then
        open = open .. '\\colorbox' .. get_latex_color_fmt(bg_res) .. '{'
        close = '}' .. close
      end
      if tc_res then
        open = open .. '\\textcolor' .. get_latex_color_fmt(tc_res) .. '{'
        close = '}' .. close
      end
      if open ~= '' then
        elem.content:insert(1, raw('latex', open))
        elem.content:insert(raw('latex', close))
      end
    else
      local open, close = '', ''
      if bg_res or padding_attr then
        local pt, pr, pb, pl = parse_padding_shorthand(padding_attr or '0pt')
        local opts = 'boxrule=0pt, frame hidden, sharp corners, breakable, boxsep=0pt, top=' .. pt .. ', right=' .. pr .. ', bottom=' .. pb .. ', left=' .. pl

        if bg_res then
          local model = bg_res.model or (bg_res.is_hex and 'HTML' or nil)
          if model then
            open = open .. '\\begingroup\n\\definecolor{pfabgtemp}{' .. model .. '}{' .. bg_res.value .. '}\n\\begin{tcolorbox}[colback=pfabgtemp, colframe=pfabgtemp, ' .. opts .. ']\n'
            close = '\n\\end{tcolorbox}\n\\endgroup' .. close
          else
            open = open .. '\\begin{tcolorbox}[colback=' .. bg_res.value .. ', colframe=' .. bg_res.value .. ', ' .. opts .. ']\n'
            close = '\n\\end{tcolorbox}' .. close
          end
        else
          open = open .. '\\begin{tcolorbox}[interior hidden, ' .. opts .. ']\n'
          close = '\n\\end{tcolorbox}' .. close
        end
      end

      if tc_res then
        open = open .. '{\\color' .. get_latex_color_fmt(tc_res) .. ' '
        close = '}' .. close
      end

      if open ~= '' then
        elem.content:insert(1, raw('latex', open))
        elem.content:insert(raw('latex', close))
      end
    end

  elseif is_typst then
    local function format_typst_color(res)
      if not res or not res.value then return nil end
      return res.type == "standard" and (res.is_hex and 'rgb("#' .. res.value:lower() .. '")' or res.value:lower()) or res.value
    end

    local tc_code = format_typst_color(tc_res)
    local bg_code = format_typst_color(bg_res)

    if tag == 'Span' then
      local open, close = '', ''
      if padding_attr then
        local pt, pr, pb, pl = parse_padding_shorthand(padding_attr)
        local fill_arg = bg_code and (', fill: ' .. bg_code) or ''
        open = open .. '#box(inset: (top: ' .. pt .. ', right: ' .. pr .. ', bottom: ' .. pb .. ', left: ' .. pl .. ')' .. fill_arg .. ')['
        close = ']' .. close
      elseif bg_code then
        open = open .. '#highlight(fill: ' .. bg_code .. ')['
        close = ']' .. close
      end

      if tc_code then
        open = open .. '#text(fill: ' .. tc_code .. ')['
        close = ']' .. close
      end

      if open ~= '' then
        elem.content:insert(1, raw('typst', open))
        elem.content:insert(raw('typst', close))
      end
    else
      local open = '#[\n'
      local close = '\n]'

      if bg_code or padding_attr then
        local pt, pr, pb, pl = parse_padding_shorthand(padding_attr or '0pt')
        local fill_arg = bg_code and (', fill: ' .. bg_code) or ''
        open = open .. '#block(width: 100%, inset: (top: ' .. pt .. ', right: ' .. pr .. ', bottom: ' .. pb .. ', left: ' .. pl .. ')' .. fill_arg .. ')[\n'
        close = '\n]' .. close
      end
      if tc_code then
        open = open .. '#set text(fill: ' .. tc_code .. ')\n'
      end

      if open ~= '#[\n' then
        elem.content:insert(1, raw('typst', open))
        elem.content:insert(raw('typst', close))
      end
    end

  else
    local style = elem.attributes['style'] or ''
    if tc_res and tc_res.value then style = style .. 'color: ' .. tc_res.value .. ';' end
    if bg_res and bg_res.value then style = style .. 'background-color: ' .. bg_res.value .. ';' end
    if padding_attr then style = style .. 'padding: ' .. padding_attr .. ';' end
    if style ~= '' then elem.attributes['style'] = style end
  end

  return elem
end

-- ==============================================================================
-- SECTION 5: MAIN EXECUTORS
-- ==============================================================================

local function handler(elem)
  local tag = elem.tag
  local raw = raw_code_function[tag]
  local is_latex = FORMAT:match('latex') or FORMAT:match('beamer') or FORMAT:match('pdf')
  local is_typst = FORMAT:match('typst')

  elem = apply_text_casing(elem, tag)
  elem = apply_standard_classes(elem, tag, raw, is_latex, is_typst)
  elem = apply_color(elem, tag, raw, is_latex, is_typst)
  return elem
end

return {
  {
    Pandoc = function(doc)
      if doc.meta['pfa-family-serif'] then typst_fonts.serif = utils.stringify(doc.meta['pfa-family-serif'])
      elseif doc.meta['mainfont']   then typst_fonts.serif = utils.stringify(doc.meta['mainfont'])
      else typst_fonts.serif = "Libertinus Serif" end

      if doc.meta['pfa-family-mono'] then typst_fonts.mono = utils.stringify(doc.meta['pfa-family-mono'])
      elseif doc.meta['codefont']  then typst_fonts.mono = utils.stringify(doc.meta['codefont'])
      elseif doc.meta['monofont']  then typst_fonts.mono = utils.stringify(doc.meta['monofont'])
      else typst_fonts.mono = "DejaVu Sans Mono" end

      if doc.meta['pfa-family-sans'] then typst_fonts.sans = utils.stringify(doc.meta['pfa-family-sans'])
      elseif doc.meta['sansfont']  then typst_fonts.sans = utils.stringify(doc.meta['sansfont'])
      else typst_fonts.sans = "DejaVu Sans Mono" end
    end
  },
  { Div = handler, Span = handler }
}
