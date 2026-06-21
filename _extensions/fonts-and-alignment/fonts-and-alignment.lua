--- fonts-and-alignment.lua
---
--- A Pandoc Lua Filter for advanced typography and inline layout control.
--- Translates a systematic utility class taxonomy into precise LaTeX and Typst elements.
--- Unrecognized color values pass through directly to let the target compiler handle validation.
---
--- @author    Nandakumar Chandrasekhar (nandac)
--- @copyright © 2026 Nandakumar Chandrasekhar
--- @license   MIT - see LICENSE for details
--- @version   3.2.0
--- @release   2026-06-20

PANDOC_VERSION:must_be_at_least('3.2')

local pandoc_lib = assert(pandoc, 'Cannot find the pandoc library')
if type(pandoc_lib) ~= 'table' then
  error('Expected variable pandoc to be a table')
end

local List = assert(pandoc.List, 'Cannot find the pandoc.List class')
local utils = require 'pandoc.utils'

-- Verify prerequisite reader extensions are enabled
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
  aliceblue            = 'F0F8FF',
  antiquewhite         = 'FAEBD7',
  aqua                 = '00FFFF',
  aquamarine           = '7FFFD4',
  azure                = 'F0FFFF',
  beige                = 'F5F5DC',
  bisque               = 'FFE4C4',
  black                = '000000',
  blanchedalmond       = 'FFEBCD',
  blue                 = '0000FF',
  blueviolet           = '8A2BE2',
  brown                = 'A52A2A',
  burlywood            = 'DEB887',
  cadetblue            = '5F9EA0',
  chartreuse           = '7FFF00',
  chocolate            = 'D2691E',
  coral                = 'FF7F50',
  cornflowerblue       = '6495ED',
  cornsilk             = 'FFF8DC',
  crimson              = 'DC143C',
  cyan                 = '00FFFF',
  darkblue             = '00008B',
  darkcyan             = '008B8B',
  darkgoldenrod        = 'B8860B',
  darkgray             = 'A9A9A9',
  darkgreen            = '006400',
  darkgrey             = 'A9A9A9',
  darkkhaki            = 'BDB76B',
  darkmagenta          = '8B008B',
  darkolivegreen       = '556B2F',
  darkorange           = 'FF8C00',
  darkorchid           = '9932CC',
  darkred              = '8B0000',
  darksalmon           = 'E9967A',
  darkseagreen         = '8FBC8F',
  darkslateblue        = '483D8B',
  darkslate_gray       = '2F4F4F',
  darkslate_grey       = '2F4F4F',
  darkturquoise        = '00CED1',
  darkviolet           = '9400D3',
  deeppink             = 'FF1493',
  deepskyblue          = '00BFFF',
  dimgray              = '696969',
  dimgrey              = '696969',
  dodgerblue           = '1E90FF',
  firebrick            = 'B22222',
  floralwhite          = 'FFFAF0',
  forestgreen          = '228B22',
  fuchsia              = 'FF00FF',
  gainsboro            = 'DCDCDC',
  ghostwhite           = 'F8F8FF',
  gold                 = 'FFD700',
  goldenrod            = 'DAA520',
  gray                 = '808080',
  green                = '008000',
  greenyellow          = 'ADFF2F',
  grey                 = '808080',
  honeydew             = 'F0FFF0',
  hotpink              = 'FF69B4',
  indianred            = 'CD5C5C',
  indigo               = '4B0082',
  ivory                = 'FFFFF0',
  khaki                = 'F0E68C',
  lavender             = 'E6E6FA',
  lavenderblush        = 'FFF0F5',
  lawngreen            = '7CFC00',
  lemonchiffon         = 'FFFACD',
  lightblue            = 'ADD8E6',
  lightcoral           = 'F08080',
  lightcyan            = 'E0FFFF',
  lightgoldenrodyellow = 'FAFAD2',
  lightgray            = 'D3D3D3',
  lightgreen           = '90EE90',
  lightgrey            = 'D3D3D3',
  lightpink            = 'FFB6C1',
  lightsalmon          = 'FFA07A',
  lightseagreen        = '20B2AA',
  lightskyblue         = '87CEFA',
  lightslate_gray      = '778899',
  lightslate_grey      = '778899',
  lightsteelblue       = 'B0C4DE',
  lightyellow          = 'FFFFE0',
  lime                 = '00FF00',
  limegreen            = '32CD32',
  linen                = 'FAF0E6',
  magenta              = 'FF00FF',
  maroon               = '800000',
  mediumaquamarine     = '66CDAA',
  mediumblue           = '0000CD',
  mediumorchid         = 'BA55D3',
  mediumpurple         = '9370DB',
  mediumseagreen       = '3CB371',
  mediumslate_blue     = '7B68EE',
  mediumspringgreen    = '00FA9A',
  mediumturquoise      = '48D1CC',
  mediumvioletred      = 'C71585',
  midnightblue         = '191970',
  mintcream            = 'F5FFFA',
  mistyrose            = 'FFE4E1',
  moccasin             = 'FFE4B5',
  navajowhite          = 'FFDEAD',
  navy                 = '000080',
  oldlace              = 'FDF5E6',
  olive                = '808000',
  olivedrab            = '6B8E23',
  orange               = 'FFA500',
  orangered            = 'FF4500',
  orchid               = 'DA70D6',
  palegoldenrod        = 'EEE8AA',
  palegreen            = '98FB98',
  paleturquoise        = 'AFEEEE',
  palevioletred        = 'DB7093',
  papayawhip           = 'FFEFD5',
  peachpuff            = 'FFDAB9',
  peru                 = 'CD853F',
  pink                 = 'FFC0CB',
  plum                 = 'DDA0DD',
  powderblue           = 'B0E0E6',
  purple               = '800080',
  rebeccapurple        = '663399',
  red                  = 'FF0000',
  rosybrown            = 'BC8F8F',
  royalblue            = '4169E1',
  saddlebrown          = '8B4513',
  salmon               = 'FA8072',
  sandybrown           = 'F4A460',
  seagreen             = '2E8B57',
  seashell             = 'FFF5EE',
  sienna               = 'A0522D',
  silver               = 'C0C0C0',
  skyblue              = '87CEEB',
  slate_blue           = '6A5ACD',
  slategray            = '708090',
  slategrey            = '708090',
  snow                 = 'FFFAFA',
  springgreen          = '00FF7F',
  steelblue            = '4682B4',
  tan                  = 'D2B48C',
  teal                 = '008000',
  thistle              = 'D8BFD8',
  tomato               = 'FF6347',
  turquoise            = '40E0D0',
  violet               = 'EE82EE',
  wheat                = 'F5DEB3',
  white                = 'FFFFFF',
  whitesmoke           = 'F5F5F5',
  yellow               = 'FFFF00',
  yellowgreen          = '9ACD32'
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

-- All core typographic variants mapped strictly and cleanly into the main dictionary matrix
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
  latex_font_styles,
  latex_font_sizes,
  latex_text_alignments,
  typst_font_styles,
  typst_font_sizes,
  typst_text_alignments,
  framework_casings
}

for _, dict in ipairs(constant_dictionaries) do
  for class_name in pairs(dict) do
    known_pfa_classes[class_name] = true
  end
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
    return (tag == 'Div') and pandoc.walk_block(elem, { Str = transform_func }) or pandoc.walk_inline(elem, { Str = transform_func })
  end
  return elem
end

local function apply_standard_classes(elem, tag, raw, is_latex, is_typst)
  local code_for_class = latex_cmd_for_tags[tag]

  for i = #elem.classes, 1, -1 do
    local class_name = elem.classes[i]

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
      else
        -- All standard token evaluations now map entirely and cleanly via the central loop dictionaries
        local target_codes = typst_font_styles[class_name] or typst_font_sizes[class_name] or typst_text_alignments[class_name]
        if target_codes then
          local codes = target_codes[tag == 'Span' and 1 or 2]
          if codes then
            elem.content:insert(1, raw('typst', codes[1]))
            if codes[2] and codes[2] ~= '' then elem.content:insert(raw('typst', codes[2])) end
          end
        end
      end
    elseif code_for_class[class_name] and is_latex then
      local code = code_for_class[class_name]
      elem.content:insert(1, raw('latex', code[1]))
      if code[2] then elem.content:insert(raw('latex', code[2])) end
    elseif class_name:match('^pfa%-') and not known_pfa_classes[class_name] then
      io.stderr:write('[fonts-and-alignment] Warning: Unrecognized class "' .. class_name .. '" on <' .. tag .. '>\n')
    end
  end
  return elem
end


-- ==============================================================================
-- SECTION 4: COLOR HANDLING (Engine Cross-Translation Strategy)
-- ==============================================================================

local function is_native_typst_syntax(input)
  if type(input) ~= 'string' then return false end
  if input:find('rgb%s*%(') or input:find('cmyk%s*%(') or input:find('luma%s*%(') or
     input:find('oklab%s*%(') or input:find('oklch%s*%(') or input:find('linear%-rgb%s*%(') or
     input:find('hsl%s*%(') or input:find('hsv%s*%(') or input:find('spot%s*%(') or
     input:find('color%.mix%(') then
    return true
  end
  if input:find('%.darken%s*%(') or input:find('%.lighten%s*%(') or
     input:find('%.transparentize%s*%(') or input:find('%.saturate%s*%(') or
     input:find('%.desaturate%s*%(') then
    return true
  end
  return false
end

local function resolve_single_color(input)
  local clean_name = input:lower():gsub('[^%w]', '')
  if css_colors[clean_name] then
    local hex = css_colors[clean_name]
    return '#' .. hex, hex, true
  end

  local raw_hex = input:gsub('^#', '')
  if raw_hex:match('^[0-9a-fA-F]+$') then
    if #raw_hex == 6 then
      return '#' .. raw_hex:upper(), raw_hex:upper(), true
    elseif #raw_hex == 3 then
      local r, g, b = raw_hex:sub(1,1), raw_hex:sub(2,2), raw_hex:sub(3,3)
      local full_hex = (r .. r .. g .. g .. b .. b):upper()
      return '#' .. full_hex, full_hex, true
    end
  end

  if input:match('^[a-zA-Z0-9%-]+$') then return input, input, false end
  return nil, nil, false
end

local function resolve_color(input, is_latex, is_typst)
  if not input then return nil end
  local is_html = not (is_latex or is_typst)

  -- ----------------------------------------------------------------------------
  -- TARGET: TYPST EXECUTIONS
  -- ----------------------------------------------------------------------------
  if is_typst then
    if is_native_typst_syntax(input) or input:find('css%s*%(') or input:find('%.') then
      return { value = input, type = "raw" }
    end
    if input:find('!') then
      local c1, pct, c2 = input:match('^([^!]+)!(%d+)!?([^!]*)$')
      if c1 and pct then
        c2 = (c2 == '' or not c2) and 'white' or c2
        local _, tex_c1, is_hex1 = resolve_single_color(c1)
        local _, tex_c2, is_hex2 = resolve_single_color(c2)
        local col1 = is_hex1 and 'rgb("#' .. tex_c1:lower() .. '")' or c1:lower()
        local col2 = is_hex2 and 'rgb("#' .. tex_c2:lower() .. '")' or c2:lower()
        return { value = string.format('color.mix((%s, %d%%), (%s, %d%%))', col1, tonumber(pct), col2, 100 - tonumber(pct)), type = "raw" }
      end
    end
    local css_val, tex_val, is_hex = resolve_single_color(input)
    if css_val then
      return { value = tex_val, is_hex = is_hex, type = "standard" }
    end
    return { value = input, type = "raw" }
  end

  -- ----------------------------------------------------------------------------
  -- TARGET: LATEX EXECUTIONS
  -- ----------------------------------------------------------------------------
  if is_latex then
    if input:find('!') then
      return { value = input, type = "raw" }
    end
    local css_val, tex_val, is_hex = resolve_single_color(input)
    if css_val then
      return { value = tex_val, is_hex = is_hex, type = "standard" }
    end

    local clean_input = input:gsub("^color%.", "")
    local space, args = clean_input:match("^([a-zA-Z0-9%-]+)%s*%((.+)%)")
    if space and args then
      local tokens = {}
      for tok in args:gmatch("[^,%s]+") do table.insert(tokens, tok) end

      if space == "cmyk" then
        local c = (tokens[1] or "0"):gsub("%%", "")
        local m = (tokens[2] or "0"):gsub("%%", "")
        local y = (tokens[3] or "0"):gsub("%%", "")
        local k = (tokens[4] or "0"):gsub("%%", "")
        local val = string.format("%s,%s,%s,%s", tonumber(c)/100, tonumber(m)/100, tonumber(y)/100, tonumber(k)/100)
        return { value = val, model = "cmyk", type = "polyfill" }
      elseif space == "luma" then
        local pct = (tokens[1] or "0"):gsub("%%", "")
        local val = string.format("%.3f", tonumber(pct)/100)
        return { value = val, model = "gray", type = "polyfill" }
      elseif space == "rgb" then
        local hex_match = args:match("^%s*['\"]?#?(%x%x%x%x%x%x)['\"]?%s*$") or args:match("^%s*['\"]?#?(%x%x%x)['\"]?%s*$")
        if hex_match then
          local _, tex_hex, is_hex_flag = resolve_single_color(hex_match)
          return { value = tex_hex, is_hex = is_hex_flag, type = "standard" }
        elseif #tokens >= 3 then
          local r = (tokens[1] or "0"):gsub("%%", "")
          local g = (tokens[2] or "0"):gsub("%%", "")
          local b = (tokens[3] or "0"):gsub("%%", "")
          local r_num = tonumber(r) or 0
          local g_num = tonumber(g) or 0
          local b_num = tonumber(b) or 0
          if tokens[1]:find("%%") then r_num = r_num / 100 * 255 end
          if tokens[2]:find("%%") then g_num = g_num / 100 * 255 end
          if tokens[3]:find("%%") then b_num = b_num / 100 * 255 end
          return { value = string.format("%d,%d,%d", r_num, g_num, b_num), model = "RGB", type = "polyfill" }
        end
      end
    end
    return { value = input, type = "raw" }
  end

  -- ----------------------------------------------------------------------------
  -- TARGET: HTML/CSS EXECUTIONS
  -- ----------------------------------------------------------------------------
  if is_html then
    local css_val = resolve_single_color(input)
    if css_val and not input:find('!') and not is_native_typst_syntax(input) and not input:find('css%s*%(') and not input:find('%.') then
      return { value = css_val, type = "standard" }
    end

    if input:find('!') then
      local c1, pct, c2 = input:match('^([^!]+)!(%d+)!?([^!]*)$')
      if c1 and pct then
        c2 = (c2 == '' or not c2) and 'white' or c2
        local css_c1 = resolve_single_color(c1) or c1
        local css_c2 = resolve_single_color(c2) or c2
        return { value = string.format("color-mix(in srgb, %s %s%%, %s)", css_c1, pct, css_c2), type = "raw" }
      end
    end

    local css_package_color = input:match("^css%s*%s*%(%s*['\"]([^'\"]+)['\"]%s*%)")
    if css_package_color then
      return { value = resolve_single_color(css_package_color) or css_package_color, type = "raw" }
    end

    -- Universal method chainer evaluator (.darken(), .lighten(), .tint())
    local base_expr, method, method_arg = input:match("^(.+)%.([a-zA-Z0-9%-]+)%s*%(%s*([^%)]+)%s*%)")
    if base_expr and method and method_arg then
      local res_base = resolve_color(base_expr, false, false)
      local base_val = res_base and res_base.value or base_expr
      local pct = method_arg:gsub("%%", "")
      if method == "darken" then
        return { value = string.format("color-mix(in srgb, black %s%%, %s)", pct, base_val), type = "raw" }
      elseif method == "lighten" then
        return { value = string.format("color-mix(in srgb, white %s%%, %s)", pct, base_val), type = "raw" }
      elseif method == "tint" then
        local tint_pct = 100 - (tonumber(pct) or 100)
        if tint_pct <= 0 then return { value = base_val, type = "raw" } end
        return { value = string.format("color-mix(in srgb, white %d%%, %s)", tint_pct, base_val), type = "raw" }
      end
    end

    -- Global coordinated coordinate spaces extractor module (strips leading color.)
    local clean_input = input:gsub("^color%.", "")
    local space, args = clean_input:match("^([a-zA-Z0-9%-]+)%s*%((.+)%)")
    if space and args then
      local tokens = {}
      for tok in args:gmatch("[^,%s]+") do table.insert(tokens, tok) end

      if space == "oklch" or space == "oklab" or space == "hsl" then
        return { value = string.format("%s(%s %s %s)", space, tokens[1] or "0", tokens[2] or "0", tokens[3] or "0"), type = "raw" }
      elseif space == "hsv" then
        local h = tokens[1] or "0"
        local s_str = (tokens[2] or "0"):gsub("%%", "")
        local v_str = (tokens[3] or "0"):gsub("%%", "")
        local s = tonumber(s_str) or 0
        local v = tonumber(v_str) or 0
        if not tokens[2]:find("%%") and s <= 1 then s = s * 100 end
        if not tokens[3]:find("%%") and v <= 1 then v = v * 100 end
        local l_vals = v * (100 - s / 2) / 100
        local s_hsl = 0
        if l_vals > 0 and l_vals < 100 then
          s_hsl = (v - l_vals) / math.min(l_vals, 100 - l_vals) * 100
        end
        return { value = string.format("hsl(%s %.1f%% %.1f%%)", h, s_hsl, l_vals), type = "raw" }
      elseif space == "cmyk" then
        local c_str = (tokens[1] or "0"):gsub("%%", "")
        local m_str = (tokens[2] or "0"):gsub("%%", "")
        local y_str = (tokens[3] or "0"):gsub("%%", "")
        local k_str = (tokens[4] or "0"):gsub("%%", "")
        local c = tonumber(c_str) or 0
        local m = tonumber(m_str) or 0
        local y = tonumber(y_str) or 0
        local k = tonumber(k_str) or 0
        if tokens[1]:find("%%") or c > 1 then c = c / 100 end
        if tokens[2]:find("%%") or m > 1 then m = m / 100 end
        if tokens[3]:find("%%") or y > 1 then y = y / 100 end
        if tokens[4]:find("%%") or k > 1 then k = k / 100 end
        local r = math.floor(255 * (1 - c) * (1 - k) + 0.5)
        local g = math.floor(255 * (1 - m) * (1 - k) + 0.5)
        local b = math.floor(255 * (1 - y) * (1 - k) + 0.5)
        return { value = string.format("rgb(%d, %d, %d)", r, g, b), type = "raw" }
      elseif space == "rgb" then
        local hex_match = args:match("^%s*['\"]?#?(%x%x%x%x%x%x)['\"]?%s*$") or args:match("^%s*['\"]?#?(%x%x%x)['\"]?%s*$")
        if hex_match then
          local res_hex = resolve_single_color(hex_match)
          if res_hex then return { value = res_hex, type = "raw" } end
        end
        return { value = string.format("rgb(%s, %s, %s)", tokens[1] or "0", tokens[2] or "0", tokens[3] or "0"), type = "raw" }
      elseif space == "luma" then
        local pct = (tokens[1] or "0"):gsub("%%", "")
        return { value = string.format("color-mix(in srgb, white %s%%, black)", pct), type = "raw" }
      elseif space == "linear-rgb" then
        local r_str = (tokens[1] or "0"):gsub("%%", "")
        local g_str = (tokens[2] or "0"):gsub("%%", "")
        local b_str = (tokens[3] or "0"):gsub("%%", "")
        local r_lin = tonumber(r_str) or 0
        local g_lin = tonumber(g_str) or 0
        local b_lin = tonumber(b_str) or 0
        if tokens[1]:find("%%") or r_lin > 1 then r_lin = r_lin / 100 end
        if tokens[2]:find("%%") or g_lin > 1 then g_lin = g_lin / 100 end
        if tokens[3]:find("%%") or b_lin > 1 then b_lin = b_lin / 100 end
        local function linear_to_srgb(c_lin)
          if c_lin <= 0.0031308 then return 12.92 * c_lin
          else return 1.055 * (c_lin ^ (1/2.4)) - 0.055 end
        end
        local r = math.floor(math.max(0, math.min(1, linear_to_srgb(r_lin))) * 255 + 0.5)
        local g = math.floor(math.max(0, math.min(1, linear_to_srgb(g_lin))) * 255 + 0.5)
        local b = math.floor(math.max(0, math.min(1, linear_to_srgb(b_lin))) * 255 + 0.5)
        return { value = string.format("rgb(%d, %d, %d)", r, g, b), type = "raw" }
      elseif space == "spot" then
        local internal_color = args:match("rgb%s*%([^%)]+%)") or args:match("#%x+") or tokens[2]
        if internal_color then
          local res_int = resolve_color(internal_color, false, false)
          if res_int then return { value = res_int.value, type = "raw" } end
        end
        return { value = "black", type = "raw" }
      end
    end

    local mc1, mp1, mc2, mp2 = input:match("color%.mix%s*%s*%(%s*%(%s*([a-zA-Z0-9%-%#%'%\"]+)%s*,%s*(%d+)%%%s*%)%s*,%s*%(%s*([a-zA-Z0-9%-%#%'%\"]+)%s*,%s*(%d+)%%%s*%)%s*%)")
    if mc1 and mp1 and mc2 then
      mc1 = mc1:gsub("['\"]", "")
      mc2 = mc2:gsub("['\"]", "")
      local res_mc1 = resolve_single_color(mc1) or mc1
      local res_mc2 = resolve_single_color(mc2) or mc2
      return { value = string.format("color-mix(in srgb, %s %s%%, %s)", res_mc1, mp1, res_mc2), type = "raw" }
    end

    return { value = input, type = "raw" }
  end
end

local function apply_color(elem, tag, raw, is_latex, is_typst)
  local color_attr = elem.attributes['pfa-color']
  if not color_attr then return elem end

  local res = resolve_color(color_attr, is_latex, is_typst)
  elem.attributes['pfa-color'] = nil

  if not res or not res.value then return elem end

  if is_latex then
    local fmt = res.model and ('[' .. res.model .. ']{') or (res.is_hex and '[HTML]{' or '{')
    local begin_code = (tag == 'Span') and ('\\textcolor' .. fmt .. res.value .. '}{') or ('{\\color' .. fmt .. res.value .. '} ')
    elem.content:insert(1, raw('latex', begin_code))
    elem.content:insert(raw('latex', '}'))
  elseif is_typst then
    local color_code = res.value
    if res.type == "standard" then
      color_code = res.is_hex and 'rgb("#' .. res.value:lower() .. '")' or res.value:lower()
    end

    if tag == 'Span' then
      elem.content:insert(1, raw('typst', '#text(fill: ' .. color_code .. ')['))
      elem.content:insert(raw('typst', ']'))
    else
      elem.content:insert(1, raw('typst', '#set text(fill: ' .. color_code .. ')\n'))
    end
  else
    elem.attributes['style'] = (elem.attributes['style'] or '') .. 'color: ' .. res.value .. ';'
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
