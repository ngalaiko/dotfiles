local gl = require 'galaxyline'
local gls = gl.section
local vcs = require 'galaxyline.provider_vcs'
local condition = require'galaxyline.condition'

-- Gruvbox
local colors = {
  bg0_h = '#1d2021',
  bg0 = '#282828',
  bg1 = '#3c3836',
  bg2 = '#504945',
  bg3 = '#665c54',
  bg4 = '#7c6f64',
  gray = '#928374',
  fg0 = '#fbf1c7',
  fg1 = '#ebdbb2',
  fg2 = '#d5c4a1',
  fg3 = '#bdae93',
  fg4 = '#a89984',
  bright_red = '#fb4934',
  bright_green = '#b8bb26',
  bright_yellow = '#fabd2f',
  bright_blue = '#83a598',
  bright_purple = '#d3869b',
  bright_aqua = '#8ec07c',
  bright_orange = '#fe8019',
  neutral_red = '#cc241d',
  neutral_green = '#98971a',
  neutral_yellow = '#d79921',
  neutral_blue = '#458588',
  neutral_purple = '#b16286',
  neutral_aqua = '#689d6a',
  neutral_orange = '#d65d0e',
  faded_red = '#9d0006',
  faded_green = '#79740e',
  faded_yellow = '#b57614',
  faded_blue = '#076678',
  faded_purple = '#8f3f71',
  faded_aqua = '#427b58',
  faded_orange = '#af3a03',
}

local mode_map = {
  ['n'] = {'NORMAL', colors.fg3, colors.bg2},
  -- ['n'] = {'NORMAL', colors.bright_green, colors.faded_green},
  ['i'] = {'INSERT', colors.bright_blue, colors.faded_blue},
  ['R'] = {'REPLACE', colors.bright_red, colors.faded_red},
  ['v'] = {'VISUAL', colors.bright_orange, colors.faded_orange},
  ['V'] = {'V-LINE', colors.bright_orange, colors.faded_orange},
  ['c'] = {'COMMAND', colors.bright_yellow, colors.faded_yellow},
  ['s'] = {'SELECT', colors.bright_orange, colors.faded_orange},
  ['S'] = {'S-LINE', colors.bright_orange, colors.faded_orange},
  ['t'] = {'TERMINAL', colors.bright_aqua, colors.faded_aqua},
  [''] = {'V-BLOCK', colors.bright_orange, colors.faded_orange},
  [''] = {'S-BLOCK', colors.bright_orange, colors.faded_orange},
  ['Rv'] = {'VIRTUAL'},
  ['rm'] = {'--MORE'},
}

local sep = {
  right_filled = '', -- e0b2
  left_filled = '', -- e0b0
  right = '', -- e0b3
  left = '', -- e0b1
}

local icons = {
  locker = '', -- f023
  not_modifiable = '', -- f05e
  unsaved = '', -- f0c7
  pencil = '', -- f040
  dos = '', -- e70f
  unix = '', -- f17c
  mac = '', -- f179
  page = '☰', -- 2630
  line_number = '', -- e0a1
  connected = '', -- f817
  disconnected = '', -- f818
  error = '', -- f658
  warning = '', -- f06a
  info = '', -- f05a
}

local function ins_left(component)
  table.insert(gl.section.left, component)
end

local function ins_right(component)
  table.insert(gl.section.right, component)
end

local function ins_mid(component)
  table.insert(gl.section.mid, component)
end

local function mode_hl()
  local mode = mode_map[vim.fn.mode()]
  if mode == nil then
    mode = mode_map['v']
    return {'V-BLOCK', mode[2], mode[3]}
  end
  return mode
end

local function highlight(group, fg, bg, gui)
  local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)
  if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
  vim.cmd(cmd)
end

local function diagnostic_exists()
  return not vim.tbl_isempty(vim.lsp.buf_get_clients(0))
end

local function wide_enough(width)
  local squeeze_width = vim.fn.winwidth(0)
  if squeeze_width > width then return true end
  return false
end

ins_left {
  ViMode = {
    provider = function()
      local label, fg, nested_fg = unpack(mode_hl())
      highlight('GalaxyViMode', colors.bg1, fg)
      highlight('GalaxyViModeInv', fg, nested_fg)
      highlight('GalaxyViModeNested', colors.fg2, nested_fg)
      highlight('GalaxyViModeInvNested', nested_fg, colors.bg1)
      highlight('DiffAdd', colors.bright_green, colors.bg1)
      highlight('DiffChange', colors.bright_orange, colors.bg1)
      highlight('DiffDelete', colors.bright_red, colors.bg1)
      return string.format('  %s ', label)
    end,
    separator = sep.left_filled,
    separator_highlight = 'GalaxyViModeInv',
  }
}
ins_left {
  FileName = {
    provider = function()
      if not condition.buffer_not_empty() then return '' end
      local fname
      if wide_enough(120) then
        fname = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
      else
        fname = vim.fn.expand '%:t'
      end
      if #fname == 0 then return '' end
      if vim.bo.readonly then fname = fname .. ' ' .. icons.locker end
      if not vim.bo.modifiable then fname = fname .. ' ' .. icons.not_modifiable end
      if vim.bo.modified then fname = fname .. ' ' .. icons.pencil end
      return ' ' .. fname .. ' '
    end,
    highlight = 'GalaxyViModeNested',
    condition = condition.buffer_not_empty,
  }
}
ins_left {
  LeftSep = {
    provider = function() return sep.left_filled end,
    highlight = 'GalaxyViModeInvNested',
  }
}
ins_left {
  GitIcon = {
    provider = function ()
      if condition.check_git_workspace() and wide_enough(85) then
        return '   '
      end
      return ''
    end,
    highlight = {colors.bright_red, colors.bg1},
  }
}
ins_left {
  GitBranch = {
    provider = function ()
      if condition.check_git_workspace() and wide_enough(85) then
        return vcs.get_git_branch()
      end
      return ''
    end,
    highlight = {colors.fg2, colors.bg1},
  }
}
ins_left {
    Space = {
        provider = function() return ' ' end,
        highlight = { colors.bg0, colors.bg1 },
    }
}
ins_left {
  DiffAdd = {
    provider = 'DiffAdd',
    icon = '+',
    highlight = {colors.bright_green, colors.bg1},
  }
}
ins_left{
  DiffModified = {
    provider = 'DiffModified',
    icon = '~',
    highlight = {colors.bright_orange, colors.bg1},
  }
}
ins_left {
  DiffRemove = {
    provider = 'DiffRemove',
    icon = '-',
    highlight = {colors.bright_red, colors.bg1},
  }
}

ins_right {
  LspStatus = {
    provider = function()
      local connected = diagnostic_exists()
      if connected then
        return '  ' .. icons.connected .. '  '
      else
        return ''
      end
    end,
    highlight = {colors.bright_green, colors.bg1},
  }
}
ins_right {
  DiagnosticWarn = {
    provider = function()
      local n = vim.lsp.diagnostic.get_count(0, 'Warning')
      if n == 0 then return '' end
      return string.format(' %s %d ', icons.warning, n)
    end,
    highlight = {colors.bright_yellow, colors.bg1},
  }
}
ins_right {
  DiagnosticError = {
    provider = function()
      local n = vim.lsp.diagnostic.get_count(0, 'Error')
      if n == 0 then return '' end
      return string.format(' %s %d ', icons.error, n)
    end,
    highlight = {colors.bright_red, colors.bg1},
  }
}
ins_right {
  RightSepNested = {
    provider = function() return sep.right_filled end,
    highlight = 'GalaxyViModeInvNested',
  }
}
ins_right {
  BufferType = {
    provider = 'FileTypeName',
    condition = condition.hide_in_width,
    highlight = 'GalaxyViModeNested',
  }
}
ins_right {
  RightSep = {
    provider = function() return sep.right_filled end,
    highlight = 'GalaxyViModeInv',
    separator = ' ',
    separator_highlight = 'GalaxyViModeNested',
  }
}
ins_right {
  PositionInfo = {
    provider = function()
      if not condition.buffer_not_empty() or not wide_enough(60) then return '' end
      return string.format('  %s %s:%s ', icons.line_number, vim.fn.line('.'), vim.fn.col('.'))
    end,
    highlight = 'GalaxyViMode',
  }
}
ins_right {
  PercentInfo = {
    provider = function ()
      if not condition.buffer_not_empty() or not wide_enough(65) then return '' end
      local percent = math.floor(100 * vim.fn.line('.') / vim.fn.line('$'))
      return string.format(' %s %s%s', icons.page, percent, '% ')
    end,
    highlight = 'GalaxyViMode',
    separator = sep.right,
    separator_highlight = 'GalaxyViMode',
  }
}
